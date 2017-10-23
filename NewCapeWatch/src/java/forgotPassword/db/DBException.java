
package forgotPassword.db;

/**
 *
 * @author Sydney Twigg
 */
public class DBException extends Exception{
    private String message;
    
    public DBException(String message){
        message = message;
    }
    
    public String getMessage(){
        return message;
    }
    
    public void setMessage(String message){
        this.message = message;
    }
}
