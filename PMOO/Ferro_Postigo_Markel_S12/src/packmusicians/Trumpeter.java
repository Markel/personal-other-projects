package packmusicians;

public class Trumpeter extends Instrumentalist {
	
	private static final double SALARIOEXTRA = 300.0;
	
	public Trumpeter (String name) {
		super(name, "Trumpet");
		super.setSalary(super.getSalary() + SALARIOEXTRA);
	}
	
	@Override
	public String perform() {
		return "Tuturu-tuturu-tururu";
	}

}
