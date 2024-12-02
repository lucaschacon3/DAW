package com.example.validacionformulario;

import jakarta.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ControladorValidacion {

    @GetMapping("/validacion")
    public String mostrarFormulario(Model modelo) {
        modelo.addAttribute("datosFormulario", new DatosFormulario());
        return "validacion";
    }

    @PostMapping("/validacion")
    public String procesarFormulario(@Valid @ModelAttribute DatosFormulario datos, BindingResult resultado, Model modelo) {
        if (resultado.hasErrors()) {
            return "validacion";
        }
        modelo.addAttribute("datos", datos);
        return "resultado-validacion";
    }
}

