package forgotPassword.db;

import static com.sun.xml.ws.spi.db.BindingContextFactory.LOGGER;
import forgotPassword.util.Setup;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Sydney Twigg
 */

//class to connect to the database
public class DBConnect {
    Connection con = null;
    
    //connect to the DB
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = null;
        conn = DriverManager.getConnection(Setup.DB_URL, Setup.DB_USERNAME, Setup.DB_PASSWORD);
        return conn;
    }
    
    //close connection
    public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (con != null) {
                con.close();
            }
        } 
        catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
