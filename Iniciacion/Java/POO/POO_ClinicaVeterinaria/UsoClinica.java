package POO_ClinicaVeterinaria;

import java.util.Scanner;

public class UsoClinica {

        static Scanner scanner=new Scanner(System.in);

    public static void main(String[] args) {
        // Ejemplo de uso
        ClinicaVeterinaria clinica = new ClinicaVeterinaria();
        String nombre;
        String fechaNacimiento;
        double peso;
        String comentarios;
        int op= 0;
        do {
                menu();
                op=scanner.nextInt();
        
                if (op==1) {
                        menuAnimal();
                        int op2= scanner.nextInt();
                        if (op2==1) {

                                scanner.nextLine();

                                System.out.print("Introcuce el nombre: ");
                               nombre=scanner.nextLine();

                               System.out.print("Introcuce el fecha de nacimiento (dd/mm/aaaa): ");
                               fechaNacimiento=scanner.nextLine();

                               System.out.print("Introcuce el peso: ");
                               peso=scanner.nextDouble();

                               scanner.nextLine();

                               System.out.print("Introcuce comentario: ");
                               comentarios=scanner.nextLine();

                               System.out.print("Introcuce la raza: ");
                               String raza=scanner.nextLine();

                               System.out.print("Introcuce el microchip: ");
                               String microchip=scanner.nextLine();

                               Perro perro=new Perro(nombre, raza, fechaNacimiento, peso, microchip, comentarios);
                               clinica.insertaAnimal(perro);
                                
                        }else if (op2==2) {
                                
                                scanner.nextLine();

                                System.out.print("Introcuce el nombre: ");
                                nombre=scanner.nextLine();
 
                                System.out.print("Introcuce el fecha de nacimiento (dd/mm/aaaa): ");
                                fechaNacimiento=scanner.nextLine();
 
                                System.out.print("Introcuce el peso: ");
                                peso=scanner.nextDouble();

                                scanner.nextLine();
 
                                System.out.print("Introcuce comentario: ");
                                comentarios=scanner.nextLine();
 
                                System.out.print("Introcuce la raza: ");
                                String raza=scanner.nextLine();
 
                                System.out.print("Introcuce el microchip: ");
                                String microchip=scanner.nextLine();

                                Gato gato=new Gato(nombre, raza, fechaNacimiento, peso, microchip, comentarios);
                               clinica.insertaAnimal(gato);

                        }else if (op2==3) {

                                scanner.nextLine();

                                System.out.print("Introcuce el nombre: ");
                                nombre=scanner.nextLine();
 
                                System.out.print("Introcuce el fecha de nacimiento (dd/mm/aaaa): ");
                                fechaNacimiento=scanner.nextLine();
 
                                System.out.print("Introcuce el peso: ");
                                peso=scanner.nextDouble();

                                scanner.nextLine();
 
                                System.out.print("Introcuce comentario: ");
                                comentarios=scanner.nextLine();
 
                                System.out.print("Introcuce la especie: ");
                                String especie=scanner.nextLine();
 
                                System.out.print("Es venenoso? (SI/NO): ");
                                String cantor=scanner.nextLine();
                                boolean esCantor;
                                if (cantor.equals("SI")) {
                                        esCantor=true;
                                }else if (cantor.equals("NO")) {
                                        esCantor=false;
                                }else{
                                        System.out.println("Error al introducir SI o NO, no es venenoso por derfecto");
                                        esCantor=false;
                                }

                                Pajaro pajaro=new Pajaro(nombre, especie, fechaNacimiento, peso, esCantor, comentarios);
                               clinica.insertaAnimal(pajaro);
                        }else if (op2==4) {

                                scanner.nextLine();

                                System.out.print("Introcuce el nombre: ");
                                nombre=scanner.nextLine();
 
                                System.out.print("Introcuce el fecha de nacimiento (dd/mm/aaaa): ");
                                fechaNacimiento=scanner.nextLine();
 
                                System.out.print("Introcuce el peso: ");
                                peso=scanner.nextDouble();

                                scanner.nextLine();
 
                                System.out.print("Introcuce comentario: ");
                                comentarios=scanner.nextLine();
 
                                System.out.print("Introcuce la especie: ");
                                String especie=scanner.nextLine();
 
                                System.out.print("Es venenoso? (SI/NO): ");
                                String veneno=scanner.nextLine();
                                boolean esVenenoso;
                                if (veneno.equals("SI")) {
                                        esVenenoso=true;
                                }else if (veneno.equals("NO")) {
                                        esVenenoso=false;
                                }else{
                                        System.out.println("Error al introducir SI o NO, no es venenoso por derfecto");
                                        esVenenoso=false;
                                }
                                

                                Reptil reptil=new Reptil(nombre, especie, fechaNacimiento, peso, esVenenoso, comentarios);
                               clinica.insertaAnimal(reptil);
                        }else{
                                System.out.println("ERROR: al introducir la opción"); 
                        }

                }else if (op==2) {
                        
                        scanner.nextLine();

                        System.out.print("Introduce nombre del animal a buscar: ");
                        String nombreABuscar=scanner.nextLine();
                        if (clinica.buscaAnimal(nombreABuscar)!=null) {
                                System.out.println(clinica.buscaAnimal(nombreABuscar).dameDatosAnimal());
                        } else{
                                System.out.println("No se ha encontrado animal");
                        }

                }else if (op==3) {

                        scanner.nextLine();

                        System.out.print("Introduce nombre del animal: ");
                        String nombreABuscar=scanner.nextLine();

                        System.out.print("Introduce nuevo comentario del animal: ");
                        String comentarioNuevo=scanner.nextLine();

                        if (clinica.modificaComentarioAnimal(nombreABuscar, comentarioNuevo)) {
                                System.out.println("Se ha modificado el comentario");
                        } else{
                                System.out.println("No se ha podido modificar el comentario");
                        }

                }else if (op==4) {
                        System.out.println(clinica.toString());
                }else if (op==5) {
                        System.out.println("Has salido");
                }else {
                        System.out.println("ERROR: al introducir la opción");
                } 
        } while (op!=5);


}

private static void menuAnimal() {
        System.out.println("¿Que quieres añadir?");
        System.out.println("1. Perro");
        System.out.println("2. Gato");
        System.out.println("3. Pajaro");
        System.out.println("4. Reptil");
}

private static void menu() {
        System.out.println("---------------");
        System.out.println("CLINICA VETERINARIA");
        System.out.println("1. Añadir animal");
        System.out.println("2. Buscar animal");
        System.out.println("3. Modificar comentario de animal");
        System.out.println("4. Mostrar toda la clínica");
        System.out.println("5. Salir");
        

}
}