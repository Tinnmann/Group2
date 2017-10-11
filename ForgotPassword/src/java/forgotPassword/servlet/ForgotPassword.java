/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forgotPassword.servlet;

import forgotPassword.db.DBConnect;
import forgotPassword.setup.CreateHash;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sydney Twigg
 */
@WebServlet(name = "ForgotPassword", urlPatterns = {"/ForgotPassword"})
public class ForgotPassword extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //get email and password from the user input
        String inputEmail = request.getParameter("email");
        String officerID = request.getParameter("officerID");
        
        String hash = CreateHash.prepareRandomString(30);
    }
    
    public static void updateVerificationReset(String email, String hash, String id){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try{
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement("UPDATE police_user SET password=" + hash +" WHERE email =" + email + " AND officerID=" + id);
            ps.executeUpdate();
            DBConnect.close(conn, ps, rs);
        }
        catch (ClassNotFoundException | SQLException e) {
            DBConnect.close(conn, ps, rs);
            System.out.println(e.getMessage());   
        }
    }
}
