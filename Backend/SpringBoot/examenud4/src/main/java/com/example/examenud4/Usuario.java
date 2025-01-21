package com.example.examenud4;

import java.util.List;

import jakarta.validation.constraints.NotNull;

public class Usuario {

	@NotNull(message = "El campo nombre es obligatorio")
	private String nombre;

	private Integer signo; // Nueva propiedad

	private List<String> aficciones;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Integer getSigno() {
		return signo;
	}

	public void setSigno(Integer signo) {
		this.signo = signo;
	}

	public List<String> getAficciones() {
		return aficciones;
	}

	public void setAficciones(List<String> aficciones) {
		this.aficciones = aficciones;
	}

}
