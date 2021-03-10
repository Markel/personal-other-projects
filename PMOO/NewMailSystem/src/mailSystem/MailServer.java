package mailSystem;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * Class for managing mail servers
 * @author PMOO teachers
 *
 */
public class MailServer {
	
	//Attribute for storing emails
	private ArrayList<Email> emailList;
	private Email emailEmpty = new Email("", "", "No email", "");

	/**
	 * Mail Server Constructor
	 */
	public MailServer() {
		emailList =new ArrayList<Email>();
	}
	
	/**
	 * Stores an email at the end of the list
	 * @param pMail email to be stored
	 */
	public void storeEmail(Email pMail) {
		emailList.add( pMail) ; 
	}
	/**
	 * Resets the email list
	 */
	public void reset() {
		emailList =new ArrayList<Email>();
	}

	/**
	 * Obtains the email list of the server
	 * @return the email list of the server
	 */
	public ArrayList<Email> getEmailList() {
		return emailList;
	}

	/**
	 * Obtains the number of Emails stored in the server
	 * @return the number of the Emails stored in the server
	 */
	public int numOfEmails() {
		return emailList.size();
	}

	/**
	 * Indicates whether the server has stored the email e
	 * @param e Email to locate
	 * @return true iff the email e is in the server.
	 */
	public boolean containsEmail(Email e) {
		return emailList.contains(e);
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
			if (emailList.get(i).equalsReceiver(new Email("", clientAddress, ""))) {
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
			if (auxMail.equalsReceiver(new Email("", clientAddress, ""))) {
				auxEmailList.add(auxMail);
				iter.remove();
			}
		}
		return auxEmailList;
	}
}
