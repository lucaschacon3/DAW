package POO_sanvalentin;

public class Regalo {

    private String nombre;
    private double precio;
    private String descripcion;

    public Regalo(String nombre, double precio, String descripcion){

        this.nombre=nombre;
        this.precio=precio;
        this.descripcion=descripcion;
    }

    public void setNombre(String nombre){
        this.nombre=nombre;
    }

    public void setPrecio(double precio){
        this.precio=precio;
    }

    public void setDescripcion(String descripcion){
        this.descripcion=descripcion;
    }

    public String getNombre(){
        return this.nombre;
    }

    public double getPrecio(){
        return this.precio;
    }

    public String getDescripcion(){
        return this.descripcion;
    }

    public String toString(){
        return "Nombre Regalo: "+this.nombre+" Precio: "+this.precio+" Descripcion: "+this.descripcion;
    }
    
    
}