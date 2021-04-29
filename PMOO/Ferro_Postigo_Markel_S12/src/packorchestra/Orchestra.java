package packorchestra;

import java.util.*;

import packexceptions.AlreadyHiredMusician;
import packmusicians.*;

public class Orchestra {
	
	private String name;
	private ArrayList<Musician> list;
	
	public Orchestra(String name) {
		this.name = name;
		this.list = new ArrayList<Musician>();
	}
	
	/**
	 * Obtains the name of the Orchestra
	 * 
	 * @return Orchestra's name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * Makes all musician perform with their instruments 
	 * @return A concat of all the performances
	 */
	public String act() {
		String result = "This is the " + name + "'s performance:\n";
		boolean searching = true;
		int i = 0;
		while (searching && i < list.size()) {
			if (list.get(i) instanceof Director) {
				result += "[" + list.get(i).getName() +  "] " + list.get(i).perform() + ",\n";
				searching = false;
			}
			i++;
		}
		
		for (Musician mus : list) {
			if (mus instanceof Instrumentalist) {
				Instrumentalist ins = (Instrumentalist) mus;
				result += "[" + ins.getName() + ", " + ins.getInstrument() + "] " + mus.perform() + ",\n";
			} else if (mus instanceof Director) {
				// Nothing
			} else {
				result += "[" + mus.getName() +  "] " + mus.perform() + ",\n";
			}
		}
		return result;
	}
	
	/**
	 * Given a musician it will hire them and add it to the orchestra. If they is
	 * already hired it won't hire them
	 * 
	 * @param musi The musician to hire
	 * @return If the hiring process was successful it return a message with their
	 *         info. If not, it will show an appropriate message.
	 */
	public String hire(Musician musi) {
		try {
			musi.hire();
			list.add(musi);
			return musi.getName() + " " + musi.getClass().getSimpleName() + ", hired for " + musi.getSalary() + " euros."; 
		} catch (AlreadyHiredMusician e) {
			return "The musician is already hired, it was not possible to hire them.";
		}
	}
	
	/**
	 * It calculates how much money costs hiring the entire orchestra
	 * @return The total cost
	 */
	public double getFee() {
		double result = 0.0;
		for (Musician mus : list) {
			result += mus.getSalary();
		}
		return result;
	}
	
	@Override
	public String toString() {
		String people = "*********** ORCHESTRA ***************\nHere they are " + name + "'s participants\n";
		for (Musician mus : list) {
			people += mus.toString() + ",\n";
		}
		return people;	
	}
	
}
