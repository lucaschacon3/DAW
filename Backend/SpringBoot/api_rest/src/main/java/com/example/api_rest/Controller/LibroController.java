package com.example.api_rest.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.api_rest.Entities.Libro;
import com.example.api_rest.Services.LibroService;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/libros")
public class LibroController {

    @Autowired
    private LibroService libroService;

    @GetMapping
    public ResponseEntity<List<Libro>> getAllLibros() {
        return ResponseEntity.ok(libroService.getAllUsers());
    }

    @PostMapping
    public ResponseEntity<?> saveLibro(@RequestBody Libro libro) {
        if (libroService.existsByTitulo(libro.getTitulo())) {
            return ResponseEntity.badRequest().body("El libro ya existe.");
        }
        return ResponseEntity.ok(libroService.saveLibro(libro));
    }

    @GetMapping(path = "/{id}")
    public ResponseEntity<Libro> getLibroById(@PathVariable(name="id") Long id) {
        return libroService.getById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping(path = "/{id}")
    public ResponseEntity<?> updateLibroById(@PathVariable (name="id") Long id, @RequestBody Libro libro) {
        if (!libroService.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(libroService.updateById(libro, id));
    }

    @PatchMapping(path = "/{id}")
    public ResponseEntity<?> partialUpdateLibro(@PathVariable (name="id") Long id, @RequestBody Map<String, Object> updates) {
        if (!libroService.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(libroService.partialUpdateById(id, updates));
    }

    @DeleteMapping(path = "/{id}")
    public ResponseEntity<?> deleteById(@PathVariable (name="id") Long id) {
        if (!libroService.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        libroService.deleteLibro(id);
        return ResponseEntity.ok("Libro eliminado con id " + id);
    }
}