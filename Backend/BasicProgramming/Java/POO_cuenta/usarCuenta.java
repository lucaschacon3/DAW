package POO_cuenta;

public class usarCuenta {
    public static void main(String[] args) {

        Cuenta cuenta1 =new Cuenta("Jorge", 150);
        System.out.println(cuenta1.toString()); // se puede hacer solo print(cuenta) porque toString va interno

        System.out.println("Haciendo cambios...");

        cuenta1.editarCuenta("Lucas", 200);
        System.out.println(cuenta1.toString()); 

        cuenta1.ingresar(1);
        if (cuenta1.retirar(202)==true) {
            System.out.println("Cantidad retirada");
        }else{
            System.out.println("Saldo insuficiente");
        }
        

        System.out.println(cuenta1.toString());

    }
}
