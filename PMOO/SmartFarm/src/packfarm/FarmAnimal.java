package packfarm;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import packexceptions.CollectErrorException;

/**
 * Represents an animal of the farm
 * 
 * @author Markel
 */
public class FarmAnimal {

    private final String ID;
    private int age;
    private double weight;
    private Sensor mySensor;
    private PhysiologicalValues[] myValues;
    private int arrayPos;
    
    /**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     */
    public FarmAnimal(String id) {
        this.ID = id;
        this.initWeek();
    }

    /**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param age Age of the animal.
     * @param weight Weight of the animal (unit: kg).
     * @param sensor Sensor attached to the animal.
     */
    public FarmAnimal(String id, int age, double weight, Sensor sensor) {
        this.ID = id;
        this.age = age;
        this.weight = weight;
        this.mySensor = sensor;
        this.initWeek();
    }

	/**
	 * Includes new physiological values to the array. If the array is full, it will
	 * save its contents to the file "data/historicalValues.txt" before registering
	 * the values again.
	 * 
	 * @return The latest values added to the array
	 */
    public PhysiologicalValues register() {
        PhysiologicalValues values = null;
        if (mySensor == null) return null; // Para evitar NullPointerException
    	if (arrayPos >= 7) {
        	this.storeValuesInFile();
        	this.initWeek();
        }
    	// Obtaining the values
        while (values == null) {
        	try {
				values = mySensor.collectValues();
			} catch (CollectErrorException e) {
				// Retry
			}
        }
        this.myValues[arrayPos] = values;
        arrayPos++;
        return values;
    }

    /**
     * Returns the average temperature of the animal in the stored days.
     * 
     * @return The average temperature.
     */
    public double avgTemperature() {
    	if (arrayPos == 0) return 0.0; // Para no dividir entre 0
    	double avg = 0.0;
    	for (int i = 0; i < arrayPos; i++) {
    		avg += (double) myValues[i].getTemperature();
    	}
    	return avg/arrayPos; // ArrayPos no es 0 en este punto
    }

	/**
	 * Saves the physiological values stored in the array in a file (located at
	 * data/historicalValues.txt)
	 */
    private void storeValuesInFile() {
        try {
			// Uso File.Separator porque data\\ar.txt no funciona en Linux, solo en
			// Windows https://stackoverflow.com/a/5797242
			FileWriter fs = new FileWriter("data" + File.separator + "historicalValues.txt", true);
			fs.write(this.toString() + "\n");
			for (int i = 0; i < arrayPos; i++) {
				fs.write(myValues[i].toString() + "\n");
			}
			fs.close();
		} catch (IOException e) {
			System.out.println("No ha sido posible guardar los valores: " + e.getLocalizedMessage());
		}
    }

    /**
     * Restarts the counter of the week array and also swaps the week array for a new one.  
     */
    private void initWeek() {
        this.arrayPos = 0;
        this.myValues = new PhysiologicalValues[7]; // Así borramos los otros por asegurarnos
    }

    /**
     * Obtains the unique identifier of the animal.
     * 
     * @return The ID.
     */
    public String getId() {
        return ID;
    }

    /**
     * Obtains the age of the animal.
     * 
     * @return The age.
     */
    public int getAge() {
        return age;
    }

    /**
     * Returns the weight of the animal (unit: kg).
     * 
     * @return The weight.
     */
    public double getWeight() {
        return weight;
    }

    /**
     * Returns the sensor of the animal.
     * 
     * @return The sensor.
     */
    public Sensor getMySensor() {
        return mySensor;
    }

    /**
     * Returns the position of arrayPos. 0 would be an empty array, 7 a full one
     * 
     * @return ArrayPos
     */
    public int getArrayPos() {
    	return arrayPos;
    }
    
    /**
     * Sets the age of the animal.
     * 
     * @param age Age to set.
     */
    public void setAge(int age) {
        this.age = age;
    }

    /**
     * Sets the weight of the animal (unit: kg).
     * 
     * @param weight Weight to set.
     */
    public void setWeight(double weight) {
        this.weight = weight;
    }

    /**
     * Sets the sensor of the animal.
     * 
     * @param sensor The sensor to set.
     */
    public void setSensor(Sensor sensor) {
        this.mySensor = sensor;
    }

    /**
     * Converts a FarmAnimal object into a String.
     * 
     * @return A string with the following format (spaces between every parameter):
	 *         ID age weight sensorID
     */
    @Override
    public String toString() {
        return ID + " " + age + " " + weight + " " + mySensor; // The mySensor automatically applies the toString
    }

    /**
	 * Checks whether the 2 animals are the same.
	 * 
	 * @param o The other animal to check against.
	 * @return True if their ID is the same, if not, false.
	 */
    @Override
    public boolean equals(Object o) {
    	if (o == null) return false;
    	FarmAnimal ani = (FarmAnimal) o;
    	return ID.equals(ani.getId());
    }

}