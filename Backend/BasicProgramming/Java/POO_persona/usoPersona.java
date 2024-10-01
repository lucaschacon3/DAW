package POO_persona;

import java.util.Scanner;

public class usoPersona {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        System.out.print("Introduce el nombre: ");
        String nombre = scanner.nextLine();

        System.out.print("Introduce la edad: ");
        int edad = scanner.nextInt();

        scanner.nextLine();

        System.out.print("Introduce el sexo (H/M): ");
        char sexo = scanner.nextLine().charAt(0);
        

        System.out.print("Introduce el peso: ");
        double peso = scanner.nextDouble();

        System.out.print("Introduce la altura: ");
        double altura = scanner.nextDouble();

        Persona persona1 = new Persona(nombre, edad, "26544789Q", sexo, peso, altura);
        Persona persona2 = new Persona("Bea",25,'M');
        Persona persona3 = new Persona();

        persona3.setNombre("Carlos");
        persona3.setEdad(30);
        persona3.setSexo('H');
        persona3.setPeso(60);
        persona3.setAltura(1.60);

        CalculaPeso(persona1);
        CalculaPeso(persona2);
        CalculaPeso(persona3);

        System.out.println(persona1.toString());
        System.out.println(persona2.toString());
        System.out.println(persona3.toString());

    }

    public static void CalculaPeso(Persona p){
        if (p.calcularIMC()==1) {
            System.out.println("Tiene sobrepeso");
        }else if(p.calcularIMC()==-1){
            System.out.println("Tiene bajo peso");
        }else{
            System.out.println("Esta en el peso ideal");
        }
    }
}
