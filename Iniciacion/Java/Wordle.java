import java.util.Random;
import java.util.Scanner;

public class Wordle {
    static String palabraSecreta = "";
    static int numIntentosConsumidos = 6;
    static int numLetrasAdivinadas = 0;
    static int numLetrasAdivinadasJ1 = 0;
    static int numLetrasAdivinadasJ2 = 0;
    static Scanner scanner = new Scanner(System.in);
    static int puntosJugador = 0;
    static int puntosMaquina = 0;
    static int puntosJugador1 = 0;
    static int puntosJugador2 = 0;
    static int totalPartidas = 0;

    public static void main(String[] args) {
        String palabraIntroducida;
        char letra;
        System.out.println("Quieres jugar en español o en inglés? (E/I)");
        char opcionIdioma=scanner.nextLine().charAt(0);

        System.out.println("Quieres jugar conta la máquina o contra un amigo? (M/A)");
        char opcionJuego=scanner.nextLine().charAt(0);

        
        if (opcionJuego=='m'||opcionJuego=='M') {
            generaPalabra(opcionIdioma); //se genera una palabra, está ahí porque dentro del while se generaria plabra constantemente
            do {
                do {
                    System.out.println("Introduce una palabra de 5 letras");
                    palabraIntroducida = scanner.nextLine();
                    if (palabraIntroducida.length()!=5) {
                        System.out.println("No has introducido una palabra de 5 letras");
                    }
    
                    numIntentosConsumidos--; // quitamos un intento
                    System.out.println(compruebaLetrasAcertadas(palabraIntroducida));
    
                } while (numIntentosConsumidos > 0 && !haGanadoJugador());
                
                haTerminadoJuego();
                generaPalabra(opcionIdioma);// genero otra palabra por si quiere empezar otro juego, que salga una palabra nueva
                numIntentosConsumidos=6;
                numLetrasAdivinadas=0;
                System.out.print("Desea salir? (S/N): ");
                letra = scanner.next().charAt(0);
            } while (letra != 's'&& letra != 'S');
    
            System.out.println("Has salido de Wordle");
            
        }else if (opcionJuego=='a'||opcionJuego=='A') {
            generaPalabra(opcionIdioma); //se genera una palabra, está ahí porque dentro del while se generaria plabra constantemente
            do {
                System.out.println("Ronda jugador 1");
                do {
                    System.out.println("Introduce una palabra de 5 letras");
                    palabraIntroducida = scanner.nextLine();
                    if (palabraIntroducida.length()!=5) {
                        System.out.println("No has introducido una palabra de 5 letras");
                    }
    
                    numIntentosConsumidos--; // quitamos un intento

                    System.out.println(compruebaLetrasAcertadas(palabraIntroducida));
                    
    
                } while (numIntentosConsumidos > 0 && !haGanadoJugador1());
                
            
                generaPalabra(opcionIdioma);// genero otra palabra por si quiere empezar otro juego, que salga una palabra nueva
                numIntentosConsumidos=6;
                

                System.out.println("Ronda jugador 2");
                do {
                    System.out.println("Introduce una palabra de 5 letras");
                    palabraIntroducida = scanner.nextLine();
                    if (palabraIntroducida.length()!=5) {
                        System.out.println("No has introducido una palabra de 5 letras");
                    }
    
                    numIntentosConsumidos--; // quitamos un intento
                    System.out.println(compruebaLetrasAcertadas(palabraIntroducida));
    
                } while (numIntentosConsumidos > 0 && !haGanadoJugador2());
                
                haTerminadoJuegoAmigo();
                generaPalabra(opcionIdioma);// genero otra palabra por si quiere empezar otro juego, que salga una palabra nueva

                System.out.print("Desea salir? (S/N): ");
                letra = scanner.next().charAt(0);
            } while (letra != 's'&& letra != 'S');
    
            System.out.println("Has salido de Wordle");
        }else{
            System.out.println("Error al introducir la opción del modo de juego");
        }

    }

        
    public static boolean haGanadoJugador() {
        if (numLetrasAdivinadas == 5) {
            return true;
        }
        return false;
    }
    public static boolean haGanadoJugador1() {
        if (numLetrasAdivinadasJ1 > 4) {
            return true;
        }
        return false;
    }
    public static boolean haGanadoJugador2() {
        if (numLetrasAdivinadasJ2 > 4) {
            return true;
        }
        return false;
    }

