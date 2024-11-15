package POO_banco;

public class usaBanco {
    public static void main(String[] args) {
        Persona persona1=new Persona("05844236W");

        persona1.addCuentas("ES123456789");
        persona1.addCuentas("ES987654321");

        persona1.dameCuenta("ES123456789").recibirAbono(700);
        persona1.dameCuenta("ES123456789").recibirAbono(1100);
        persona1.dameCuenta("ES987654321").pagarRecibo(750);
    

        if (persona1.esMorosa()) {
            System.out.println("En la primera cuenta: Es moroso");
        }else{
            System.out.println("En la primera cuenta: No es moroso");
        } 

    }
}
