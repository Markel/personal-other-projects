package packmusicians;

public abstract class Singer extends Musician {
	
	private static final double SALARIOEXTRA = 200.0;
	
	public Singer(String name) {
		super(name);
		this.setSalary(super.getSalary() + SALARIOEXTRA);
	}
	
	@Override
	public abstract String perform();

}
