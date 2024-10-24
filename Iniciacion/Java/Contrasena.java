

import java.util.Random;
import java.util.Scanner;

/**
 * Desarrolla un programa en Java que permita generar contraseñas tanto débiles
 * como fuertes. El programa debe pedir al usuario que elija entre generar una
 * contraseña débil o una fuerte.
 * 
 * Para las contraseñas débiles, el programa deberá generar una contraseña de
 * longitud fija (por ejemplo, 6 caracteres) compuesta únicamente por letras
 * minúsculas.
 * 
 * Para las contraseñas fuertes, el programa debe generar una contraseña de
 * longitud específica ingresada por el usuario (por ejemplo, entre 8 y 12
 * caracteres). Estas contraseñas deben incluir una combinación de letras
 * mayúsculas, minúsculas, números y al menos un carácter especial, como '@',
 * '#', '$', '_'.
 * 
 * El programa deberá mostrar la contraseña generada según la elección del
 * usuario.
 */
public class Contrasena {

	public static void main(String[] args) {
		
		Scanner scanner=new Scanner(System.in);
		char letra;
		int numAleatorio;//para generar letras aleatorias
		String letraAleatoria=""; //para guardar la letra aleatoria
		int longitudContrasea;
		String ContrasenaDebil="";
		String ContrasenaFuerte="";
		String caracteres="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$_";

		Random random=new Random();


		System.out.print("Desea generar una contaseña fuerte o débil? (F/D)");
		letra = scanner.nextLine().charAt(0);
		System.out.println(caracteres.length());
		

		if (letra=='f'|| letra=='F') {
			System.out.println("Has elegido contraseña fuerte");
			System.out.print("Introduce la longitud que desea entre 8 y 12 caracteres: ");
			longitudContrasea=scanner.nextInt();
			if (longitudContrasea>7 && longitudContrasea<13) {
				for (int i = 0; i < longitudContrasea-1; i++) {
					numAleatorio=random.nextInt(caracteres.length());
					ContrasenaFuerte=ContrasenaFuerte+caracteres.charAt(numAleatorio);
				}
				numAleatorio=random.nextInt(4)+52;
				ContrasenaFuerte=ContrasenaFuerte+caracteres.charAt(numAleatorio);
				System.out.println("La contraseña fuerte es: "+ContrasenaFuerte);
			}else{
				System.out.println("Error al introducir la longitud");
			}

			
		}else if (letra=='d'|| letra=='D') {
			System.out.println("Has elegido contraseña débil");
			for (int i = 0; i < 6; i++) {
				numAleatorio=random.nextInt(26);
				ContrasenaDebil=ContrasenaDebil+caracteres.charAt(numAleatorio);
			}
			System.out.println("La contraseña débil es: "+ContrasenaDebil);
		}else{
			System.out.println("Error al introducir la opción, Inténtalo de nuevo");
		}
	}
}
