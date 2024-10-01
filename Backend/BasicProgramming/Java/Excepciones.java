import java.util.Scanner;
// hay excepciones que hay que hacer el try-catch y otra que no hece falta como en el scanner 

public class Excepciones {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        try {
            System.out.print("Introduce un numero: ");
            int num=scanner.nextInt();
        } catch (Exception e) {
            System.out.println("No has introducido un numero");
        }

        //para este caso se usa:
        //while (!scanner.hasNextInt()) {
            //System.out.println("Error: Debe ingresar un número entero válido.");
            //System.out.print("Ingrese un número: ");
            //scanner.next(); // Limpiar la entrada no válida
        //}
  

    }
}
