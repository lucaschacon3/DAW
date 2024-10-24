package POO_cuenta_arraylist;

import java.util.ArrayList;
import java.util.Scanner;

public class usarCuenta {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        ArrayList<Cuenta> cuentas = new ArrayList<Cuenta>();
        int op = 0;

        do {
            Menu();
            op = scanner.nextInt();
            switch (op) {
                case 1:
                    addCuenta(scanner, cuentas);
                    break;
                case 2:
                    EliminarCuentas(scanner, cuentas);
                    break;
                case 3:
                    ListarCuentasPorTitular(scanner, cuentas);
                    break;
                default:
                    System.out.println("Has introducido mal la opcion");
                    break;
            }

        } while (op != 4);
        System.out.println("Has salido");

    }

    private static void ListarCuentasPorTitular(Scanner scanner, ArrayList<Cuenta> cuentas) {
        String titular;
        scanner.nextLine();
        System.out.println("Introduce nombre del titular:");
        titular = scanner.nextLine();

        for (int i = 0; i < cuentas.size(); i++) {
            if (titular.equals(cuentas.get(i).getTitular())) {
                System.out.println(cuentas.get(i));
            }
        }
    }

    private static void EliminarCuentas(Scanner scanner, ArrayList<Cuenta> cuentas) {
        String titular;
        scanner.nextLine();
        System.out.println("Introduce nombre del titular:");
        titular = scanner.nextLine();

        scanner.nextLine(); 
        for (int i = 0; i < cuentas.size(); i++) {
            if (titular.equals(cuentas.get(i).getTitular())) {
                cuentas.remove(i);
            }
        }
    }

    private static void addCuenta(Scanner scanner, ArrayList<Cuenta> cuentas) {
        String titular;
        double cantidad;
        scanner.nextLine();
        System.out.print("Introduce el nombre del titular: ");
        titular = scanner.nextLine();

        System.out.print("Introduce la cantidad a ingresar: ");
        cantidad = scanner.nextDouble();

        scanner.nextLine();
        Cuenta cuenta = new Cuenta(titular, cantidad);
        cuentas.add(cuenta);
    }

    private static void Menu() {
        System.out.println("----Menu----");
        System.out.println("1. Añadir cuenta");
        System.out.println("2. Eliminar cuenta");
        System.out.println("3. Listar cuentas por titular");
        System.out.println("4. Salir");
        System.out.println("------------");
        System.out.print("Introduce una opcion: ");

    }
}
