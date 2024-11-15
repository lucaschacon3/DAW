package POO_empleado_comision;

public class Empleado {

    private String nombre;
    private String apellido;
    private double salario_base;
    private String n_ss;

    public Empleado(String nombre, String apellido, double salario_base, String n_ss) {

        super();
        this.nombre = nombre;
        this.apellido = apellido;
        this.salario_base = salario_base;
        this.n_ss = n_ss;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public double getSalario_base() {
        return salario_base;
    }

    public String getN_ss() {
        return n_ss;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setSalario_base(double salario_base) {
        this.salario_base = salario_base;
    }

    public void setN_ss(String n_ss) {
        this.n_ss = n_ss;
    }

    @Override
    public String toString() {
        return "Nombre: " + getNombre() + " Apellido: " + getApellido() +
                " Salario Base: " + getSalario_base() + " Nº SS: " + getN_ss();
    }
}