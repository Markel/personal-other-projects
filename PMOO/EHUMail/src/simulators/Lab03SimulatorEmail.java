package simulators;

import mailsystem.Email;

/**
 * Class for simulating Email
 * 
 * @author PMOO teachers
 */
public class Lab03SimulatorEmail {
	/**
	 * Method to test the Email class
	 */
	public static void testEmail() {
		
		Email email1 = new Email("maite.urretavizcaya@ehu.eus", "julian.gutierrez@ehu.eus", "Lab S3", "Ya están colgados en eGela el enunciado y clases del laboratorio S3.");
		Email email2 = new Email("julian.gutierrez@ehu.eus", "maite.urretavizcaya@ehu.eus", "Lab S3");
		
		System.out.println("email1 attributes (by getters):");
		System.out.println("Sender: " + email1.getSender());
		System.out.println("Receiver: " + email1.getReceiver());
		System.out.println("Subject: " + email1.getSubject());
		System.out.println("Text: " + email1.getText()+"\n");
		
		
		System.out.println("\nemail2 attributes (by getters):");
		System.out.println("Sender: " + email2.getSender());
		System.out.println("Receiver: " + email2.getReceiver());
		System.out.println("Subject: " + email2.getSubject());
		System.out.println("Text: " + email2.getText());

		email2.setText("De acuerdo, ¡gracias!\nJulian");
		System.out.println("\nText: " + email2.getText());
		
		
		
		System.out.println("\n"+email1.toString()+"\n");
		System.out.println("\n"+email2);
		
		email1.showEmail();
		
		System.out.println(email1.equalReceiver("julian.gutierrez@ehu.eus")); // True
		System.out.println(email2.equals(email1)); // False
		
	}
	
	public static void main(String[] args) {
		testEmail();
	}
	
}
