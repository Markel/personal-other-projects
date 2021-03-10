package test;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.*;

import mailSystem.*;

@DisplayName("obtainAndRemoveEmail")
class ObtainAndRemoveEmailTest {
	
	private static Email email1, email2, email3;
	private static MailServer myServer;
	
	@BeforeAll
	static void setUp() throws Exception {
		email1 = new Email("Alba", "Markel", "Idiota");
		email2 = new Email("Markel", "Alba", "Why?", "¿Por qué me haces tanto daño?");
		email3 = new Email("Alba", "Markel", "Porque soy mala persona");
		myServer = new MailServer();
	}
	
	@BeforeEach
	void individualSetUp() throws Exception {
		myServer.reset();
		myServer.storeEmail(email1);
		myServer.storeEmail(email2);
		myServer.storeEmail(email3);
	}
	
	@Test
	@DisplayName("Returns empty email")
	void emptyEmail() {
		assertEquals(myServer.obtainAndRemoveEmail("Javier"), new Email("", "", "No email", ""));
	}
	
	@Test
	@DisplayName("Returns the correct email")
	void correctEmail() {
		assertEquals(email1, myServer.obtainAndRemoveEmail("Markel"));
	}

	@Test
	@DisplayName("Amount of mails reduced")
	void amountReduced() {
		int preDelete = myServer.numOfEmails();
		myServer.obtainAndRemoveEmail("Markel");
		assertTrue(preDelete - 1 == myServer.numOfEmails());
	}
	
	@Test
	@DisplayName("Deals with empty lists")
	void dealEmpty() {
		myServer.reset();
		assertEquals(myServer.obtainAndRemoveEmail("Markel"), new Email("", "", "No email", ""));
	}
}
