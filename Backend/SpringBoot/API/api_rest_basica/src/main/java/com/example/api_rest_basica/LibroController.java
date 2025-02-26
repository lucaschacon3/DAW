package com.example.api_rest_basica;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;

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

    @GetMapping(path = "/{id}")
    public Optional<Libro> getLibroById(@PathVariable(name = "id") Long id) {

        return libroService.getById(id); // Si no se encuentra el libro, devolverá null, lo que generará un 404
    }

    @PutMapping(path = "/{id}")
    public Libro updateLibroById(@PathVariable(name = "id") Long id, @RequestBody Libro libro) {
        return libroService.updateById(libro, id);

    }

    @DeleteMapping(path = "/{id}")
    public String deleteById(@PathVariable(name = "id") Long id) {

        boolean ok = libroService.deleteLibro(id);

        if (ok) {
            return "Libro eliminado con id " + id;
        } else {
            return "Error al eliminar libro con id " + id;
        }
    }

}
