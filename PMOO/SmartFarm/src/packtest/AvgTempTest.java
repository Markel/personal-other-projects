package packtest;

import static org.junit.jupiter.api.Assertions.*;
import packfarm.*;
import org.junit.jupiter.api.*;

@DisplayName("Average temp.")
class AvgTempTest {

	FarmAnimal f;
	
	@BeforeEach
	void setUp() {
		f = new FarmAnimal("A", 4, 6.0, new Sensor("s"));
	}
	
	@Test
	@DisplayName("Ninguno")
	void none() {
		assertEquals(0, f.avgTemperature());
	}
	
	@Test
	@DisplayName("Uno")
	void one() {
		int times = 1;
		double temp = 0.0;
		for (int i = 0; i < times; i++) {
			temp += f.register().getTemperature();
		}
		temp = temp/times;
		assertEquals(temp, f.avgTemperature(), 0.01);
	}
	
	@Test
	@DisplayName("Cuatro")
	void four() {
		int times = 4;
		double temp = 0.0;
		for (int i = 0; i < times; i++) {
			temp += f.register().getTemperature();
		}
		temp = temp/times;
		assertEquals(temp, f.avgTemperature(), 0.01);
	}
	
	@Test
	@DisplayName("Siete")
	void seven() {
		int times = 7;
		double temp = 0.0;
		for (int i = 0; i < times; i++) {
			temp += f.register().getTemperature();
		}
		temp = temp/times;
		assertEquals(temp, f.avgTemperature(), 0.01);
	}
	
	@Test
	@DisplayName("Ocho")
	void eight() {
		int times = 7;
		double temp = 0.0;
		for (int i = 0; i < times; i++) {
			f.register().getTemperature();
		}
		temp = f.register().getTemperature();
		assertEquals(temp, f.avgTemperature(), 0.01);
	}
}
