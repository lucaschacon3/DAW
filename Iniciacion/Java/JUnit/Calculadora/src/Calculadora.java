package JUnit.Calculadora.src;

public class Calculadora {

    public double suma(double num1, double num2) {
        return num1 + num2;
    }

    public double resta(double num1, double num2) {
        return num1 - num2;
    }

    public double multiplicacion(double num1, double num2) {
        return num1 * num2;
    }

    public Double division(double num1, double num2) {
        if (num2 == 0) {
            return null;
        }
        return num1 / num2;
    }
}