package POO_sanvalentin;

public class Gestorsanvalentin {
    public static void main(String[] args) {
        Persona persona1=new Persona("0345539q","Lucas");
        Persona persona2=new Persona("73566273p", "Natalia");

        Regalo regaloParaPersona1= new Regalo("MacBook Pro", 1200, "Aluminio, 8gb ram, 256gb almacenamiento");
        Regalo regaloParaPersona2= new Regalo("Pulsera Pandora", 80, "Plata, 16cm");

        Pareja pareja1=new Pareja(persona1, persona2);
        pareja1.setRegaloParaPersona1(regaloParaPersona1);
        pareja1.setRegaloParaPersona2(regaloParaPersona2);

        System.out.println(pareja1.mostrarDetalles());

    }
}
