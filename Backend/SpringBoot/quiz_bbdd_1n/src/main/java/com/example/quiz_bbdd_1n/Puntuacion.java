package com.example.quiz_bbdd_1n;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
public class Puntuacion {

    @Id // Agregar @Id para identificar la entidad
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Esto generará un valor automáticamente
    private Long id;

    private int puntuacion;

    private LocalDateTime fecha;

    @ManyToOne
    @JoinColumn(name = "jugador_id")
    private Jugador jugador;

    // Constructor, getters y setters

    public Puntuacion() {
    }

    public Puntuacion(int puntuacion, LocalDateTime fecha, Jugador jugador) {
        this.puntuacion = puntuacion;
        this.fecha = fecha;
        this.jugador = jugador;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(int puntuacion) {
        this.puntuacion = puntuacion;
    }

    public LocalDateTime getFecha() {
        return fecha;
    }

    public void setFecha(LocalDateTime fecha) {
        this.fecha = fecha;
    }

    public Jugador getJugador() {
        return jugador;
    }

    public void setJugador(Jugador jugador) {
        this.jugador = jugador;
    }
}
