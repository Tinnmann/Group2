
package forgotPassword.util;

/**
 *
 * @author Sydney Twigg
 */
public class Setup {
    //class to store all of the DB/Email settings that will be used to reset a user's password
    
    //DB setup
    public static final String DB_URL = "jdbc:mysql://localhost:3306/capewatchdb";
    public static final String DB_USERNAME = "root";
    public static final String DB_PASSWORD = "sqlPass"; //needs to be changed if on another pc
    public static final String DB_TABLE = "police_user";
    
    //mail setup
    public static final String MAIL_USERNAME = "xmeagolsoftware@gmail.com";
    public static final String MAIL_PASSWORD = "Xmeagol1";
    public static final String MAIL_SMTP_HOST = "smtp.gmail.com";
    public static final String MAIL_SMTP_PORT = "587";
    
    //link redirect
    public static final String MAIL_LINK = "http://localhost:8080/ForgotPassword_emailLink/VerifyEmailHash";
    
public static final String SALT = "$2a$10$DOWSDz/CyKaJ40hslrk5fe";

}
