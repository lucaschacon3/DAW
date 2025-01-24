package com.example.examenud4;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class MiniQuizzController {

    static final String[] SIGNOS = { "Aries", "Tauro", "Géminis", "Cáncer", "Leo", "Virgo", "Libra", "Escorpio",
            "Sagitario" };
    static final String[] AFICCIONES = { "Deportes", "Juerga", "Lectura", "Relaciones sociales" };

    // Método que genera una categoría basado en los datos ingresados
    static String generaCategoría(String nombre, Integer signo, String aficciones) {
        String[] categorías = { "Tierra", "Aire", "Agua", "Fuego" };
        String[] aficcionesArray = aficciones.split(",");
        Integer num = Arrays.asList(aficcionesArray).stream().map(Integer::parseInt).reduce(0, Integer::sum);
        int indice = (nombre.length() * signo * num) % categorías.length;
        return categorías[indice];
    }

    @GetMapping("/")
    public String inicio(Model modelo) {

        return "inicio";
    }

    @PostMapping("/inicio")
    public String procesarInicio(
            @RequestParam(name = "nombre", required = false) String nombre,
            HttpSession sesion,
            Model modelo) {

        // Validación: Verificar que el nombre no esté vacío o nulo
        if (nombre == null || nombre.isBlank()) {
            String error = "El nombre no puede estar vacío";
            modelo.addAttribute("error", error);
            return "inicio"; // Volver a la página de inicio si hay error
        }

        // Guardar el nombre en la sesión
        sesion.setAttribute("nombre", nombre);

        // Redirigir a la siguiente etapa
        return "etapa2";
    }

    @PostMapping("/etapa2")
    public String procesarEtapa2(
            @RequestParam(name = "signo", required = false) String signo,
            HttpSession sesion,
            Model modelo) {

        // Validación: Verificar que se seleccionó un signo
        if (signo == null || signo.isBlank()) {
            modelo.addAttribute("error", "Debes seleccionar un signo.");
            return "etapa2"; // Volver a la página actual en caso de error
        }

        // Guardar el signo en la sesión
        sesion.setAttribute("signo", signo);

        // Redirigir a la siguiente etapa
        return "etapa3";
    }

    @PostMapping("/etapa3")
    public String procesarEtapa3(
            @RequestParam(name = "aficciones", required = false) List<String> aficciones,
            HttpSession sesion,
            Model modelo) {

        // Validación: verificar que al menos una afición fue seleccionada
        if (aficciones == null || aficciones.isEmpty()) {
            modelo.addAttribute("error", "Debes seleccionar al menos una afición.");
            return "etapa3"; // Volver a la vista actual en caso de error
        }

        // Guardar las aficiones en la sesión
        sesion.setAttribute("aficciones", aficciones);

        // Redirigir a la siguiente etapa
        return "resultado";
    }

}
