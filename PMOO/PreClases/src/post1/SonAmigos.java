package post1;

public class SonAmigos {
	
	public static boolean checkSonAmigos(int numero1, int numero2) {
		int i, divisorNumero1 = 0, divisorNumero2 = 0;
		for (i=1; i <= numero1/2; i++) {
			if (numero1 % i == 0) {
				divisorNumero1 += i;
			}
		}
		for (i=1; i <= numero2/2; i++) {
			if (numero2 % i == 0) {
				divisorNumero2 += i;
			}
		}
		return (numero1 == divisorNumero2) && (numero2 == divisorNumero1);
	}
	
	public static void main(String[] args) {
		System.out.println("220 & 284 son amigos? " + checkSonAmigos(220, 284));
		System.out.println("220 & 242 son amigos? " + checkSonAmigos(220, 242));
		System.out.println("1184 & 1210 son amigos? " + checkSonAmigos(1184, 1210));
		
	}

}
