package packmusicians;

public class Soprano extends Singer {
	
	private boolean internacional;
	
	public Soprano(String name, boolean internacional) {
		super(name);
		this.internacional = internacional;
	}
	
	@Override
	public double getSalary() {
		if (!internacional)
			return super.getSalary();
		else
			return super.getSalary() + (super.getSalary() * 33)/100;
	}
	
	@Override
	public String perform() {
		return "Liliri-liliri-liiiiiiiii";
	}
	
	@Override
	public String toString() {
		return super.toString() + ", international=" + internacional;
	}
}
