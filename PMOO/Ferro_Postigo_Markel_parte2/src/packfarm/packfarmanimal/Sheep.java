package packfarm.packfarmanimal;

/**
 * It represents a sheep in the farm
 * 
 * @author markel
 */
public abstract class Sheep extends Producer {
	
	private final static double CONSUMODEFAULT = 133.23;
	private final static int YEARSDEFAULT = 12;
	
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param product The product that they produce.
     * @param ecological If the animal is ecological
    */
	public Sheep(String id, String product, boolean ecological) {
		super(id, product, YEARSDEFAULT, CONSUMODEFAULT, ecological);
	}
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param age Age of the animal.
     * @param weight Weight of the animal (unit: kg).
     * @param product The product that they produce
     * @param ecological If the animal is ecological
    */
	public Sheep(String id, int age, double weight, String product, boolean ecological) {
		super(id, age, weight, YEARSDEFAULT, CONSUMODEFAULT, product, ecological);
	}
	
	@Override
	public String inheritancePath() {
    	return "Sheep < " + super.inheritancePath();
    }

}
