package POO_TresEnRaya;

public class TresEnRaya {

    private int[] tablero;

    public TresEnRaya() {
        tablero = new int[9];

        for (int i = 0; i < tablero.length; i++) {
            tablero[i] = 0;
        }
    }

    public boolean mueveJugador1(int pos) {
        if (movimientoValido(pos)) {
            tablero[pos] = 1;
            return true;
        }
        return false;
    }

    public boolean mueveJugador2(int pos) {
        if (movimientoValido(pos)) {
            tablero[pos] = 2;
            return true;
        }
        return false;
    }

    private boolean movimientoValido(int pos) {
        if (pos >= 0 && pos < 9) {
            if (tablero[pos] == 0) {
                return true;
            }
        }
        return false;
    }

    public boolean quedanMovimientos() {
        for (int i = 0; i < tablero.length; i++) {
            if (tablero[i] == 0) {
                return true;
            }
        }
        return false;
    }

    public boolean ganaJugador1() {
        if ((tablero[0] == 1 && tablero[1] == 1 && tablero[2] == 1) ||
                (tablero[3] == 1 && tablero[4] == 1 && tablero[5] == 1) ||
                (tablero[6] == 1 && tablero[7] == 1 && tablero[8] == 1) ||
                // Combinaciones verticales
                (tablero[0] == 1 && tablero[3] == 1 && tablero[6] == 1) ||
                (tablero[1] == 1 && tablero[4] == 1 && tablero[7] == 1) ||
                (tablero[2] == 1 && tablero[5] == 1 && tablero[8] == 1) ||
                // Combinaciones diagonales
                (tablero[0] == 1 && tablero[4] == 1 && tablero[8] == 1) ||
                (tablero[2] == 1 && tablero[4] == 1 && tablero[6] == 1)) {
            return true;
        } else {

            return false;
        }
    }

    public boolean ganaJugador2() {
        if ((tablero[0] == 2 && tablero[1] == 2 && tablero[2] == 2) ||
                (tablero[3] == 2 && tablero[4] == 2 && tablero[5] == 2) ||
                (tablero[6] == 2 && tablero[7] == 2 && tablero[8] == 2) ||
                // Combinaciones verticales
                (tablero[0] == 2 && tablero[3] == 2 && tablero[6] == 2) ||
                (tablero[1] == 2 && tablero[4] == 2 && tablero[7] == 2) ||
                (tablero[2] == 2 && tablero[5] == 2 && tablero[8] == 2) ||
                // Combinaciones diagonales
                (tablero[0] == 2 && tablero[4] == 2 && tablero[8] == 2) ||
                (tablero[2] == 2 && tablero[4] == 2 && tablero[6] == 2)) {
            return true;

        } else {

            return false;
        }
    }

    public void dibujaTablero() {
        char [] tableroCaracteres=new char[9];

        for (int i = 0; i < tableroCaracteres.length; i++) {
            if (tablero[i]==1) {
                tableroCaracteres[i]='X';
            }
            if (tablero[i]==2) {
                tableroCaracteres[i]='O';
            }
            if (tablero[i]==0) {
                tableroCaracteres[i]=' ';
            }
        }
        System.out.println("");
        System.out.println(" " + tableroCaracteres[0] + " | " + tableroCaracteres[1] + " | " + tableroCaracteres[2]);
        System.out.println("-----------");
        System.out.println(" " + tableroCaracteres[3] + " | " + tableroCaracteres[4] + " | " + tableroCaracteres[5]);
        System.out.println("-----------");
        System.out.println(" " + tableroCaracteres[6] + " | " + tableroCaracteres[7] + " | " + tableroCaracteres[8]);
    }

}