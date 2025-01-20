package com.example.demo;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EjemploController {

    // Página inicial con el formulario de usuario
    @GetMapping("/")
    public String inicio(Model model) {
        model.addAttribute("usuario", new Usuario()); // Objeto vacío para el formulario
        return "formulario"; // Renderiza formulario.html
    }

    // Procesar el formulario inicial
    @PostMapping("/formulario")
    public String processForm(
            @Valid Usuario usuario,
            BindingResult result,
            Model model,
            HttpSession session) {
        if (result.hasErrors()) {
            return "formulario"; // Si hay errores, vuelve al formulario
        }
        // Guardar usuario en sesión
        session.setAttribute("usuario", usuario);
        return "redirect:/preguntas"; // Redirige a las preguntas
    }

    // Página de preguntas tipo radio y checkbox
    @GetMapping("/preguntas")
    public String preguntas() {
        return "preguntas"; // Renderiza preguntas.html
    }

    // Procesar las respuestas de las preguntas
    @PostMapping("/preguntas")
    public String processPreguntas(
            @RequestParam("opcion") String opcion,
            @RequestParam(value = "preferencias", required = false) String[] preferencias,
            HttpSession session,
            Model model) {
        // Guardar respuestas en sesión
        session.setAttribute("opcion", opcion);
        session.setAttribute("preferencias", preferencias);

        // Mostrar resumen en modal
        model.addAttribute("opcion", opcion);
        model.addAttribute("preferencias", preferencias);
        return "resumen"; // Renderiza resumen.html con un modal
    }

    // Página de resultado final
    @PostMapping("/resultado")
    public String resultado(HttpSession session, Model model) {
        // Recuperar datos de sesión
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        String opcion = (String) session.getAttribute("opcion");
        String[] preferencias = (String[]) session.getAttribute("preferencias");

        // Pasar datos al modelo para mostrarlos
        model.addAttribute("usuario", usuario);
        model.addAttribute("opcion", opcion);
        model.addAttribute("preferencias", preferencias);

        return "resultado"; // Renderiza resultado.html
    }
}
