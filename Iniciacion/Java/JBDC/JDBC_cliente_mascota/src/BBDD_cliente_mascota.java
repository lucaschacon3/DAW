package JDBC_cliente_mascota.src;


import java.sql.*;
import java.util.Scanner;


public class BBDD_cliente_mascota {
    static Scanner scanner = new Scanner(System.in);
    static Connection miConexion;
    static Statement miStatement;
    static ResultSet miResultset;

    public static void main(String[] args) {

        String URI = "jdbc:mysql://localhost:3306/cliente_mascota";
        String user = "root";
        String password = "lucas";

        // creamos la conexion
        try {
            miConexion = DriverManager.getConnection(URI, user, password);
            miStatement = miConexion.createStatement();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        int op=0;

        do {
            menu();
            op=Integer.parseInt(scanner.nextLine());
            if (op==1) {
                InsertarMascota();
            }else if (op==2) {
                ActualizaMascota();
            }else if (op==3) {
                BorrarMascota();
            }else if (op==4) {
                ConsultaMascotasCliente();
            }else{
                System.out.println("Error al introducir la opcion");
            }

        } while (op!=5);
        System.out.println("Has salido");
    }

    private static void menu() {
        System.out.println("1. Insertar mascota");
        System.out.println("2. Actualizar nombre de la mascota");
        System.out.println("3. Borrar mascota");
        System.out.println("4. Consultar mascotas de cliente");
        System.out.println("5. Salir");
    }

    private static void ConsultaMascotasCliente() {
        int id_cliente;
        do {
            System.out.print("Introduce el id del cliente: ");
            id_cliente= Integer.parseInt(scanner.nextLine());
        } while (!existeCliente(id_cliente));

        try {
            String instruccionSQL= "Select * from mascota where id_cliente="+id_cliente+";";
            miResultset=miStatement.executeQuery(instruccionSQL);
            while (miResultset.next()) {
                System.out.println(miResultset.getInt("id_mascota") + " " + miResultset.getString("nombre") + " "+ miResultset.getInt("id_cliente"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }


    private static void BorrarMascota() {
        int id_mascota;
        do {
            System.out.print("Introduce el id de la mascota: ");
            id_mascota= Integer.parseInt(scanner.nextLine());
        } while (!existeMascota(id_mascota));

        try {
            String instruccionSQL= "DELETE FROM mascota WHERE id_mascota ="+id_mascota+";";
            miStatement.executeUpdate(instruccionSQL);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }


    private static void ActualizaMascota() {
        int id_mascota;
        do {
            System.out.print("Introduce el id de la mascota: ");
            id_mascota= Integer.parseInt(scanner.nextLine());
        } while (!existeMascota(id_mascota));

        System.out.print("Introduce el nombre nuevo de la mascota: ");
        String nombreNuevo=scanner.nextLine();

        try {
            String instruccionSQL= "UPDATE mascota SET nombre ='"+nombreNuevo+"' WHERE id_mascota="+id_mascota+";";
            miStatement.executeUpdate(instruccionSQL);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    private static void InsertarMascota() {
        //existe el cliente
        int id_cliente, id_mascota;
        do {
            System.out.print("Introduce el id del cliente: ");
            id_cliente= Integer.parseInt(scanner.nextLine());
        } while (!existeCliente(id_cliente));

        // que NO exita la mascota
        do {
            System.out.print("Introduce el id de la mascota: ");
            id_mascota= Integer.parseInt(scanner.nextLine());
        } while (existeMascota(id_mascota));

        //insertamos la mascota
        System.out.print("Introduce el nombre de la mascota: ");
        String nombreMascota=scanner.nextLine();
        
        try {
            String instruccionSQL= "insert into mascota values("+id_mascota+",'"+nombreMascota+"',"+id_cliente+");";
            miStatement.executeUpdate(instruccionSQL);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }


    private static boolean existeCliente(int id){
        
        try {
            String instruccionSQL = "SELECT  id_cliente FROM cliente where id_cliente="+id+";";
            miResultset = miStatement.executeQuery(instruccionSQL);
            if (miResultset.next()) { //solo entra si existe el cliente
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    private static boolean existeMascota(int id){
        
        try {
            String instruccionSQL = "SELECT  id_mascota FROM mascota where id_mascota="+id+";";
            miResultset = miStatement.executeQuery(instruccionSQL);
            if (miResultset.next()) { //solo entra si existe la mascota
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
}
