package packfarm.packfarmanimal;

/**
 * It represents a cow in the farm
 * 
 * @author markel
 */
public class Cow extends Producer {
	
	private final static double CONSUMODEFAULT = 492.75;
	private final static int YEARSDEFAULT = 20;
	private final static String PRODUCTDEFAULT = "milk";
	
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param ecological If the animal is ecological
    */
	public Cow(String id, boolean ecological) {
		super(id, PRODUCTDEFAULT, YEARSDEFAULT, CONSUMODEFAULT, ecological);
	}
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param age Age of the animal.
     * @param weight Weight of the animal (unit: kg).
     * @param ecological If the animal is ecological
    */
	public Cow(String id, int age, double weight, boolean ecological) {
		super(id, age, weight, YEARSDEFAULT, CONSUMODEFAULT, PRODUCTDEFAULT, ecological);
	}
	
	@Override
	public String inheritancePath() {
    	return "Cow < " + super.inheritancePath();
    }

}
