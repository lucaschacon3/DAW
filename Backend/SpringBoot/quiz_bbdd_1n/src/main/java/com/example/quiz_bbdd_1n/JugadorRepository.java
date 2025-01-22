package com.example.quiz_bbdd_1n;

import org.springframework.data.jpa.repository.JpaRepository;


public interface JugadorRepository extends JpaRepository<Jugador, Long> {
    Jugador findByNombre(String nombre);  // Método para buscar un jugador por nombre
}
