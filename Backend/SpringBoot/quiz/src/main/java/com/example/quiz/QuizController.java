package com.example.quiz;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;


@Controller
public class QuizController {

    // Página de inicio, donde se solicita el nombre
    @GetMapping("/")
    public String showStartPage() {
        return "index"; // La página donde el usuario ingresa su nombre
    }

    // Página de la primera pregunta
    @PostMapping("/startQuiz")
    public String startQuiz(@RequestParam("name") String name, HttpSession session) {
        session.setAttribute("name", name); // Guardar el nombre en la sesión
        return "pregunta1"; // Redirige a la primera pregunta
    }

    // Página de la segunda pregunta
    @PostMapping("/pregunta2")
    public String showPregunta2(@RequestParam("q1") String q1, HttpSession session) {
        session.setAttribute("q1", q1);
        return "pregunta2"; // Redirige a la segunda pregunta
    }

    // Página de la tercera pregunta
    @PostMapping("/pregunta3")
    public String showPregunta3(@RequestParam("q2") String q2, HttpSession session) {
        session.setAttribute("q2", q2);
        return "pregunta3"; // Redirige a la tercera pregunta
    }

    // Página de resultados
    @PostMapping("/result")
    public String showResult(@RequestParam("q3") String q3, HttpSession session, Model model) {
        session.setAttribute("q3", q3);

        // Obtener las respuestas de las sesiones
        String name = (String) session.getAttribute("name");
        String q1 = (String) session.getAttribute("q1");
        String q2 = (String) session.getAttribute("q2");
        String q3Saved = (String) session.getAttribute("q3");

        // Evaluar las respuestas
        int score = 0;
        if ("b".equals(q1)) score++;
        if ("b".equals(q2)) score++;
        if ("c".equals(q3Saved)) score++;

        // Pasar el nombre y el puntaje al modelo
        model.addAttribute("name", name);
        model.addAttribute("score", score);
        return "result"; // Redirige a la página de resultados
    }
}
