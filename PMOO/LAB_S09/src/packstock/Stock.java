package packstock;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import packexception.NegativeAmountException;
import packexception.UnknownCodeException;
import packproduct.Product;

/**
 * Class that allows to represent a Stock composed of Products
 * 
 * @author PMOO teachers
 * @version v1
 */
public class Stock {
	private static Stock instance;
	
	private ArrayList<Product> list;
	private int lastCode;

	/**
	 * Constructor without parameters that initializes the lastCode to 0 and creates
	 * an empty ArrayList of Products
	 */
	private Stock() {
		lastCode = 1000;
		list = new ArrayList<Product>();
	}
	
	/**
	 * Sirve como reemplazamiento a la constructora al esta clase ser una singleton.
	 * @return El stock ya existente, o un stock nuevo.
	 */
	public static Stock getInstance() {
		if (instance == null) instance = new Stock();
		return instance;
	}
	
	/**
	 * Destruye la posible instancia existente de Stock, provocando que la próxima vez
	 * que se llame a getInstance, esta sea un instancia totalmente nueva.
	 */
	public static void destroy() {
		instance = null;
	}
	
	/**
	 * Increments the value of lastCode and returns it
	 * 
	 * @return the next code value
	 */
	public int getNextCode() {
		lastCode = lastCode + 1;
		return lastCode;
	}

	/**
	 * Adds a Product to the list
	 * 
	 * @param p the product to be added
	 */
	public void addProduct(Product p) {
		list.add(p);
	}

	/**
	 * Obtains the number of Products in the list
	 * 
	 * @return number of products
	 */
	public int numberOfProducts() {
		return list.size();
	}

	/**
	 * Obtains the product with the given code from the list.
	 * 
	 * @param code Code of the Product to obtain
	 * @return the product from the stock. If ther are not
	 * @exception UnknownCodeException If the code is not present
	 */
	public Product obtainProduct(int code) throws UnknownCodeException {
		int pos = list.indexOf(new Product(code));
		if (pos != -1) {
			return list.get(pos);
		} else {
			throw new UnknownCodeException();
		}
	}

	/**
	 * Removes the given Product from the list.
	 * 
	 * @param p the product to remove
	 * @exception UnknownCodeException If the product is not present
	 */
	public void removeProduct(Product p) throws UnknownCodeException {
		if (!(list.remove(p)))
			throw new UnknownCodeException();
	}

	/**
	 * Removes the product with the given code from the list. If the product does
	 * not exist, it shows a message
	 * 
	 * @param code the code of the product to remove
	 * @exception UnknownCodeException If the product is not present
	 */
	public void removeProduct(int code) throws UnknownCodeException {
		removeProduct(obtainProduct(code));
	}

	/**
	 * Updates the amount of the product with the given code with the given amount
	 * 
	 * @param code   Code of the Product to be updated
	 * @param amount Amount to set
	 * @exception UnknownCodeException If the product is not present
	 */
	public void updateAmount(int code, int amount) throws UnknownCodeException {
		Product p = obtainProduct(code);
		try {
			p.setAmount(amount);
		} catch (NegativeAmountException e) {
			System.out.println(e.getMessage());
		}
	}

	/**
	 * Writes the stock into the stock.txt file
	 * 
	 * @exception IOException Something went wrong in the hard drive (like no writing permission)
	 */
	public void storeStockInFile() {
		FileWriter fs;
		try {
			fs= new FileWriter("stock.txt");
			for (Product p: list) {
				fs.write(p.toString() + "\n");
			}
			fs.close();
		} catch (IOException e) {
			System.out.print("Archivo no generado: ");
			System.out.println(e.getLocalizedMessage());
		}
	}
}
