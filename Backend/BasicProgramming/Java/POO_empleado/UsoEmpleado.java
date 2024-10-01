package POO_empleado;

public class UsoEmpleado {
    
    public static void main(String[] args) {
        
        Comercial comercial= new Comercial("0434454432w", "Lucas", 2000, 1500);
        System.out.println("Nombre: "+ comercial.getNombre());
        System.out.println("Sueldo: "+ comercial.getSueldo());

        Tecnico tecnico = new Tecnico("7366646636a", "Julio", 1000, "Python");
        System.out.println("Nombre: "+ tecnico.getNombre());
        System.out.println("Sueldo: "+ tecnico.getSueldo());

        Empleado [] empleado =new Empleado[2];
        empleado[0]=comercial;
        empleado[1]=tecnico;

        //el array es de empleado y
        //para acceder a los metodos de comercial o tecnico hay que castear.

        Comercial comercialAUX= (Comercial) empleado[0];
        comercialAUX.setComision(1000);

        //para comprobar

        if (empleado[0] instanceof Comercial) { // devuelve true si pertenece a la clase
            System.out.println("Es una instancia de la clase");
        }else{
            System.out.println("No es una instancia de la clase");
        }
    }
}
