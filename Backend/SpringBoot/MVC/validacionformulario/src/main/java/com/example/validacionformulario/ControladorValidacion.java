package com.example.validacionformulario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class ControladorValidacion {

    @GetMapping("/")
    public String mostrarFormulario(Model model) {
        model.addAttribute("formularioPersona", new PersonaForm());
        return "validacion"; // Nombre de la plantilla HTML
    }

    @PostMapping("/")
    public String procesarFormulario(@Valid @ModelAttribute("formularioPersona") PersonaForm formularioPersona, 
                                      BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "validacion";
        }

        String resultado = formularioPersona.getEdad() >= 18 
                           ? "Es mayor de edad." 
                           : "Es menor de edad.";
        model.addAttribute("resultado", resultado);

        return "validacion";
    }
}
