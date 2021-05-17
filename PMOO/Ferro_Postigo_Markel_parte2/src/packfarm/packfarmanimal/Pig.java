package packfarm.packfarmanimal;

/**
 * It represents a pig in the farm
 * 
 * @author markel
 */
public class Pig extends FarmAnimal implements IEcological {
	
	private final static int YEARSDEFAULT = 1;
	private final static double CONSUMODEFAULT = 134.32;
	
	private boolean ecological;
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param ecological If the animal is ecological
    */
	public Pig(String id, boolean ecological) {
		super(id, YEARSDEFAULT, CONSUMODEFAULT); // Si no tiene peso complicado calcular el coste
		this.ecological = ecological;
		applyEcological();
	}
	
	/**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param age Age of the animal.
     * @param weight Weight of the animal (unit: kg).
     * @param ecological If the animal is ecological
    */
	public Pig(String id, int age, double weight, boolean ecological) {
		super(id, age, weight, YEARSDEFAULT, CONSUMODEFAULT * ((weight * 3.5)/100));
		this.ecological = ecological;
		applyEcological();
	}
	
	public boolean isEcological() {
		return ecological;
	}
	
	public void applyEcological() {
		if (ecological) {
			super.setAnnualFoodPrice(this.calculateAnnualCost() * 1.15);
		}
	}
	
	@Override
	public void setWeight(double weight) {
        super.setWeight(weight);
        super.setAnnualFoodPrice(CONSUMODEFAULT * ((weight * 3.5)/100));
    }
	
	@Override
	public String inheritancePath() {
    	return "Pig < " + super.inheritancePath();
    }
	
	
	@Override
	public boolean departure() {
		return (getAge() >=1 || getWeight() >= 100) & !possibleSick();
	}
	
	@Override
	public String toString() {
		return super.toString() + " " + ecological;
	}
}
