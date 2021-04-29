package packtest;

import static org.junit.jupiter.api.Assertions.*;
import packmusicians.*;
import packorchestra.*;
import org.junit.jupiter.api.*;

class OrchestraTest {
	
	private Orchestra o;
	private Director d;
	private Tenor t;
	
	@BeforeEach
	void setUp() throws Exception {
		o = new Orchestra("Orqui");
		d = new Director("Director");
		t = new Tenor("Tenor");
		o.hire(d);
		o.hire(t);
	}

	@Test
	@DisplayName("Simple check")
	void simple_test() {
		assertEquals(d.getSalary() + t.getSalary(), o.getFee());
	}

}
