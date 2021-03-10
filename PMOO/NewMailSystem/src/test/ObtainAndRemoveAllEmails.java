package test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.*;
import java.util.*;
import mailSystem.*;

@DisplayName("obtainAndRemoveAllEmails")
class ObtainAndRemoveAllEmails {

	private static Email email1, email2, email3;
	private static MailServer myServer;
	private ArrayList<Email> list;
	
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
	@DisplayName("Amount of mails correctly reduced")
	void amountReduced() {
		int preDelete = myServer.numOfEmails();
		myServer.obtainAndRemoveAllEmails("Markel");
		assertTrue(preDelete - 2 == myServer.numOfEmails());
	}

	@Test
	@DisplayName("Returns empty email")
	void emptyEmail() {
		list = new ArrayList<Email>();
		assertEquals(myServer.obtainAndRemoveAllEmails("Javier"), list);
	}
	
	@Test
	@DisplayName("Deals with empty lists")
	void dealEmpty() {
		myServer.reset();
		list = new ArrayList<Email>();
		assertEquals(myServer.obtainAndRemoveAllEmails("Markel"), list);
	}
	
	@Test
	@DisplayName("Returns the correct emails")
	void correctEmail() {
		list = new ArrayList<Email>();
		list.add(email1);
		list.add(email3);
		assertEquals(list, myServer.obtainAndRemoveAllEmails("Markel"));
	}
}
