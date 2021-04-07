package test;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.*;
import packstock.*;

@DisplayName("nextCode")
class StockNextCode {
	private Stock s;
	private int i;

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
	@DisplayName("First Code = 1001")
	void firstCode() {
		i = s.getNextCode();
		assertEquals(1001, i);
	}

	@Test
	@DisplayName("Second Code = 1002")
	void secondCode() {
		s.getNextCode();
		i = s.getNextCode();
		assertEquals(1002, i);
	}

}
