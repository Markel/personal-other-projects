//! El código no está documentado, es una copia de lo que he hecho en papel (y me daba pereza escribirlo a mano)
package packbuilding;

public class TemperatureSensor {
	private int piso;
	private int oficina;
	private boolean state;
	private int ultimaTemperatura;
	
	public TemperatureSensor(int piso, int oficina) {
		this(piso, oficina, false);
	}
	
	public TemperatureSensor(int piso, int oficina, boolean state) {
		this.piso = piso;
		this.oficina = oficina;
		this.state = state;
		if (state) {
			updateTemperature();
		}
	}
	
	public void setState(boolean state) {
		this.state = state;
	}
	
	public void updateTemperature() {
		if (this.state) {
			ultimaTemperatura = this.getMeasurement();
		}
	}
	
	public int getTemperature() {
		return this.ultimaTemperatura;
	}
	
	public boolean differentLocation(String sensor) {
		return !this.getLocation().equals(sensor);
	}
	
	
	// "Predefinidos"
	public String getLocation() {
		return "F1O5";
	}
	
	private int getMeasurement() {
		return 30;
	}
}