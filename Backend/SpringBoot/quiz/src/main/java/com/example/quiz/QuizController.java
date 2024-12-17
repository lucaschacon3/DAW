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

    @PostMapping("/pregunta1")
    public String showPregunta1(@RequestParam("nombre") String nombre, HttpSession session) {
        session.setAttribute("nombre", nombre);
        return "pregunta1";
    }

    @PostMapping("/pregunta2")
    public String showPregunta2(@RequestParam("q1") String q1, HttpSession session) {
        session.setAttribute("q1", q1);
        return "pregunta2";
    }

    @PostMapping("/pregunta3")
    public String showPregunta3(@RequestParam("q2") String q2, HttpSession session) {
        session.setAttribute("q2", q2);
        return "pregunta3";
    }

    @PostMapping("/pregunta4")
    public String showPregunta4(@RequestParam("q3") String q3, HttpSession session) {
        session.setAttribute("q3", q3);
        return "pregunta4";
    }

    @PostMapping("/pregunta5")
    public String showPregunta5(@RequestParam("q4") String q4, HttpSession session) {
        session.setAttribute("q4", q4);
        return "pregunta5";
    }

    @PostMapping("/pregunta6")
    public String showPregunta6(@RequestParam("q5") String q5, HttpSession session) {
        session.setAttribute("q5", q5);
        return "pregunta6";
    }

    @PostMapping("/pregunta7")
    public String showPregunta7(@RequestParam("q6") String q6, HttpSession session) {
        session.setAttribute("q6", q6);
        return "pregunta7";
    }

    @PostMapping("/pregunta8")
    public String showPregunta8(@RequestParam("q7") String q7, HttpSession session) {
        session.setAttribute("q7", q7);
        return "pregunta8";
    }

    @PostMapping("/result")
    public String showResult(@RequestParam("q8") String q8, HttpSession session, Model model) {
        session.setAttribute("q8", q8);

        // Obtener las respuestas de las sesiones
        String q1 = (String) session.getAttribute("q1");
        String q2 = (String) session.getAttribute("q2");
        String q3 = (String) session.getAttribute("q3");
        String q4 = (String) session.getAttribute("q4");
        String q5 = (String) session.getAttribute("q5");
        String q6 = (String) session.getAttribute("q6");
        String q7 = (String) session.getAttribute("q7");
        String q8Saved = (String) session.getAttribute("q8");

        String nombre = (String) session.getAttribute("nombre");

        // Evaluar las respuestas
        int score = 0;
        if ("b".equals(q1)) score++;
        if ("b".equals(q2)) score++;
        if ("c".equals(q3)) score++;
        if ("a".equals(q4)) score++;
        if ("b".equals(q5)) score++;
        if ("c".equals(q6)) score++;
        if ("a".equals(q7)) score++;
        if ("b".equals(q8Saved)) score++;

        // Obtener la categoría usando el enum
        CategoriaLuchador categoria = CategoriaLuchador.getCategoria(score);

        model.addAttribute("nombre", nombre);
        model.addAttribute("score", score);
        model.addAttribute("categoria", categoria.getMensaje());
        return "result";
    }
}
