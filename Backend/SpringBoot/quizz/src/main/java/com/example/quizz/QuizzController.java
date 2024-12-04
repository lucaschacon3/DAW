package com.example.quizz;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.validation.Valid;

@Controller
public class QuizzController {

    @GetMapping("/")
    public String mostrarFormulario(Model modelo) {
        modelo.addAttribute("datosFormulario", new DatosFormulario());
        return "solicitudNombre";
    }

    @PostMapping("/")
    public String procesarFormulario(@Valid @ModelAttribute("datosFormulario") DatosFormulario datosFormulario,
            BindingResult bindingResult,
            Model modelo) {
        if (bindingResult.hasErrors()) {
            // Si hay errores, vuelve al formulario
            return "solicitudNombre";
        }
        modelo.addAttribute("datos", datosFormulario);
        return "quizz";
    }

}
