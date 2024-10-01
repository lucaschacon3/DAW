package POO_ClinicaVeterinaria;

public class Perro extends Animal {
    // Atributos adicionales
    private String raza;
    private String microchip;

    // Constructor
    public Perro(String nombre, String raza, String fechaNacimiento, double peso, String microchip,
            String comentarios) {
        super(nombre, fechaNacimiento, peso, comentarios);
        this.raza = raza;
        this.microchip = microchip;
    }

    // Métodos
    public String getRaza() {
        return raza;
    }

    public String getMicrochip() {
        return microchip;
    }

    // Método sobreescrito
    @Override
    public String dameDatosAnimal() {
        return "Ficha de Perro\nNombre: "+getNombre()+"\nRaza: "+getRaza()+"\nFecha de Nacimiento: "+getPeso()+"\nPeso: "+getPeso()+ "kg"+"\nMicrochip: "+getMicrochip()+"\nComentarios: "+getComentarios();
    }
}
