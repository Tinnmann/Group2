
package forgotPassword.util;

import java.util.Random;
import com.google.gson.Gson;


/**
 *
 * @author Sydney Twigg
 */
public class Utils {
    
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
