package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class VisitasController {

    private int contadorVisitas = 0;

    @GetMapping("/visitas") // Asegúrate de que este mapeo sea correcto
    public String contarVisitas() {
        contadorVisitas++;
        return String.format("Número de visitas: %d", contadorVisitas);
    }
}
