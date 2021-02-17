package mailsystem;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * A server which contains a list of mails
 * @author markel
 */
public class MailServer {
	private ArrayList<Email> emailList;
	private Email emailEmpty = new Email("", "", "No email", "");
	
	/**
	 * A server in which emails are saved. When creating it, it will be empty.
	 */
	public MailServer() {
		emailList = new ArrayList<Email>(); //! ArrayList se inicializa a nivel de constructora
	}
	
	/**
	 * Add a new email to the end of the server list
	 * 
	 * @param email the email to add to the end of the list
	 */
	public void sendEmail(Email email) {
		emailList.add(email);
	}
	
	/**
	 * Prints to standard output all mails from the list
	 */
	public void showAllEmails() {
		for (Email email : emailList) {
			email.showEmail();
		}
	}
	
	/**
	 * Deletes all mails from the list
	 */
	public void resetServer() {
		this.emailList.clear();
	}
	
	/**
	 * Returns the first email with an specified receiver
	 * 
	 * @param clientAddress The receiver to check for matches
	 * @return The email that matches the clientAddress, if no matching address is
	 *         found it will return an emailEmpty
	 */
	public Email obtainAndRemoveEmail(String clientAddress) {
		Email auxMail;
		int index = -1, i = 0;
		// Iterate through the emailList until the end or until a matching address is found, whichever comes first
		while (i < emailList.size() && index == -1) {
			if (emailList.get(i).equals(clientAddress)) {
				index = i; // The email has been found
			}
			i++;
		}
		if (index != -1) {
			// An email had been found
			auxMail = emailList.get(index);
			emailList.remove(index);
			return auxMail;
		} else {
			// -1 signifies that no email if found
			return emailEmpty;
		}
	}
	
	/**
	 * Obtains all the email for a specified receiver and deletes them from the
	 * server
	 * 
	 * @param clientAddress The receiver to check for matches
	 * @return All emails that match the clientAddress receiver (the ones that had
	 *         been deleted from the server)
	 */
	public ArrayList<Email> obtainAndRemoveAllEmails(String clientAddress) {
		ArrayList<Email> auxEmailList = new ArrayList<Email>(); // Where the matching emails are saved
		Iterator<Email> iter = this.emailList.iterator();
		Email auxMail;
		while (iter.hasNext()) {
			auxMail = iter.next();
			if (auxMail.equals(clientAddress)) {
				auxEmailList.add(auxMail);
				iter.remove();
			}
		}
		return auxEmailList;
	}
	
	// EJERCICIOS COMPLEMENTARIOS //
	
	/**
	 * Obtiene cuántos mensajes tiene un usuario en el servidor
	 * 
	 * @param user El usuario a comprobar
	 * @return Número de mensajes de user
	 */
	public int inboxSize(String user) {
		int size = 0;
		for (Email email : emailList) {
			if (email.equals(user)) {
				size++;
			}
		}
		return size;
	}
	
	/**
	 * Deletes the Nth message from a user
	 * 
	 * @param clientAddress The receiver to check for matches
	 * @param index         specifies how many messages are skipped before deletes.
	 *                      An index of 4 will delete the 4th message. Must be >0
	 */
	public void removeNMessage(String clientAddress, int index) {
		int i = -1, found = 0;
		// Iterate through the emailList until the end or until a number of emails are matched
		while (i+1 < emailList.size() && index != found) {
			i++; // i is updated at the start so we conserve the index after reaching x mails
			if (emailList.get(i).equals(clientAddress)) {
				found++;
			}
		}
		// If index == found it means that the indexth email exists
		if (index == found) {
			emailList.remove(i);
		} else {
			System.out.println("No hay tantos emails de este usuario");
		}
	}
	
	/**
	 * Deletes the Nth message from a user and returns it
	 * 
	 * @param clientAddress The receiver to check for matches
	 * @param index         Specifies how many messages are skipped before deletes.
	 *                      An index of 4 will delete the 4th message. Must be >0
	 * @return The email that has been deleted
	 */
	public Email obtainRemoveEmailInboxPos(String clientAddress, int index) {
		int i = -1, found = 0;
		// Iterate through the emailList until the end or until a number of emails are matched
		while (i+1 < emailList.size() && index != found) {
			i++; // i is updated at the start so we conserve the index after reaching x mails
			if (emailList.get(i).equals(clientAddress)) {
				found++;
			}
		}
		// If index == found it means that the indexth email exists
		if (index == found) {
			Email auxEmail = emailList.get(i); // We copy before deleting
			emailList.remove(i);
			return auxEmail;
		} else {
			System.out.println("No hay tantos emails de este usuario");
			return emailEmpty; // If we don't return anything problems arise
		}
	}
}
