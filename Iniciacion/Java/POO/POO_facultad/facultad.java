package POO_facultad;

import java.util.Scanner;

public class facultad {
    
    public static void main(String[] args) {
        
        Scanner scanner= new Scanner(System.in);
        Persona [] personas= new Persona[10];
        int opcion=0;
        int contPosOcupadas=0;
        do {
            Menu2();
            opcion= scanner.nextInt();
    
            if (opcion==1) {
                Menu1();
                int opPersona=scanner.nextInt();

                if (opPersona==1) {
                    System.out.println("Introduce el curso");
                    int curso=scanner.nextInt();

                    System.out.println("Introduce el nombre");
                    String nombre=scanner.nextLine();

                    scanner.nextLine();

                    System.out.println("Introduce los apellidos");
                    String apellidos=scanner.nextLine();

                    System.out.println("Introduce el dni");
                    String dni=scanner.nextLine();

                    System.out.println("Introduce el estado civil");
                    String estado_civil=scanner.nextLine();


                    Estudiante estudiante=new Estudiante(curso, nombre, apellidos, dni, estado_civil);

                    personas[contPosOcupadas]=estudiante;
                    contPosOcupadas++;
                }else if (opPersona==2) {

                    System.out.println("Introduce el departamento");
                    String departamento=scanner.nextLine();

                    scanner.nextLine();

                    System.out.println("Introduce el año de incorporacion");
                    int anio_incorporacion=scanner.nextInt();

                    System.out.println("Introduce el numero del despacho");
                    int num_despacho=scanner.nextInt();

                    System.out.println("Introduce el nombre");
                    String nombre=scanner.nextLine();

                    scanner.nextLine();

                    System.out.println("Introduce los apellidos");
                    String apellidos=scanner.nextLine();

                    System.out.println("Introduce el dni");
                    String dni=scanner.nextLine();

                    System.out.println("Introduce el estado civil");
                    String estado_civil=scanner.nextLine();


                    Profesor profesor = new Profesor(departamento, anio_incorporacion, num_despacho, nombre, apellidos, dni, estado_civil);

                    personas[contPosOcupadas]=profesor;
                    contPosOcupadas++;
                }else if (opPersona==3) {

                    System.out.println("Introduce la seccion");
                    String seccion=scanner.nextLine();

                    scanner.nextLine();

                    System.out.println("Introduce el año de incorporacion");
                    int anio_incorporacion=scanner.nextInt();

                    System.out.println("Introduce el numero del despacho");
                    int num_despacho=scanner.nextInt();

                    System.out.println("Introduce el nombre");
                    String nombre=scanner.nextLine();

                    scanner.nextLine();

                    System.out.println("Introduce los apellidos");
                    String apellidos=scanner.nextLine();

                    System.out.println("Introduce el dni");
                    String dni=scanner.nextLine();

                    System.out.println("Introduce el estado civil");
                    String estado_civil=scanner.nextLine();


                    PersonalServicio personalServicio = new PersonalServicio(seccion, anio_incorporacion, num_despacho, nombre, apellidos, dni, estado_civil);

                    personas[contPosOcupadas]=personalServicio;
                    contPosOcupadas++;
                }else{
                    System.out.println("Error al introducir la opcion");
                }

            }else if (opcion==2) {
                for (int i = 0; i < personas.length; i++) {
                    if (personas[i]!=null) {
                        System.out.println(personas[i].toString());
                    }
                }
            }else if (opcion==3) {
                System.out.println("Has salido");
            }else{
                System.out.println("Error al introducir la opcion");
            }
        } while (opcion!=3);
        
    }

    public static void Menu1(){
        System.out.println("¿Que quieres añadir?");
        System.out.println("1. Estudiante");
        System.out.println("2. Profesor");
        System.out.println("3. Personal de Servicio");
    }

    public static void Menu2(){
        System.out.println("-----Menu------");
        System.out.println("1. Añadir Persona");
        System.out.println("2. Mostrar Personas");
        System.out.println("3. Salir");
        System.out.print("Seleccione una opcion: ");
    }
}
