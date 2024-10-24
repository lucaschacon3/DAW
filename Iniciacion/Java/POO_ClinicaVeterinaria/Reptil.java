package POO_ClinicaVeterinaria;

public class Reptil extends Animal {
    private String especie;
    private boolean venenoso;

    public Reptil(String nombre, String especie, String fechaNacimiento, double peso, boolean venenoso,
            String comentarios) {
        super(nombre, fechaNacimiento, peso, comentarios);
        this.especie = especie;
        this.venenoso = venenoso;
    }

    public String getEspecie() {
        return especie;
    }

    public boolean esVenenoso() {
        return venenoso;
    }

    @Override
    public String dameDatosAnimal() {
        return "Ficha de Reptil\nNombre: "+getNombre()+"\nEspecie: "+getEspecie()+"\nFecha de Nacimiento: "+getPeso()+"\nPeso: "+getPeso()+ "kg"+"\nEs Venenoso: "+esVenenoso()+"\nComentarios: "+getComentarios();
    }
}
