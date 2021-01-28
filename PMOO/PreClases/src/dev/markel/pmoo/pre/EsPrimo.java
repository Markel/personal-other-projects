package dev.markel.pmoo.pre;

public class EsPrimo {

	/**
	 * Comprueba si el número introducido es primo 
	 * @param numero Es el número a comprobar
	 * @return True si es primo, false si no es primo
	 */
	public static boolean comprobarPrimo(int numero) {
		boolean resultado = true;
		int i = 2;
		while (resultado && i <= numero/2) {
			if (numero % i == 0) {
				resultado = false;
			}
			i++;
		}
		return resultado;
	}
	
	public static void main(String[] args) {
		System.out.println("Es el número 42 primo? " + comprobarPrimo(42));
		System.out.println("Es el número 97 primo? " + comprobarPrimo(97));
		System.out.println("Es el número 9887 primo? " + comprobarPrimo(9887));
	}

}
