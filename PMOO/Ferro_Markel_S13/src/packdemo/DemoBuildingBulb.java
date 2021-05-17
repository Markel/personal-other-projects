package packdemo;

import packbuilding.Building;
import packexceptions.AlreadyOnException;
import packexceptions.UnknownIdentifierException;
import packlight.*;

public class DemoBuildingBulb {

	public static void main(String[] args) {
		Building b = new Building();
		
		Led l1= new Led("DN065B", 11, 1000, false, "cyan", 1); 
		Led l2= new Led("CCT Cir", 6, 450, true, "orange", 0.85);
		Incandescentes i2= new Incandescentes("E27/25W P45", 25, 300); 
		Led l3= new Led("CorePro-T8", 8, 100, true, "bleu", 1); 
		Halogenas h3= new Halogenas("E40 CDM-T-230-3", 230, 21900, true); 
		Led l4= new Led("GU10-Wifi", 4, 300, true, "red", 0.85); 
		Fluorescentes f2= new Fluorescentes("1SL/25 63219740", 58, 4671.9, "S-10");
		Led l5= new Led("GU5.3 MR16", 5, 470, true, "blue", 0.8);
		Incandescentes i1= new Incandescentes("E27/100W A55", 100, 1600); 
		
		b.addLightBulb(l1);
		b.addLightBulb(l2);
		b.addLightBulb(i2);
		b.addLightBulb(l3);
		b.addLightBulb(h3);
		b.addLightBulb(l4);
		b.addLightBulb(f2);
		b.addLightBulb(l5);
		b.addLightBulb(i1);
		
		try {
			b.turnOnLightBulb("DN065B");
			b.turnOnLightBulb("E27/25W P45");
			b.turnOnLightBulb("E40 CDM-T-230-3");
			b.turnOnLightBulb("1SL/25 63219740");
		} catch (AlreadyOnException e) {
			System.out.println("La bombilla está encendida");
		} catch (UnknownIdentifierException e) {
			System.out.println("Algún identificador es incorrecto");
			System.exit(1); // Se entiende como que hay que salir en el enunciado
		}
		
		System.out.println("Consumo máximo: " + b.maximumConsumption() + "W");
		
		System.out.println("Bombillas ordenadas:");
		b.sort();
		
		System.out.println("Bombillas que pueden estar en agua:");
		b.printWetPlaceBulbs();
	}

}
