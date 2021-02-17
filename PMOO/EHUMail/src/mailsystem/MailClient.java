package mailsystem;

import java.util.ArrayList;

/**
 * 
 * @author markel
 */
public class MailClient {
	private MailServer server;
	private String userAddress;
	
	/**
	 * Creates a mail client with a server and a userAddress
	 * 
	 * @param server      A MailServer that connects with a MailClient
	 * @param userAddress The address of the user's client
	 */
	public MailClient (MailServer server, String userAddress) {
		this.server = server;
		this.userAddress = userAddress;
	}
	
	/**
	 * @return The user address of the mail client
	 */
	public String getUserAddress() {
		return this.userAddress;
	}
	
	/**
	 * Creates and email based on the parameters and adds it to the server inside
	 * the client
	 * 
	 * @param receiver who is receiving the email
	 * @param subject  what the email is about
	 * @param text     the contents of the email
	 */
	public void sendEmail(String receiver, String subject, String text) {
		//? Voy a suponer que tenemos que usar el userAddress como emisor, no tenemos otra constructora
		Email auxEmail = new Email(userAddress, receiver, subject, text); 
		server.sendEmail(auxEmail);
	}
	
	/**
	 * Gets the first email in the server of the user address (it also deletes it)
	 * 
	 * @return The first email from the user
	 */
	public Email obtainEmail() {
		return server.obtainAndRemoveEmail(userAddress);
	}
	
	/**
	 * Gets all the email from the server of the user address (they're also deleted)
	 * 
	 * @return All emails from the userAddress
	 */
	public ArrayList<Email> obtainAllEmails() {
		return server.obtainAndRemoveAllEmails(userAddress);
	}
	
	/**
	 * Removes the nth message of the user from the server
	 * 
	 * @param index Specifies how many messages are skipped before deletes. An index
	 *              of 4 will delete the 4th message. Must be >0
	 */
	public void removeEmailFromInboxPos(int index) {
		server.removeNMessage(userAddress, index);
	}
	
	/**
	 * Removes and returns the nth message of the user from the server
	 * 
	 * @param index Specifies how many messages are skipped before deletes. An index
	 *              of 4 will delete the 4th message. Must be >0
	 * @return The email that has been deleted
	 */
	public Email obtainRemoveEmailFromInboxPos(int index) {
		return server.obtainRemoveEmailInboxPos(userAddress, index);
	}
}
