package com.example.validacionformulario;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public class DatosFormulario {

    @NotEmpty(message = "El nombre es obligatorio")
    @Size(min = 2, max = 30, message = "El nombre debe tener entre 2 y 30 caracteres")
    private String nombre;

    @NotEmpty(message = "El mensaje no puede estar vacío")
    private String mensaje;

    // Getters y Setters
}

