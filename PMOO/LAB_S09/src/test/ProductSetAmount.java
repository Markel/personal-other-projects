package test;

import static org.junit.jupiter.api.Assertions.*;
import packproduct.*;
import org.junit.jupiter.api.*;

import packexception.NegativeAmountException;

@DisplayName("setAmount")
class ProductSetAmount {
	private Product p;

	@BeforeEach
	public void setUp() {
		p = new Product(42);
	}

	@AfterEach
	public void tearDown() {
		p = null;
	}

	@DisplayName("Valor positivo")
	@Test
	void positive() {
		try {
			p.setAmount(50);
			assertEquals(50, p.getAmount());
		} catch (NegativeAmountException e) {
			fail("Ha lanzado un error con cantidad positiva");
		}
	}

	@DisplayName("Valor negativo")
	@Test
	void negative() {
		assertThrows(NegativeAmountException.class, () -> {
			p.setAmount(-50);
		});
	}

	@DisplayName("Valor límite 0")
	@Test
	void zero() {
		try {
			p.setAmount(0);
			assertEquals(0, p.getAmount());
		} catch (NegativeAmountException e) {
			fail("El 0 debería ser un valor aceptable");
		}
	}
}
