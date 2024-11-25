package daw.goya.formulario;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;



public class FormularioController {
    @GetMapping("/")
    String primerAcceso(){
        return "form";
    }

    @PostMapping("/")
    String procesarFormulario(@RequestParam(name="nombre", required = false)String nombre, Model modelo){
        if (nombre==null || nombre.isEmpty()) {
            modelo.addAttribute("nombre", "");
            modelo.addAttribute("errorMsg", "El nombre no puede estar vacio");
            modelo.addAttribute("mostrarFormulario", true);
        }else{
            modelo.addAttribute("nombre", nombre);
        }
        return "form";
    }
}
