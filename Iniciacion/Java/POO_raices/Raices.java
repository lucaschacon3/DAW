package POO_raices;

public class Raices {
    private double a;
    private double b;
    private double c;
    
    public Raices(double a, double b, double c){
        this.a=a;
        this.b=b;
        this.c=c;
    }

    public void obtenerRaices(){
        if (tieneRaices()) {
            double resultado1= (-b+Math.pow(getDiscriminante(), 0.5))/(2*a);
            System.out.println("Raiz 1 = "+resultado1);

            double resultado2= (-b-Math.pow(getDiscriminante(), 0.5))/(2*a);
            System.out.println("Raiz 2 = "+resultado2);
        }else{
            System.out.println("Tiene una o ninguana real");
        }
    }

    public void obtenerRaiz(){
        if (tieneRaiz()) {
            double resultado1= (-b+Math.pow(getDiscriminante(), 0.5))/(2*a);
            System.out.println("Raiz 1 = "+resultado1);

        }else{
            System.out.println("Tiene más de una raiz");
        }
    }

    public double getDiscriminante(){
        double discriminante= Math.pow(b, 2)-4*a*c;
        return discriminante;
    }

    public boolean tieneRaices(){
    
        if (getDiscriminante()>0) {
            return true;
        }
        return false;
    }

    public boolean tieneRaiz(){
    
        if (getDiscriminante()==0) {
            return true;
        }
        return false;
    }


}