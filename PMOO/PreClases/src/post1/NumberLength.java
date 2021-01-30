package post1;

public class NumberLength {
	
	/**
	 * Counts the number of digits a number has
	 * @param number the number to count
	 * @return quantity of digits
	 */
	public static int checkLength(int number) {
		String numberInString;
		numberInString = Integer.toString(number);
		return numberInString.length();
	}
	
	public static void main(String[] args) {
		System.out.println("The length of 2002 is " + checkLength(2002));
		System.out.println("The length of 1 is " + checkLength(1));
		System.out.println("The length of 2000000000 is " + checkLength(2000000000));
	}

}
