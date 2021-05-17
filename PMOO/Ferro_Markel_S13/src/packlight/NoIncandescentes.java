package packlight;

public abstract class NoIncandescentes extends Regulables {
	
	private boolean transformador;
	
	/**
	 * It creates an object of Incandescentes type
	 * @param id The id of the bulb
	 * @param consumption The consumption of the bulb (unit: Watt)
	 * @param intensity The insentity of the bulb (unit: lumen)
	 * @param transformador If the bulb needs a transformer
	 */
	public NoIncandescentes (String id, double consumption, double intensity, boolean transformador) {
		super(id, consumption, intensity);
		this.transformador = transformador;
	}

	/**
	 * Retuns whether the bulb needs a transformer
	 * @return True if it needs it
	 */
	public boolean isTransformador() {
		return transformador;
	}
	
	@Override
	public String toString() {
		return super.toString() + ", transformador= " + transformador;
	}
	
}
