package POO_banco;

public class Persona {
    private String dni;
    private int cuentasAsociadas;
    private Cuenta[]cuentas;

    //constructor
    public Persona(String dni){

        this.dni=dni;
        this.cuentasAsociadas=0;
        this.cuentas=new Cuenta[3];
    }
    //setter
    public boolean addCuentas(String numCuenta){
        if (this.cuentasAsociadas>3) {
            return false;
        }
        this.cuentas[this.cuentasAsociadas]=new Cuenta(numCuenta);
        this.cuentasAsociadas++;
        return true;

    }
    //getter
    public boolean esMorosa(){
        /*for (int i = 0; i < cuentasAsociadas; i++) {
            if (cuentas[i].consultarSaldo()<0) {
                return true;
            }
            
        }
        return false;
        */ 
        for (Cuenta c:cuentas){
            if(c.consultarSaldo()<0){
                return true;
            }
        }
        return false;
        
    }
    //getter
    public String toString() {
        String cadena="Dni: "+this.dni;
        
        for (int i = 0; i < cuentasAsociadas; i++) {
            cadena=cadena+cuentas[i].toString();
        }
        return cadena;
    }
    //getter
    public String dameDni(){
        return this.dni;
    }
    //getter
    public Cuenta dameCuenta(String numCuenta) {
		for (int i=0;i<cuentasAsociadas;i++) {
			Cuenta c=cuentas[i];
			if (numCuenta.equals(c.consultarCuenta())) {
				return c;
			}
		}
		// no ha encontrado la cuenta
		return null;
	}

    
    
}
