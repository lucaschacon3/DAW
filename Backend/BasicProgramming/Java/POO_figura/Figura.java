package POO_figura;

/**
 * Figura
 */
public abstract class Figura {

    private String nombre;

    public Figura(String nombre) {
    
        super();
        this.nombre= nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public abstract double obtenerArea();
    public abstract double obtenerVolumen();

    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return "Nombre: "+getNombre();
    }
}