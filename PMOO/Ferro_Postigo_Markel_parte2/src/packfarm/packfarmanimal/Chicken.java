package packfarm.packfarmanimal;

/**
 * It represent a chicken on the farm
 * 
 * @author markel
 */
public class Chicken extends Producer {
	
	private final static double CONSUMODEFAULT = 547.5;
	private final static int YEARSDEFAULT = 4;
	private final static double USUALTEMP = 42.0;
	private final static String PRODUCTDEFAULT = "eggs";
	
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param ecological If the animal is ecological
    */
	public Chicken(String id, boolean ecological) {
		super(id, PRODUCTDEFAULT, YEARSDEFAULT, CONSUMODEFAULT, USUALTEMP, ecological);
	}
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param age Age of the animal.
     * @param weight Weight of the animal (unit: kg).
     * @param ecological If the animal is ecological
    */
	public Chicken(String id, int age, double weight, boolean ecological) {
		super(id, age, weight, YEARSDEFAULT, CONSUMODEFAULT, PRODUCTDEFAULT, USUALTEMP, ecological);
	}
	
	@Override
	public String inheritancePath() {
    	return "Chicken < " + super.inheritancePath();
    }
}
