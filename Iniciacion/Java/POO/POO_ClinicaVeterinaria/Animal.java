package POO_ClinicaVeterinaria;
/*
 * 
 * 
 * ¿Que es una clase abstacta?
 * Es una clase que almenos y no ses metodos es abstracto.
 * Un metodo abstracto es un metodo en el que se define la cabecera pero no el cuerpo.
 * El cuerpo de esa funcion se realiza en las clases hijas.
 * 
 * En las clases abstractas no se puede construir un objeto.
 * 
 * 
 */

/**
 * Clases_abstractas
 */

abstract class Animal {
    // Atributos
    private String nombre;
    private String fechaNacimiento;
    private double peso;
    private String comentarios;

    // Constructor
    public Animal(String nombre, String fechaNacimiento, double peso, String comentarios) {
        this.nombre = nombre;
        this.fechaNacimiento = fechaNacimiento;
        this.peso = peso;
        this.comentarios = comentarios;
    }

    // Métodos
    public String getNombre() {
        return nombre;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public double getPeso() {
        return peso;
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    // Método abstracto
    public abstract String dameDatosAnimal();
}
