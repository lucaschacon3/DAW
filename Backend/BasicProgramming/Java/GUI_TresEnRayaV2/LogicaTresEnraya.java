package GUI_TresEnRayaV2;

public class LogicaTresEnraya {
    private int[] tablero;
    private boolean esTurnoJugador1;

    public LogicaTresEnraya(){
        tablero=new int[9];
        esTurnoJugador1=true;
    }
    public boolean ganaJugador(int jugador) {
		//columnas
		for(int i=0;i<3;i++) {
			if ((tablero[i]==jugador)&&(tablero[3+i]==jugador)
				&&(tablero[6+i]==jugador)){
				return true;
			}
		}
		//filas
		for(int i=0;i<9;i=i+3) {
			if ((tablero[i]==jugador)&&(tablero[1+i]==jugador)
					&&(tablero[2+i]==jugador)){
					return true;
				}
		}
		//diagonal
		if ((tablero[0]==jugador) && (tablero[4]==jugador)&& 
				(tablero[8]==jugador))
			return true;
		if ((tablero[2]==jugador) && (tablero[4]==jugador)&& 
				(tablero[6]==jugador))
			return true;
			
		return false;
	}

    public boolean quedanCasillas() {
		for(int i=0;i<9;i++) {
			if (tablero[i]==0)
				return true; 
		}
		return false;
	}
	public boolean casillaVacia(int pos) {
		if (tablero[pos]==0)
			return true;
		
		return false;
	}

    public int getTablero(int pos) {
        return tablero[pos];
    }

    public void setTablero(int pos, int cambio) {
        this.tablero[pos]=cambio;
    }

    public boolean isEsTurnoJugador1() {
        return esTurnoJugador1;
    }

    public void setEsTurnoJugador1(boolean esTurnoJugador1) {
        this.esTurnoJugador1 = esTurnoJugador1;
    }
}
