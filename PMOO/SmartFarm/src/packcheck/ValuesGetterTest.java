package packcheck;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.*;
import packfarm.PhysiologicalValues;

@DisplayName("PhysiologicalValues getters")
class ValuesGetterTest {
	
	public static PhysiologicalValues p;
	
	@BeforeAll
	static void setUp() {
		p = new PhysiologicalValues(100, 60.24, 3);
	}
	
	@Test
	@DisplayName("Heart Rate")
	void heartRate() {
		assertEquals(100, p.getHeartRate());
	}

	@Test
	@DisplayName("Temperature")
	void temperature() {
		assertEquals(60.24, p.getTemperature());
	}
	
	@Test
	@DisplayName("Activity")
	void activity() {
		assertEquals(3, p.getActivity());
	}
	
}
