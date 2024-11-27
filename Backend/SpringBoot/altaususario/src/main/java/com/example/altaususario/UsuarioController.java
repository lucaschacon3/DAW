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
        return "index"; // Nombre del archivo HTML (formulario.html) en la carpeta templates
    }

    @PostMapping("/procesarFormulario")
    public String procesarFormulario(
            @RequestParam(name="nombre", defaultValue = "", required = false) String nombre,
            @RequestParam(name="primerApellido", defaultValue = "", required = false) String primerApellido,
            @RequestParam(name="segundoApellido", defaultValue = "", required = false) String segundoApellido,
            @RequestParam(name="correo", defaultValue = "", required = false) String correo,
            @RequestParam(name="sexo", defaultValue = "", required = false) String sexo,
            @RequestParam(name="direccion", defaultValue = "", required = false) String direccion,
            @RequestParam(name="estudios", defaultValue = "", required = false) String estudios,
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
