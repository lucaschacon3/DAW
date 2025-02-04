package com.example.prueba_servicios_1n;

import jakarta.persistence.*;

@Entity
public class Punto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private int valor;

    @ManyToOne
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;

    public Punto() {}

    public Punto(int valor, Usuario usuario) {
        this.valor = valor;
        this.usuario = usuario;
    }

    public Long getId() { return id; }
    public int getValor() { return valor; }
    public void setValor(int valor) { this.valor = valor; }
    public Usuario getUsuario() { return usuario; }
    public void setUsuario(Usuario usuario) { this.usuario = usuario; }
}
