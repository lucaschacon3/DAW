package com.example.api_rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/libros")
public class LibroController {

    @Autowired
    private LibroService libroService;

    @GetMapping
    public List<Libro> getAllLibros() {
        return libroService.getAllUsers();
    }

    @PostMapping
    public Libro saveLibro(@RequestBody Libro libro) {
        return libroService.saveLibro(libro);
    }

    @GetMapping(path="/{id}")
    public Optional<Libro> getLibroById(@PathVariable(name="id") Long id) {
        
        return libroService.getById(id);  // Si no se encuentra el libro, devolverá null, lo que generará un 404
    }


}
