
import java.util.Scanner;

public class Arrays_traspuesta {
    static Scanner scanner= new Scanner(System.in);
    public static void main(String[] args){
        int[][] matriz= new int[3][3];
        int[][] matrizT= new int[3][3];

        //construimos matriz base
        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matrizT.length; j++) {
                System.out.print("Introduce un numero para la posicion "+(i+1)+" :");
                matriz[i][j]=scanner.nextInt();
            }
        }
            
        //construimos matriz traspuesta
        for (int i = 0; i < matrizT.length; i++) {
            for (int j = 0; j < matrizT.length; j++) {
                matrizT[i][j]=matriz[j][i];
            }
        }

        //mostramos
        System.out.println("La matriz base es: ");

        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matrizT.length; j++) {
                System.out.print(matriz[i][j]);
            }
            System.out.println("");
            
        }
        //mostramos
        System.out.println("La matriz Transpuesta es: ");

        for (int i = 0; i < matrizT.length; i++) {
            for (int j = 0; j < matrizT.length; j++) {
                System.out.print(matrizT[i][j]);
            }
            System.out.println("");
            
        }

    }
    
}