/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forgotPassword.mail;

import com.google.gson.Gson;
import forgotPassword.setup.CreateHash;
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
    /*
    public static void main(String[] args) {
        String id, email;
        //test
        String id = "3";
        String email = "sydneytwigg@gmail.com";
        String hash = CreateHash.prepareRandomString(30);
        try {
            sendResetPasswordLink(id, email, hash);
        } catch (MessagingException ex) {
            Logger.getLogger(SendResetMail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
*/


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
                .append("<br/><br/>To reset your password please use the following temporary password to log in and change your existing password: ")
                .append("<br/> ")
                .append(hash)
                .append("<br/> ")
                .append("<br/><br/> Thanks, <br/> Xmeagol Software.");

        //Send message
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(Setup.MAIL_USERNAME));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        message.setSubject("Cape Watch - Reset Password");
        message.setContent(bodyText.toString(), "text/html; charset=utf-8");
        Transport.send(message);
    }




}
