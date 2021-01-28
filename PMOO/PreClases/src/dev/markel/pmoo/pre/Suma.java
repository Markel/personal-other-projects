package dev.markel.pmoo.pre;

public class Suma {
	
	/**
	 * Suma los números introducidos como parámetros
	 * @param numero1 Primer número a sumar
	 * @param numero2 Segundo número a sumar
	 * @return La suma de número 1 y 2
	 */
	public static int sumar(int numero1, int numero2) {
		int resultado = numero1 + numero2;
		return resultado;
	}
	
	public static void main(String[] args) {
		System.out.println("La suma de 3 y 5 es " + sumar(3,5));
		System.out.println("La suma de 42 y 69 es " + sumar(42,69));
	}

}
