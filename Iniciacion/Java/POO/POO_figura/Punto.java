package POO_figura;

public class Punto extends Figura {

    private double x;
    private double y;
    
    public Punto(String nombre, double x, double y){
        super(nombre);// super llama al constructor de la clase padre
        this.x=x;
        this.y=y;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double obtenerArea(){
        return 0;
    }

    public double obtenerVolumen(){
        return 0;
    }

    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return super.toString()+" Area: "+obtenerArea()+" Volumen: "+obtenerVolumen();
    }
}
