/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forgotPassword.servlets;

import forgotPassword.dao.UserDAO;
import forgotPassword.db.DBException;
import forgotPassword.model.StatusPojo;
import forgotPassword.util.BCrypt;
import forgotPassword.util.Setup;
import forgotPassword.util.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sydney Twigg
 */
public class ChangePassword extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(ForgotPassword.class.getName());

    public ChangePassword() {
        super();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer officerID = (Integer) request.getSession().getAttribute("user");

        if (officerID != null) {
            request.getRequestDispatcher("changePassword.html").forward(request, response);
        } else {
            String message = "Click <a href=\"login.html\">here</a> to login";
            request.setAttribute("message", message);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String output = "";
        String header = "";

        //NOTE: ONLY USE THIS IF YOU WANT TO HASH PASSWORD IN DB
        //get new password from input and hash it
        String inputPassword = null;

        //without hash
        String password = request.getParameter("password");
        if (request.getParameter("password") != null) {
            inputPassword = BCrypt.hashpw(request.getParameter("password"), Setup.SALT);
        }

        //get user ID from session
        String officerID = (String) request.getSession().getAttribute("user");
        String isResetPasswordVerified = (String) request.getSession().getAttribute("isResetPasswordVerified");
        StatusPojo sp = new StatusPojo();

        try {
            if (officerID != null && isResetPasswordVerified != null) {
                //update password if the status is in reset password or forgot password
                UserDAO.updatePassword(officerID, inputPassword); //IF YOU WANT TO HASH IT CHANGE TO inputPassword
                sp.setMessage("Password changed successfully");
                request.getRequestDispatcher("/login.html").forward(request, response);
            } else {
                sp.setMessage("Invalid input");
                output = sp.getMessage();
                header = "Error";
                //redirect to show success/error
                request.setAttribute("message", output);
                request.setAttribute("header", header);
                request.getRequestDispatcher("/messageToUser.jsp").forward(request, response);
            }
        } catch (DBException e) {
            LOGGER.info(e.getMessage());
            sp.setMessage(e.getMessage());
            output = sp.getMessage();
            header = "Error";
            //redirect to show success/error
            request.setAttribute("message", output);
            request.setAttribute("header", header);
            request.getRequestDispatcher("/messageToUser.jsp").forward(request, response);
        }

    }
}
