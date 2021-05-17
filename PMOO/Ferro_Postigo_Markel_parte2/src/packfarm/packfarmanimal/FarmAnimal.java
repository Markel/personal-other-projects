package packfarm.packfarmanimal;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import packexceptions.CollectErrorException;
import packfarm.PhysiologicalValues;
import packfarm.Sensor;

/**
 * Represents an animal of the farm
 * 
 * @author Markel
 */
public abstract class FarmAnimal implements Comparable<FarmAnimal> {

    private final String ID;
    private int age;
    private double weight;
    private Sensor mySensor;
    private PhysiologicalValues[] myValues;
    private int arrayPos;
    private double usualTemp; // Fahrenheit
    private double annualFoodPrice;
    private int departureAge;
    
    /**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param departureAge When animals should leave the farm
     * @param annualFoodPrice How much do they cost
     */
    public FarmAnimal(String id, int departureAge, double annualFoodPrice) {
        this(id, 39, departureAge, annualFoodPrice);
    }
    
    /**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param usualTemp Usual temperature of the animal (unit: celsius)
     * @param departureAge When animals should leave the farm
     * @param annualFoodPrice How much do they cost
     */
    public FarmAnimal(String id, double usualTemp, int departureAge, double annualFoodPrice) {
        this.ID = id;
        this.initWeek();
        this.usualTemp = usualTemp;
        this.departureAge = departureAge;
        this.annualFoodPrice = annualFoodPrice;
    }

    /**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param age Age of the animal.
     * @param weight Weight of the animal (unit: kg).
     * @param departureAge When animals should leave the farm
     * @param annualFoodPrice How much do they cost
     */
    public FarmAnimal(String id, int age, double weight, int departureAge, double annualFoodPrice) {
        this(id, age, weight, departureAge, annualFoodPrice, 39);
    }
    
    /**
     * Creates a new animal.
     * 
     * @param id Unique identifier of the animal.
     * @param age Age of the animal.
     * @param weight Weight of the animal (unit: kg).
     * @param departureAge When animals should leave the farm
     * @param annualFoodPrice How much do they cost
     * @param usualTemp Usual temperature of the animal (unit: celsius)
     */
    public FarmAnimal(String id, int age, double weight, int departureAge, double annualFoodPrice, double usualTemp) {
        this.ID = id;
        this.age = age;
        this.weight = weight;
        this.initWeek();
        this.departureAge = departureAge;
        this.annualFoodPrice = annualFoodPrice;
        this.usualTemp = usualTemp;
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
				values = mySensor.collectValues(usualTemp);
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
     * Checks if the animal is 1.5 degrees celcius away from its usual temperature
     * 
     * @return True if the values are abnormal
     */
    public boolean possibleSick() {
    	boolean sick = false;
    	if (avgTemperature() >= (usualTemp + 1.5)) {
    		sick = true;
    	} else if (avgTemperature() <= (usualTemp - 1.5)) {
    		sick = true;
    	}
    	return sick;
    }
    
    /**
     * Obtains the inheritance path of the animal
     * @return the inheritance path
     */
    public String inheritancePath() {
    	return "FarmAnimal";
    }
    
    /**
     * Checks if the animal is ready to leave the farm
     * @return True if it is ready
     */
    public boolean departure() {
    	if (age >= departureAge) {
			return true;
		}
    	return false;
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
     * Returns the usual temperatu of the animal (unit: fahrenheit).
     * 
     * @return The usual temperature.
     */
    public double getUsualTemperature() {
    	return usualTemp;
    }
    
    /**
     * Obtains the cost of maintaining the animal
     * 
	 * @return the cost of maintainance
	 */
	public double calculateAnnualCost() {
		return annualFoodPrice;
	}

	/**
	 * Obtains the age in which the animals should leave the farm
	 * 
	 * @return the departureAge
	 */
	public int getDepartureAge() {
		return departureAge;
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
	 * Changes the annualFoodPrice
	 * 
	 * @param annualFoodPrice the annualFoodPrice to set
	 */
	public void setAnnualFoodPrice(double annualFoodPrice) {
		this.annualFoodPrice = annualFoodPrice;
	}

    @Override
    public String toString() {
        return ID + " " + age + " " + weight + " " + mySensor + " " + departureAge + " " + annualFoodPrice; // The mySensor automatically applies the toString
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
    
    public int compareTo(FarmAnimal f) {
    	return ID.compareTo(f.getId());
    }

}