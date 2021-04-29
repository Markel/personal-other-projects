package packtest;

import static org.junit.jupiter.api.Assertions.*;
import packfarm.*;
import org.junit.jupiter.api.*;

@DisplayName("Register")
class RegisterTest {

	FarmAnimal f;
	
	@BeforeEach
	void setUp() {
		f = new FarmAnimal("A", 4, 6.0, new Sensor("s"));
	}
	
	/*
	 * Cada test comprobará que register devuelva algo, que la temperatura media
	 * cambia y que arrayPos está en la posición adecuada; si uno de los tres falla
	 * el test se dará como fallido
	 */
	
	@Test
	@DisplayName("Ninguno")
	void none() {
		assertEquals(0, f.getArrayPos()); // Por asegurarse que se inicializa a 0
		assertNotSame(null, f.register());
		assertNotEquals(0, f.avgTemperature());
		assertEquals(1, f.getArrayPos());
	}
	
	@Test
	@DisplayName("Uno")
	void one() {
		for (int i = 0; i < 1; i++) {
			f.register();
		}
		double preTemp = f.avgTemperature();
		assertNotSame(null, f.register());
		assertNotEquals(preTemp, f.avgTemperature());
		assertEquals(2, f.getArrayPos());
	}
	
	@Test
	@DisplayName("Cuatro")
	void four() {
		for (int i = 0; i < 4; i++) {
			f.register();
		}
		double preTemp = f.avgTemperature();
		assertNotSame(null, f.register());
		assertNotEquals(preTemp, f.avgTemperature());
		assertEquals(5, f.getArrayPos());
	}
	
	@Test
	@DisplayName("Seis")
	void six() {
		for (int i = 0; i < 6; i++) {
			f.register();
		}
		double preTemp = f.avgTemperature();
		assertNotSame(null, f.register());
		assertNotEquals(preTemp, f.avgTemperature());
		assertEquals(7, f.getArrayPos());
	}
	
	@Test
	@DisplayName("Siete")
	void seven() {
		for (int i = 0; i < 7; i++) {
			f.register();
		}
		double preTemp = f.avgTemperature();
		assertNotSame(null, f.register());
		assertNotEquals(preTemp, f.avgTemperature());
		assertEquals(1, f.getArrayPos());
	}
	
}
