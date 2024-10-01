package POO_agenda;

public class usoAgenda {

    public static void main(String[] args) {
        Contacto contacto1=new Contacto("Lucas C", "687745983");
        Contacto contacto2=new Contacto("Andres", "6211456984");

        Agenda agenda=new Agenda();

        agenda.aniadirContacto(contacto1);
        agenda.aniadirContacto(contacto2);

        //agenda.eliminarContacto(contacto2);

        agenda.listarContactos();
    }

}