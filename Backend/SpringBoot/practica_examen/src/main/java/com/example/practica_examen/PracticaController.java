package com.example.practica_examen;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;





@Controller
public class PracticaController {
    
    @GetMapping("/")
    public String inicio() {
        return "inicio";
    }

    @PostMapping("/inicio")
    public String procesarInicio(@RequestParam("nombre")String nombre, HttpSession sesion, Model modelo) {
        if (nombre==null || nombre.isEmpty() || nombre.isBlank()) {
            modelo.addAttribute("error", "El nombre no puede estar vacio");
            return "inicio";
        }
        sesion.setAttribute("nombre", nombre);

        return "apellidos";
    }

    @PostMapping("/apellidos")
    public String procesarApellido(@RequestParam("apellido") String apellido, HttpSession sesion, Model modelo) {
        if (apellido==null || apellido.isEmpty() || apellido.isBlank()) {
            modelo.addAttribute("error", "El apellido no puede estar vacio");
            return "apellidos";
        }
 
        sesion.setAttribute("apellido", apellido);

        String nombre=(String)sesion.getAttribute("nombre");
        modelo.addAttribute("nombre", nombre);
        modelo.addAttribute("apellido", apellido);
        

        return "resultado";
    }
    

    

    
}
