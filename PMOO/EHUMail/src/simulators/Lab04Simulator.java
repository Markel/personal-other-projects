package simulators;

import mailsystem.*;

/**
 * @author markel
 */
public class Lab04Simulator {
	
	public static void testMailServer() {
		MailServer myServer = new MailServer();
		Email email1 = new Email("maite.urretavizcaya@ehu.eus", "maite.urretavizcaya@ehu.eus", "Lab S4", "Ya está colgado el lab S4.");
		Email email2 = new Email("julian.gutierrez@ehu.eus", "maite.urretavizcaya@ehu.eus", "Re Lab S4");
		
		myServer.sendEmail(email1);
		myServer.sendEmail(email2);
		myServer.showAllEmails();
		
		// TESTS COMPLEMENTARIOS //
		// These methods are better tested one by one, so I recommend uncommenting lines
		// one by one

		//System.out.println(myServer.obtainAndRemoveEmail("maite.urretavizcaya@ehu.eus"));
		//System.out.println(myServer.obtainAndRemoveAllEmails("maite.urretavizcaya@ehu.eus")); // Println no está pensado para ello, pero para pruebas rápidas vale
		//myServer.resetServer();
		//myServer.removeNMessage("maite.urretavizcaya@ehu.eus", 4);
		//System.out.println(myServer.obtainRemoveEmailInboxPos("maite.urretavizcaya@ehu.eus", 2));
		
		/* System.out.println("\nRemaining emails:");
		myServer.showAllEmails(); */
	}
	
	public static void testMailClient() {
		MailServer mailServer1 = new MailServer();
		MailClient mailClient1 = new MailClient(mailServer1, "julian.gutierrez@ehu.eus");
		MailClient mailClient2 = new MailClient(mailServer1, "maite.urretavizcaya@ehu.eus");
		mailClient1.sendEmail("maite.urretavizcaya@ehu.eus", "Lab 05", "Les va a encantar");
		mailClient2.sendEmail("julian.gutierrez@ehu.eus", "Re Lab 05", "No sé, el 4 no les gusto");
		mailClient1.sendEmail("maite.urretavizcaya@ehu.eus", "Final Re", "Mentira si lo han hecho!");
		
		//mailServer1.showAllEmails();
		
		System.out.println(mailClient1.obtainEmail().toString());
		System.out.println("Remaining emails: ");
		mailServer1.showAllEmails();
		
		// TESTS COMPLEMENTARIOS //
		// These methods are better tested one by one, so I recommend uncommenting lines
		// one by one
		
		//mailClient2.removeEmailFromInboxPos(2);
		//System.out.println(mailClient2.obtainRemoveEmailFromInboxPos(2));
		/* System.out.println("Remaining emails: ");
		mailServer1.showAllEmails(); */
	}
	
	public static void main(String[] args) {
		// Recomiendo usar uno u otro, los dos a la vez genera mucha cosas en consola
		testMailServer();
		testMailClient();

	}

}
