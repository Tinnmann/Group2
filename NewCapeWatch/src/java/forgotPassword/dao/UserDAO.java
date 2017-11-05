package forgotPassword.dao;

import static com.sun.xml.ws.spi.db.BindingContextFactory.LOGGER;
import forgotPassword.db.DBConnect;
import forgotPassword.db.DBException;
import forgotPassword.model.UserPojo;
import forgotPassword.servlets.RegisterUser;
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

    //updatePassword
    public static void updatePassword(String officerID, String password) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("update police_user set password = ? where officerID = ?");
            ps.setString(1, password);
            ps.setString(2, officerID);
            ps.executeUpdate();
            DBConnect.close(conn, ps, rs);
        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.info(e.getMessage());
            DBConnect.close(conn, ps, rs);
            throw new DBException("Excepion while accessing database");
        }
    }

    //updateVerificationReset
    public static void updateVerificationReset(String inputEmail, String hash) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("UPDATE police_user SET email_verification_hash ='" + hash + "', password_status =" + "'resetPassword'" + "WHERE email ='" + inputEmail + "'");
            ps.executeUpdate();
            DBConnect.close(conn, ps, rs);
        } catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            System.out.println(e.getMessage());
            throw new DBException("Error accessing database");
        }
    }

    //selectUser(by email)
    public static UserPojo selectUser(String inputEmail) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserPojo pojo = null;

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("SELECT name, surname, division, rank, policeStation, email, password, officerID, email_verification_hash, password_status FROM police_user WHERE email='" + inputEmail + "'");

            rs = ps.executeQuery();

            if (rs != null) {
                while (rs.next()) {
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
        } catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            System.out.println(e.getMessage());
            throw new DBException("Error accessing database");
        }
        return pojo;
    }

    public static boolean verifyEmailHash(String id, String hash) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean verified = false;
        ResultSet rs = null;

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("SELECT email FROM police_user WHERE officerID ='" + id + "' AND email_verification_hash='" + hash + "'");

            rs = ps.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    verified = true;
                }
            }
            DBConnect.close(conn, ps, rs);
        } catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            System.out.println(e.getMessage());
            throw new DBException("Error accessing database");
        }

        return verified;
    }

    public static void updateStatus(String officerID, String status) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("update police_user set password_status = ? where OfficerID = ?");
            ps.setString(1, status);
            ps.setString(2, officerID);
            ps.executeUpdate();
            DBConnect.close(conn, ps, rs);
        } catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            throw new DBException("Excepion while accessing database");
        }
    }

    public static void updateEmailVerificationHash(String ID, String hash) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("update police_user set email_verification_hash = ? where OfficerID = ?");
            ps.setString(1, hash);
            ps.setString(2, ID);
            ps.executeUpdate();
            DBConnect.close(conn, ps, rs);
        } catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            Logger.getLogger(VerifyEmailHash.class.getName()).log(Level.SEVERE, null, e);
            throw new DBException("Excepion while accessing database");
        }
    }

    public static boolean idExists(String id) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        boolean verified = false;

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("SELECT 1 FROM police_user WHERE OfficerID=?");
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    verified = true;
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, e);
            throw new DBException("Excepion while accessing database");
        }

        return verified;
    }

    /* public static String insertNewUser(UserPojo user) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String id = user.getOFFICERID();

        try {
            conn = DBConnect.getConnection();
            conn.setAutoCommit(false);
            ps = conn.prepareStatement("INSERT INTO police_user(name, surname, division, rank, policeStation, email, password, officerID, email_verification_hash) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, user.getNAME());
            ps.setString(2, user.getSURNAME());
            ps.setString(3, user.getDIVISION());
            ps.setString(4, user.getRANK());
            ps.setString(5, user.getPOLICESTATION());
            ps.setString(6, user.getEMAIL());
            ps.setString(7, user.getPASSWORD());
            ps.setString(8, user.getOFFICERID());
            ps.setString(9, user.getEMAILVERIFICATIONHASH());

            ps.executeUpdate();

            conn.commit();
            DBConnect.close(conn, ps, rs);
        } catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, e);
            throw new DBException("Excepion while accessing database");
        }

        return id;
    }*/
    public static String registerUser(UserPojo user) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String id = user.getOFFICERID();

        try {
            conn = DBConnect.getConnection();
            conn.setAutoCommit(false);
            ps = conn.prepareStatement("UPDATE police_user SET email = ?, password = ?, email_verification_hash = ? WHERE OfficerID = ?");
            ps.setString(1, user.getEMAIL());
            ps.setString(2, user.getPASSWORD());
            ps.setString(3, user.getEMAILVERIFICATIONHASH());
            ps.setString(4, id);

            ps.executeUpdate();
            conn.commit();
            DBConnect.close(conn, ps, rs);
        } catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, e);
            throw new DBException("Excepion while accessing database");
        }
        return id;
    }

    public static UserPojo verifyLogin(String email, String password) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        UserPojo user = null;

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("SELECT name, surname, division, rank, policeStation, email, officerID, password_status FROM police_user WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    user = new UserPojo();

                    user.setNAME(rs.getString(1));
                    user.setSURNAME(rs.getString(2));
                    user.setDIVISION(rs.getString(3));
                    user.setRANK(rs.getString(4));
                    user.setPOLICESTATION(rs.getString(5));
                    user.setEMAIL(rs.getString(6));
                    user.setOFFICERID(rs.getString(7)); //there are 10 columns but if you say 10 it breaks
                    user.setSTATUS(rs.getString(8));
                }
            }

            DBConnect.close(conn, ps, rs);
        } catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, e);
            throw new DBException("Excepion while accessing database");
        }

        return user;
    }

}
