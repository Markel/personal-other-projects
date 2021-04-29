package packmusicians;

public class Tenor extends Singer {
	
	public Tenor(String name) {
		super(name);
	}
	
	@Override
	public String perform() {
		return "Lorolo-lorolo-loooo";
	}

}
