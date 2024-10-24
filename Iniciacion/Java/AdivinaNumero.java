


import java.util.Random;
import java.util.Scanner;

public class AdivinaNumero{
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Random random = new Random();

        int numeroSecreto = random.nextInt(101);

        System.out.println("Adivina el Número");
        System.out.println("Tienes 5 oportunidades para adivinar el número.");

        int intentosRestantes = 5;

        while (intentosRestantes > 0) {
            System.out.print("Introduce tu número: ");
            int intento = scanner.nextInt();

			boolean salir=false;

            if (intento == numeroSecreto && salir==false) {
                System.out.println("Has adivinado el número secreto.");
                salir=true;
            } else if(salir==false){
                System.out.println("Número incorrecto.");

                if (intento < numeroSecreto) {
                    System.out.println("El número secreto es mayor.");
                } else {
                    System.out.println("El número secreto es menor.");
                }

                intentosRestantes--;

                if (intentosRestantes > 0) {
                    System.out.println("Tienes " + intentosRestantes + " oportunidades restantes.\n");
                } else {
                    System.out.println("Lo siento, has agotado tus oportunidades. El número secreto era: " + numeroSecreto);
                }
            }
        }

        scanner.close();
    }
}
