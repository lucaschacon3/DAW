package com.example.api_rest;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LibroService {

    @Autowired
    private LibroRepository libroRepository;

    public ArrayList <Libro> getAllUsers(){
        return (ArrayList<Libro>) libroRepository.findAll();
    }

    public Libro saveLibro(Libro libro){
        return libroRepository.save(libro);
    }

    public Optional<Libro> getById(Long id){
        return libroRepository.findById(id);
    }

    public Libro updateById(Libro request, Long id){
        Libro libro= libroRepository.findById(id).get();

        libro.setTitulo(request.getTitulo());
        libro.setAutor(request.getAutor());
        libro.setAño(request.getAño());

        return libro;
    }

    public Boolean deleteLibro(Long id){
        try {
            libroRepository.deleteById(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
}
