package com.example.quizz;

import jakarta.validation.constraints.NotBlank;

public class DatosFormulario {
    @NotBlank(message = "El nombre no puede estar vacío")
    private String nombre;

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
