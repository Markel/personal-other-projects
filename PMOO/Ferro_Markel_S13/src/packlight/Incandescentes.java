package packlight;

public class Incandescentes extends Regulables {
	
	/**
	 * It creates an object of Incandescentes type
	 * @param id The id of the bulb
	 * @param consumption The consumption of the bulb (unit: Watt)
	 * @param intensity The insentity of the bulb (unit: lumen)
	 */
	public Incandescentes (String id, double consumption, double intensity) {
		super(id, consumption, intensity);
	}
	
}
