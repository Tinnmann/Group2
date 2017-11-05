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
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sydney Twigg
 */
public class RegisterUser extends HttpServlet {

    public RegisterUser() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get values from form
        String officerID = request.getParameter("officerID");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmpassword");

        StatusPojo sp = new StatusPojo();

        String output = "";
        String header = "";

        UserPojo user = new UserPojo();
        user.setOFFICERID(officerID);
        user.setEMAIL(email);

        //generate password hash
        user.setPASSWORD(BCrypt.hashpw(password, Setup.SALT));

        //generate hash - email verification
        String hash = Utils.prepareRandomString(30);

        //generate hash for password
        user.setEMAILVERIFICATIONHASH(BCrypt.hashpw(hash, Setup.SALT));

        //email verification
        try {
            if (UserDAO.idExists(officerID)) {
                UserDAO.registerUser(user);

                //send verification mail
                MailUtil.sendRegistrationLink(officerID, email, hash);

                sp.setMessage("A link has been sent to your registered email, please click the link to activate your account.");
                output = sp.getMessage();
                header = "Successful Registration";

            } else {
                header = "Error";
                sp.setMessage("The Officer ID entered does not exist");
                output = sp.getMessage();
            }
        } catch (DBException | MessagingException e) {
            header = "Error";
            sp.setMessage("Unknown error, check server log.");
            output = Utils.toJson(sp);
        }
        
        //redirect to show success/error
        request.setAttribute("message", output);
        request.setAttribute("header", header);
        request.getRequestDispatcher("/messageToUser.jsp").forward(request, response);

    }

    //validate fields are populated
    public static boolean validate(String id, String email, String pw, String cPw, String name, String sname, String policeStation, String division, String rank) {
        if (id == null) {
            System.out.println("id");
            return false;
        }
        if (email == null) {
            System.out.println("email");

            return false;
        }
        if (pw == null) {
            System.out.println("pw");

            return false;
        }
        if (cPw == null) {
            System.out.println("cpw");

            return false;
        }
        if (name == null) {
            System.out.println("name");

            return false;
        }
        if (sname == null) {
            System.out.println("sname");

            return false;
        }
        if (policeStation == null) {
            System.out.println("police station");

            return false;
        }
        if (division == null) {
            System.out.println("div");

            return false;
        }
        if (rank == null) {
            System.out.println("rank");

            return false;
        }
        return true;
    }

    public static boolean passwordMatch(String password, String confirmPassword) {

        if (password.matches(confirmPassword)) {
            return true;
        }

        return false;
    }

}
