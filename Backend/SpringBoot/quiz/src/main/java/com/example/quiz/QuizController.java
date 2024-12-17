package com.example.quiz;

import java.io.*;
import java.util.*;

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
        String nombre = (String) session.getAttribute("nombre");
        List<String> respuestas = getRespuestasFromSession(session);

        // Evaluar las respuestas
        int score = calculateScore(respuestas);

        // Guardar el nombre y la puntuación en el archivo
        saveScoreToFile(nombre, score);

        // Obtener la categoría usando el enum
        CategoriaLuchador categoria = CategoriaLuchador.getCategoria(score);

        model.addAttribute("nombre", nombre);
        model.addAttribute("score", score);
        model.addAttribute("categoria", categoria.getMensaje());
        model.addAttribute("leaderboard", getLeaderboard()); // Mostrar el leaderboard
        return "result";
    }

    // Método para obtener las respuestas de las sesiones
    private List<String> getRespuestasFromSession(HttpSession session) {
        List<String> respuestas = new ArrayList<>();
        respuestas.add((String) session.getAttribute("q1"));
        respuestas.add((String) session.getAttribute("q2"));
        respuestas.add((String) session.getAttribute("q3"));
        respuestas.add((String) session.getAttribute("q4"));
        respuestas.add((String) session.getAttribute("q5"));
        respuestas.add((String) session.getAttribute("q6"));
        respuestas.add((String) session.getAttribute("q7"));
        respuestas.add((String) session.getAttribute("q8"));
        return respuestas;
    }

    // Método para calcular la puntuación
    private int calculateScore(List<String> respuestas) {
        String[] correctAnswers = {"b", "b", "c", "a", "b", "c", "a", "b"};
        int score = 0;
        for (int i = 0; i < respuestas.size(); i++) {
            if (correctAnswers[i].equals(respuestas.get(i))) {
                score++;
            }
        }
        return score;
    }

    // Método para guardar los resultados en un archivo
    private void saveScoreToFile(String nombre, int score) {
        // Usar la ruta relativa basada en el directorio raíz del proyecto
        String filePath = "Backend/SpringBoot/quiz/src/main/resources/static/data/scores.txt"; // Esta es una ruta relativa desde el directorio raíz del proyecto
        File file = new File(filePath);

        // Crear el directorio si no existe
        file.getParentFile().mkdirs();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
            writer.write(nombre + ": " + score);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Método para leer los resultados y mostrarlos en el tablón
    private List<String> getLeaderboard() {
        List<String> leaderboard = new ArrayList<>();
        String filePath = "Backend/SpringBoot/quiz/src/main/resources/static/data/scores.txt"; // Ruta relativa desde el directorio raíz del proyecto
        File file = new File(filePath);

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;

            // Leemos el archivo línea por línea
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(":");
                if (parts.length == 2) {
                    String name = parts[0].trim();
                    String scoreStr = parts[1].trim();
                    try {
                        int score = Integer.parseInt(scoreStr);
                        leaderboard.add(name + ": " + score);
                    } catch (NumberFormatException e) {
                        System.err.println("Error al convertir la puntuación de " + name);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Ordenar el leaderboard por puntuación de mayor a menor
        leaderboard.sort((entry1, entry2) -> {
            int score1 = Integer.parseInt(entry1.split(":")[1].trim());
            int score2 = Integer.parseInt(entry2.split(":")[1].trim());
            return Integer.compare(score2, score1);
        });

        return leaderboard;
    }
}
