

import java.util.Scanner;

/*
 * Realizar una función a la que se le pasa
 *  por parámetro una cadena
con un email, y dicha función devuelve si el 
mail está bien formado.
Un email está bien formado cuando:
1.1.- Contiene una y solo una arroba.
1.2.- No puede contener dos puntos seguidos '.' después de la arroba.
1.3.- No puede contener ' '
 * 
 * 
 * */
public class Email {

	public static void main(String[] args) {
		Scanner in=new Scanner (System.in);
		System.out.println("Introduce un email");
		String email=in.nextLine();
		
		if (emailEsCorrecto(email))
			System.out.println("El email es correcto!!!");
		else
			System.out.println("El email NO es correcto :(");

	}
	
	public static boolean emailEsCorrecto(String email) {
		if (!contieneUnaArroba(email))
			return false;
		if (contieneAlgunEspacio(email))
			return false;
		if (contieneDosPuntosSeguidos(email))
			return false;
		// en caso de que todo sea correcto
		return true;
	}
	public static boolean contieneUnaArroba(String email) {
		int posPrimeraArroba=email.indexOf('@');
		int posUltimaArroba=email.lastIndexOf('@');
		// no hay ninguna @
		if (posPrimeraArroba==-1)
			return false;
		// solo hay una @
		if (posPrimeraArroba==posUltimaArroba)
			return true;
		// hay más de 1 arroba
		return false;
	}
	public static boolean contieneAlgunEspacio(String email) {
		/*FORMA 1
		 * for (int i=0;i<email.length();i++) {
		 
			if (email.charAt(i)==' ')
				return false;
		}
		return true;
		*/
		// FORMA 2
		if (email.contains(" "))
			return true;
		//si no lo contiene
		return false;
		// FORMA 3
		//if (email.indexOf(' ')==-1)
		//	return false;
		//return true;
		
	}
	public static boolean contieneDosPuntosSeguidos(String email) {
		String[] partesEmail=email.split("@");
		boolean tieneDosPuntos=partesEmail[1].contains("..");
		return tieneDosPuntos;
	}

}
