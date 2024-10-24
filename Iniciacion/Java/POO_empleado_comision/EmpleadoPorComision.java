package POO_empleado_comision;

public class EmpleadoPorComision extends EmpleadoBaseMasComision {

    public EmpleadoPorComision(String nombre, String apellido, String n_ss, double n_ventas, double comision) {

        super(nombre, apellido, 0, n_ss, n_ventas, comision);
    }

    public double salario_total() {
        return (super.getN_ventas() * super.getComision());
    }

    @Override
    public String toString() {
        return super.toString() + " Salario total: " + salario_total();
    }
}
