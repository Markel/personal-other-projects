package packsimulator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Scanner;

import packfarm.Farm;
import packfarm.Sensor;
import packfarm.packfarmanimal.Chicken;
import packfarm.packfarmanimal.Cow;
import packfarm.packfarmanimal.FarmAnimal;
import packfarm.packfarmanimal.Horse;
import packfarm.packfarmanimal.Latxa;
import packfarm.packfarmanimal.Pig;
import packfarm.packfarmanimal.WoolSheep;

public class FarmSimulatorHierarchy {
	
	private static Farm f;
	
	public static void main(String[] args) {
		f = Farm.getInstance();
		try {
	    	Scanner s = new Scanner(new FileReader("data" + File.separator + "availableSensors15.txt"));
	    	loadSensors(s);
	    	s.close();
    	} catch (FileNotFoundException e) {
    		System.out.println("El archivo availableSensors.txt no se encuentra en la carpeta data o no puede ser leído correctamente.");
    	}
		
		initializeFarmAnimals();
		
		System.out.println("Inheritance path of animals:");
		for (FarmAnimal f: f.obtainAllAnimals()) {
			System.out.println(f.inheritancePath());
		}
		System.out.println("\nAnimals before sorting:");
		f.whoIsInFarm();
		System.out.println("\nAnimals after sorting:");
		f.sortFarm();
		f.whoIsInFarm();
		
		for (int i = 0; i < 7; i++) {
			f.register();
		}
		ArrayList<FarmAnimal> sick = f.obtainPossiblySick();
		System.out.println("Animales enfermos: " + sick.size());
		for (FarmAnimal f : sick) {
			f.register();
		}
		
		System.out.println("Gasto anual de la granja: " + f.calculateAnnualCost() + "€");
		
		System.out.println("Número de animales ecológicos: " + f.farmEcologicalAnimalAccount());
		
		System.out.println("Número de sensores disponibles: " + f.howManySensors());
		
		ArrayList<FarmAnimal> departure = f.farmAnimalsDeparture();
		System.out.print("Han salido de la granja " + departure.size() + " animales, con identificadores: ");
		for (FarmAnimal f : departure) {
			System.out.print(f.getId() + ", ");
		}
		
		System.out.println("\nNúmero de sensores disponibles: " + f.howManySensors());
	}
	
    /**
     * Loads sensors from a file to a farm (uses a global variable f)
     * 
     * @param s A file that includes ids of sensors (one per line)
     */
    private static void loadSensors(Scanner s) {
        while (s.hasNextLine()) {
        	Sensor auxs = new Sensor(s.nextLine());
        	f.addSensor(auxs);
        }
    }
    
    public static void initializeFarmAnimals() {
		// 5 chickens (3 ecological and two not, 1 year old but 1 out of 4
		f.addFarmAnimal(new Chicken("CHI34", 1, 1.5, true));
		f.addFarmAnimal(new Chicken("CHI35", 1, 1.5, true));
		f.addFarmAnimal(new Chicken("CHI36", 1, 1.5, true));
		f.addFarmAnimal(new Chicken("CHI37", 4, 1.5, false));
		f.addFarmAnimal(new Chicken("CHI38", 1, 1.5, false));

		// 2 ecological Latxa sheep and 2 non-ecological WoolSheep, about 45 kilos and 3-5 years old and one 12
		f.addFarmAnimal(new Latxa("SHE40", 5, 45, true));
		f.addFarmAnimal(new Latxa("SHE41", 3, 47, true));
		f.addFarmAnimal(new WoolSheep("SHE42", 12, 45, false));
		f.addFarmAnimal(new WoolSheep("SHE43", 4, 46, false));

		// 5 cows of about 450-600 kilos and of about 15 years (one 20), 3 ecological and 2 not
		f.addFarmAnimal(new Cow("COW51", 20, 450, true));
		f.addFarmAnimal(new Cow("COW52", 15, 500, true));
		f.addFarmAnimal(new Cow("COW53", 13, 450, true));
		f.addFarmAnimal(new Cow("COW54", 11, 550, false));
		f.addFarmAnimal(new Cow("COW55", 10, 600, false));

		// TODO Create 3 p igs with id "PIG"+n of about 80 to 200 kilos, 1 year old, two of them ecological
		f.addFarmAnimal(new Pig("PIG61", 1, 80, false));
		f.addFarmAnimal(new Pig("PIG62", 1, 180, true));
		f.addFarmAnimal(new Pig("PIG63", 1, 140, false));
		
		// TODO Create 3 horse, one of each type, with identifiers "HOR"+n, 7 years old ride and show,
		// TODO and work 10 years old. Approximate weight 300-400 kilos
		f.addFarmAnimal(new Horse("HOR71", 7, 300, "ride"));
		f.addFarmAnimal(new Horse("HOR72", 7, 350, "show"));
		f.addFarmAnimal(new Horse("HOR73", 10, 400, "work"));
	}
}
