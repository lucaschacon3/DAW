package POO_figura;

public class Circulo extends Figura {
    private double radio;
    private Punto punto;

    public Circulo(String nombre, double radio, Punto punto) {
        super(nombre);
        this.radio = radio;
        this.punto = punto;
    }

    public double obtenerArea() {
        return (Math.PI*radio * radio);
    }

    public double obtenerVolumen() {
        return 0;
    }

    public double getRadio() {
        return radio;
    }

    public Punto getPunto() {
        return punto;
    }

    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return super.toString()+" Area: "+obtenerArea()+" Volumen: "+obtenerVolumen();
    }
}
