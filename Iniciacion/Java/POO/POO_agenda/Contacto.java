package POO_agenda;

public class Contacto {
    private String nombre;
    private String telefono;

    public Contacto(String nombre, String telefono){
        this.nombre=nombre;
        this.telefono=telefono;
    }

    public String getNombre() {
        return nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public String toString(){
        return "Nombre: "+this.nombre+" Telefono: "+this.telefono;
    }
}
