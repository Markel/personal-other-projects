package mailsystem;

/**
 * Email is an electronic message send by someone and received by another
 * person.</br>
 * Created on 2021-02-10.
 * 
 * @author Markel
 */
public class Email {
	private String sender;
	private String receiver;
	private String subject;
	private String text;
	
	/**
	 * Creates and initializes the sender, the receiver and the subject of the
	 * email.
	 * 
	 * @param sender   who is sending the email
	 * @param receiver who is receiving the email
	 * @param subject  what the email is about
	 */
	public Email (String sender, String receiver, String subject) {
		this.sender = sender;
		this.receiver = receiver;
		this.subject = subject;
	}

	/**
	 * Creates and initializes the sender, the receiver, the subject and the text of
	 * the email.
	 * 
	 * @param sender   who is sending the email
	 * @param receiver who is receiving the email
	 * @param subject  what the email is about
	 * @param text     the contents of the email
	 */
	public Email (String sender, String receiver, String subject, String text) {
		this.sender = sender;
		this.receiver = receiver;
		this.subject = subject;
		this.text = text;
	}
	
	/**
	 * Transforms an email into a String that can be easily printed out.
	 * 
	 * @return A prettified version of the email ready for end users.
	 */
	public String toString() {
		return ("Email:\nFrom: " + sender + "\nTo: " + receiver + "\nSubject: " 
				+ subject + "\nContents: " + text);
	}
	
	/**
	 * Prints to standard output the contents of the email.
	 * 
	 * @apiNote Modifications to toString() will result in different output.
	 * @implNote It creates a new line before printing the message
	 */
	public void showEmail() {
		System.out.println("\n" + this.toString()); //* this is not strictly necessary, but nice to see
	}
	
	/**
	 * Checks whether the receiver of the email is the same as passed in parameters
	 * 
	 * @param otherReceiver Receiver to check against the email one
	 * @return true if they are equal, false if they are different
	 */
	public boolean equalReceiver(String otherReceiver) {
		return otherReceiver == this.receiver;
	}
	
	/**
	 * Checks whether two emails are exactly equal in all parameters
	 * 
	 * @param secondEmail the email to compare to
	 * @return true if they are equal, false if they are even a comma different
	 * @implNote all parameters: sender, receiver, subject & text
	 */
	public boolean equals(Email secondEmail) {
		return (this.receiver == secondEmail.getReceiver() &&
				this.sender == secondEmail.getSender() &&
				this.subject == secondEmail.getSubject() &&
				this.text == secondEmail.getText());
	}
	
	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}

	/**
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}

	/**
	 * @return the sender
	 */
	public String getSender() {
		return sender;
	}

	/**
	 * @return the receiver
	 */
	public String getReceiver() {
		return receiver;
	}

	/**
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}
}
