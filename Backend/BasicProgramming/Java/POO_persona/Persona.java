package POO_persona;

import java.util.Random;

public class Persona {
    private String nombre;
    private int edad;
    private String DNI;
    private char sexo;
    private double peso;
    private double altura;

    //constructor por defecto
    public Persona(){
        this.nombre="";
        this.edad=0;
        this.DNI=generaDNI();
        this.sexo='H';
        this.peso=0;
        this.altura=0;
    }
    //Un constructor con el nombre, edad y sexo, el resto por defecto.
    public Persona(String nombre, int edad, char sexo){
        this.nombre=nombre;
        this.edad=edad;
        this.sexo= sexo;

        this.DNI=generaDNI();
        this.peso=0;
        this.altura=0;
    }
    //Un constructor con el nombre, edad y sexo, el resto por defecto.
    public Persona(String nombre, int edad, String DNI, char sexo, double peso, double altura){
        this.nombre=nombre;
        this.edad=edad;
        this.DNI=DNI;
        this.sexo= sexo;
        this.peso=peso;
        this.altura=altura;
    }
    public int calcularIMC(){
        double imc=this.peso/(this.altura*this.altura);
        if (imc<20) {
            return -1;

        }else if(imc>25){
            return 1;
        }else {
            return 0;
        }
    }

    public boolean esMayorDeEdad(){
        if (this.edad>17) {
            return true;
        }
        return false;
    }

    private void comprobarSexo(){
        if (this.sexo!='H'&& this.sexo!='M') {
            this.sexo= 'H';
        }
    }

    public String toString() {
        return "Nombre: "+ this.nombre+" Edad: "+this.edad+" DNI: "
        +this.DNI+" Sexo: "+this.sexo+" Peso: "+this.peso+ " Altura: "+this.altura;
    }

    private String generaDNI(){
        Random random=new Random();
        String digitos="";
        String dni="";
        
        for (int i = 0; i < 8; i++) {
            int numAleatorio= random.nextInt(10);
            digitos=digitos+numAleatorio;
    
        }
        dni=digitos;
        String[] letras = {"T", "R", "W", "A", "G", "M", "Y", "F", "P", "D", "X", "B", "N", "J", "Z", "S", "Q", "V", "H", "L", "C", "K", "E"};
        int indiceLetra = Integer.parseInt(digitos) % 23;
        dni=dni+letras[indiceLetra];
        
        return dni;
    }

    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public void setEdad(int edad){
        this.edad=edad;
    }
    public void setSexo(char sexo){
        this.sexo=sexo;
    }
    public void setPeso(double peso){
        this.peso=peso;
    }
    public void setAltura(double altura){
        this.altura=altura;
    }

}
