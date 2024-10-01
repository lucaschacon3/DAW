import java.util.Scanner;

public class Fecha {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Introuce una fecha (dd/mm/aaaa)");
        String fecha=scanner.nextLine();

        if (FechaValida(fecha)) {
            System.out.println("formato de fecha correcta");

        }else{
            System.out.println("formato invalido");
        }
        System.out.println("La fecha introducida es: "+CambiarFormatoFecha(fecha));
    }

    public static boolean FechaValida(String fecha){
        if (ValidarBarras(fecha)&& ValidarLongitud(fecha) && ValidarMes(fecha)) {
            return true;
        }
        return false;
        
    }

    public static boolean ValidarBarras(String fecha){
        int contbarras=0;
        for (int i = 0; i < fecha.length(); i++) {
            if (fecha.charAt(i)== '/') {
                contbarras++;
            }
        }
        if (contbarras==2) {
            return true;
        }
        return false;
    }

    public static boolean ValidarLongitud(String fecha){
        if (fecha.length()==10) {
            return true;
        }
        return false;
    }

    public static boolean ValidarMes(String fecha){

        String [] formato=fecha.split("/");
        String mes= formato[2];
        
        if (Integer.parseInt(mes)>12 || Integer.parseInt(mes)<0) {
            return false;
        }
        return true;
    }

    public static String CambiarFormatoFecha(String fecha){

        String [] formato=fecha.split("/");
    
        return formato[0]+" de "+formato[1]+" de "+formato[2];
    }


}