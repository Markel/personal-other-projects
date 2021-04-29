package packmusicians;

import packexceptions.*;

public abstract class Musician {
	private String name;
	private double salary;
	private boolean hired;
	
	public Musician(String name) {
		this.name = name;
		this.salary = (double) 800;
		this.hired = false;
	}
	
	/**
	 * Gets the name of the musician
	 * @return The name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * Sets the name of the musician
	 * @param name The name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * Gets the salary of the musician (currency: euros)
	 * @return The salary
	 */
	public double getSalary() {
		return salary;
	}
	
	/**
	 * Sets the salary of the musician (currency: euros)
	 * @param salary The salary to set
	 */
	public void setSalary(double salary) {
		this.salary = salary;
	}
	
	/**
	 * It indicates if a musician is hired
	 * @return True if it's hired, false otherwise
	 */
	public boolean isHire() {
		return hired;
	}
	
	/**
	 * Hires the musician
	 * @throws AlreadyHiredMusician If the musician is already hired
	 */
	public void hire() throws AlreadyHiredMusician {
		if (hired)
			throw new AlreadyHiredMusician(name + " " + this.getClass().getSimpleName().toLowerCase() + " is already hired.");
		hired = true;
	}
	
	/**
	 * The musician performs its characteristic sound
	 * @return The sound
	 */
	public abstract String perform();
	
	@Override
	public boolean equals(Object obj) {
		if (obj == null) return false;
		Musician mus = (Musician) obj;
		return this.name.equals(mus.getName());
	}
	
	@Override
	public String toString() {
		return this.getClass().getSimpleName() + " name=" + name + ", salary=" + this.getSalary() + "€, hired=" + hired;
	}
}
