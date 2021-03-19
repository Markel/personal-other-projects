package packsupermarket;

import packexception.*;
import packproduct.Product;
import packstock.Stock;

public class SuperOnLine {
	public static void main(String[] args) {

		Stock s = new Stock();
		Product p1, p2, p3;
		
		p1 = new Product(s.getNextCode(), "banana", 2.3, 50, 1.00, 0.04);
		s.addProduct(p1);
		System.out.println("Added product: " + p1.toString());

		p2 = new Product(s.getNextCode());
		p2.setName("gel_ducha");
		p2.setPrice(1.58);
		try {
			p2.setAmount(100);
		} catch (NegativeAmountException e) {
			System.out.println("La cantidad registrada es negativa (" + e.getMessage() + ")");
		}
		p2.setWeight(1.2);
		s.addProduct(p2);
		System.out.println("Added product: " + p2.toString());

		
		p3 = new Product(s.getNextCode(), "alitas_de_pollo", 2.13, 40, 0.5, 0.1);
		s.addProduct(p3);
		System.out.println("Added product: " + p3.toString());
		
		try {
			s.obtainProduct(1);
			s.removeProduct(1);
		} catch (UnknownCodeException e) {
			System.out.println("El producto a obtener y eliminar no existe");
		}
		
		s.storeStockInFile();
	}
}
