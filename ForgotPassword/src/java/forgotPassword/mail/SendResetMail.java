/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forgotPassword.mail;

import com.google.gson.Gson;
import forgotPassword.setup.Setup;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Sydney Twigg
 */
public class SendResetMail {
    public static void main(String[] args) {
        
        //test
        String id = "3";
        String email = "sydneytwigg@gmail.com";
        String hash = prepareRandomString(30);
        try {
            sendResetPasswordLink(id, email, hash);
        } catch (MessagingException ex) {
            Logger.getLogger(SendResetMail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
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
        String link = Setup.MAIL_LINK + "?scope=resetPassword&userId=" + id + "&hash=" + hash;
        
        //create email body
        StringBuilder bodyText = new StringBuilder();
        
        bodyText.append("<div>")
                .append("To complete the password reset, click the below link: <br/><br/>")
                .append("Please click <a href=\"")
                .append(link)
                .append("\"+>here</a> or open the link in the browser<br/>")
                .append("<br/><br/> Thanks, <br/> Xmeagol Software.");
        
        //Send message
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(Setup.MAIL_USERNAME));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        message.setSubject("Cape Watch - Reset Password");
        message.setContent(bodyText.toString(), "text/html; charset=utf-8");
        Transport.send(message);
    }
    
    
    //create hash with a random string 
    private static final char[] symbols;
    private static final Random random = new Random();
    
    static {
        StringBuilder tmp = new StringBuilder();
        
        for (char ch = '0'; ch <= '9'; ++ch) {
            tmp.append(ch);
        }
        for (char ch = 'a'; ch <= 'z'; ++ch) {
            tmp.append(ch);
        }    
        
        symbols = tmp.toString().toCharArray();
    } 
    
    //method to generate & return random string of a given length
    public static String prepareRandomString(int len){
        char [] generatedString = new char[len];
        
        for (int i = 0; i < generatedString.length; i++){
            generatedString[i] = symbols[random.nextInt(symbols.length)];
        }
        
        return new String(generatedString);
    }
    
    private static final Gson gson = new Gson();

    public static String toJson(Object obj) {
        return gson.toJson(obj);
     }

}
