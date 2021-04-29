package packsimulator;

import java.io.*;
import java.util.*;
import packfarm.Farm;
import packfarm.FarmAnimal;
import packfarm.Sensor;

/**
 * A little simulation of the farm working
 * 
 * @author Markel
 */
public class FarmSimulator {

    /**
     * @param args
     */
    public static void main(String[] args) {
    	Farm f = Farm.getInstance();
    	// Sensors
    	try {
	    	Scanner s = new Scanner(new FileReader("data" + File.separator + "availableSensors.txt"));
	    	loadSensors(f, s);
	    	s.close();
    	} catch (FileNotFoundException e) {
    		System.out.println("El archivo availableSensors.txt no se encuentra en la carpeta data o no puede ser leído correctamente.");
    	} 
    	// Animals
    	try {
	    	Scanner s = new Scanner(new FileReader("data" + File.separator + "smartFarm.txt"));
	    	loadFarmAnimals(f, s);
	    	s.close();
    	} catch (FileNotFoundException e) {
    		System.out.println("El archivo smartFarm.txt no se encuentra en la carpeta data o no puede ser leído correctamente.");
    	}
    	
    	ArrayList<String> l = f.obtainFarmAnimalOlder(17);
    	System.out.println("Animales mayores de 17 años: " + l.size());
    	registerOlder(f, 17);
    	
    	for (int i = 0; i < 7; i++) {
			f.register();
		}
    	
    	System.out.println("Sensores disponibles: " + f.howManySensors());
    	
    	try {
    		f.addFarmAnimal("XXXX", 42, Math.PI);
    	} catch (IndexOutOfBoundsException e) {
    		System.out.println(e.getMessage());
    	}
    	
    	ArrayList<FarmAnimal> s = f.obtainPossiblySick(102.0);
    	System.out.println("Animales con mas de 102 Fº: " + s.size());
    	
    	int e = f.farmAnimalsDeparture(500.0, 102.0).size();
    	System.out.println("Animales que han salido de la granja: " + e);
    	
    	System.out.println("Sensores disponibles (después de qué se fueran los animales): " + f.howManySensors());
    }


    /**
     * Loads sensors from a file to a farm
     * 
     * @param f The farm
     * @param s A file that includes ids of sensors (one per line)
     */
    private static void loadSensors(Farm f, Scanner s) {
        while (s.hasNextLine()) {
        	Sensor auxs = new Sensor(s.nextLine());
        	f.addSensor(auxs);
        }
    }

    /**
     * Loads animals with values from a file to a farm
     * 
     * @param f The farm
     * @param s A file that includes animals in the format (id age weight)
     */
    private static void loadFarmAnimals(Farm f, Scanner s) {
        while (s.hasNextLine()) {
        	String[] res = s.nextLine().split(" ");
        	try {
        		f.addFarmAnimal(res[0], Integer.parseInt(res[1]), Double.parseDouble(res[2]));
        	} catch (IndexOutOfBoundsException e) {
        		System.out.println(e.getMessage());
        	}
        }
    }

	/**
	 * It registers the physiological values of all animals in the farm older than a
	 * given max age
	 * 
	 * @param f   The farm
	 * @param max Starting age (not included) to check
	 */
    private static void registerOlder(Farm f, int max) {
        for (String a : f.obtainFarmAnimalOlder(max)) {
			f.obtainFarmAnimal(a).register();
		}
    }

}