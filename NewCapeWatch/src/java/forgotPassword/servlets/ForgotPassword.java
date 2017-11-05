/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forgotPassword.servlets;

import forgotPassword.dao.UserDAO;
import forgotPassword.db.DBException;
import forgotPassword.model.StatusPojo;
import forgotPassword.model.UserPojo;
import forgotPassword.util.BCrypt;
import forgotPassword.util.MailUtil;
import forgotPassword.util.Setup;
import forgotPassword.util.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sydney Twigg
 */
public class ForgotPassword extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(ForgotPassword.class.getName());
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String output = "";
        String header = "";
        //get email + officerID from user input
        String inputEmail = request.getParameter("email");
        String officerID = request.getParameter("officerID");

        StatusPojo sp = new StatusPojo();

        try {
            //get user details from the email
            UserPojo up = UserDAO.selectUser(inputEmail);

            if (up != null) {
                //create verification hash
                String hash = Utils.prepareRandomString(30);

                //update verification hash in the DB
                UserDAO.updateVerificationReset(inputEmail, BCrypt.hashpw(hash, Setup.SALT));

                //send email to user
                MailUtil.sendResetPasswordLink(up.getOFFICERID() + "", inputEmail, hash);

                //set status
                sp.setMessage("An email has been sent to your registered email, please click the link to reset your password.");
                output = sp.getMessage();
                header = "Password Reset Successful";
            } else {
                sp.setMessage("The entered email does not exist.");
                output = sp.getMessage();
                header = "Error";
            }
        } catch (DBException | MessagingException e) {
            LOGGER.info(e.getMessage());
            sp.setCode(-2);
            sp.setMessage(e.getMessage());
            output = sp.getMessage();
            header = "Error";
        }
        //redirect to show success/error
        request.setAttribute("message", output);
        request.setAttribute("header", header);
        request.getRequestDispatcher("/messageToUser.jsp").forward(request, response);

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ForgotPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
