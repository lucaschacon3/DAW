package POO_electrodomesticos;

public class Television extends Electrodomestico{
    
    private double pulgadas;
    private boolean TDT;

    final double pulgadas_defecto=20;
    final boolean TDT_defecto= false;

    public Television(){
        super();
        this.pulgadas=pulgadas_defecto;
        this.TDT=TDT_defecto;
    }

    public Television(double precio, double peso){
        super(precio, peso);
        this.pulgadas=pulgadas_defecto;
        this.TDT=TDT_defecto;

    }

    public Television(double pulgadas, boolean TDT, double precio, String color, char consumo, double peso){
        super(precio, color, consumo, peso);
        this.pulgadas=pulgadas;
        this.TDT=TDT;
    }

    public double getPulgadas() {
        return pulgadas;
    }

    public boolean getTDT() {
        return TDT;
    }

    public double precioFinal(){
        
        double precioF=super.getPrecio();
        if (this.pulgadas>40) {
            precioF=precioF+precioF*0.3;
        }
        if (this.TDT) {
            precioF=precioF+50;
        }
        return precioF;
    }

    @Override
    public String toString() {
        
        return super.toString()+ " Pulgadas: "+getPulgadas()+ " TDT: "+getTDT()+ " Precio final: "+precioFinal();
    }

}
