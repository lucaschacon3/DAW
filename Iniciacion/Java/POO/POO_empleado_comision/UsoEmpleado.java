package POO_empleado_comision;

public class UsoEmpleado {

    public static void main(String[] args) {

        EmpleadoPorComision empleado1 = new EmpleadoPorComision("Olga", "Gimenez", "28-174802", 7, 200);
        EmpleadoPorComision empleado2 = new EmpleadoPorComision("Lucas", "Chacon", "28-934802", 10, 150);

        EmpleadoBaseMasComision empleado3 = new EmpleadoBaseMasComision("Alex", "Garcia", 1000, "28-2323238", 3, 100);
        EmpleadoBaseMasComision empleado4 = new EmpleadoBaseMasComision("Maria", "Gomez", 1200, "28-2323238", 4, 95);

        System.out.println("Nombre: " + empleado1.getNombre() + "->" + " Salario: " + empleado1.salario_total());
        System.out.println("Nombre: " + empleado2.getNombre() + "->" + " Salario: " + empleado2.salario_total());
        System.out.println("Nombre: " + empleado3.getNombre() + "->" + " Salario: " + empleado3.salario_total());
        System.out.println("Nombre: " + empleado4.getNombre() + "->" + " Salario: " + empleado4.salario_total());
    }
}
