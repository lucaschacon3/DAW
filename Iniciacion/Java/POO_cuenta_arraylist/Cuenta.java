package POO_cuenta_arraylist;

public class Cuenta {
    private String titular;
    private double cantidad;
    
    //constructor
    public Cuenta(String titular, double cantidad){

        this.titular=titular;
        this.cantidad=cantidad;
    }
     //constructor sobrecarga
    public Cuenta(String titular){

        this.titular=titular;
        this.cantidad=0;
    }

    public String getTitular() {
        return titular;
    }
    //getter
    public String toString(){

        return "Titular: "+this.titular+"\nCantidad: "+this.cantidad;

    }
    //setter
    public void ingresar(double ingreso){
        if (ingreso>0) {
            this.cantidad=this.cantidad+ingreso;
        }
    }
    //setter
    public boolean retirar(double retiro){
        if (retiro<=this.cantidad) {
            this.cantidad=this.cantidad-retiro;
            return true;
        }else{
            return false;//no se puede retirar
        }
        
    }
}
