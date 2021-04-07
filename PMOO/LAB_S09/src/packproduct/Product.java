package packproduct;

import packexception.NegativeAmountException;

/**
 * Product class represents the products in the supermarket stock
 * @author PMOO teachers
 * @version v1
 */
public class Product {
	private static final double VAT_DEF= 0.21;

	private final double VAT;
	private int code;
	private String name;
	private double price;
	private int amount;
	private double weight;
	
	public Product(int code) {
		this.code= code;
		VAT= VAT_DEF;
	}
	
	public Product(int code, String name, double price, int amount, double weight, double iva) {
		this.code = code;
		this.name = name;
		this.price = price;
		this.amount = amount;
		this.weight = weight;
		this.VAT = iva;
	}
	
	/**
	 * Obtains the code of a product
	 * @return the code
	 */
	public int getCode() {
		return code;
	}

	/**
	 * Establishes the code of a product
	 * @param code the code to set
	 */
	public void setCode(int code) {
		this.code = code;
	}

	/**
	 * Obtains the name of a product
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * Establishes the name of a product
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Obtains the price of a product
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * Establishes the price of a product
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}

	/**
	 * Obtains the amount of a product
	 * @return the amount
	 */
	public int getAmount() {
		return amount;
	}

	/**
	 * Establishes the amount of a product
	 * @param amount the amount to set
	 * @exception NegativeAmountException If the amount is negative
	 */
	public void setAmount(int amount) throws NegativeAmountException {
		if (amount < 0) {
			throw new NegativeAmountException(String.valueOf(amount));
		}
		this.amount = amount;
	}

	/**
	 * Obtains the weight of a product
	 * @return the weight
	 */
	public double getWeight() {
		return weight;
	}

	/**
	 * Establishes the weight of a product
	 * @param weight the weight to set
	 */
	public void setWeight(double weight) {
		this.weight = weight;
	}

	/**
	 * Obtains the vatDef of a product
	 * @return the vatDef
	 */
	public static double getVatDef() {
		return VAT_DEF;
	}

	/**
	 * Obtains the VAT of a product
	 * @return the vAT
	 */
	public double getVAT() {
		return VAT;
	}
	
	
	/**
	 * Obtains the price + the VAT of a product 
	 * @return The price of the product + VAT
	 */
	public double priceWithVAT() {
		return price * (1+VAT);
	}	
	
	/**
	 * Converts to string the product in this format: 
	 * code, name, price, amount, weight & VAT
	 */
	@Override
	public String toString() {
		return (code + " " + name + " " + price + " " + amount + " " + weight + " " + VAT);
	}
	
	/**
	 * Two products are equal if their code is the same
	 * @return True if they are equal, and false if not
	 */
	@Override
	public boolean equals(Object obj) {
		if (obj==null) return false;
		Product p = (Product) obj;
		return (this.code == p.code);
	}
}
