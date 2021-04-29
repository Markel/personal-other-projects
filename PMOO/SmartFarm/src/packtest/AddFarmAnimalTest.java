package packtest;

import static org.junit.jupiter.api.Assertions.*;
import packfarm.*;
import org.junit.jupiter.api.*;

@DisplayName("AddFarmAnimal")
class AddFarmAnimalTest {
	
	static Farm f; 
	static FarmAnimal a;
	
	@BeforeAll
	static void setUpBeforeClass() {
		f = Farm.getInstance();
		f.addSensor(new Sensor("sensor"));
		f.addFarmAnimal("A", 4, 500.0);
		a = f.obtainFarmAnimal("A");
	}

	@Test
	@DisplayName("Throws if no sensors")
	void noSensors() {
		assertThrows(IndexOutOfBoundsException.class, () -> {
			f.addFarmAnimal("B", 4, Math.PI);
		});
	}
	
	@Test
	@DisplayName("ID registered")
	void id() {
		assertEquals("A", a.getId());
	}
	
	@Test
	@DisplayName("Age registered")
	void age() {
		assertEquals(4, a.getAge());
	}
	
	@Test
	@DisplayName("Weight registered")
	void weight() {
		assertEquals(500.0, a.getWeight());
	}
	
	@Test
	@DisplayName("Sensor attached")
	void sensor() {
		assertNotSame(null, a.getMySensor());
	}
	
	@Test
	@DisplayName("Sensor list decreases")
	@SuppressWarnings("static-access")
	void sensorDecrease() {
		f.addSensor(new Sensor("J"));
		assertEquals(1, f.howManySensors());
		f.addFarmAnimal("HI", 6, 400.0);
		assertEquals(0, f.howManySensors());
		// Yes, the following bit is cheeky
		f.destroy();
		this.setUpBeforeClass();
	}
}
