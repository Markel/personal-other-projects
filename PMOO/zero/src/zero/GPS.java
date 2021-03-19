package zero;

public class GPS {
	/**
	 * Obtains the GPS distance between 2 points
	 * @param lat1 first latitude
	 * @param lon1 first longitude
	 * @param lat2 second latitude
	 * @param lon2 second longitude
	 * @return devuelve la distancia entre los dos puntos
	 */
	public static double distance(double lat1, double lon1, double lat2, double lon2) {
		double r = 6.371;
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
	
	public static void main(String[] args) {
		double distance= distance(43.318334, -1.9812313, 43.2630126, -2.9349852);
		System.out.println("Distance between Donostia and Bilbao: "+ distance);
		distance= distance(43.318334, -1.9812313, 37.3890924, -5.9844589);
		System.out.println("Distance between Donostia and Sevilla: "+ distance);
		System.out.println("Distance between Bilbao and Sevilla: "+ distance(43.2630126, -2.9349852, 37.3890924, -5.9844589));
	}
	
}
