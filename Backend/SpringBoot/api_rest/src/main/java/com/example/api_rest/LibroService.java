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
    
}
