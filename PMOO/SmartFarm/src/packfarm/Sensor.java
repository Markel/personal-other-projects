package packfarm;

import java.util.*;
import packexceptions.CollectErrorException;

/**
 * Represents a sensor that can be attached to an animal
 * 
 * @author Markel
 */
public class Sensor {

    private String id;

    /**
     * Creates a Sensor object with the id value initialized
     * 
     * @param id Sensor's unique identifier
     */
    public Sensor(String id) {
        this.id = id;
    }

    /**
	 * Simulates a data structure that could be collected from a real sensor
	 * 
	 * @return Randomized physiological data
	 */
    private PhysiologicalValues collect() throws CollectErrorException {
    	Random r= new Random();
    	int heartRate= 0;
    	double temperature = 0.0;
    	int activity= 0;
    	// Simulates the possibility or not of values capture
    	heartRate = 60+ r.nextInt(20);
    	temperature = 101.5+r.nextDouble();
    	temperature = Double.parseDouble(String.format("%.2f", temperature).
    	replace(',', '.'));
    	activity = r.nextInt(5)+1;
    	PhysiologicalValues phy = new PhysiologicalValues(heartRate, temperature, activity);
    	if (Math.random()>=0.9) throw new CollectErrorException(phy.toString());
    	return phy;
    }

	/**
	 * Using the sensor attached to the animal it queries the physiological values
	 * of the animal
	 * 
	 * @return The physiological values of the animal in the moment of the call
	 */
    public PhysiologicalValues collectValues() throws CollectErrorException {
        return collect();
    }

	/**
	 * Converts a sensor into a String
	 * 
	 * @return A string with the following format: id
	 */
    @Override
    public String toString() {
        return "" + id; // Done this to create a new object, in case the id could be changed
    }

}