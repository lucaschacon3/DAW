package com.example.api_rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/libros")
public class LibroController {

    @Autowired
    private LibroRepository libroRepository;

    @GetMapping
    public List<Libro> getAllLibros() {
        return libroRepository.findAll();
    }

    @GetMapping("/{id}")
    public Libro getLibroById(@PathVariable Long id) {
        Optional<Libro> libro = libroRepository.findById(id);
        return libro.orElse(null);  // Si no se encuentra el libro, devolverá null, lo que generará un 404
    }

    @PostMapping
    public Libro createLibro(@RequestBody Libro libro) {
        return libroRepository.save(libro);
    }

    @DeleteMapping("/{id}")
    public void deleteLibro(@PathVariable Long id) {
        libroRepository.deleteById(id);
    }

    @PutMapping("/{id}")
    public Libro updateLibro(@RequestBody Libro libro, @PathVariable Long id) {
        libro.setId(id);
        return libroRepository.save(libro);
    }

    @PatchMapping("/{id}")
    public Libro partiallyUpdateLibro(@RequestBody Libro libro, @PathVariable Long id) {
        libro.setId(id);
        return libroRepository.save(libro);
    }
}
