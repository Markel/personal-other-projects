package packlight;

public class Led extends NoIncandescentes implements ISeguridad {
	
	private String color;
	private double estanqueidad;
	
	/**
	 * It creates an object of Incandescentes type
	 * @param id The id of the bulb
	 * @param consumption The consumption of the bulb (unit: Watt)
	 * @param intensity The insentity of the bulb (unit: lumen)
	 * @param transformador If the bulb needs a transformer
	 * @param color Must be "red", "orange", "cyan" or "blue"
	 * @param tightness Tightness of the bulb
	 */
	public Led (String id, double consumption, double intensity, boolean transformador, String color, double estanqueidad) {
		super(id, consumption, intensity, transformador);
		this.color = color.toLowerCase();
		this.estanqueidad = estanqueidad;
	}

	/**
	 * Obtains the color of the bulb
	 * @return The color
	 */
	public String getColor() {
		return color;
	}

	/**
	 * Obtains the tightness of the bulb
	 * @return the tightness
	 */
	public double getEstanqueidad() {
		return estanqueidad;
	}
	
	
	@Override
	public double getIntensity() {
		double color_inte;
		switch(color) {
		  case "red":
			  color_inte = this.currentBrightness()*1.15;
			  break;
		  case "naranja":
			  color_inte = this.currentBrightness()*1.29;
			  break;
		  case "cyan":
			  color_inte = this.currentBrightness()*1.5;
			  break;
		  case "azul":
			  color_inte = this.currentBrightness()*1.31;
			  break;
		  default:
			  color_inte = this.currentBrightness();
		}
		return Math.min(this.getIntensity(), color_inte);
	}
	
	@Override
	public String toString() {
		return super.toString() + ", color= " + color + ", estanqueidad= " + estanqueidad;
	}
	
	public double getSecurity() {
		return 3*estanqueidad;
	}
}
