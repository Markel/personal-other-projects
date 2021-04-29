package packmusicians;

public class Director extends Musician {
	
	private int antiguedad;
	private static final double SALARIOEXTRA = 400.0;
	
	public Director(String name) {
		super(name);
		this.setSalary(super.getSalary() + SALARIOEXTRA);
		this.antiguedad = 0;
	}
	
	/**
	 * Gets how long the director has been working (unit: years)
	 * @return the antiguedad
	 */
	public int getAntiguedad() {
		return antiguedad;
	}
	
	@Override
	public double getSalary() {
		double salary = super.getSalary();
		double plus = (salary * 105 / 100) * antiguedad;
		return salary + plus;
	}
	
	/**
	 * Sets how long the director has been working (unit: years)
	 * @param antiguedad the antiguedad to set
	 */
	public void setAntiguedad(int antiguedad) {
		this.antiguedad = antiguedad;
	}

	@Override
	public String perform() {
		return "Tok tok tok: (silence)";
	}
	
	@Override
	public String toString() {
		return super.toString() + ", antiquity=" + antiguedad;
	}
	
}
