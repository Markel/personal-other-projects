//! El código no está documentado, es una copia de lo que he hecho en papel (y me daba pereza escribirlo a mano)
package packsimulator;

import packbuilding.*;

public class BuildingSimulator {
	public static void main(String[] args) {
		// Apartado a (añadir pares)
		BuildingControl edificio = new BuildingControl();
		for (int p = 1; p <= 2; p++) {
			for (int o = 2; o <= 10; o += 2) {
				edificio.addSensor(new TemperatureSensor(p,o));
			}
		}
		
		// Realizar control
		System.out.println(edificio.buildingManagement());
	}
}
