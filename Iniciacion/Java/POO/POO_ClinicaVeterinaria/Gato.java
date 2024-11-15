package POO_ClinicaVeterinaria;

public class Gato extends Animal {
    private String raza;
    private String microchip;

    public Gato(String nombre, String raza, String fechaNacimiento, double peso, String microchip, String comentarios) {
        super(nombre, fechaNacimiento, peso, comentarios);
        this.raza = raza;
        this.microchip = microchip;
    }

    public String getRaza() {
        return raza;
    }

    public String getMicrochip() {
        return microchip;
    }

    @Override
    public String dameDatosAnimal() {
        return "Ficha de Gato\nNombre: "+getNombre()+"\nRaza: "+getRaza()+"\nFecha de Nacimiento: "+getPeso()+"\nPeso: "+getPeso()+ "kg"+"\nMicrochip: "+getMicrochip()+"\nComentarios: "+getComentarios();
    }
}
