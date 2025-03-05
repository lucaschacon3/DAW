package com.example.demo.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Puntos {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	
	private Long puntuacion;
	
	@ManyToOne
	@JoinColumn(name="usuario_id")
	private Usuario usuario;

	
	
	public Puntos() {
		super();
	}

	public Puntos(Long puntos, Usuario usuario) {
		super();
		this.puntuacion = puntos;
		this.usuario = usuario;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getPuntos() {
		return puntuacion;
	}

	public void setPuntos(Long puntos) {
		this.puntuacion = puntos;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	
	
}
