package POO_libro;

public class ConjuntoLibros {
	private final int TAM = 10;
	private int cont;
	private Libro[] conjunto;

	public ConjuntoLibros() {
		this.conjunto = new Libro[TAM];
		this.cont = 0;
	}

	public int getCont() {
		return cont;
	}

	public void setCont(int cont) {
		this.cont = cont;
	}

	public Libro[] getConjunto() {
		return conjunto;
	}

	public void setConjunto(Libro[] conjunto) {
		this.conjunto = conjunto;
	}

	public boolean anadirlibros(Libro libro) {
		if (cont < TAM) {
			for (int i = 0; i < TAM; i++) {
				if (conjunto[i] == null) {
					conjunto[i] = libro;
					cont++;
					return true;
				}

			}
		}
		return false;
	}

	public boolean eliminarlibroTitulo(String repuesta) {
		for (int i = 0; i < cont; i++) {
			if (conjunto[i] != null && conjunto[i].dametitulo().equals(repuesta)) {
				conjunto[i] = null;
				cont--;
				return true;
			}
		}
		return false;
	}

	public boolean eliminarlibroAutor(String repuesta) {
		boolean eliminado = false;
		for (int i = 0; i < cont; i++) {
			if (conjunto[i] != null && conjunto[i].dameautor().equals(repuesta)) {
				conjunto[i] = null;
				eliminado = true;
				cont--;
				return true;
			}
		}
		return eliminado;
	}
	private int damePrimeraPosicion() {
		for(int i=0;i<TAM;i++) {
			if (conjunto[i]!=null) {
				return i;
			}
		}
		return -1;
	}
	public void mostrarMayorCalificacion() {
		int primeraPosicion=damePrimeraPosicion();
		int posMaxCalificacion=primeraPosicion;
		int maxCalif = 0;
		if (primeraPosicion!=-1)  // no está vacio
		{
			maxCalif=conjunto[primeraPosicion].damecalificacion();
			
			for (int i = primeraPosicion+1; i < TAM; i++) {
				if (conjunto[i]!=null) {
					if (conjunto[i].damecalificacion()>maxCalif) {
						maxCalif=conjunto[i].damecalificacion();
						posMaxCalificacion=i;
					}
				}
			}
			System.out.println(conjunto[posMaxCalificacion].toString());
		}
			

		
	}

	public void mostrarMenorCalificacion() {
		int maxCalif = -1;
		for (int i = 0; i < cont; i++) {
			maxCalif = Math.min(maxCalif, conjunto[i].damecalificacion());
			System.out.println("este libro tiene la menor calificacion de " + conjunto[i].damecalificacion()
					+ "y es este libro " + conjunto[i].dameAtributos());
		}
	}

	public String toString() {
		String cadLibros = "";
		for (int i = 0; i < TAM; i++) {
			if (conjunto[i] != null) {
				cadLibros += conjunto[i].toString()+"\n";
			}

		}
		return cadLibros;
	}
}
