package POO_figura;

public class Cilindro extends Figura {
    
    private Circulo circulo;
    private double altura;

    public Cilindro(String nombre, Circulo circulo, double altura){
        
        super(nombre);
        this.circulo=circulo;
        this.altura=altura;
    }

    public double getAltura() {
        return altura;
    }
    
    public double obtenerArea(){
        return (2*circulo.obtenerArea())+(2*Math.PI*circulo.getRadio()*getAltura());
    }

    public double obtenerVolumen(){
        return (Math.PI* Math.pow(circulo.getRadio(), 2)*getAltura());
    }

    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return super.toString()+" Area: "+obtenerArea()+" Volumen: "+obtenerVolumen();
    }
}
