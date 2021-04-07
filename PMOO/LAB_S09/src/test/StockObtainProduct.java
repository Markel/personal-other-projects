package test;

import static org.junit.jupiter.api.Assertions.*;
import packstock.*;
import packproduct.*;
import org.junit.jupiter.api.*;

import packexception.UnknownCodeException;

@DisplayName("obtainProduct")
class StockObtainProduct {
	
	public Stock s;
	public Product aux;
	public static Product p = new Product(42);
	
	@BeforeEach
	public void setUp() {
		s = Stock.getInstance();
		s.addProduct(p);
	}
	
	@AfterEach
	public void tearDown() {
		Stock.destroy();
		s = null;
	}
	
	@Test
	@DisplayName("Product exists")
	void exists() {
		try {
			aux = s.obtainProduct(42);
			assertEquals(p, aux);
		} catch (UnknownCodeException e) {
			fail("El producto con código 42 debería existir");
		}
	}
	
	@Test
	@DisplayName("Product doesn't exist")
	void notExists() {
		assertThrows(UnknownCodeException.class, () -> {
			s.obtainProduct(69);
		});
	}
}
