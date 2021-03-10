package mailSystem;

/**
 * Represents eMails with the sender, receiver, subject and text
 * @author PMOO teachers
 *
 */
public class Email {
	private String sender;
	private String receiver;
	private String subject;
	private String text;
	

	/**
     * Create a new email with corresponding sender, receiver and subject
     * @param pFrom Email sender
     * @param pTo Email receiver
     * @param pSubject Email subject
	 */
	public Email(String pFrom, String pTo, String pSubject) {
		this(pFrom,pTo,pSubject,"");
	}
	
	/**
     * Create a new email with corresponding sender, receiver, subject and text
     * @param pFrom Email sender
     * @param pTo Email receiver
     * @param pSubject Email subject
     * @param pText - Email text
     */
	public Email(String pFrom, String pTo, String pSubject, String pText) {
		this.sender = pFrom;
		this.receiver = pTo;
		this.subject = pSubject;
		this.text = pText;
	}	

	/**
     * Obtain the sender of the email 
     * @return email sender
     */
	public String getSender() {
		return sender;
	}

	/**
     * Obtain the receiver of the email 
     * @return email receiver
     */
	public String getReceiver() {
		return receiver;
	}

	/**
     * Obtain the subject of the email 
     * @return email subject
     */
	public String getSubject() {
		return subject;
	}

	/**
     * Obtain the text of the email 
     * @return email text
     */
	public String getText() {
		return text;
	}
	
	/**
	 * Modifies the text of the email with the text in the parameter
	 * @param pText Text for the email
	 */
	public void setText(String pText) {
		this.text = pText;
	}
	
	/**
     * Shows the message in the standard output
     */
    public void showEmail() {
        System.out.println(this.toString());
    }
    
    /**
     * Decides whether receivers of the other and actual email are equals
     * @param other email with which to compare
     * @return true iff the receivers of the other and actual email are equals
     */
    public boolean equalsReceiver(Email other) {
        return (this.receiver.equals(other.getReceiver()));
        	
    }
    
    /**
     * Obtains a String that represents the Email
     */
    @Override
    public String toString() {
    	String st;
    	st="\nFrom: " + sender+"\nTo: " + receiver+"\nSubject: " + subject+"\nMessage: " + text;
    	return st;
    }
	 
    /**
     * Checks if 2 emails are exactly equal
     * @param email The email to check against
     * @return True if they are equal, false if not
     */
    @Override
    public boolean equals(Object obj) {
    	if (obj == null) return false;
    	Email auxMail = (Email) obj;
    	return (this.receiver.equals(auxMail.getReceiver()) &&
				this.sender.equals(auxMail.getSender()) &&
				this.subject.equals(auxMail.getSubject()) &&
				this.text.equals(auxMail.getText()));
		}
    
}
