package POO_CarritoCompra;


import java.util.HashMap;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class POO_CarritoCompra {

	public static void main(String[] args) {
		HashMap<String, Integer> carrito=new HashMap<String, Integer>();
		Scanner scanner=new Scanner(System.in);
		int opcion=1;
		String clave="";
		Integer valor=0;
		do {
			System.out.println("0. Salir");
			System.out.println("1. Añadir al carrito");
			System.out.println("2. Listar carrito");
			System.out.println("3. Borrar carrito");
			
			opcion=Integer.parseInt(scanner.nextLine());
			switch(opcion) {
				case 1: //insertar
					//pedimos la clave y nos aseguramos de que no exista
					do {
						System.out.print("Inserta nombre del producto: ");
						clave=scanner.nextLine();
					}while(carrito.containsKey(clave));
					//pedimos el nombre e insertemos el par clave-valor
					System.out.print("Introduce la cantidad: ");
					valor=Integer.parseInt(scanner.nextLine()) ;
					carrito.put(clave, valor);
				break;
				case 2: //listar
					//recuperamos todas las claves del array asociativos para recorrerlo
				Set<String> claves=carrito.keySet();
				for(String key:claves) {
					//accedemos al valor por clave
					System.out.println("Producto:"+key+" Cantidad:"+carrito.get(key));
				}
				break;
				case 3:
					System.out.print("Introduce producto a borrar: ");
					clave=scanner.nextLine();
					if (carrito.containsKey(clave)) {
						carrito.remove(clave);
					}else {
						System.out.println("Producto no existe");
					}
					
				break;
				default:
					System.out.println("Opción no valida");
			}
		}while (opcion!=0);

	}

}