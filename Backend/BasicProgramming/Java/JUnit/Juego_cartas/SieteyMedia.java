package JUnit.Juego_cartas;

import java.util.Random;
import java.util.Scanner;

public class SieteyMedia {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Random random = new Random();
        Baraja baraja = new Baraja(1);
        double sumatorioJugador = 0;
        double sumatorioMaquina = 0;
        char op;
        boolean jugadorSeHaPlantado = false;

        System.out.println("Juego 7 y media");
        System.out.println("------------------");

        baraja.barajar();

        // Turno del jugador
        while (!jugadorSeHaPlantado) {
            Carta carta = baraja.robar();
            System.out.println("Carta seleccionada: " + carta.nombreCarta());
            sumatorioJugador += carta.valor7ymedia();

            System.out.println("Suma total del jugador: " + sumatorioJugador);

            if (sumatorioJugador >= 7.5) {
                System.out.println("Te has plantado.");
                jugadorSeHaPlantado = true;
            } else {
                System.out.print("¿Quieres más cartas? (S/N): ");
                op = scanner.nextLine().charAt(0);
                op = Character.toLowerCase(op);
                if (op != 's') {
                    jugadorSeHaPlantado = true;
                }
            }
        }

        // Turno de la máquina
        while (sumatorioMaquina < 7 && random.nextBoolean()) {
            Carta carta = baraja.robar();
            System.out.println("La máquina ha sacado la carta: " + carta.nombreCarta());
            sumatorioMaquina += carta.getNumero();
            System.out.println("Suma total de la máquina: " + sumatorioMaquina);
        }

        // Comparación de resultados
        if (sumatorioJugador > 7.5 || (sumatorioMaquina <= 7.5 && sumatorioMaquina > sumatorioJugador)) {
            System.out.println("La máquina gana.");
        } else if (sumatorioMaquina > 7.5 || (sumatorioJugador <= 7.5 && sumatorioJugador > sumatorioMaquina)) {
            System.out.println("¡Has ganado!");
        } else {
            System.out.println("Empate.");
        }
    }
}

