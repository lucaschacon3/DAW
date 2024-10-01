package POO_fraccion;

import java.util.Scanner;

public class usoFraccion {
    static Scanner scanner = new Scanner(System.in);
    
    public static void main(String[] args) {

        Menu();
        int op= scanner.nextInt();

        Fraccion fraccion1 = new Fraccion(Numerador(), Denominador());
        System.out.println("Fraccion 1 ="+fraccion1.mostrar());

        Fraccion fraccion2 = new Fraccion(Numerador(), Denominador());
        System.out.println("Fraccion 2 ="+fraccion2.mostrar());

        Fraccion fraccion3=new Fraccion(0, 1);

        if (op==1) {
            fraccion3=fraccion1.suma(fraccion2);
            System.out.println("Suma ="+fraccion3.mostrar());
        }else if(op==2){
            fraccion3=fraccion1.resta(fraccion2);
            System.out.println("Resta ="+fraccion3.mostrar());
        }else if(op==3){
            fraccion3=fraccion1.multiplicacion(fraccion2);
            System.out.println("Multiplicacion ="+fraccion3.mostrar());
        }else if(op==4){
            fraccion3=fraccion1.division(fraccion2);
            System.out.println("Division ="+fraccion3.mostrar());
        }else{
            System.out.println("Error al introducir la opcion");
        }
        
        fraccion3.simplificar();
        System.out.println("La fraccion simplificada es: "+fraccion3.mostrar());
        

    }
    public static void Menu(){
        System.out.println("1. SUMA");
        System.out.println("2. RESTA");
        System.out.println("3. MULTIPLICACION");
        System.out.println("4. DIVISION");
        System.out.print("Selecciona una opcion: ");
    }

    public static int Numerador(){
        System.out.print("Introduce el numerador: ");
        int numerador= scanner.nextInt();
        return numerador;
    }

    public static int Denominador(){
        System.out.print("Introduce el denominador: ");
        int denominador= scanner.nextInt();
        return denominador;
    }

    
}
