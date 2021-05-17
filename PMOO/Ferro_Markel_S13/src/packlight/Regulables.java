package packlight;

import packexceptions.AlreadyOffException;
import packexceptions.AlreadyOnException;

public abstract class Regulables extends LightBulb {
	
	private int porcenPotencia;
	
	/**
	 * It creates an object of Regulables type
	 * @param id The id of the bulb
	 * @param consumption The consumption of the bulb (unit: Watt)
	 * @param intensity The insentity of the bulb (unit: lumen)
	 */
	public Regulables(String id, double consumption, double intensity) {
		super(id, consumption, intensity);
		this.porcenPotencia = 0;
	}
	
	/**
	 * Sets the percentage of the potency to work (if the bulb is on, if not it
	 * doens't do anything)
	 * 
	 * @param percentage The percentage to set
	 */
	public void setPercentage(int percentage) {
		if (super.isOn())
			this.porcenPotencia = percentage;
	}
	
	/**
	 * Gets the current consumption of the bulb
	 * @return The consumption
	 */
	public double getConsumption() {
		return (super.getNominalConsumption() * this.porcenPotencia) / 100;
	}
	
	@Override
	public void turnOn() throws AlreadyOnException {
		super.turnOn();
		this.porcenPotencia = 50;
	}
	
	@Override
	public void turnOff() throws AlreadyOffException {
		super.turnOff();
		this.porcenPotencia = 0;
	}
	
	/**
	 * Returns the current brightness based on the percentage of potency
	 * 
	 * @return The current brightness
	 */
	public double currentBrightness() {
		if (!super.isOn()) return (double) 0;
		return (this.porcenPotencia * super.getIntensity()) / 100;
	}
	
	@Override
	public double efficacy() {
		if (!super.isOn())
			return super.efficacy();
		return this.currentBrightness() / this.getNominalConsumption();
	}
	
	@Override
	public String toString() {
		return super.toString() + ", porcentaje_de_potencia= " + porcenPotencia;
	}
}
