package POO_password;

import java.util.Random;

public class Password {
    private String password;
    private int longitud;
    Random random= new Random();

    public Password(){
        this.longitud=8;
        this.password="12345678";

    }
    public Password(int longitud){
        
        String password="";
        String alfabeto="QWERTYUIOPASDFGHJKLÑZXCVBNMqwertyuiopasdfghjklñzxcvbnm123456789";
        for (int i = 0; i < longitud; i++) {
            int numAleatorio=random.nextInt(alfabeto.length());
            password=password+alfabeto.charAt(numAleatorio);
        }
        this.longitud=longitud; 
        this.password=password;
    }

    public String toString(){
        return "La contraseña es: "+this.password+ "y la longitud es: "+this.longitud;
    }

    public String getPassword(){
        return this.password;
    }

    public int getLongitud(){
        return this.longitud;
    }

    public void setLongitud(int longitud){
        this.longitud=longitud;
    }

    public void generaPassword(){
        String password="";
        String alfabeto="QWERTYUIOPASDFGHJKLÑZXCVBNMqwertyuiopasdfghjklñzxcvbnm123456789";
        for (int i = 0; i < longitud; i++) {
            int numAleatorio=random.nextInt(alfabeto.length());
            password=password+alfabeto.charAt(numAleatorio);
        }
        this.password=password;
    }

    public boolean esFuerte(){
        int contMayus=0;
        int contMinus=0;
        char [] aux= this.password.toCharArray();

        for (int i = 0; i < password.length(); i++) {
            if (Character.isUpperCase(aux[i])) {
                contMayus++;
            }
            if (Character.isLowerCase(aux[i])) {
                contMinus++;
            }
        }
        if (this.password.length()>=5 && contMayus>=2 && contMinus>=1) {
            return true;
        }
        return false;
    }


}
