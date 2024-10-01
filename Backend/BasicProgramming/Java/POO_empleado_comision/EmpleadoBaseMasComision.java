package POO_empleado_comision;

public class EmpleadoBaseMasComision extends Empleado {

    private double n_ventas;
    private double comision;

    public EmpleadoBaseMasComision(String nombre, String apellido, double salario_base, String n_ss, double n_ventas,
            double comision) {

        super(nombre, apellido, salario_base, n_ss);
        this.n_ventas = n_ventas;
        this.comision = comision;
    }

    public double getN_ventas() {
        return n_ventas;
    }

    public double getComision() {
        return comision;
    }

    public void setN_ventas(double n_ventas) {
        this.n_ventas = n_ventas;
    }

    public void setComision(double comision) {
        this.comision = comision;
    }

    public double salario_total() {
        return (this.n_ventas * this.comision) + super.getSalario_base();
    }

    @Override
    public String toString() {

        return super.toString() + " Salario total: " + salario_total();
    }
}
