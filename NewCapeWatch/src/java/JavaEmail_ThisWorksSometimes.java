
//package javatest;

import javax.mail.*;
import java.util.Properties;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;


public class JavaEmail_ThisWorksSometimes {

    Properties emailProperties;
    Session mailSession;
    MimeMessage emailMessage;
    
    public static void main(String[] args) throws AddressException, MessagingException{
        JavaEmail_ThisWorksSometimes javaEmail = new JavaEmail_ThisWorksSometimes();
              
    javaEmail.setMailServerProperties();
		javaEmail.createEmailMessage();
		javaEmail.sendEmail();
	}

	public void setMailServerProperties() {
		String emailPort = "587";//gmail's smtp port

		emailProperties = System.getProperties();
		emailProperties.put("mail.smtp.port", emailPort);
		emailProperties.put("mail.smtp.auth", "true");
		emailProperties.put("mail.smtp.starttls.enable", "true");

	}

	public void createEmailMessage() throws AddressException, MessagingException {
		String emailSubject = "Message from Cape Watch System Contact Us";
                
                //this is just to test, email wll always be sent to xmeagolsoftware@gmail.com -OR- to all developers.
                String toEmail = JOptionPane.showInputDialog("Email to send to:");
                
                //the following will be retrieved from the contact us page fields - this is just to test
                String senderName = "Sender Name";
                String message = "[user feedback/enquiries/etc.]";
		String emailBody = "New Message From: " + senderName + "\n\nEmail: " + toEmail + " \n\nMessage:\n" + message;              

		mailSession = Session.getDefaultInstance(emailProperties, null);
		emailMessage = new MimeMessage(mailSession);
                
                emailMessage.addRecipient((Message.RecipientType.TO), new InternetAddress(toEmail));

		emailMessage.setSubject(emailSubject);
		emailMessage.setText(emailBody);
	}

	public void sendEmail() throws AddressException, MessagingException {
                //email account details
		String emailHost = "smtp.gmail.com";
		String fromUser = "xmeagolsoftware";//just the id alone without @gmail.com
		String fromUserEmailPassword = "Xmeagol1";

		Transport transport = mailSession.getTransport("smtp");

		transport.connect(emailHost, fromUser, fromUserEmailPassword);
		transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
		transport.close();
		System.out.println("Email sent successfully.");
	}
}

//if sending to all developers replace
//String[] toEmails = { "xmeagolsoftware@gmail.com" };
/*for (int i = 0; i < toEmails.length; i++) {
    emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
}*/