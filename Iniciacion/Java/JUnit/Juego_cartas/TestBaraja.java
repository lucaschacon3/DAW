package JUnit.Juego_cartas;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

public class TestBaraja {

    private Baraja baraja;

    @Before 
    public void setUp() {
        baraja = new Baraja();
    }

    @Test
    public void testConstructor() {
        assertNotNull(baraja);
        assertEquals(40, baraja.numeroCartas());
    }


    @Test
    public void testRobar() {
        int numeroCartasInicial = baraja.numeroCartas();
        Carta cartaRobada = baraja.robar();
        int numeroCartasFinal = baraja.numeroCartas();

        assertNotNull(cartaRobada);
        assertEquals(numeroCartasInicial - 1, numeroCartasFinal);
    }

    @Test
    public void testInsertarCarta() {
        int numeroCartasInicial = baraja.numeroCartas();
        baraja.InsertaCartaFinal(41);
        int numeroCartasFinal = baraja.numeroCartas();

        assertEquals(numeroCartasInicial + 1, numeroCartasFinal);
    }

    @Test
    public void testVacia() {
        assertFalse(baraja.vacia());

        while (!baraja.vacia()) {
            baraja.robar();
        }

        assertTrue(baraja.vacia());
    }

    @Test
    public void testBarajar() {
        Baraja barajaAntesBarajar = new Baraja();
        Baraja barajaDespuesBarajar = new Baraja();
        barajaDespuesBarajar.barajar();

        assertNotEquals(barajaAntesBarajar.mostrarBarajaPrueba(), barajaDespuesBarajar.mostrarBarajaPrueba());
    }

    @Test
    public void testCortar() {
        Baraja barajaAntesCortar = new Baraja();
        baraja.cortar(20);

        assertNotEquals(barajaAntesCortar.mostrarBarajaPrueba(), baraja.mostrarBarajaPrueba());
    }

}


    
