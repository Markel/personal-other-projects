package packtest;

import static org.junit.jupiter.api.Assertions.*;
import packfarm.*;
import org.junit.jupiter.api.*;

class RemoveAnimalTest {
	
	Farm f;
	
	@BeforeEach
	void setUp() {
		f = Farm.getInstance();
		// No es bonito, pero 8 líneas en 2 es worthy
		for (int i = 0; i < 4; i++) f.addSensor(new Sensor(((Integer) i).toString()));
		for (int i = 0; i < 4; i++) f.addFarmAnimal((char) (65 + i) + "", i, 100.0 * i);
	}

	@AfterEach
	void tearDown() {
		Farm.destroy();
	}
	
	@Test
	@DisplayName("Returns deleted animal")
	void returns() {
		FarmAnimal aux = f.obtainFarmAnimal("A");
		FarmAnimal aux2 = f.removeFarmAnimal("A");
		assertEquals(aux, aux2);
	}
	
	@Test
	@DisplayName("Number of animals is reduced")
	void reduced() {
		int i = f.howManyAnimals();
		f.removeFarmAnimal("A");
		assertEquals(i - 1, f.howManyAnimals());
	}
	
	@Test
	@DisplayName("If doesn't exist returns null")
	void returnNull() {
		assertSame(null, f.removeFarmAnimal("Z"));
	}
	
	@Test
	@DisplayName("Return the sensor to pool")
	void returnSensor() {
		FarmAnimal aux = f.removeFarmAnimal("A");
		f.addFarmAnimal("E", 5, 500.0);
		// An equals for sensor may had helped, but with some understanding you can see
		// that the pointer should be the same too
		assertSame(aux.getMySensor(), f.obtainFarmAnimal("E").getMySensor());
	}
}
