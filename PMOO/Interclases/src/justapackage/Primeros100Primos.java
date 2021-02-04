package justapackage;

public class Primeros100Primos {
	
	/**
	 * Compruba si un número es primo. Lo hace mediante una secuencia de primos
	 * anteriores, porque todos los números compuestos (aquellos no primos) siempre
	 * tienen un divisor primo menor que ellos.
	 * @param numero el número a comprobar si es primo
	 * @param primosAnteriores array de los primos menores que numero
	 * @return true si es primo, false si no es primo
	 */
	public static boolean esPrimo(int numero, int[] primosAnteriores) {
		int i = 0;
		boolean esPrimo = true;
		//* Los arrays de int se llenan con 0 con lo que el 0 significa que es el final del array
		while (esPrimo && primosAnteriores[i] != 0) {
			if (numero % primosAnteriores[i] == 0) {
				esPrimo = false;
			}
			i++;
		}
		return esPrimo;
	}
	
	/**
	 * Escribe un número al final del array de integers. Con final se quiere
	 * expresar el final de los números "no basura" (es decir aquellos no
	 * inicializados), no se refiere la última posición del array.
	 * @implNote Cualquier 0 se considera "número basura" con lo que este método no es
	 * apropiados para los casos donde 0 puede ser un valor válido del array
	 * @param array Array al que añadir el número, este será el parámetro que se
	 * cambiará al final del método
	 * @param numero Número a añadir al final del array
	 */
	public static void escribirAlFinal(int[] array, int numero) {
		int i = 0;
		while (array[i] != 0) {
			i++;
		}
		array[i] = numero;
	}
	
	/**
	 * Escribe a salida estándar el contenido de todos los valores del array
	 * @param array El array a mostrar
	 */
	public static void mostrarArray(int[] array) {
		System.out.print("| ");
		for (int i = 0; i < array.length; i++) {
			System.out.print(array[i] + " | ");
		}
	}
	
	/**
	 * Crea un array de N integers el cual es llenado con los primeros 100 números
	 * primos. Después solicita a mostrarArray que lo escriba en pantalla. 
	 */
	public static void main(String[] args) {
		int[] primos;
		int aProbar = 2; //* El número 1 no es primo por definición, por lo que empezamos en 2
		int N = 100;
		primos = new int[N];
		while (primos[N-1] == 0) { //* De la misma manera que en esPrimo podemos utilizar los 0 para determinar si se ha completado el ciclo
			if (esPrimo(aProbar, primos)) {
				escribirAlFinal(primos, aProbar);
			}
			aProbar++;
		}
		mostrarArray(primos);
	}
}
