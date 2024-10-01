package POO_raices;

public class usoRaices {
    public static void main(String[] args) {
        Raices ecuacion1= new Raices(1,-2,1);
        Raices ecuacion2= new Raices(-1,7,-10);
        Raices ecuacion3= new Raices(2,-14,24);
        Raices ecuacion4= new Raices(1,1,1);

        System.out.println("Ecuacion 1");
        Resultado(ecuacion1);
        
        System.out.println("\nEcuacion 2");
        Resultado(ecuacion2);

        System.out.println("\nEcuacion 3");
        Resultado(ecuacion3);

        System.out.println("\nEcuacion 4");
        Resultado(ecuacion4);
    }

    public static void Resultado(Raices ecuacion){
        if (ecuacion.tieneRaices()) {
            ecuacion.obtenerRaices();
        }else{
            ecuacion.obtenerRaiz();
        }
    }
}
