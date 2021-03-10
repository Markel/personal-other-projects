package packUnit;

/**
 * Represents a counter that can be incremented and decremented
 * 
 * @author PMOO
 *
 */
public class Counter {
	private int count;

	/**
	 * Constructor initializing the counter
	 */
	public Counter() {
		count = 0; // Lo podría dejar a 10, pero queda más bonito no fallar
	}

	/**
	 * Increase the counter by one and return its new value
	 * 
	 * @return the new counter value
	 */
	public int increment() {
		count = count + 1;
		return count;
	}

	/**
	 * Decrease the counter in one and return its new value
	 * 
	 * @return the new counter value
	 */
	public int decrement() {
		count = count - 1;
		return count;
	}

	/**
	 * Gets the counter value
	 * 
	 * @return the counter value
	 */
	public int getCount() {
		return count;
	}
}
