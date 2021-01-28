package dev.markel.pmoo.pre;

public class esCapicua {
	
	/**
	 * Comprueba si un número es capicua, es decir, que al dar la vuelta al número este se mantenga igual
	 * @param numero El número a comprobar si es capicua
	 * @return True si es capicua, false si no lo es
	 */
	public static boolean comprobarCapicua(long numero) {
		long invertido = 0, aux = numero;
		// Guardamos en invertido numero pero invertido
		while (aux != 0) {
			invertido *= 10;
			invertido += aux % 10;
			aux = aux / 10;
		}
		return (invertido == numero);
	}
	
	public static void main(String[] args) {
		System.out.println("Es 2002 (best year award) capicua? " + comprobarCapicua(2002));
		System.out.println("Es 2000001 capicua? " + comprobarCapicua(2000001));
		System.out.println("Es 123454321 capicua? " + comprobarCapicua(123454321));
	}

}
