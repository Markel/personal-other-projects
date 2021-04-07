package packexception;

/**
 * A negative value is set to something that cannot be negative
 * @author markel
 */
public class NegativeAmountException extends Exception {
	public NegativeAmountException () {
		super();
	}
	
	public NegativeAmountException (String message) {
		super(message);
	}
}
