package JDBC_personas.src;

import java.sql.*;
import java.util.Scanner;

public class BBDD_personas {
    static Scanner scanner = new Scanner(System.in);
    static Connection miConexion;
    static Statement miStatement;
    static ResultSet miResultset;

    public static void main(String[] args) {

        String URI = "jdbc:mysql://localhost:3306/prueba";
        String user = "admin";
        String password = "lucas";
        
        // creamos la conexion
        try {
            miConexion = DriverManager.getConnection(URI, user, password);
            miStatement = miConexion.createStatement();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        Menu();
        int op = Integer.parseInt(scanner.nextLine());

        switch (op) {
            case 1:
                AnadirPersona();
                break;

            case 2:
                CambiarEdad();
                break;
            case 3:
                EliminarPersona();
                break;

            case 4:
                ConsultarBD();
                break;
            default:
                System.out.println("Error al introducir la opcion");
                break;
        }
    }

    private static void EliminarPersona() {
        try {
            System.out.print("Introduce el DNI de la persona: ");
            String DNI = scanner.nextLine();

            String instruccionSQL = "DELETE FROM personas WHERE dni='" + DNI + "'";
            miStatement.executeUpdate(instruccionSQL);

            System.out.println("Se ha eliminado correctamente");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    private static void ConsultarBD() {
        try {
            String instruccionSQL = "SELECT * FROM personas";
            miResultset = miStatement.executeQuery(instruccionSQL);
            while (miResultset.next()) {
                System.out.println(miResultset.getString("dni") + " " + miResultset.getString("nombre") + " "+ miResultset.getInt("edad"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    private static void CambiarEdad() {
        try {
            System.out.print("Introduce el DNI de la persona: ");
            String DNI = scanner.nextLine();

            System.out.print("Introduce la nueva edad de la persona: ");
            int edad = Integer.parseInt(scanner.nextLine());

            String instruccionSQL = "UPDATE personas SET edad = '" + edad + "' WHERE dni = '" + DNI + "'";
            miStatement.executeUpdate(instruccionSQL);

            System.out.println("Se ha cambiado correctamente");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    private static void AnadirPersona() {
        try {
            System.out.print("Introduce el DNI de la persona: ");
            String DNI = scanner.nextLine();

            System.out.print("Introduce el nombre de la persona: ");
            String nombre = scanner.nextLine();

            System.out.print("Introduce la edad de la persona: ");
            int edad = Integer.parseInt(scanner.nextLine());

            String instruccionSQL = "INSERT INTO personas VALUES('" + DNI + "', '" + nombre + "', " + edad + ")";
            miStatement.executeUpdate(instruccionSQL);

            System.out.println("Se ha añadido correctamente");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    private static void Menu() {
        System.out.println("1. Insertar Persona");
        System.out.println("2. Actualizar edad de Persona");
        System.out.println("3. Borrar Persona por DNI");
        System.out.println("4. Consultar BD");
        System.out.println("5. Salir");
    }

}
