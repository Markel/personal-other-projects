package test;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.*;
import mailSystem.*;
import java.util.*;

@DisplayName("storeEmail")
class MailServerTest {
	
	private Email email1, email2;
	private MailServer mServer;
	private ArrayList<Email> list;
	
	@BeforeEach
	void setUp() throws Exception {
		email1=new Email("Ainhoa", "Yeray","Weekend plan");
		email2=new Email("Yaiza", "Yeray","Meeting Schedule");
		mServer= new MailServer();
		list= new ArrayList<Email>();
	}

	@Test
	@DisplayName("Guardar un solo mail")
	public void firstEmail() {
		mServer.storeEmail(email1);
		assertTrue(mServer.containsEmail(email1));
	}
	
	@Test
	@DisplayName("Guardar un segundo mail")
	public void secondEmail() {
		mServer.storeEmail(email1);
		mServer.storeEmail(email2);
		assertTrue(mServer.containsEmail(email2));
	}
	
	@Test
	@DisplayName("Emails en orden")
	public void emailOrden() {
		list.add(email1);
		list.add(email2);
		mServer.storeEmail(email1);
		mServer.storeEmail(email2);
		assertEquals(mServer.getEmailList(), list); // Ya sé que no podíamos usar getEmailList, pero diría que esto se
													// puede considerar un caso extra 
	}
}
