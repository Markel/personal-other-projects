package packfarm.packfarmanimal;

/**
 * Class used as a parent for all animals that produce some kind of product
 * 
 * @author markel
 */
public abstract class Producer extends FarmAnimal implements IEcological {
	
	private String product;
	private boolean ecological;
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param product The product that they produce
     * @param departureAge When animals should leave the farm
     * @param annualFoodPrice How much do they cost
     * @param ecological If the animal is ecological
    */
	public Producer(String id, String product, int departureAge, double annualFoodPrice, boolean ecological) {
		super(id, departureAge, annualFoodPrice);
		this.product = product;
		this.ecological = ecological;
		applyEcological();
	}
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param product The product that they produce
     * @param departureAge When animals should leave the farm
     * @param annualFoodPrice How much do they cost
     * @param usualTemp Usual temperature of the animal (unit: celsius)
     * @param ecological If the animal is ecological
    */
	public Producer(String id, String product, int departureAge, double annualFoodPrice, double usualTemp, boolean ecological) {
		super(id, usualTemp, departureAge, annualFoodPrice);
		this.product = product;
		this.ecological = ecological;
		applyEcological();
	}
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param age Age of the animal.
     * @param weight Weight of the animal (unit: kg).
     * @param departureAge When animals should leave the farm
     * @param annualFoodPrice How much do they cost
     * @param product The product that they produce
     * @param ecological If the animal is ecological
    */
	public Producer(String id, int age, double weight, int departureAge, double annualFoodPrice, String product, boolean ecological) {
		super(id, age, weight, departureAge, annualFoodPrice);
		this.product = product;
		this.ecological = ecological;
		applyEcological();
	}
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param age Age of the animal.
     * @param weight Weight of the animal (unit: kg).
     * @param departureAge When animals should leave the farm
     * @param annualFoodPrice How much do they cost
     * @param product The product that they produce
     * @param usualTemp Usual temperature of the animal (unit: celsius)
     * @param ecological If the animal is ecological
    */
	public Producer(String id, int age, double weight, int departureAge, double annualFoodPrice, String product, double usualTemp, boolean ecological) {
		super(id, age, weight, departureAge, annualFoodPrice, usualTemp);
		this.product = product;
		this.ecological = ecological;
		applyEcological();
	}

	/**
	 * Obtains the product the animal produces
	 * 
	 * @return the product
	*/
	public String getProduct() {
		return product;
	}
	
	public boolean isEcological() {
		return ecological;
	}
	
	public void applyEcological() {
		if (ecological) {
			super.setAnnualFoodPrice(this.calculateAnnualCost() * 1.2);
		}
	}
	
	@Override
	public String inheritancePath() {
    	return "Producer < " + super.inheritancePath();
    }
	
	@Override
	public String toString() {
		return super.toString() + " " + product + " " + ecological;
	}
	
}
