package packlight;

public class Fluorescentes extends LightBulb implements ISeguridad {
	
	private String cevador;
	
	/**
	 * It creates an object of Incandescentes type
	 * @param id The id of the bulb
	 * @param consumption The consumption of the bulb (unit: Watt)
	 * @param intensity The insentity of the bulb (unit: lumen)
	 * @param cevador The type of cevador of the bulb
	 */
	public Fluorescentes (String id, double consumption, double intensity, String cevador) {
		super(id, consumption, intensity);
		this.cevador = cevador;
	}

	/**
	 * Shows the cevador of the fluorecent bulb
	 * @return the cevador
	 */
	public String getCevador() {
		return cevador;
	}
	
	@Override
	public String toString() {
		return super.toString() + ", cevador= " + cevador;
	}
	
	public double getSecurity() {
		// I know, too many returns, but in this case it makes it so much clearer...
		switch(cevador.toLowerCase()) {
			case "deos st171":
				return 3;
			case "s2 4-22w ser":
				return 2;
			default:
				return 1;
		}
	}
	 
}
