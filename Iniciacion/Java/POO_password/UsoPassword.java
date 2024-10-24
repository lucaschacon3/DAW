package POO_password;

import java.util.Scanner;

public class UsoPassword {
    public static void main(String[] args) {

        Scanner scanner=new Scanner(System.in);

        System.out.print("Cuantas contraseñas quieres?: ");
        int numContraseñas= scanner.nextInt();

        Password [] contraseñas =new Password[numContraseñas];
        boolean [] comprobarFuerza= new boolean[numContraseñas];

        System.out.print("Indica la longitud de la contraseña: ");
        int longitud= scanner.nextInt();

        for (int i = 0; i < numContraseñas; i++) {
            contraseñas[i]= new Password(longitud);
            if (contraseñas[i].esFuerte()) {
                comprobarFuerza[i]=true;
            }else{
                comprobarFuerza[i]=false;
            }
            
        }

        for (int i = 0; i < numContraseñas; i++) {
            
            System.out.println("Contraseña: "+contraseñas[i].getPassword());
            if (comprobarFuerza[i]) {
                System.out.println("Es fuerte");
            }else{
                System.out.println("Es debil"); 
            }
            
        }
    }
}
