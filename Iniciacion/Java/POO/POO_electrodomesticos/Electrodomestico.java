package POO_electrodomesticos;

public class Electrodomestico {

    private double precio;
    private String color;
    private char consumo;
    private double peso;

    final String color_defecto = "blanco";
    final char consumo_defecto = 'F';

    public Electrodomestico() {

        super();
        this.precio = 100;
        this.color = color_defecto;
        this.consumo = consumo_defecto;
        this.peso = 5;
    }

    public Electrodomestico(double precio, double peso) {
        super();

        if (precio > 0) {
            this.precio = precio;
        }

        this.color = color_defecto;
        this.consumo = consumo_defecto;

        if (peso > 0) {
            this.peso = peso;
        } else {
            this.peso = 5;
        }

    }

    public Electrodomestico(double precio, String color, char consumo, double peso) {
        super();

        if (precio > 0) {
            this.precio = precio;
        }

        if (comprobarColor(color.toLowerCase())) {
            this.color = color;
        } else {
            this.color = color_defecto;
        }

        if (comprobarConsumo(consumo)) {
            this.consumo = consumo;
        } else {
            this.consumo = consumo_defecto;
        }

        if (peso > 0) {
            this.peso = peso;
        } else {
            this.peso = 5;
        }

    }

    public String getColor() {
        return color;
    }

    public char getConsumo() {
        return consumo;
    }

    public double getPeso() {
        return peso;
    }

    public double getPrecio() {
        return precio;
    }

    private boolean comprobarConsumo(char consumo) {
        if (consumo == 'A' || consumo == 'B' || consumo == 'C' || consumo == 'D' || consumo == 'E' || consumo == 'F') {
            return true;
        } else {
            return false;
        }
    }

    private boolean comprobarColor(String color) {
        if (color.equals("blanco") || color.equals("negro") || color.equals("rojo") || color.equals("azul")
                || color.equals("gris")) {
            return true;
        } else {
            return false;
        }
    }

    public double precioFinal() {
        double precioF = this.precio;
        if (this.consumo == 'A') {
            precioF = precioF + 100;
        } else if (this.consumo == 'B') {
            precioF = precioF + 80;
        } else if (this.consumo == 'C') {
            precioF = precioF + 60;
        } else if (this.consumo == 'D') {
            precioF = precioF + 50;
        } else if (this.consumo == 'E') {
            precioF = precioF + 30;
        } else if (this.consumo == 'F') {
            precioF = precioF + 10;
        }

        if (this.peso > 0 && this.peso < 20) {
            precioF = precioF + 10;
        } else if (this.peso > 19 && this.peso < 50) {
            precioF = precioF + 50;
        } else if (this.peso > 49 && this.peso < 80) {
            precioF = precioF + 80;
        } else if (this.peso > 80) {
            precioF = precioF + 100;
        }

        return precioFinal();
    }

    @Override
    public String toString() {
        return "Precio: "+getPrecio()+ " Color: "+getColor()+ " Consumo: "+getConsumo()+" Precio: "+getPrecio();
    }
}
