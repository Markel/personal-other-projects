package test;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.*;
import packUnit.*;

@DisplayName("The counter's test")
class CounterTest {

	private Counter counter1;
	
	@BeforeEach
	public void setUp() throws Exception {
		counter1 = new Counter();
	}
	
	@Test
	@DisplayName("Check that it increases")
	public void testIncrement() {
		counter1.increment();
		assertEquals(2, counter1.increment());
	}

	@Test
	@DisplayName("Check that it decreases")
	public void testDecrement() {
		assertTrue(counter1.decrement() == -1);
	}

}
