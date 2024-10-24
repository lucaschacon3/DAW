package POO_facultad;

public class Empleado extends Persona{

    private int anio_incorporacion;
    private int num_despacho;

    public Empleado(int anio_incorporacion, int num_despacho, String nombre, String apellidos, String dni, String estado_civil){

        super(nombre, apellidos, dni, estado_civil);
        this.anio_incorporacion=anio_incorporacion;
        this.num_despacho=num_despacho;
    }

    public int getAnio_incorporacion() {
        return anio_incorporacion;
    }

    public int getNum_despacho() {
        return num_despacho;
    }

    @Override
    public String toString() {
        return super.toString() + " Año incorporacion: "+getAnio_incorporacion()+" Numero de despacho: "+getNum_despacho();
    }


}
