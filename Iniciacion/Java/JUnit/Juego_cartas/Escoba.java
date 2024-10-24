package JUnit.Juego_cartas;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Escoba {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<Jugador> jugadores = new ArrayList<>();
        Baraja baraja = new Baraja();
        List<Carta> cartasEnMesa = new ArrayList<>();

        // Agregar jugadores
        jugadores.add(new Jugador("Jugador 1"));
        jugadores.add(new Jugador("Jugador 2"));

        // Repartir cartas
        for (int i = 0; i < 3; i++) {
            for (Jugador jugador : jugadores) {
                Carta carta = baraja.robar();
                jugador.recibirCarta(carta);
            }
        }

        boolean juegoTerminado = false;
        while (!juegoTerminado) {
            for (Jugador jugador : jugadores) {
                // Imprimir estado actual del juego
                System.out.println("Turno de " + jugador.getNombre());
                System.out.println("Cartas en la mesa: " + cartasEnMesa);
                System.out.println("Cartas en tu mano: " + jugador.getCartasEnSuMano());

                // Lógica del turno del jugador (pendiente de implementar)

                // Preguntar al jugador si desea continuar jugando
                System.out.print("¿Quieres continuar jugando? (S/N): ");
                String continuar = scanner.nextLine().toUpperCase();
                if (continuar.equals("N")) {
                    juegoTerminado = true;
                }
            }
        }
    }
}


