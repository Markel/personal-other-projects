package justapackage;

/**
 * @deprecated
 * @author markel
 */
public class CribaEratostenes {
	
	//! THIS DOES NOT WORK AT ALL, I WANT TO HAVE DINNER, okay?
	
	public static void fillArray(int array[]) {
		for (int i = 0; i < array.length; i++) {
			array[i] = i+2;
		}
	}
	
	public static boolean checkForCribaEratostenes(int num) {
		if (num % 2 == 0 && num % 3 == 0 && num % 5 == 0 && num % 7 == 0) {
			return true;
		}
		return false;
	}
	
	public static void main(String[] args) {
		int N = 1000;
		int[] primos, divisores;
		primos = new int[N-1];
		divisores = new int[] {2, 3, 5, 7}; //* Habría que eliminar si 7 si N fuese menor que 7²
		for (int i = 2; i < divisores.length; i++) {
			
		}
	}

}
