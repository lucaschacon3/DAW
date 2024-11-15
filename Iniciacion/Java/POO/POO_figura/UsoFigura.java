package POO_figura;

import java.util.ArrayList;

public class UsoFigura {
    public static void main(String[] args) {
        ArrayList<Figura> figuras=new ArrayList<Figura>();

        Punto punto= new Punto("Punto", 3, 2);
        figuras.add(punto);

        Circulo circulo= new Circulo("Circulo", 3, punto);
        figuras.add(circulo);

        Cilindro cilindro=new Cilindro("Cilindro", circulo, 4);
        figuras.add(cilindro);

        for (int i = 0; i < figuras.size(); i++) {
            System.out.println(figuras.get(i));
        }
    }
}
