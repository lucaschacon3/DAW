package POO_sanvalentin;

public class Persona {
    
    private String dni;
    private String nombre;

    public Persona(String dni, String nombre){
        this.dni=dni;
        this. nombre=nombre;
    }

    public String getdni(){
        return this.dni;
    }

    public String getNombre(){
        return this.nombre;
    }
    
    public String toString(){
        return "DNI: "+this.dni+" Nombre Persona: "+this.nombre;
    }
}
