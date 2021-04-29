package packcheck;

import static org.junit.jupiter.api.Assertions.*;
import packfarm.Sensor;
import packexceptions.*;
import org.junit.jupiter.api.*;

@DisplayName("Sensor")
class SensorTest {

	Sensor s;

	@BeforeEach
	void setUp() {
		s = new Sensor("prueba");
	}

	@Test
	@DisplayName("toString")
	void string() {
		assertEquals("prueba", s.toString());
	}
	
	@Test
	@DisplayName("CollectValues throws")
	void collectThrows() {
		assertThrows(CollectErrorException.class, () -> {
			// Las probabilidades de que no ocurra entre 100 intentos son 1 entre un googol.
			for (int i = 0; i < 100; i++) { 
				s.collectValues();
			}
		});
	}

}
