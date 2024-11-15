package POO_empleado;

public class Empleado {

    private String nombre;
    private String dni;
    private double sueldo;

    public Empleado(String nombre, String dni, double sueldo){
        
        super();
        this.nombre=nombre;
        this.dni=dni;
        this.sueldo=sueldo;
    }

    public String getDni() {
        return dni;
    }
    
    public String getNombre() {
        return nombre;
    }

    public double getSueldo() {
        return sueldo;
    }
    
    public void setDni(String dni) {
        this.dni = dni;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    @Override
    public String toString() {
        return super.toString();
    }
}