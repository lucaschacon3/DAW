

import java.util.Random;

/*
 * 	App
 */
public class Tragaperras {

	public static void main(String[] args) {

	
		Random random = new Random();
		String[] figuras={"Corazon", "Diamante", "Herradura", "Campana", "Limon"};

		int numAleatorio=random.nextInt(5);
		String tirada1= figuras[numAleatorio];
		
		numAleatorio=random.nextInt(5);
		String tirada2= figuras[numAleatorio];
		
		numAleatorio=random.nextInt(5);
		String tirada3= figuras[numAleatorio];
		
		

		if (tirada1==tirada2&&tirada1==tirada3) {
			System.out.println(tirada1+" "+tirada2+" "+tirada3);
			System.out.println("“Enhorabuena, ha ganado 10 monedas”");
		
		}else if(tirada1==tirada2||tirada1==tirada3 || tirada2==tirada3){
			System.out.println(tirada1+" "+tirada2+" "+tirada3);
			System.out.println("bien, ha recuperado la moneda");
			
		}else if(tirada1!=tirada2&&tirada1!=tirada3 && tirada2!=tirada3){
			System.out.println(tirada1+" "+tirada2+" "+tirada3);
			System.out.println("“Lo siento, ha perdido”");
		}
	}
}

