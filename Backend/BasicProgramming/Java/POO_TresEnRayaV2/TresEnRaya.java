package POO_TresEnRayaV2;

public class TresEnRaya {

    private int[][] tablero;

    public TresEnRaya() {
        tablero = new int[3][3];

        for (int i = 0; i < tablero.length; i++) {
            for (int j = 0; j < tablero[i].length; j++) {
                tablero[i][j] = 0;
            }
        }
    }

    public void iniciar(){
        for (int i = 0; i < tablero.length; i++) {
            for (int j = 0; j < tablero.length; j++) {
                tablero[i][j]=0;
            }
        }
    }

    public boolean mueveJugador1(int pos) {
        int fila = pos / 3;
        int columna = pos % 3;
        if (movimientoValido(fila, columna)) {
            tablero[fila][columna] = 1;
            return true;
        }
        return false;
    }
    
    public boolean mueveJugador2(int pos) {
        int fila = pos / 3;
        int columna = pos % 3;
        if (movimientoValido(fila, columna)) {
            tablero[fila][columna] = 2;
            return true;
        }
        return false;
    }
    

    public boolean movimientoValido(int fila, int columna) {
        if (fila >= 0 && fila < 3 && columna >= 0 && columna < 3) {
            if (tablero[fila][columna] == 0) {
                return true;
            }
        }
        return false;
    }

    public boolean quedanMovimientos() {
        for (int i = 0; i < tablero.length; i++) {
            for (int j = 0; j < tablero[i].length; j++) {
                if (tablero[i][j] == 0) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean ganaJugador1() {
        // Comprobación de filas y columnas
        for (int i = 0; i < 3; i++) {
            if ((tablero[i][0] == 1 && tablero[i][1] == 1 && tablero[i][2] == 1) ||
                (tablero[0][i] == 1 && tablero[1][i] == 1 && tablero[2][i] == 1)) {
                return true;
            }
        }
        // Comprobación de diagonales
        if ((tablero[0][0] == 1 && tablero[1][1] == 1 && tablero[2][2] == 1) ||
            (tablero[0][2] == 1 && tablero[1][1] == 1 && tablero[2][0] == 1)) {
            return true;
        }
        return false;
    }

    public boolean ganaJugador2() {
        // Comprobación de filas y columnas
        for (int i = 0; i < 3; i++) {
            if ((tablero[i][0] == 2 && tablero[i][1] == 2 && tablero[i][2] == 2) ||
                (tablero[0][i] == 2 && tablero[1][i] == 2 && tablero[2][i] == 2)) {
                return true;
            }
        }
        // Comprobación de diagonales
        if ((tablero[0][0] == 2 && tablero[1][1] == 2 && tablero[2][2] == 2) ||
            (tablero[0][2] == 2 && tablero[1][1] == 2 && tablero[2][0] == 2)) {
            return true;
        }
        return false;
    }

    public void dibujaTablero() {
        char [][] tableroCaracteres=new char[3][3];

        for (int i = 0; i < tableroCaracteres.length; i++) {
            for (int j = 0; j < tableroCaracteres.length; j++) {
                
                if (tablero[i][j]==1) {
                    tableroCaracteres[i][j]='X';
                }
                if (tablero[i][j]==2) {
                    tableroCaracteres[i][j]='O';
                }
                if (tablero[i][j]==0) {
                    tableroCaracteres[i][j]=' ';
                }
            }
        }
        System.out.println("");
        System.out.println(" " + tableroCaracteres[0][0] + " | " + tableroCaracteres[0][1] + " | " + tableroCaracteres[0][2]);
        System.out.println("-----------");
        System.out.println(" " + tableroCaracteres[1][0] + " | " + tableroCaracteres[1][1] + " | " + tableroCaracteres[1][2]);
        System.out.println("-----------");
        System.out.println(" " + tableroCaracteres[2][0] + " | " + tableroCaracteres[2][1] + " | " + tableroCaracteres[2][2]);
    }
}
