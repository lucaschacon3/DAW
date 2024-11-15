package POO_banco;

public class Cuenta {
    private String numCuenta;
    private double saldo;

    //constructor
    public Cuenta(String numCuenta){

        this.numCuenta=numCuenta;
        this.saldo=0;
    } 
    //getter
    public String toString() {
        
        return "Número de cuenta: "+this.numCuenta+"Saldo: "+this.saldo;
    }
    //getter
    public double consultarSaldo(){
        return this.saldo;
    }
    //getter
    public String consultarCuenta(){
        return this.numCuenta;
    }
    //setter
    public boolean recibirAbono(double abono){
        if (abono>0) {
            this.saldo=this.saldo+abono;
            return true;
        }
        return false;
    }
    //setter
    public boolean pagarRecibo(double recibo){

        if (recibo>=0) {
            this.saldo=this.saldo-recibo;
            return true;//para que sea moroso
        }
        return false;
    }


}
