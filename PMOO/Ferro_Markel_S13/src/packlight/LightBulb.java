package packlight;

import packexceptions.*;

public abstract class LightBulb implements Comparable<LightBulb> {
	
	private String id;
	private double consumption;
	private double intensity;
	private boolean on;
	
	/**
	 * It creates an object of LightBulb type
	 * @param id The id of the bulb
	 * @param consumption The consumption of the bulb (unit: Watt)
	 * @param intensity The insentity of the bulb (unit: lumen)
	 */
	public LightBulb (String id, double consumption, double intensity) {
		this.id = id;
		this.consumption = consumption;
		this.intensity = intensity;
		this.on = false;
	}

	/**
	 * Obtains the id of the bulb
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * Obtains the consumption of the bulb (unit: Watt)
	 * @return the consumption
	 */
	public double getNominalConsumption() {
		return consumption;
	}

	/**
	 * Obtains the intensity of the bulb (unit: lumen)
	 * @return the intensity
	 */
	public double getIntensity() {
		return intensity;
	}

	/**
	 * Obtains whether the bulb is on
	 * @return True if on
	 */
	public boolean isOn() {
		return on;
	}

	/**
	 * Sets the comsumption of the bulb (unit: Watt)
	 * @param consumption the consumption to set
	 */
	public void setConsumption(double consumption) {
		this.consumption = consumption;
	}

	/**
	 * Sets the intensity of the bulb (unit: lumen)
	 * @param intensity the intensity to set
	 */
	public void setIntensity(double intensity) {
		this.intensity = intensity;
	}
	
	/**
	 * Turns the bulb on
	 * @throws AlreadyOnException If the bulb is already on
	 */
	public void turnOn() throws AlreadyOnException {
		if (on) throw new AlreadyOnException();
		on = true;
	}
	
	/**
	 * Turns the bulb off
	 * @throws AlreadyOffException If the bulb is already off
	 */
	public void turnOff() throws AlreadyOffException {
		if (!on) throw new AlreadyOffException();
		on = false;
	}
	
	/**
	 * Obtains the currency efficiency of the bulb
	 * @return The efficiency
	 */
	public double efficacy() {
		return this.getIntensity() / this.getNominalConsumption();
	}
	
	@Override
	public String toString() {
		return id + ": " + consumption + "W, " + intensity + " lumen and is on? " + on;
	}
	
	public int compareTo(LightBulb st) {
		return id.compareTo(st.getId());
	} 
}
