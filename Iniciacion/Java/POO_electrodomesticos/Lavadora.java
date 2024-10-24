package POO_electrodomesticos;

public class Lavadora extends Electrodomestico {
    
    private double carga;
    final double carga_defecto=5;

    public Lavadora(){
        super();
        this.carga=carga_defecto;
    }

    public Lavadora(double precio, double peso){
        super(precio, peso);
        this.carga=carga_defecto;
    }

    public Lavadora(double carga, double precio, String color, char consumo, double peso){
        super(precio, color, consumo, peso);
        this.carga=carga;
    }

    public double getCarga() {
        return carga;
    }

    public double precioFinal(){
        
        double precioF=super.getPrecio();
        if (this.carga>50) {
            precioF=precioF+50;
        }
        return precioF;
    }

    @Override
    public String toString() {
        
        return super.toString()+ " Carga: "+getCarga()+ " Precio final: "+precioFinal();
    }
}
