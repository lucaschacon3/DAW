package POO_facultad;

public class Profesor extends Empleado{

    private String departamento;

    public Profesor(String departamento, int anio_incorporacion, int num_despacho, String nombre, String apellidos, String dni, String estado_civil){

        super(anio_incorporacion, num_despacho,nombre, apellidos, dni, estado_civil);
        this.departamento=departamento;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    @Override
    public String toString() {

        return super.toString()+" Departamento: "+getDepartamento();
    }
    
}
