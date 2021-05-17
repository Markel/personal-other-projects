package packfarm;

import java.util.*;

import packexceptions.UnknownFarmAnimalException;
import packfarm.packfarmanimal.Chicken;
import packfarm.packfarmanimal.FarmAnimal;
import packfarm.packfarmanimal.IEcological;

/**
 * Represents an entire farm
 * 
 * @author Markel
 */
public class Farm {

    private static Farm instance;
    private ArrayList<FarmAnimal> farmAnimalsSet;
    private ArrayList<Sensor> sensorList;
    private Sensor defaultSensor = new Sensor("ID00");

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
	 * Asigns an available sensor to an animal that will be added to the farm
	 * 
	 * @param a The sensorless animal to add
	 * @throws IndexOutOfBoundsException If no sensors are available
	 */
    public void addFarmAnimal(FarmAnimal a) throws IndexOutOfBoundsException {
    	if (a instanceof Chicken) {
			a.setSensor(defaultSensor);
		} else {
			if (sensorList.size() == 0) throw new IndexOutOfBoundsException("No sensors available");
			a.setSensor(sensorList.get(0));
			sensorList.remove(0);
		}
        farmAnimalsSet.add(a);
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
	 * Obtains a list of all the animal in the farm
	 * 
	 * @return A list of animals
	 */
    public ArrayList<FarmAnimal> obtainAllAnimals() {
    	return farmAnimalsSet;
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
	 * Obtains a list of animals with an abnormal avg. temperature
	 * 
	 * @return The list of the animals that comply with the condition
	 */
    public ArrayList<FarmAnimal> obtainPossiblySick() {
    	ArrayList<FarmAnimal> list = new ArrayList<FarmAnimal>();
        for (FarmAnimal f : farmAnimalsSet) {
			if (f.possibleSick()) list.add(f);
		}
        return list;
    }

    /**
     * Search between the animals in the farm for a specific given id
     * @param toFind The animal to search for
     * @return The animal associated with the one given
     * @throws UnknownFarmAnimalException When the animal isn't present
    */
    public FarmAnimal obtainFarmAnimal(FarmAnimal toFind) throws UnknownFarmAnimalException {
        FarmAnimal a = null, aux = null;
        Iterator<FarmAnimal> i = farmAnimalsSet.iterator();
    	while (i.hasNext() && a == null) {
    		aux = i.next();
    		if (aux.equals(toFind)) a = aux;
    	}
    	if (a == null) throw new UnknownFarmAnimalException();
    	return a;
    }

    /**
	 * Removes an animal from the farm, adding its sensor to the sensorList
	 *
	 * @param animal The animal to remove
	 * @return The animal that has been removed
     * @throws UnknownFarmAnimalException When the animal isn't present
	 */
    public FarmAnimal removeFarmAnimal(FarmAnimal animal) throws UnknownFarmAnimalException {
        FarmAnimal toDelete = this.obtainFarmAnimal(animal);
        if (!(toDelete instanceof Chicken)) {
        	sensorList.add(toDelete.getMySensor()); // Do not add chicken sensors
		}
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
     * Removes the animals that are ready for departure.
     *  
     * @return A list of the animals that have left the farm
     */
    public ArrayList<FarmAnimal> farmAnimalsDeparture() {
    	ArrayList<FarmAnimal> clone = new ArrayList<FarmAnimal>();
    	for (FarmAnimal f : farmAnimalsSet) {
			clone.add(f);
		}
    	ArrayList<FarmAnimal> toDelete = new ArrayList<FarmAnimal>();
        Iterator<FarmAnimal> i = clone.iterator();
    	
    	while (i.hasNext()) {
    		FarmAnimal f = i.next();
			if (f.departure()) {
				toDelete.add(f);
				try {
					this.removeFarmAnimal(f);
				} catch (UnknownFarmAnimalException e) {
					// Shouldn't happen
					e.printStackTrace();
				}
			}
    	}
        return toDelete;
    }
    
    /**
     * Sorts the animals in the farm.
     */
    public void sortFarm() {
    	Collections.sort(farmAnimalsSet);
    }
    
    /**
     * Prints info of all the animals in the farm
     */
    public void whoIsInFarm() {
    	System.out.println("Animals in the farm:");
    	for (FarmAnimal f : farmAnimalsSet) {
			System.out.println(f.toString());
		}
    }
    
	/**
	 * Calculates the annual cost of all the animals in the farm
	 * 
	 * @return The cost (unit: euros)
	 */
    public double calculateAnnualCost() {
    	double result = 0.0;
    	for (FarmAnimal f : farmAnimalsSet) {
			result += f.calculateAnnualCost();
		}
    	return result;
    }
    
    /**
     * Counts the number of animals in the farm that are ecological 
     * @return The amount of ecological animals
     */
    public int farmEcologicalAnimalAccount() {
    	int ecologic = 0;
    	for (FarmAnimal f : farmAnimalsSet) {
			if (f instanceof IEcological) {
				IEcological e = (IEcological) f;
				if (e.isEcological()) {
					ecologic++;
				}
			}
		}
    	return ecologic;
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