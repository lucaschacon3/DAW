package com.example.ejemplo_mysql;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String getUsers(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "index";
    }

    @PostMapping("/add")
    public String addUser(@RequestParam String name, @RequestParam String email) {
        userService.saveUser(new User(name, email));
        return "redirect:/users";
    }

    @PostMapping("/add-puntuacion/{userId}")
    public String addPuntuacion(@PathVariable Long userId, @RequestParam int puntos) {
        userService.addPuntuacion(userId, puntos);
        return "redirect:/users";
    }
}
