package com.example.quiz_bbdd_1n;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class QuizService {

    @Autowired
    private JugadorRepository jugadorRepository;

    @Autowired
    private PuntuacionRepository puntuacionRepository;

    // Método para obtener o crear un jugador si no existe
    public Jugador getOrCreateJugador(String nombre) {
        // Verificar si el jugador ya existe
        Jugador jugador = jugadorRepository.findByNombre(nombre);
        
        // Si no existe, creamos un nuevo jugador
        if (jugador == null) {
            jugador = new Jugador(nombre);
            jugadorRepository.save(jugador); // Guardamos el nuevo jugador en la base de datos
        }

        return jugador;
    }

    // Método para guardar una nueva puntuación
    public void savePuntuacion(Jugador jugador, int puntuacion, int score) {
        Puntuacion nuevaPuntuacion = new Puntuacion(puntuacion, LocalDateTime.now(), jugador);
        puntuacionRepository.save(nuevaPuntuacion); // Guardamos la puntuación en la base de datos
    }

    // Método para obtener las mejores puntuaciones de un jugador con un límite
    public List<Puntuacion> getTopPuntuacionesByJugador(Long jugadorId, int limit) {
        // Obtener todas las puntuaciones del jugador ordenadas de mayor a menor
        List<Puntuacion> puntuaciones = puntuacionRepository.findByJugadorIdOrderByPuntuacionDesc(jugadorId);

        // Limitar la cantidad de puntuaciones a las mejores 'limit'
        return puntuaciones.stream().limit(limit).toList();
    }

    // Método para obtener todas las puntuaciones de un jugador
    public List<Puntuacion> getAllPuntuacionesByJugador(Long jugadorId) {
        // Retorna todas las puntuaciones del jugador ordenadas de mayor a menor
        return puntuacionRepository.findByJugadorIdOrderByPuntuacionDesc(jugadorId);
    }
}
