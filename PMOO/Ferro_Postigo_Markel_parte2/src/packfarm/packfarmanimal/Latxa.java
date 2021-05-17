package packfarm.packfarmanimal;

/**
 * It represent a latxa sheep in the farm
 * 
 * @author markel
 */
public class Latxa extends Sheep {
	
	private final static String PRODUCTDEFAULT = "milk";
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param ecological If the animal is ecological
    */
	public Latxa(String id, boolean ecological) {
		super(id, PRODUCTDEFAULT, ecological);
	}
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param age Age of the animal.
     * @param weight Weight of the animal (unit: kg).
     * @param ecological If the animal is ecological
    */
	public Latxa(String id, int age, double weight, boolean ecological) {
		super(id, age, weight, PRODUCTDEFAULT, ecological);
	}
	
	@Override
	public String inheritancePath() {
    	return "Latxa < " + super.inheritancePath();
    }

}
