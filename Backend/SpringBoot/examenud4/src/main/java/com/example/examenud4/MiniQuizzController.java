package com.example.examenud4;

import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MiniQuizzController {

    static final String[] SIGNOS = {"Aries", "Tauro", "Géminis", "Cáncer", "Leo", "Virgo", "Libra", "Escorpio", "Sagitario"};
    static final String[] AFICCIONES = {"Deportes", "Juerga", "Lectura", "Relaciones sociales"};

    // Método que genera una categoría basado en los datos ingresados
    static String generaCategoría(String nombre, Integer signo, String aficciones) {
        String[] categorías = {"Tierra", "Aire", "Agua", "Fuego"};
        String[] aficcionesArray = aficciones.split(",");
        Integer num = Arrays.asList(aficcionesArray).stream().map(Integer::parseInt).reduce(0, Integer::sum);
        int indice = (nombre.length() * signo * num) % categorías.length;
        return categorías[indice];
    }

    @GetMapping("/")
    public String inicio(Model modelo) {
        modelo.addAttribute("usuario", new Usuario());
        return "inicio";
    }

    @PostMapping("/inicio")
    public String procesarInicio(@Valid Usuario usuario, BindingResult result, HttpSession sesion, Model modelo) {
        if (result.hasErrors()) {
            return "inicio";
        }

        sesion.setAttribute("usuario", usuario); // Guardar el usuario en la sesión
        return "etapa2";
    }

    @PostMapping("/etapa2")
    public String procesarEtapa2(@RequestParam("signo") Integer signo, HttpSession sesion, Model modelo) {
        if (signo == null || signo < 0 || signo >= SIGNOS.length) {
            modelo.addAttribute("error", "Debes seleccionar un signo válido.");
            return "etapa2";
        }

        sesion.setAttribute("signo", signo); // Guardar el signo en la sesión
        return "etapa3";
    }

    @PostMapping("/etapa3")
    public String procesarEtapa3(@RequestParam("aficciones") String[] aficciones, HttpSession sesion, Model modelo) {
        if (aficciones == null || aficciones.length == 0) {
            modelo.addAttribute("error", "Debes seleccionar al menos una aficción.");
            return "etapa3";
        }

        // Guardar las aficciones como cadena en la sesión
        String aficcionesStr = String.join(",", aficciones);
        sesion.setAttribute("aficciones", aficcionesStr);

        return "resultado";
    }

    @PostMapping("/resultado")
    public String procesarResultado(HttpSession sesion, Model modelo) {
        // Obtener datos de la sesión
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");
        Integer signo = (Integer) sesion.getAttribute("signo");
        String aficciones = (String) sesion.getAttribute("aficciones");

        if (usuario == null || signo == null || aficciones == null) {
            modelo.addAttribute("error", "No se pudo calcular el resultado. Por favor, completa todas las etapas.");
            return "inicio";
        }

        // Generar la categoría
        String categoria = generaCategoría(usuario.getNombre(), signo, aficciones);
        modelo.addAttribute("categoria", categoria);

        return "resultado";
    }
}
