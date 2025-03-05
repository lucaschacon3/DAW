package com.example.demo.entities;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Usuario {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable=false,unique=true)
	private String nombre;
	
	
	@OneToMany(mappedBy = "usuario", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Puntos> puntuaciones=new ArrayList<>();

	

	public Usuario() {
		super();
	}
	public Usuario(String nombre) {
		super();
		this.nombre=nombre;
	}


	public Usuario(String nombre, List<Puntos> puntuaciones) {
		super();
		this.nombre = nombre;
		this.puntuaciones = puntuaciones;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public List<Puntos> getPuntuaciones() {
		return puntuaciones;
	}


	public void setPuntuaciones(List<Puntos> puntuaciones) {
		this.puntuaciones = puntuaciones;
	}
	
	
}
