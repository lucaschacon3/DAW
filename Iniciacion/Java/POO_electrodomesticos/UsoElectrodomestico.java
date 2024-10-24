package POO_electrodomesticos;

public class UsoElectrodomestico {
    public static void main(String[] args) {
        Electrodomestico [] electrodomesticos = new Electrodomestico[2];
        Lavadora lavadora= new Lavadora(50, 300, "Rojo", 'A', 100);
        Television television= new Television(50, true, 500, "Blanco", 'B', 50);

        double precioTotal=0;

        electrodomesticos[0]= lavadora;
        electrodomesticos[1]=television;

        for (int i = 0; i < electrodomesticos.length; i++) {
            if (electrodomesticos[i]!=null) {
                System.out.println(electrodomesticos[i]);
            }
        }

        for (int i = 0; i < electrodomesticos.length; i++) {
      
            if (electrodomesticos[i]!=null) {
                precioTotal+=electrodomesticos[i].precioFinal();
            }
        }

        System.out.print("Todos los productos cuestan: "+precioTotal);

    }
}
