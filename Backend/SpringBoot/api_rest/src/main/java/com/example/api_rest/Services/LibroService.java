package com.example.api_rest.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.api_rest.Entities.Libro;
import com.example.api_rest.Repositories.LibroRepository;

import java.util.List;
import java.util.Optional;

@Service
public class LibroService {

    @Autowired
    private LibroRepository libroRepository;

    public List<Libro> getAllUsers() {
        return libroRepository.findAll();
    }

    public Libro saveLibro(Libro libro) {
        return libroRepository.save(libro);
    }

    public Optional<Libro> getById(Long id) {
        return libroRepository.findById(id);
    }

    public boolean existsById(Long id) {
        return libroRepository.existsById(id);
    }

    public boolean existsByTitulo(String titulo) {
        return libroRepository.findByTitulo(titulo).isPresent();
    }

    public Libro updateById(Libro request, Long id) {
        Libro libro = libroRepository.findById(id).orElseThrow();
        libro.setTitulo(request.getTitulo());
        libro.setAutor(request.getAutor());
        libro.setAño(request.getAño());
        return libroRepository.save(libro);
    }

    public void deleteLibro(Long id) {
        libroRepository.deleteById(id);
    }
}