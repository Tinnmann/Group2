/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forgotPassword.servlets;

import forgotPassword.dao.UserDAO;
import forgotPassword.db.DBException;
import forgotPassword.util.BCrypt;
import forgotPassword.util.Setup;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sydney Twigg
 */
public class VerifyEmailHash extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(ForgotPassword.class.getName());

    public VerifyEmailHash() {
        super();
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String output = "";
        String header = "";
        //get user ID and email verification code hash code

        String officerID = request.getParameter("officerID");
        String hash = BCrypt.hashpw(request.getParameter("hash"), Setup.SALT);
        String scope = request.getParameter("scope");
        String message = null;

        //forgot password
        try {
            //verify with database
            if (scope.equals("resetPassword") && UserDAO.verifyEmailHash(officerID, hash)) {
                //update status to active
                UserDAO.updateStatus(officerID, "active");
                //add a session
                request.getSession().setAttribute("user", officerID);
                request.getSession().setAttribute("isResetPasswordVerified", "yes");
                //forward request
                request.getRequestDispatcher("/createPass.html").forward(request, response);
            } else if (scope.equals("activation") && UserDAO.verifyEmailHash(officerID, hash)) {
                //update status to active
                UserDAO.updateStatus(officerID, "active");
                UserDAO.updateEmailVerificationHash(officerID, null);
                //forward request
                request.getRequestDispatcher("/login.html").forward(request, response);
            } else {
                output = "Something went wrong";
                header = "Error";
                //redirect to show success/error
                request.setAttribute("message", output);
                request.setAttribute("header", header);
                request.getRequestDispatcher("/messageToUser.jsp").forward(request, response);
            }
        } catch (DBException ex) {
            Logger.getLogger(VerifyEmailHash.class.getName()).log(Level.SEVERE, null, ex);
            message = ex.getMessage();
        }

    }

}
