//! El código no está documentado, es una copia de lo que he hecho en papel (y me daba pereza escribirlo a mano)
package packbuilding;

public class BuildingControl {
	private final int tempMínima;
	private final int tempMáxima;
	private TemperatureSensor[] sensores;
	
	public BuildingControl() {
		this(18,23);
	}
	
	public BuildingControl(int tempMínima, int tempMáxima) {
		sensores = new TemperatureSensor[20]; // Mencionado en el contexto
		this.tempMínima = tempMínima;
		this.tempMáxima = tempMáxima;
	}
	
	public void addSensor(TemperatureSensor sensor) {
		int i = 0;
		while (i < sensores.length && sensores[i] != null) {
			i++;
		}
		sensores[i] = sensor; // Nota: Cuando el array esté completo esto dará error
	}
	
	/**
	 * Genera el texto de alerta apropiado en casi de una temperatura incorrecta
	 * @param location La oficina en la que ocurre el problema
	 * @param temperature La temperatura a la cual la oficina está
	 * @return Mensaje de aleta para la oficina
	 */
	public String alertOffice(String location, int temperature) {
		return "foo";
	}
	
	public String buildingManagement() {
		String alerta = "VERIFICAR OFICINAS: "; // Si no hay ninguna se mostrará solo esto
		int tempAux;
		for (TemperatureSensor sensor: sensores) {
			if (sensor != null) {
				sensor.setState(true);
				sensor.updateTemperature();
				tempAux = sensor.getTemperature();
				if (tempAux > tempMáxima) {
					alerta = alerta + sensor.getLocation() + " (" + (tempAux - tempMáxima) + ") ";
				} else if (tempAux < tempMínima) {
					alerta = alerta + sensor.getLocation() + " (" + (tempAux - tempMínima) + ") ";
				}
				sensor.setState(false);
			}
		}
		return alerta;
	}
}
