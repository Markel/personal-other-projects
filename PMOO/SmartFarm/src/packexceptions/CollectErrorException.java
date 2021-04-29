package packexceptions;

/**
 * An error has happened in the process of obtaining animal information
 * 
 * @author Markel
 */
public class CollectErrorException extends Exception {
	
	public CollectErrorException(String message) {
		super(message);
	}
	
}
