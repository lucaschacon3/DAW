package com.example.quiz_puntuacion;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class QuizPuntuacionController {

    @Autowired
    private UsuarioRepositorio usuarioRepositorio;

    @Autowired
    private PuntuacionRepositorio puntuacionRepositorio;

    @GetMapping("/")
    public String inicio() {
        return "inicio";
    }

    @PostMapping("/inicio")
    public String procesarInicio(@RequestParam("nombre") String nombre, HttpSession sesion, Model modelo) {
        if (nombre == null || nombre.isEmpty() || nombre.isBlank()) {
            modelo.addAttribute("error", "El nombre no puede estar vacío");
            return "inicio";
        }
        sesion.setAttribute("nombre", nombre);

        int puntuacion = 0;
        if ("lucas".equals(nombre)) {
            puntuacion += 1;
        }
        sesion.setAttribute("puntuacion", puntuacion);

        return "apellidos";
    }

    @PostMapping("/apellidos")
    public String procesarApellido(@RequestParam("apellido") String apellido, HttpSession sesion, Model modelo) {
        if (apellido == null || apellido.isEmpty() || apellido.isBlank()) {
            modelo.addAttribute("error", "El apellido no puede estar vacío");
            return "apellidos";
        }
        int puntuacion = (int) sesion.getAttribute("puntuacion");
        if ("chacon".equals(apellido)) {
            puntuacion += 1;
        }
        sesion.setAttribute("puntuacion", puntuacion);
        sesion.setAttribute("apellido", apellido);
        return "aficiones";
    }

    @PostMapping("/aficiones")
    public String procesarAficiones(@RequestParam(value = "aficiones", required = false) String[] aficiones,
            Model modelo, HttpSession sesion) {

        if (aficiones == null || aficiones.length == 0) {
            modelo.addAttribute("error", "Selecciona al menos una");
            return "aficiones";
        }

        String nombre = (String) sesion.getAttribute("nombre");
        String apellido = (String) sesion.getAttribute("apellido");

        // Guardamos el usuario en el repositorio con el nombre y una lista de
        // puntuaciones vacía
        Usuario usuario = new Usuario(nombre, new ArrayList<>());
        usuarioRepositorio.save(usuario);

        int puntuacion = (int) sesion.getAttribute("puntuacion");
        // Guardamos la puntuación en el repositorio con la puntuación y el objeto
        // usuario
        Puntuacion puntuacionEntidad = new Puntuacion((long) puntuacion, usuario);
        puntuacionRepositorio.save(puntuacionEntidad);

        // Agregamos los atributos a la vista
        modelo.addAttribute("nombre", nombre);
        modelo.addAttribute("apellido", apellido);
        modelo.addAttribute("aficiones", aficiones);
        modelo.addAttribute("puntuacion", puntuacion);

        // Pasamos las listas de puntuaciones y usuarios
        Iterable<Puntuacion> puntuacionesIterable = puntuacionRepositorio.findAll();
        List<Puntuacion> puntuaciones = StreamSupport.stream(puntuacionesIterable.spliterator(), false)
                .collect(Collectors.toList());
        modelo.addAttribute("puntuaciones", puntuaciones);

        

        return "resultado";
    }

}
