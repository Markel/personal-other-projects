package packfarm.packfarmanimal;

/**
 * It represents 
 * @author markel
 *
 */
public class WoolSheep extends Sheep {
	
	private final static String PRODUCTDEFAULT = "wool";
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param ecological If the animal is ecological
    */
	public WoolSheep(String id, boolean ecological) {
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
	public WoolSheep(String id, int age, double weight, boolean ecological) {
		super(id, age, weight, PRODUCTDEFAULT, ecological);
	}
	
	@Override
	public String inheritancePath() {
    	return "WoolSheep < " + super.inheritancePath();
    }

}
