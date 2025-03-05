package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

@Controller
public class AhorcadoController {

    private static final String[] PALABRAS = {"SPRING", "JAVA", "FRAMEWORK", "THYMELEAF", "CONTROLLER"};
    private String palabraSecreta;
    private char[] progreso;
    private Set<Character> letrasIngresadas;
    private int intentosRestantes;

    public AhorcadoController() {
        iniciarJuego();
    }

    private void iniciarJuego() {
        palabraSecreta = PALABRAS[new Random().nextInt(PALABRAS.length)]; // Generar palabra aleatoria
        progreso = new char[palabraSecreta.length()];
        Arrays.fill(progreso, '_');
        letrasIngresadas = new HashSet<>();
        intentosRestantes = 6; // Intentos máximos
    }

    @GetMapping("/")
    public String mostrarJuego(Model model) {
        model.addAttribute("progreso", String.valueOf(progreso));
        model.addAttribute("intentosRestantes", intentosRestantes);
        model.addAttribute("letrasIngresadas", letrasIngresadas);
        return "ahorcado";
    }

    @PostMapping("/intentar")
    public String procesarIntento(@RequestParam("letra") String letra, Model model) {
        if (letra.length() != 1 || !Character.isLetter(letra.charAt(0))) {
            model.addAttribute("error", "Ingresa una sola letra válida.");
        } else {
            char intento = Character.toUpperCase(letra.charAt(0));
            if (letrasIngresadas.contains(intento)) {
                model.addAttribute("error", "Ya intentaste esa letra.");
            } else {
                letrasIngresadas.add(intento);
                boolean acierto = false;

                for (int i = 0; i < palabraSecreta.length(); i++) {
                    if (palabraSecreta.charAt(i) == intento) {
                        progreso[i] = intento;
                        acierto = true;
                    }
                }

                if (!acierto) {
                    intentosRestantes--;
                }
            }
        }

        // Verificar si se ganó o perdió
        if (intentosRestantes == 0) {
            model.addAttribute("mensaje", "¡Perdiste! La palabra era: " + palabraSecreta);
            iniciarJuego();
        } else if (!new String(progreso).contains("_")) {
            model.addAttribute("mensaje", "¡Ganaste! La palabra era: " + palabraSecreta);
            iniciarJuego();
        }

        return mostrarJuego(model);
    }
}
