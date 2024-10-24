package POO_HashMap;


import java.util.HashMap;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class POO_HashMap {

	public static void main(String[] args) {
		HashMap<Integer, String> nombres=new HashMap<Integer, String>();
		Scanner scanner=new Scanner(System.in);
		int opcion=1;
		int clave=0;
		String nombre="";
		do {
			System.out.println("0. Salir");
			System.out.println("1. Insertar");
			System.out.println("2. Listar");
			System.out.println("3. Borrar");
			
			opcion=scanner.nextInt();
			switch(opcion) {
				case 1: //insertar
					//pedimos la clave y nos aseguramos de que no exista
					do {
						System.out.println("inserta clave");
						clave=scanner.nextInt();
						scanner.nextLine();
					}while(nombres.containsKey(clave));
					//pedimos el nombre e insertemos el par clave-valor
					System.out.println("Introduce nombre");
					nombre=scanner.nextLine();
					nombres.put(clave, nombre);
				break;
				case 2: //listar
					//recuperamos todas las claves del array asociativos para recorrerlo
				Set<Integer> claves=nombres.keySet();
				for(Integer key:claves) {
					//accedemos al valor por clave
					System.out.println("Clave:"+key+" Valor:"+nombres.get(key));
				}
				break;
				case 3:
					System.out.println("Introduce clave a borrar");
					clave=scanner.nextInt();
					if (nombres.containsKey(clave)) {
						nombres.remove(clave);
					}else {
						System.out.println("Clave no existe");
					}
					
				break;
				default:
					System.out.println("Opción no valida");
			}
		}while (opcion!=0);

	}

}