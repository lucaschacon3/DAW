package POO_sanvalentin;

import java.util.Scanner;

public class Gestorsanvalentin2 {

    static Scanner scanner=new Scanner(System.in);
    static Pareja [] parejas=new Pareja[10];
    static int contParejas=0;
    public static void main(String[] args) {
        
        
        char salida='n';
        do {
            Menu();
            int op=scanner.nextInt();

            if (op==1) {
                System.out.println("Has entrado en Agregar pareja y sus regalos");
                AgregarPareja();

            }else if (op==2) {
                System.out.println("Has entrado en Mostrar detalles de las parejas y sus regalos");
                mostrarDetallesParejas();
            }
            System.out.println("Deseas salir? (S/N)");
            scanner.nextLine();
            salida=scanner.nextLine().charAt(0);
        } while (salida=='N' || salida=='n');
        

    }

    public static void Menu(){
        System.out.println("------MENU------");
        System.out.println("1. Agregar pareja y sus regalos");
        System.out.println("2. Mostrar detalles de las parejas y sus regalos");
        System.out.print("Introduce una opción: ");
    }

    public static void AgregarPareja(){
        Persona persona1=new Persona("0345539q","Lucas");
        Persona persona2=new Persona("73566273p", "Natalia");

        Regalo regaloParaPersona1= new Regalo("MacBook Pro", 1200, "Aluminio, 8gb ram, 256gb almacenamiento");
        Regalo regaloParaPersona2= new Regalo("Pulsera Pandora", 80, "Plata, 16cm");

        Pareja pareja1=new Pareja(persona1, persona2);
        pareja1.setRegaloParaPersona1(regaloParaPersona1);
        pareja1.setRegaloParaPersona2(regaloParaPersona2);

        parejas[contParejas]=pareja1;
        contParejas++;
    }

    static void mostrarDetallesParejas(){
        for (int i = 0; i < parejas.length; i++) {
            System.out.println(parejas[i].mostrarDetalles());
        }
        
    }
}
