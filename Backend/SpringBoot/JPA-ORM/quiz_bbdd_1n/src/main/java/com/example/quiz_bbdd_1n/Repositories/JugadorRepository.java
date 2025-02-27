package com.example.quiz_bbdd_1n.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.quiz_bbdd_1n.Entities.Jugador;


public interface JugadorRepository extends JpaRepository<Jugador, Long> {
    Jugador findByNombre(String nombre);  // Método para buscar un jugador por nombre
}
