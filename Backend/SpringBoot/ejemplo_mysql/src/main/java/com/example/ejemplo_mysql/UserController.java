package com.example.ejemplo_mysql;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/")
    public String getUsers(Model model) {
        // Obtener todos los usuarios de la base de datos
        model.addAttribute("users", userRepository.findAll());
        return "index"; // Este es el nombre de la vista HTML
    }
}
