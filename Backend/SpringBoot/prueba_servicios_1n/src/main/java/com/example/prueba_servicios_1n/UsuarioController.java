package com.example.prueba_servicios_1n;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private PuntoRepository puntoRepository;

    @GetMapping
    public String listarUsuarios(Model model) {
        List<Usuario> usuarios = usuarioRepository.findAll();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("nuevoUsuario", new Usuario());
        model.addAttribute("nuevoPunto", new Punto());
        return "usuarios";
    }

    @PostMapping("/guardar")
    public String guardarUsuario(@ModelAttribute Usuario usuario) {
        usuarioRepository.save(usuario);
        return "redirect:/usuarios";
    }

    @PostMapping("/puntos/{usuarioId}")
    public String agregarPuntos(@PathVariable Long usuarioId, @RequestParam int valor) {
        Usuario usuario = usuarioRepository.findById(usuarioId).orElse(null);
        if (usuario != null) {
            Punto punto = new Punto(valor, usuario);
            puntoRepository.save(punto);
        }
        return "redirect:/usuarios";
    }
}

