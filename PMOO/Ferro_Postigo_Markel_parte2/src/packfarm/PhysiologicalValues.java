package packfarm;

/**
 * Saves the state in which an animal is at one point in time
 * 
 * @author Markel
 */
public class PhysiologicalValues {

    private int heartRate;
    private double temperature; // En fahrenheit
    private int activity;

    /**
     * Creates a Physicological Values register with information about an animal.
     * 
     * @param heartRate The speed at which the animal's heart beats (unit: bpm).
     * @param temperature Inner temperature of the animal (unit: fahrenheit).
     * @param activity A value between 1 and 5 which represents the activity of the animal.
     */
    public PhysiologicalValues(int heartRate, double temperature, int activity) {
        this.heartRate = heartRate;
        this.temperature = temperature;
        this.activity = activity;
    }

    /**
     * Obtains the heart rate of the animal (unit: bpm).
     * 
     * @return Heart rate.
     */
    public int getHeartRate() {
        return this.heartRate;
    }

    /**
     * Obtains the inner temperature of the animal (unit: fahrenheit).
     * 
     * @return Inner temperature.
     */
    public double getTemperature() {
        return this.temperature;
    }

    /**
     * Obtains the activity of the animal.
     * 
     * @return The activity.
     */
    public int getActivity() {
        return this.activity;
    }

    /**
	 * Converts a PhysiologicalValues object into a String.
	 * 
	 * @return A string with the following format (spaces between every parameter):
	 *         heartRate temperature activity
	 */
    @Override
    public String toString() {
        return heartRate + " " + temperature + " " + activity;
    }

}