package com.example.servidoreweb;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ControladorServidorweb {

    @GetMapping("/saludo")
    public String saludar(@RequestParam(name = "nombre", required = false, defaultValue = "Mundo") String nombre, Model modelo) {
        modelo.addAttribute("nombre", nombre);
        return "saludo";
    }
}

