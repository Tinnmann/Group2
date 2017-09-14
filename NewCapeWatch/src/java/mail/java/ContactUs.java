
package mail.java;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Sydney Twigg
 */
public class ContactUs {
    static Properties emailProperties;
    static Session mailSession;
    static MimeMessage emailMessage;
    
    //declare email details
    String emailHost = "smtp.gmail.com";
    String emailPort = "587"; //gmail's default smtp port
    String fromUser = "xmeagolsoftware";
    String fromUserEmailPassword = "Xmeagol1";
    
    String[] toEmails = { "xmeagolsoftware@gmail.com" };
    
    public static void main (String [] args){
        ContactUs javaEmail = new ContactUs();
        
        javaEmail.setMailServerProperties();
    }
    
    public void setMailServerProperties() {
        emailProperties = System.getProperties();
        emailProperties.put("mail.smtp.port", emailPort);
        emailProperties.put("mail.smtp.auth", "true");
        emailProperties.put("mail.smtp.starttls.enable", "true");
    }
    
    public void createEmailMessage(String emailSubject, String emailBody) throws AddressException, MessagingException {
        mailSession = Session.getDefaultInstance(emailProperties, null);
        emailMessage = new MimeMessage(mailSession);

        for (int i = 0; i < toEmails.length; i++) {
            emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
        }

        emailMessage.setSubject(emailSubject);
        emailMessage.setText(emailBody);
    }
    
    public void sendEmail() throws AddressException, MessagingException {
        Transport transport = mailSession.getTransport("smtp");
        transport.connect(emailHost, fromUser, fromUserEmailPassword);
        transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
        transport.close();
    }
}
