package com.example.api_rest.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.api_rest.Entities.Libro;

import java.util.Optional;

public interface LibroRepository extends JpaRepository<Libro, Long> {
    Optional<Libro> findByTitulo(String titulo);
}