package com.example.api_rest.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
        return ResponseEntity.status(HttpStatus.OK).body(libroService.getAllUsers());
    }

    @GetMapping(path = "/{id}")
    public ResponseEntity<?> getLibroById(@PathVariable(name="id") Long id) {
        if (libroService.existsById(id)) {
            return ResponseEntity.status(HttpStatus.OK).body(libroService.getById(id));
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No encontrado");
    }

    @PostMapping
    public ResponseEntity<?> saveLibro(@RequestBody Libro libro) {
        if (libroService.existsByTitulo(libro.getTitulo())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("El libro ya existe.");
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(libroService.saveLibro(libro));
    }

    @DeleteMapping(path = "/{id}")
    public ResponseEntity<?> deleteById(@PathVariable (name="id") Long id) {
        if (!libroService.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No encontrado");
        }
        libroService.deleteLibro(id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    @PutMapping(path = "/{id}")
    public ResponseEntity<?> updateLibroById(@PathVariable (name="id") Long id, @RequestBody Libro libro) {
        if (!libroService.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No encontrado");
        }
        return ResponseEntity.status(HttpStatus.OK).body(libroService.updateById(libro, id));
    }

    @PatchMapping(path = "/{id}")
    public ResponseEntity<?> partialUpdateLibro(@PathVariable (name="id") Long id, @RequestBody Map<String, Object> updates) {
        if (!libroService.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No encontrado");
        }
        return ResponseEntity.status(HttpStatus.OK).body(libroService.partialUpdateById(id, updates));
    }


}