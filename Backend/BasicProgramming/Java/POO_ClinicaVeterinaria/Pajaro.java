package POO_ClinicaVeterinaria;

public class Pajaro extends Animal {
    private String especie;
    private boolean cantor;

    public Pajaro(String nombre, String especie, String fechaNacimiento, double peso, boolean cantor, String comentarios) {
        super(nombre, fechaNacimiento, peso, comentarios);
        this.especie = especie;
        this.cantor = cantor;
    }

    public String getEspecie() {
        return especie;
    }

    public boolean esCantor() {
        return cantor;
    }

    @Override
    public String dameDatosAnimal() {
        return "Ficha de Pajaro\nNombre: "+getNombre()+"\nEspecie: "+getEspecie()+"\nFecha de Nacimiento: "+getPeso()+"\nPeso: "+getPeso()+ "kg"+"\nEs cantor: "+esCantor()+"\nComentarios: "+getComentarios();
    }
}
