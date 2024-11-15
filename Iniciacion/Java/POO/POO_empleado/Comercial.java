package POO_empleado;

public class Comercial extends Empleado{
    
    private double comision;
    
    public Comercial(String dni, String nombre, double comision, double sueldo){

        super(dni,nombre, sueldo);
        this.comision=comision;
    }

    public double getComision() {
        return comision;
    }

    public void setComision(double comision) {
        this.comision = comision;
    }

    @Override
    public String toString() {
        return super.toString();
    }
    //sobreescribimos el metodo ya que el comercial tiene una comision
    @Override
    public double getSueldo() {
        return super.getSueldo()+comision;
    }
}
