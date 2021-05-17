package packfarm.packfarmanimal;

/**
 * Used for the animals that can be ecological
 * 
 * @author markel
 */
public interface IEcological {
	
	// In reality the amount of work needed for this to work makes this interface
	// kind of useless, but it is more so I can use an instanceof
	
	/**
	 * Obtains weather the animal is ecological
	 * @return If it is ecological
	 */
	public boolean isEcological();
	
	/**
	 * It modifies the cost of the animal if this is ecological
	 */
	public void applyEcological();
}
