package POO_sanvalentin;

public class Pareja {

    private Persona persona1;
    private Persona persona2;
    private Regalo regaloParaPersona1;
    private Regalo regaloParaPersona2;

    public Pareja(Persona persona1, Persona persona2){

        this.persona1=persona1;
        this.persona2=persona2;
        this.regaloParaPersona1=null;
        this.regaloParaPersona2=null;
    }

    public void setRegaloParaPersona1(Regalo regaloParaPersona1){
        this.regaloParaPersona1=regaloParaPersona1;
    }

    public void setRegaloParaPersona2(Regalo regaloParaPersona2){
        this.regaloParaPersona2=regaloParaPersona2;
    }

    public double CostoTotal(){
        double costo=regaloParaPersona1.getPrecio()+regaloParaPersona2.getPrecio();
        return costo;
    }

    public String mostrarDetalles(){
        return regaloParaPersona1.toString()+ "\n"+
        regaloParaPersona2.toString()+" \nCoste total: "+CostoTotal();
    }

    public String toString(){
        return persona1.toString()+" "+mostrarDetalles();
    }
}

