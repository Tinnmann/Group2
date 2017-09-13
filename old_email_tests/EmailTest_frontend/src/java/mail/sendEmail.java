/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mail;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Sydney Twigg
 */
public class sendEmail {
     static Properties emailProperties;
    static Session mailSession;
    static MimeMessage emailMessage;
    
    public static void main (String [] args){
        sendEmail javaEmail = new sendEmail();
        
        javaEmail.setMailServerProperties();
    }
    
    public static void setMailServerProperties() {
        String emailPort = "587";//gmail's smtp port

        emailProperties = System.getProperties();
        emailProperties.put("mail.smtp.port", emailPort);
        emailProperties.put("mail.smtp.auth", "true");
        emailProperties.put("mail.smtp.starttls.enable", "true");
    }
    
    public static void send(String name, String email, String message){ 
        try {
            String emailSubject = "Message from Cape Watch System Contact Us";
            
            String toEmail = "xmeagolsoftware@gmail.com";
            
            //String senderName
            String emailBody = "New Message From: " + name + "\n\nEmail: " + email + " \n\nMessage:\n" + message;
            
            mailSession = Session.getDefaultInstance(emailProperties, null);
            emailMessage = new MimeMessage(mailSession);
            
            emailMessage.addRecipient((Message.RecipientType.TO), new InternetAddress(toEmail));
            
            emailMessage.setSubject(emailSubject);
            emailMessage.setText(emailBody);
            
            
            //email account details
            String emailHost = "smtp.gmail.com";
            String fromUser = "xmeagolsoftware";//just the id alone without @gmail.com
            String fromUserEmailPassword = "Xmeagol1";
            
            Transport transport = mailSession.getTransport("smtp");
            
            transport.connect(emailHost, fromUser, fromUserEmailPassword);
            transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
            transport.close();
            System.out.println("Email sent successfully.");
        } catch (MessagingException ex) {
            Logger.getLogger(sendEmail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
