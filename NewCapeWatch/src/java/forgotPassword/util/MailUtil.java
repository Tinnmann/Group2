
package forgotPassword.util;

import static com.sun.xml.ws.client.ContentNegotiation.none;
import static java.nio.file.Files.size;
import java.util.Properties;
import static javafx.scene.text.Font.font;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import static javax.ws.rs.client.Entity.text;

/**
 *
 * @author Sydney Twigg
 */
public class MailUtil {
    //sends email with verification link to reset password
    public static void sendResetPasswordLink(String id, String email, String hash) throws AddressException, MessagingException {
        
        //define email properties
        Properties prop = new Properties();
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", Setup.MAIL_SMTP_HOST); //smtp host fetched from Setup.java
        
        //authenticate email details 
        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication(){
                 return new PasswordAuthentication(Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD);  
            }
        });
        
        //link to be sent to the user to reset their password
        String link = Setup.MAIL_LINK + "?scope=resetPassword&officerID=" + id + "&hash=" + hash;
        
        //create email body
        StringBuilder bodyText = new StringBuilder();
        
        bodyText.append("<div>")
                .append("To complete the password reset, click the below link: <br/><br/>")
                .append("Please click <a href=\"")
                .append(link)
                .append("\"+>here</a> or open the link in your browser<br/>")
                .append("<br/><br/> Thanks, <br/> Xmeagol Software.");
        
        //Send message
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(Setup.MAIL_USERNAME));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        message.setSubject("Cape Watch - Reset Password");
        message.setContent(bodyText.toString(), "text/html; charset=utf-8");
        Transport.send(message);
    }
    
    public static void sendRegistrationLink(String id, String email, String hash)throws AddressException, MessagingException{
        Properties prop = new Properties ();
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", Setup.MAIL_SMTP_HOST); //smtp host fetched from Setup.java
        prop.put("mail.smtp.port", Setup.MAIL_SMTP_PORT); //port fetched from Setup.java
        
        //authenticate email details 
        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication(){
                 return new PasswordAuthentication(Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD);  
            }
        });
        
        //link to be sent to the user to verify their email
        String link = Setup.MAIL_LINK + "?scope=activation&officerID=" + id + "&hash=" + hash;
        
        StringBuilder bodyText = new StringBuilder();
        
        bodyText.append("<div>")
                .append("To complete your registration, please activate your account by clicking the below link: <br/><br/> ")
                .append("Please click <a href=\"")
                .append(link)
                .append("\"+>here</a> or open the link in your browser<br/>")
                .append("<br/><br/> Thank you, <br/> Xmeagol Software.<br/><br/>");
    
        //Send message
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(Setup.MAIL_USERNAME));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        message.setSubject("Cape Watch - Confirm Registration");
        message.setContent(bodyText.toString(), "text/html; charset=utf-8");
        Transport.send(message);
    }
}
