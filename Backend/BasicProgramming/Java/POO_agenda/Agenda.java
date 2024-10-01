package POO_agenda;

public class Agenda {
    private Contacto [] contactos;


    public Agenda(){
        contactos=new Contacto [10];
    }

    private int posicionLibre(){
        for (int i = 0; i < contactos.length; i++) {
            if (contactos[i]==null) {
                return i;
            }
        }
        return -1;
    }
    //falta controlar los contactos repetidos
    public void aniadirContacto(Contacto contacto){
        boolean salir=false;
        int i=0;

        while (salir==false && i<contactos.length) {
            if (contactos[posicionLibre()]==null) {
                contactos[posicionLibre()]=contacto;
                System.out.println("Contacto agregado");
                salir=true;
                i++;
            }else{
                System.out.println("Contacto no agregado, agenda llena");
                salir=true;
                i++;
            }
        }
        
    }

    public void eliminarContacto(Contacto contacto){
        for (int i = 0; i < contactos.length; i++) {
            if (contactos[i].getNombre()==contacto.getNombre()) {
                contactos[i]=null;
                System.out.println("Contacto eliminado");
            }
        }
        System.out.println("Contacto no eliminado, no esta en agenda");
    }

    public boolean existeContacto(Contacto contacto){
        for (int i = 0; i < contactos.length; i++) {
            if (contactos[i].getNombre()==contacto.getNombre()) {
                return true;
            }
        }
        return false;
    }

    public void listarContactos(){
        for (int i = 0; i < contactos.length; i++) {
            if (contactos[i]!=null) {
                System.out.println(contactos[i].toString());
            }
        }
    }

    public void buscaContacto(String nombre){
        for (int i = 0; i < contactos.length; i++) {
            if(contactos[i].getNombre()== nombre){
                System.out.println(contactos[i].toString());
            }
        }
    }

    public boolean agendaLlena(){
        for (int i = 0; i < contactos.length; i++) {
            if (contactos[i]!=null) {
                return false;
            }
        }
        return true;
    }

    public int huecosLibres(){
        int cont=0;
        for (int i = 0; i < contactos.length; i++) {
            if (contactos[i]!=null) {
                cont++;
            }
        }
        return cont;
    }

}
