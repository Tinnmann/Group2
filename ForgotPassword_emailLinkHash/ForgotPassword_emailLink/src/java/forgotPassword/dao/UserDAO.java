
package forgotPassword.dao;

import static com.sun.xml.ws.spi.db.BindingContextFactory.LOGGER;
import forgotPassword.db.DBConnect;
import forgotPassword.db.DBException;
import forgotPassword.model.UserPojo;
import forgotPassword.servlets.VerifyEmailHash;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sydney Twigg
 */
public class UserDAO {
    //methods to implement
    
    //selectUser - is this needed??? 
    /*
    public static UserPojo selectUser(String officerID) throws DBException{
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserPojo pojo = null;
        
        try{
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("");
        }
        catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            System.out.println(e.getMessage());
            throw new DBException("Error accessing database");
        }
        
        
        
        
        return pojo;
    } */
    //updatePassword
    	public static void updatePassword(String officerID, String password) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
                conn = DBConnect.getConnection();
                ps = conn.prepareStatement("update police_user set password = ? where officerID = ?");
                ps.setString(1,password);
                ps.setString(2,officerID);
                ps.executeUpdate();
                DBConnect.close(conn, ps, rs);
        } catch (ClassNotFoundException | SQLException e) {
                LOGGER.info(e.getMessage());
                DBConnect.close(conn, ps, rs);
                throw new DBException("Excepion while accessing database");
        }
	}
    //updateStatus
    //verifyEmailHash
    //updateEmailVerificationHash
    //updateVerificationReset
    public static void updateVerificationReset(String inputEmail, String hash) throws DBException{
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("UPDATE police_user SET email_verification_hash ='" + hash + "', password_status =" + "'resetPassword'" + "WHERE email ='" + inputEmail + "'");
            ps.executeUpdate();
            DBConnect.close(conn, ps, rs);
        } 
        catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            System.out.println(e.getMessage());
            throw new DBException("Error accessing database");
        }
    }
    

    //selectUser(by email)
    public static UserPojo selectUser(String inputEmail) throws DBException{
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserPojo pojo = null;
        
        try{
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("SELECT name, surname, division, rank, policeStation, email, password, officerID, email_verification_hash, password_status FROM police_user WHERE email='" + inputEmail +"'");
            
            rs = ps.executeQuery();
            
            if (rs != null){
                while (rs.next()){
                    pojo = new UserPojo();
                    pojo.setNAME(rs.getString(1));
                    pojo.setSURNAME(rs.getString(2));
                    pojo.setDIVISION(rs.getString(3));
                    pojo.setRANK(rs.getString(4));
                    pojo.setPOLICESTATION(rs.getString(5));
                    pojo.setEMAIL(rs.getString(6));
                    pojo.setOFFICERID(rs.getString(8));
                    pojo.setEMAILVERIFICATIONHASH(rs.getString(9));
                    pojo.setSTATUS(rs.getString(10));
                }
            }
            DBConnect.close(conn, ps, rs);
        }
        catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            System.out.println(e.getMessage());
            throw new DBException("Error accessing database");
        }
        
        
        
        
        return pojo;
    }
    
    
    public static boolean verifyEmailHash(String id, String hash) throws DBException{
        Connection conn = null;
        PreparedStatement ps = null;
        boolean verified = false;
        ResultSet rs = null;
        
        try{
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("SELECT email FROM police_user WHERE officerID ='" + id +"' AND email_verification_hash='" + hash+"'");
            
            rs = ps.executeQuery();
            
            if (rs != null){
                while (rs.next()){
                    verified = true;
                }
            }
            DBConnect.close(conn, ps, rs);
        }
        catch(ClassNotFoundException | SQLException e){
            DBConnect.close(conn, ps, rs);
            System.out.println(e.getMessage());
            throw new DBException("Error accessing database");
        }
        
        return verified;
    }
    
    public static void updateStatus(String ID, String status) throws DBException{
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("update police_user set password_status = ? where OfficerID = ?");
            ps.setString(1,status);
            ps.setString(2,ID);
            ps.executeUpdate();
            DBConnect.close(conn, ps, rs);
        } catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            throw new DBException("Excepion while accessing database");
        }
    }
    
    public static void updateEmailVerificationHash(String ID, String hash) throws DBException{
		Connection conn = null;
		PreparedStatement ps = null;
                ResultSet rs = null;
		try {
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement("update police_user set email_verification_hash = ? where PoliceID = ?");
			ps.setString(1,hash);
			ps.setString(2,ID);
			ps.executeUpdate();
			DBConnect.close(conn, ps, rs);
		} catch (ClassNotFoundException | SQLException e) {
			DBConnect.close(conn, ps, rs);
                                    Logger.getLogger(VerifyEmailHash.class.getName()).log(Level.SEVERE, null, e);

			throw new DBException("Excepion while accessing database");
		}
	}
	
}
