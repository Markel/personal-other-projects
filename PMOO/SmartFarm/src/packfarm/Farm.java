package packfarm;

import java.util.*;

/**
 * Represents an entire farm
 * 
 * @author Markel
 */
public class Farm {

    private static Farm instance;
    private ArrayList<FarmAnimal> farmAnimalsSet;
    private ArrayList<Sensor> sensorList;

    /**
     * Creates a new Farm
     */
    private Farm() {
    	farmAnimalsSet = new ArrayList<FarmAnimal>();
    	sensorList = new ArrayList<Sensor>();
    }

	/**
	 * Creates a new farm if one did not exist previously, if it did it will return
	 * the pointer to the previous instance
	 * 
	 * @return The Farm instance
	 */
    public static Farm getInstance() {
        if (instance == null) instance = new Farm();
        return instance;
    }

    /**
     * Destroys the current farm setting the instance value to null
     */
    public static void destroy() {
        instance = null;
    }

    /**
	 * Asigns an available sensor to an animal that will be created with the
	 * parameters provided
	 * 
	 * @param id     The unique identifier of the animal
	 * @param age    The age of the animal
	 * @param weight The weight of the animal
	 * @throws IndexOutOfBoundsException If no sensors are available
	 */
    public void addFarmAnimal(String id, int age, double weight) throws IndexOutOfBoundsException {
        if (sensorList.size() == 0) throw new IndexOutOfBoundsException("No sensors available");
        FarmAnimal a = new FarmAnimal(id, age, weight, sensorList.get(0));
        farmAnimalsSet.add(a);
        sensorList.remove(0);
    }

    /**
     * Counts the amount of animals in the farm
     * 
     * @return Amount of animals
     */
    public int howManyAnimals() {
        return farmAnimalsSet.size();
    }

    /**
     * Adds a sensor to the available sensor list
     * 
     * @param sensor Sensor to add
     */
    public void addSensor(Sensor sensor) {
        sensorList.add(sensor);
    }

    /**
     * Counts the amount of sensors available in the farm
     * 
     * @return Amount of sensors
     */
    public int howManySensors() {
        return sensorList.size();
    }

    /**
     * Request that all animals in the farm register their physiological values
     */
    public void register() {
        for (FarmAnimal a : farmAnimalsSet) {
			a.register();
		}
    }

    /**
	 * Obtains a list of animals with a avg. temperature (strictly) greater than a
	 * given temperature
	 * 
	 * @param max The max temperature to compare against
	 * @return The list of the animals that comply with the condition
	 */
    public ArrayList<FarmAnimal> obtainPossiblySick(double max) {
    	ArrayList<FarmAnimal> list = new ArrayList<FarmAnimal>();
        for (FarmAnimal f : farmAnimalsSet) {
			if (f.avgTemperature() > max) list.add(f);
		}
        return list;
    }

	/**
	 * Search between the animals in the farm for a specific given id
	 * 
	 * @implNote There's not error detecting for wrong ids as requested by the
	 *           specification. However, just wanted to let know that in that case,
	 *           null will be returned.
	 * @param id The id to search for
	 * @return The animal associated with that id
	 */
    public FarmAnimal obtainFarmAnimal(String id) {
        FarmAnimal a = null, aux = null;
        Iterator<FarmAnimal> i = farmAnimalsSet.iterator();
    	while (i.hasNext() && a == null) {
    		aux = i.next();
    		if (aux.getId().equals(id)) a = aux;
    	}
    	return a;
    }

    /**
	 * Removes an animal from the farm, adding its sensor to the sensorList
	 * 
	 * @implNote The specification doesn't ask for it, but if the animal doesn't
	 *           exist, except a null to be returned
	 * @param id The id of the animal to remove
	 * @return The animal that has been removed
	 */
    public FarmAnimal removeFarmAnimal(String id) {
        FarmAnimal toDelete = this.obtainFarmAnimal(id);
        if (toDelete == null) return null;
        sensorList.add(toDelete.getMySensor());
        farmAnimalsSet.remove(toDelete);
        return toDelete;
    }

    /**
     * Obtains a list of animals (strictly) older than a given age
     * 
     * @param age The age to check against
     * @return The list of the identifiers older than the age given
     */
    public ArrayList<String> obtainFarmAnimalOlder(int age) {
        ArrayList<String> list = new ArrayList<String>();
        for (FarmAnimal f : farmAnimalsSet) {
			if (f.getAge() > age) list.add(f.getId());
		}
        return list;
    }

    /**
     * Removes the animals that are overwight but not sick.
     * 
     * @param maxWeight Threshold weight starting from which animals are overweight
     * @param maxTemp Threshold temperature starting from which animals are sick  
     * @return A list of identifiers of the animals that have left the farm
     */
    public ArrayList<String> farmAnimalsDeparture(double maxWeight, double maxTemp) {
    	ArrayList<String> sick = new ArrayList<String>();
    	ArrayList<String> overWeight = new ArrayList<String>();
    	ArrayList<String> toDelete = new ArrayList<String>();
        
    	// Weight
    	for (FarmAnimal f : farmAnimalsSet) {
			if (f.getWeight() > maxWeight) overWeight.add(f.getId());
		}
    	// Sick
    	ArrayList<FarmAnimal> aux = this.obtainPossiblySick(maxTemp);
    	for (FarmAnimal f : aux) {
			sick.add(f.getId());
		}
        // Create the ones that must be deleted
    	for (String a : overWeight) {
			if (!sick.contains(a)) toDelete.add(a);
		}
        
        // Remove them
        for (String s : toDelete) {
			this.removeFarmAnimal(s);
		}
        return toDelete;
    }
    
    
    /**
     * Converts a Farm object into a String.
     * 
     * @return A string with the following format (spaces between every parameter):
	 *         instanceAddress
     */
    @Override
    public String toString() {
        return instance + ""; // The mySensor automatically applies the toString
    }
}