package POO_fraccion;

public class Fraccion {
    private int numerador;
    private int denominador;

    public Fraccion(int numerador, int denominador){
        
        this.numerador=numerador;
        this.denominador=denominador;
    }

    public String mostrar(){
        return this.numerador+"/"+this.denominador; 
    }

    public int dameDenominador(){
        return this.denominador;
    }

    public int dameNumerador(){
        return this.numerador;
    }

    public Fraccion suma(Fraccion f){
        int denominadorSuma= this.denominador * f.dameDenominador();
        int numeradorSuma=(this.numerador * f.dameDenominador())+(this.denominador*f.dameNumerador());

        return new Fraccion(numeradorSuma, denominadorSuma);
    }

    public Fraccion resta(Fraccion f){
        int denominadorSuma= this.denominador * f.dameDenominador();
        int numeradorSuma=(this.numerador * f.dameDenominador())-(this.denominador*f.dameNumerador());

        return new Fraccion(numeradorSuma, denominadorSuma);
    }

    public Fraccion multiplicacion(Fraccion f){
        int denominadorMult= this.denominador * f.dameDenominador();
        int numeradorMult=(this.numerador * f.dameNumerador());

        return new Fraccion(numeradorMult, denominadorMult);
    }

    public Fraccion division(Fraccion f){
        int denominadorDiv= this.denominador*f.dameNumerador();
        int numeradorDiv=(this.numerador*f.dameDenominador());

        return new Fraccion(numeradorDiv, denominadorDiv);
    }

    public void simplificar(){
        int mcd = calcularMCD(numerador, denominador);

        this.numerador = this.numerador/mcd;
        this.denominador = this.denominador/mcd;
        
    }
    public int calcularMCD(int a, int b) {
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

}
