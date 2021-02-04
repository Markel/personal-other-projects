package packclases;

public class GPS {
	public double latitude;
	public double longitude;
	
	public GPS (double la, double lo) {
		latitude = la;
		longitude = lo;
	}
	
	/**
	 * Measures the distance between two points in the world
	 * @param g1 First GPS point
	 * @param g2 Second GPS point
	 * @return Distance between the points
	 */
	public static double distance(GPS g1, GPS g2) {
		double lat1 = g1.latitude, lat2 = g2.latitude;
		double lon1 = g1.longitude, lon2 = g2.longitude;
		double r = 6.371; // Actually I don't really know how the distance goes
		double dLat = lat2-lat1 * Math.PI/180;
		double dLon = lon2-lon1 * Math.PI/180;
		double a =
			Math.sin(dLat/2) * Math.sin(dLat/2) +
			Math.cos(lat1 * Math.PI/180) * Math.cos(lat2 * Math.PI/180) *
			Math.sin(dLon/2) * Math.sin(dLon/2)
		;
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		double d = r * c;
		return d;
		
	}
	
	/**
	 * Prints to standard output all the GPS coordinates passed
	 * @param lista an array of GPS coordinates
	 */
	public static void printArrayOfGPS(GPS[] lista) {
		GPS aux;
		for (int i = 0; i < lista.length; i++) {
			aux = lista[i];
			System.out.println("(" + aux.latitude + ", " + aux.longitude + ")");
		}
	}
	
	public static void main(String[] args) {
		GPS donosti = new GPS(43.318334, -1.9812313);
		GPS bilbao = new GPS(43.2630126, -2.9349852);
		System.out.println("Distance between Donosti and Bilbo " + distance(donosti, bilbao));
		GPS[] listaGPS;
		listaGPS = new GPS [2];
		listaGPS[0] = donosti;
		listaGPS[1] = bilbao;
		printArrayOfGPS(listaGPS);
	}

}