    public static void haTerminadoJuego() {
        

        if (numIntentosConsumidos == 0) {
            System.out.println("Has perdido la partida");
            puntosMaquina++;
        } else if (haGanadoJugador()) {
            System.out.println("Has ganado la partida");
            puntosJugador++;
        }

        totalPartidas++;
        System.out.println("Tu: " + puntosJugador + " vs Maquina: " + puntosMaquina);
        System.out.println("Total de partidas: " + totalPartidas);
    }

    public static void haTerminadoJuegoAmigo() {
        

        if (haGanadoJugador1()) {
            System.out.println("Ha ganado jugador 1");
            puntosJugador1++;
        } else if (haGanadoJugador2()) {
            System.out.println("Has ganado jugador 2");
            puntosJugador2++;
        }else if (!haGanadoJugador1()&&!haGanadoJugador2()) {
            System.out.println("Jugador 1 y jugador 2 han perdido");
        }

        totalPartidas++;
        System.out.println("Jugador 1: " + puntosJugador1 + " vs Jugador 2: " + puntosJugador2);
        System.out.println("Total de partidas: " + totalPartidas);
    }

    public static String compruebaLetrasAcertadas(String palabraIntroducida) {
        char[] palabraGenerada = new char[5];//aqui se crea la palabra con mayusculas, minusculas y asteriscos 
        numLetrasAdivinadas = 0;
    
        
        String palabraSecretaLowerCase = palabraSecreta.toLowerCase();// lo convertimos en minusculas por si el usuario introduce mayusculas
    
        for (int i = 0; i < palabraIntroducida.length(); i++) {
            char letraIntroducida = Character.toUpperCase(palabraIntroducida.charAt(i));//en cada iteracion se guarda en un char la letra correspondiente
            char letraSecreta = Character.toUpperCase(palabraSecreta.charAt(i));
    
            if (letraIntroducida == letraSecreta) {
                palabraGenerada[i] = letraIntroducida;
                numLetrasAdivinadas++;
                numLetrasAdivinadasJ1++;
                numLetrasAdivinadasJ2++;
            } else if (palabraSecretaLowerCase.indexOf(Character.toLowerCase(letraIntroducida)) != -1) { //comprueba que la letra intoducida pertenzca a la palabra secreta, (si no esta devuelve -1)
                palabraGenerada[i] = Character.toLowerCase(letraIntroducida);
            } else {
                palabraGenerada[i] = '*';
            }
        }
        return new String(palabraGenerada);
    }

    public static String generaPalabra(char opcionIdioma) {

        if (opcionIdioma=='e'|| opcionIdioma=='E') {
            String[] palabras_esp = {"mango", "huevo", "salto", "oveja", "tigre", "lince", "zorro", "gafas",
            "pista", "silla", "libro", "bolsa", "madre", "padre", "boxeo", "rugby", "reloj", "nubes", "ancla", "cebra"};
            Random random = new Random();
            palabraSecreta = palabras_esp[random.nextInt(20)];
        }else if (opcionIdioma=='i'||opcionIdioma=='I') {
            String[] palabras_ing = {"house", "plant", "water", "music", "phone", "bread", "money", "table",
            "happy", "watch", "fruit", "green", "chair", "party", "light", "apple", "beach", "earth", "smile", "river"};
            Random random = new Random();
            palabraSecreta = palabras_ing[random.nextInt(20)];
        }else{
            System.out.println("Error al introducir la opción del idioma");
        }
        
        return palabraSecreta;
    }
}