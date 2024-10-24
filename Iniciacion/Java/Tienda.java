
/*
    Ejercicio 12. Realizar un programa en java que gestione los datos de stock de una
    tienda de comestibles,la información a recoger será: nombre del producto(no se
    puede repetir), precio, cantidad en stock.
    La tienda dispone de 10 productos distintos. El programa debe ser capaz de:
    1. Dar de alta un producto nuevo.
    2. Buscar un producto por su nombre.
    3. Modificar el stock y precio de un producto dado.
 */
import java.util.Scanner;

public class Tienda {
    static Scanner scanner = new Scanner(System.in);
    public static void main(String[] args) {
        
        String[] nombresProductos = new String[10];
        double[] preciosProductos = new double[10];
        int[] cantidadesStock = new int[10];

        int opcion;
        do {
            System.out.println("Seleccione una opción:");
            System.out.println("1. Dar de alta un producto nuevo.");
            System.out.println("2. Buscar un producto por su nombre.");
            System.out.println("3. Modificar el stock y precio de un producto.");
            System.out.println("0. Salir.");

            opcion = scanner.nextInt();
            scanner.nextLine(); // Consumir el salto de línea

            switch (opcion) {
                case 1:
                    darDeAltaProducto(nombresProductos, preciosProductos, cantidadesStock);
                    break;
                case 2:
                    buscarProductoPorNombre(nombresProductos, preciosProductos, cantidadesStock);
                    break;
                case 3:
                    modificarStockYPrecio(nombresProductos, preciosProductos, cantidadesStock);
                    break;
            }
        } while (opcion != 0);
    }

    private static void darDeAltaProducto(String[] nombres, double[] precios, int[] cantidades) {
        System.out.println("Ingrese el nombre del producto:");
        String nombre = scanner.nextLine();

        // Verifica si el producto ya existe
        for (int i = 0; i < nombres.length; i++) {
            if (nombre.equals(nombres[i])) {
                System.out.println("El producto ya existe en el stock.");
                return;
            }
        }

        System.out.println("Ingrese el precio del producto:");
        double precio = scanner.nextDouble();
        System.out.println("Ingrese la cantidad en stock del producto:");
        int cantidadStock = scanner.nextInt();

        // Busca la primera posición disponible en los arrays
        int indice = buscarIndiceVacio(nombres);
        
        // Agrega el nuevo producto al stock
        if (indice != -1) {
            nombres[indice] = nombre;
            precios[indice] = precio;
            cantidades[indice] = cantidadStock;

            System.out.println("Producto agregado al stock.");
        } else {
            System.out.println("No hay espacio disponible para agregar más productos.");
        }
    }

    private static int buscarIndiceVacio(String[] nombres) {
        for (int i = 0; i < nombres.length; i++) {
            if (nombres[i] == null) {
                return i;
            }
        }
        return -1; // Retorna -1 si no hay espacio disponible
    }

    private static void buscarProductoPorNombre(String[] nombres, double[] precios, int[] cantidades) {
        System.out.println("Ingrese el nombre del producto a buscar:");
        String nombreBusqueda = scanner.nextLine();

        for (int i = 0; i < nombres.length; i++) {
            if (nombreBusqueda.equals(nombres[i])) {
                System.out.println("Producto encontrado:");
                System.out.println("Nombre: " + nombres[i]);
                System.out.println("Precio: " + precios[i]);
                System.out.println("Cantidad en stock: " + cantidades[i]);
                return;
            }
        }

        System.out.println("Producto no encontrado en el stock.");
    }

    private static void modificarStockYPrecio(String[] nombres, double[] precios, int[] cantidades) {
        System.out.println("Ingrese el nombre del producto a modificar:");
        String nombreModificacion = scanner.nextLine();

        for (int i = 0; i < nombres.length; i++) {
            if (nombreModificacion.equals(nombres[i])) {
                System.out.println("Ingrese el nuevo precio del producto:");
                double nuevoPrecio = scanner.nextDouble();
                System.out.println("Ingrese la nueva cantidad en stock del producto:");
                int nuevaCantidadStock = scanner.nextInt();

                // Modifica el precio y la cantidad en stock del producto
                precios[i] = nuevoPrecio;
                cantidades[i] = nuevaCantidadStock;

                System.out.println("Producto modificado correctamente.");
                return;
            }
        }

        System.out.println("Producto no encontrado en el stock.");
    }
}



