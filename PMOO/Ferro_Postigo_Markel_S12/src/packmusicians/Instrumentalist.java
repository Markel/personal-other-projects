package packmusicians;

public abstract class Instrumentalist extends Musician {
	
	private String instrument;
	
	public Instrumentalist (String name, String instrument) {
		super(name);
		this.instrument = instrument;
	}
	
	/**
	 * Gets the instrument of the musician
	 * @return The instrument
	 */
	public String getInstrument() {
		return instrument;
	}
	
	@Override
	public String toString() {
		return super.toString() + ", instrument=" + instrument;
	}
	
	@Override
	public abstract String perform();
	
}
