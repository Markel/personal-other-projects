package packbuilding;

import packlight.*;
import java.util.*;

import packexceptions.AlreadyOffException;
import packexceptions.AlreadyOnException;
import packexceptions.UnknownIdentifierException;

public class Building {
	
	private ArrayList<LightBulb> list;
	
	public Building() {
		list = new ArrayList<LightBulb>();
	}
	
	
	public void turnOnLightBulb(String id) throws UnknownIdentifierException, AlreadyOnException {
		LightBulb l = obtainLightBulb(id);
		l.turnOn();
	}
	
	/**
	 * Given an identifier it switches off the bulb
	 * 
	 * @param id The identifier of the bulb
	 * @throws UnknownIdentifierException If not bulb with that identifier is exists
	 */
	public void turnOffLightBulb(String id) throws UnknownIdentifierException {
		LightBulb l = obtainLightBulb(id);
		try {
			l.turnOff();
		} catch (AlreadyOffException e) {}
	}
	
	/**
	 * Obtains the bulb with the given identifier
	 * 
	 * @param id The identifier to search for
	 * @return The bulb with that identifier
	 * @throws UnknownIdentifierException If not bulb with that identifier is
	 *                                    present
	 */
	public LightBulb obtainLightBulb(String id) throws UnknownIdentifierException {
		for (LightBulb l : list) {
			if (l.getId().equals(id))
				return l;
		}
		throw new UnknownIdentifierException("No se ha encontrado la bombilla " + id);
	}
	
	/**
	 * Prints the info of all the bulbs in the building
	 */
	public void printBulbs() {
		for (LightBulb l : list) {
			System.out.println(l.toString());
		}
	}
	
	/**
	 * Obtains the current consumption of all the LightBulbs in the building
	 * @return The current consumption
	 */
	public double currentConsumption() {
		double result = 0.0;
		for (LightBulb l : list) {
			if (l instanceof Regulables) {
				Regulables r = (Regulables) l;
				result += r.getConsumption();
			} else {
				result += l.getNominalConsumption();
			}
		}
		return result;
	}
	
	/**
	 * Obtains the maximum consumption the building may consume
	 * @return The maximum consumption
	 */
	public double maximumConsumption() {
		double result = 0.0;
		for (LightBulb l : list) {
			result += l.getNominalConsumption();
		}
		return result;
	}
	
	/**
	 * Adds a bulb to the building, if one exists with the same identifier it will
	 * remove that and add this one as a replacement
	 * 
	 * @param l Bulb to add
	 */
	public void addLightBulb(LightBulb l) {
		try {
			LightBulb r = obtainLightBulb(l.getId());
			list.remove(r);
			list.add(l);
		} catch (UnknownIdentifierException e) {
			list.add(l);
		}
	}
	
	/**
	 * Prints to stdout the bulb that may be on wet places
	 */
	public void printWetPlaceBulbs() {
		for (LightBulb l : list) {
			if (l instanceof ISeguridad) {
				ISeguridad i = (ISeguridad) l;
				System.out.print(i.toString());
				System.out.println(", nivel_de_seguridad= " + i.getSecurity());
			}
		}
	}
	
	public ArrayList<LightBulb> sort() {
		ArrayList<LightBulb> sorted = list;
		Collections.sort(sorted);
		for (LightBulb l : sorted) {
			System.out.println(l.toString());
		}
		return sorted;
	}
}