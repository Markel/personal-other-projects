package test;

import static org.junit.jupiter.api.Assertions.*;
import packstock.*;
import packproduct.*;
import org.junit.jupiter.api.*;

import packexception.UnknownCodeException;

@DisplayName("removeProduct")
class StockRemoveProduct {
	
	public Stock s;
	public int i;
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
	@DisplayName("Eliminar producto existente")
	void existente() {
		i = s.numberOfProducts();
		try {
			s.removeProduct(42);
			assertEquals(i-1, s.numberOfProducts());
		} catch (UnknownCodeException e) {
			fail("El producto debería existir");
		}
	}
	
	@Test
	@DisplayName("Eliminar producto no existente")
	void noExistente() {
		i = s.numberOfProducts();
		assertThrows(UnknownCodeException.class, () -> {
			s.removeProduct(69);
			assertEquals(i, s.numberOfProducts());
			assertTrue(s.obtainProduct(42).equals(p));
		});
	}
	
}
