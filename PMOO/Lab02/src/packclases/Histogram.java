package packclases;

public class Histogram {	
	/**
	 * Obtains the number of pixels represented in the histogram
	 * @param his the histogram to count pixels from
	 * @return number of pixels in the histogram
	 */
	public static int getNumPixels(int[] his) {
		int num = 0;
		for (int i=0; i<his.length; i++) {
			num += his[i];
		}
		return num;
	}
	
	/**
	 * Calculates the average of a histogram
	 * @param his the histogram to calculate the average from
	 * @return Average of the histogram
	 */
	public static double average(int[] his) {
		double av = 0.0;
		int num_pixels = getNumPixels(his);
		for (int i = 0; i < his.length; i++) {
			av += i*his[i];
		}
		return av/num_pixels;
	}
	
	public static void main(String[] args) {
		int[] histogram;
		histogram = new int [256];
		
		// Fill the histogram
		for (int i = 0; i < histogram.length; i++) {
			histogram[i]=10*(i+1);
		}
		System.out.println("Número de píxeles " + getNumPixels(histogram));
		System.out.println("Media del histograma " + average(histogram));
	}
}
