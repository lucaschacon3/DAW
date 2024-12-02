package com.example.manejarformulario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ControladorFormulario {

    @GetMapping("/formulario")
    public String mostrarFormulario(Model modelo) {
        modelo.addAttribute("datosFormulario", new DatosFormulario());
        return "formulario";
    }

    @PostMapping("/formulario")
    public String procesarFormulario(@ModelAttribute DatosFormulario datos, Model modelo) {
        modelo.addAttribute("datos", datos);
        return "resultado";
    }
}

