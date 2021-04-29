package packmusicians;

public class Pianist extends Instrumentalist {
	
	private static final double SALARIOEXTRA = 700.0;
	
	public Pianist (String name) {
		super(name, "Piano");
		super.setSalary(super.getSalary() + SALARIOEXTRA);
	}
	
	@Override
	public String perform() {
		return "Cliing-cliing-clang-cliing-claang-cliing";
	}

}
