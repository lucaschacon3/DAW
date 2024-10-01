package POO_facultad;

public class Persona {

    private String nombre;
    private String apellidos;
    private String dni;
    private String estado_civil;


    public Persona(String nombre, String apellidos, String dni, String estado_civil){
        this. nombre=nombre;
        this.apellidos=apellidos;
        this.dni=dni;
        this.estado_civil=estado_civil;

    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getDni() {
        return dni;
    }

    public String getEstado_civil() {
        return estado_civil;
    }

    @Override
    public String toString() {
        
        return "Nombre: "+getNombre()+ " Apellidos: "+getApellidos()+ " Dni: "+getDni()+ " Estado civil: "+getEstado_civil();
    }
}