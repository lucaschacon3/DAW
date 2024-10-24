

import java.util.Scanner;

/*
 * 	App
 */
public class InvertirCadena {

    public static void main(String[] args) {
        String cadena = "";
        String aux = "";

        Scanner scanner = new Scanner(System.in);
        System.out.print("Introduce una cadena: ");
        cadena = scanner.nextLine();
        aux = cadena;

        char[] arraychar = cadena.toCharArray();
        char[] arraychar_aux = aux.toCharArray();

        // Invertir la cadena
        int contador = cadena.length() - 1;
        for (int i = 0; i < cadena.length(); i++) {
            arraychar_aux[contador] = arraychar[i];
            contador--;
        }
        //imprimimos
        System.out.print("Cadena invertida: ");
        for (int i = 0; i < cadena.length(); i++) {
            System.out.print(arraychar_aux[i]);
        }

    }

}
