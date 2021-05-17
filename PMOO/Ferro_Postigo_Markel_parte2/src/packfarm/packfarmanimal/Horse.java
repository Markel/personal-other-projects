package packfarm.packfarmanimal;

/**
 * It represents a horse in the farm
 * 
 * @author markel
 */
public class Horse extends FarmAnimal {
	
	private final static int YEARSDEFAULT = 5;
	private final static double CONSUMODEFAULT = 1027.75;
	
	private String type;
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param type The activity they perform.
    */
	public Horse(String id, String type) {
		super(id, YEARSDEFAULT, CONSUMODEFAULT); // Si no tiene peso complicado calcular el coste
		this.type = type;
	}
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param age Age of the animal.
     * @param weight Weight of the animal (unit: kg).
     * @param type The activity they perform.
    */
	public Horse(String id, int age, double weight, String type) {
		super(id, age, weight, YEARSDEFAULT, CONSUMODEFAULT * ((weight * 1)/100));
		this.type = type;
	}
	
	/**
	 * Obtains the type of the horse
	 * 
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	
	@Override
	public void setWeight(double weight) {
        super.setWeight(weight);
        super.setAnnualFoodPrice(CONSUMODEFAULT * ((weight * 1)/100));
    }
	
	@Override
	public String inheritancePath() {
    	return "Horse < " + super.inheritancePath();
    }
	
	@Override
	public boolean departure() {
		return !possibleSick();
	}
	
	@Override
	public String toString() {
		return super.toString() + " " + type;
	}
	
}
