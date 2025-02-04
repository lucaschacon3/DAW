package com.example.ejemplo_mysql;


import jakarta.persistence.*;

@Entity
public class Puntuacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int puntos;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    public Puntuacion() {}

    public Puntuacion(int puntos, User user) {
        this.puntos = puntos;
        this.user = user;
    }

    public Long getId() { return id; }
    public int getPuntos() { return puntos; }
    public void setPuntos(int puntos) { this.puntos = puntos; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
}
