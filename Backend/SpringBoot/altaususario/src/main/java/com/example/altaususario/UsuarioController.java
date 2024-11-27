package com.example.altaususario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UsuarioController {

    @RequestMapping("/")
    public String mostrarFormulario() {
        return "formulario"; // Nombre del archivo HTML (formulario.html) en la carpeta templates
    }

    @PostMapping("/procesarFormulario")
    public String procesarFormulario(
            @RequestParam("nombre") String nombre,
            @RequestParam("primerApellido") String primerApellido,
            @RequestParam("segundoApellido") String segundoApellido,
            @RequestParam("correo") String correo,
            @RequestParam("sexo") String sexo,
            @RequestParam("direccion") String direccion,
            @RequestParam("estudios") String estudios,
            @RequestParam(required = false, value = "musica") String musica,
            @RequestParam(required = false, value = "deportes") String deportes,
            @RequestParam(required = false, value = "cine") String cine,
            @RequestParam(required = false, value = "libros") String libros,
            @RequestParam(required = false, value = "ciencia") String ciencia,
            Model model) {
        
        // Agregar datos al modelo para pasarlos a la vista
        model.addAttribute("nombre", nombre);
        model.addAttribute("primerApellido", primerApellido);
        model.addAttribute("segundoApellido", segundoApellido);
        model.addAttribute("correo", correo);
        model.addAttribute("sexo", sexo);
        model.addAttribute("direccion", direccion);
        model.addAttribute("estudios", estudios);
        model.addAttribute("temas", new String[]{musica, deportes, cine, libros, ciencia});

        return "resultado"; // Nombre del archivo HTML donde se mostrará el resultado
    }
}
