package POO_TresEnRayaV2;

import java.util.Random;
import java.util.Scanner;

public class usoTresEnRaya {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        TresEnRaya tablero = new TresEnRaya();
        int op = 0;
        int posJ1, posJ2;
        char fichaJ1 = ' ';
        char fichaJ2 = ' ';
        do {
            Menu(); // Mostrar el menú principal
            op = scanner.nextInt();
            if (op == 1) {
                do {
                    scanner.nextLine();

                    System.out.println("Jugador 1 elige ficha (X/O): ");
                    fichaJ1 = scanner.nextLine().charAt(0);
    
    
                    System.out.println("Jugador 2 elige ficha (X/O): ");
                    fichaJ1 = scanner.nextLine().charAt(0);
                } while (((fichaJ1!='X' && fichaJ2!='O')||(fichaJ1!='X' && fichaJ2!='O'))&&(fichaJ1!=fichaJ2));


                do {



                    if (fichaJ1 == 'X' && fichaJ2 == 'O') {
                        // jugador 1
                        tablero.dibujaTablero();
                        System.out.println("Introduce una posición para jugador 1 (1-9)");
                        posJ1 = scanner.nextInt();
                        if (tablero.mueveJugador1(posJ1 - 1)) {
                            System.out.println("Movimiento efectivo");
                        } else {
                            System.out.println("Movimiento no efectivo");
                            System.out.println("Introduce una posición para jugador (1-9)");
                            posJ1 = scanner.nextInt();
                            tablero.mueveJugador1(posJ1 - 1);
                        }

                        // jugador 2
                        tablero.dibujaTablero();
                        System.out.println("Introduce una posición para jugador 2 (1-9)");
                        posJ2 = scanner.nextInt();
                        if (tablero.mueveJugador2(posJ2 - 1)) {
                            System.out.println("Movimiento efectivo");
                        } else {
                            System.out.println("Movimiento no efectivo");
                            System.out.println("Introduce una posición para jugador (1-9)");
                            posJ2 = scanner.nextInt();
                            tablero.mueveJugador1(posJ2 - 1);
                        }
                    } else {
                        // jugador 1
                        tablero.dibujaTablero();
                        System.out.println("Introduce una posición para jugador 1 (1-9)");
                        posJ1 = scanner.nextInt();
                        if (tablero.mueveJugador2(posJ1 - 1)) {
                            System.out.println("Movimiento efectivo");
                        } else {
                            System.out.println("Movimiento no efectivo");
                            System.out.println("Introduce una posición para jugador (1-9)");
                            posJ1 = scanner.nextInt();
                            tablero.mueveJugador2(posJ1 - 1);
                        }

                        // jugador 2
                        tablero.dibujaTablero();
                        System.out.println("Introduce una posición para jugador 2 (1-9)");
                        posJ2 = scanner.nextInt();
                        if (tablero.mueveJugador1(posJ2 - 1)) {
                            System.out.println("Movimiento efectivo");
                        } else {
                            System.out.println("Movimiento no efectivo");
                            System.out.println("Introduce una posición para jugador (1-9)");
                            posJ2 = scanner.nextInt();
                            tablero.mueveJugador1(posJ2 - 1);
                        }
                    }

                } while (!tablero.ganaJugador1() && !tablero.ganaJugador2() && tablero.quedanMovimientos());

                // Mostrar el resultado del juego
                if (tablero.ganaJugador1()) {
                    System.out.println("Ha ganado el jugador 1");
                } else if (tablero.ganaJugador2()) {
                    System.out.println("Ha ganado el jugador 2");
                } else {
                    System.out.println("Empate");
                }
                tablero.iniciar();

            } else if (op == 2) {
                // máquina vs jugador
                Random random = new Random();
                int whostarts = random.nextInt(2);
                if (whostarts == 0) {
                    System.out.println("Empieza el jugador 1");
                    do {
                        // Turno del jugador 1
                        tablero.dibujaTablero();
                        System.out.println("Introduce una posición para jugador (1-9)");
                        posJ1 = scanner.nextInt();
                        if (tablero.mueveJugador1(posJ1 - 1)) {
                            System.out.println("Movimiento efectivo");
                        } else {
                            System.out.println("Movimiento no efectivo");
                            System.out.println("Introduce una posición para jugador (1-9)");
                            posJ1 = scanner.nextInt();
                            tablero.mueveJugador1(posJ1 - 1);
                        }

                        // Turno de la máquina (movimiento aleatorio)

                        int posRandom;
                        do {
                            posRandom = random.nextInt(9);
                        } while (!tablero.mueveJugador2(posRandom));

                    } while (!tablero.ganaJugador1() && !tablero.ganaJugador2() && tablero.quedanMovimientos());
                } else {
                    System.out.println("Empieza la maquina");
                    do {
                        // Turno de la máquina (movimiento aleatorio)

                        int posRandom;
                        do {
                            posRandom = random.nextInt(9);
                        } while (!tablero.mueveJugador2(posRandom));

                        // Turno del jugador 1
                        tablero.dibujaTablero();
                        System.out.println("Introduce una posición para jugador (1-9)");
                        posJ1 = scanner.nextInt();
                        if (tablero.mueveJugador1(posJ1 - 1)) {
                            System.out.println("Movimiento efectivo");
                        } else {
                            System.out.println("Movimiento no efectivo");
                            System.out.println("Introduce una posición para jugador (1-9)");
                            posJ1 = scanner.nextInt();
                            tablero.mueveJugador1(posJ1 - 1);
                        }

                    } while (!tablero.ganaJugador1() && !tablero.ganaJugador2() && tablero.quedanMovimientos());
                }

                // Mostrar el resultado del juego
                tablero.dibujaTablero();
                if (tablero.ganaJugador1()) {
                    System.out.println("Ha ganado el jugador 1");
                } else if (tablero.ganaJugador2()) {
                    System.out.println("Ha ganado la máquina");
                } else {
                    System.out.println("Empate");
                }
                tablero.iniciar();
            } else if (op == 3) {
                // maquina vs maquina
                do {
                    // Turno maquina 1
                    Random random = new Random();
                    tablero.dibujaTablero();
                    int posRandom1 = random.nextInt(9);
                    tablero.mueveJugador1(posRandom1);

                    if (!tablero.ganaJugador2() && tablero.quedanMovimientos()) {
                        tablero.dibujaTablero();
                        int posRandom2 = random.nextInt(9);
                        tablero.mueveJugador2(posRandom2);
                    }

                } while (!tablero.ganaJugador1() && !tablero.ganaJugador2() && tablero.quedanMovimientos());

                // Mostrar el resultado del juego
                tablero.dibujaTablero();
                if (tablero.ganaJugador1()) {
                    System.out.println("Ha ganado la maquina 1");
                } else if (tablero.ganaJugador2()) {
                    System.out.println("Ha ganado la máquina 2");
                } else {
                    System.out.println("Empate");
                }
                tablero.iniciar();
            }
        } while (op != 4);

        System.out.println("Has salido");
    }

    public static void Menu() {
        System.out.println(" ");
        System.out.println("**************************");
        System.out.println("***** Menú principal *****");
        System.out.println("**************************");
        System.out.println("_____________________");
        System.out.println("Introduce una opción: ");
        System.out.println("1. Jugador 1 vs jugador 2");
        System.out.println("2. Jugador 1 vs máquina");
        System.out.println("3. Maquina vs Maquina");
        System.out.println("4. Salir");
    }
}
