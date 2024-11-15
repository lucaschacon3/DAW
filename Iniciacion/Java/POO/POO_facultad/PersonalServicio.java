package POO_facultad;

public class PersonalServicio extends Empleado{
    
    private String seccion;

    public PersonalServicio(String seccion, int anio_incorporacion, int num_despacho, String nombre, String apellidos, String dni, String estado_civil){

        super(anio_incorporacion, num_despacho,nombre, apellidos, dni, estado_civil);
        this.seccion=seccion;
    }

    public String getSeccion() {
        return seccion;
    }

    @Override
    public String toString() {
        
        return super.toString()+ " Seccion: "+getSeccion();
    }
}
