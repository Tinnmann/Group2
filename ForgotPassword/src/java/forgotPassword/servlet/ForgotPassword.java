/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forgotPassword.servlet;

import forgotPassword.db.DBConnect;
import forgotPassword.mail.SendResetMail;
import forgotPassword.setup.CreateHash;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sydney Twigg
 */
public class ForgotPassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //get email and password from the user input
        String email = request.getParameter("email");
        String id = request.getParameter("officerID");

        try {
            //create a hash to send and reset password
            String hash = CreateHash.prepareRandomString(30);

            //update user password and status in the database
            updateVerificationReset(email, hash, id);

            //send mail
            SendResetMail.sendResetPasswordLink(id, email, hash);
        } catch (MessagingException ex) {
            Logger.getLogger(ForgotPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void updateVerificationReset(String email, String hash, String id){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try{
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("UPDATE police_user SET password='" + hash + "', password_status='resetPassword' WHERE email='" + email + "' AND OfficerID='"+id+"'");
            ps.executeUpdate();
            DBConnect.close(conn, ps, rs);
        }
        catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            System.out.println(e.getMessage());
        }
    }
}
