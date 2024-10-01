package POO_ClinicaVeterinaria;

import java.util.ArrayList;

class ClinicaVeterinaria {
    // Atributos
    private ArrayList<Animal> listaAnimales;

    // Constructor
    public ClinicaVeterinaria() {
        listaAnimales = new ArrayList<>();
    }

    // Métodos
    public void insertaAnimal(Animal animal) {
        listaAnimales.add(animal);
    }

    public Animal buscaAnimal(String nombre) {
        for (Animal animal : listaAnimales) {
            if (animal.getNombre().equals(nombre)) {
                return animal;
            }
        }
        return null;
    }

    public boolean modificaComentarioAnimal(String nombre, String nuevoComentario) {
        Animal animal = buscaAnimal(nombre);
        if (animal != null) {
            animal.setComentarios(nuevoComentario);
            return true;
        }
        return false;
    }

    @Override
    public String toString() {

        String listaEntera="";
        for (int i = 0; i < listaAnimales.size(); i++) {
            listaEntera=listaEntera+"\n"+listaAnimales.get(i).dameDatosAnimal()+"\n";
        }
        
        return listaEntera;
    }
}

