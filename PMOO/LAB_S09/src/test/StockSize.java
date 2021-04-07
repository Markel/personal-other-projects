package test;

import static org.junit.jupiter.api.Assertions.*;
import packstock.*;
import packproduct.*;
import java.util.Random;
import org.junit.jupiter.api.*;

import packexception.UnknownCodeException;

@DisplayName("numberOfProducts")
class StockSize {
	
	public Stock s;
	
	@BeforeEach
	public void setUp() {
		s = Stock.getInstance();
	}
	
	@AfterEach
	public void tearDown() {
		Stock.destroy();
		s = null;
	}
	
	@Test
	@DisplayName("Sin productos")
	void noProducts() {
		assertEquals(0, s.numberOfProducts());
	}
	
	@Test
	@DisplayName("Solo añadir")
	void simpleAdd() {
		Random rand = new Random(); // Vamos a jugar con random (por salsear un poco)
		int int_random = rand.nextInt(23);
		for (int i = 0; i < int_random; i++) {
			s.addProduct(new Product(s.getNextCode()));
		}
		assertEquals(int_random, s.numberOfProducts());
	}
	
	@Test
	@DisplayName("Añadir y eliminar")
	void addAndDelete() {
		Random rand = new Random();
		int n = 0;
		int int_random = rand.nextInt(23);
		for (int i = 0; i < int_random; i++) {
			n = s.getNextCode();
			s.addProduct(new Product(n));
		}
		try {
			s.removeProduct(n);
		} catch (UnknownCodeException e) { fail(); }
		assertEquals(int_random - 1, s.numberOfProducts());
	}
}
