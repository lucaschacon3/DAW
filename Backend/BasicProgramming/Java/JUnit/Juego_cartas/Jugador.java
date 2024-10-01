package JUnit.Juego_cartas;

import java.util.ArrayList;
import java.util.List;

public class Jugador {
    private String nombre;
    private List<Carta> cartasEnSuMano;

    public Jugador(String nombre) {
        this.nombre = nombre;
        cartasEnSuMano = new ArrayList<>();
    }

    public String getNombre() {
        return nombre;
    }

    public List<Carta> getCartasEnSuMano() {
        return cartasEnSuMano;
    }

    public void recibirCarta(Carta carta) {
        cartasEnSuMano.add(carta);
    }
}


