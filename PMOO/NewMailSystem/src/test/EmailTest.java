package test;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.*;
import mailSystem.Email;

@DisplayName("equalsReceiver")
class EmailTest {

	private Email email1, email2;
	
	@BeforeEach
	public void setUp() throws Exception {
		email1 = new Email("Ainhoa", "Yeray","Weekend plan");
	}

	@Test
	@DisplayName("Receivers are equal")
	public void sameReceiver() {
		email2 = new Email("Javier", "Yeray", "Test de prueba");
		assertTrue(email1.equalsReceiver(email2));
	}

	@Test
	@DisplayName("Receivers are different")
	public void differentReceivers() {
		email2 = new Email("Javier", "Lola", "Test de prueba");
		assertFalse(email1.equalsReceiver(email2));
	}
}
