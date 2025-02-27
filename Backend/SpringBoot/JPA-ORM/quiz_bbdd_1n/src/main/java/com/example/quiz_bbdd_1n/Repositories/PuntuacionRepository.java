package com.example.quiz_bbdd_1n.Repositories;


import org.springframework.data.jpa.repository.JpaRepository;

import com.example.quiz_bbdd_1n.Entities.Jugador;
import com.example.quiz_bbdd_1n.Entities.Puntuacion;

import java.util.List;


public interface PuntuacionRepository extends JpaRepository<Puntuacion, Long> {
    // Método para obtener las puntuaciones de un jugador ordenadas por puntuación descendente
    List<Puntuacion> findByJugadorOrderByPuntuacionDesc(Jugador jugador);

    // Método para obtener puntuaciones por jugador ordenadas por puntuación descendente (por id)
    List<Puntuacion> findByJugadorIdOrderByPuntuacionDesc(Long jugadorId);

    List<Puntuacion> findAllByOrderByPuntuacionDesc();
}