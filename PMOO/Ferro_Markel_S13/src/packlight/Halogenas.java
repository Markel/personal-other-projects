package packlight;

public class Halogenas extends NoIncandescentes {
	
	/**
	 * It creates an object of Incandescentes type
	 * @param id The id of the bulb
	 * @param consumption The consumption of the bulb (unit: Watt)
	 * @param intensity The insentity of the bulb (unit: lumen)
	 * @param transformador If the bulb needs a transformer
	 */
	public Halogenas (String id, double consumption, double intensity, boolean transformador) {
		super(id, consumption, intensity, transformador);
	}
	
}
