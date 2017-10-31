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


    /*TO DO WHEN I'M MORE AWAKE
        - Fix link: officerID=null DONE~
        - Make sure DB gets updated with hash
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get values from form
        String officerID = request.getParameter("officerID");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmpassword");

        StatusPojo sp = new StatusPojo();

        String output = "";

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
            //check if email does not exist in DB before registering

                UserDAO.registerUser(user);

                //send verification mail
                MailUtil.sendRegistrationLink(officerID, email, hash);

                sp.setCode(0);
                sp.setMessage("Link sent");
                output = Utils.toJson(sp);
                //response.sendRedirect("/messageToUser.jsp");
                

        } catch (DBException | MessagingException e) {
            sp.setCode(-2);
            sp.setMessage("Unknown error, check server log.");
            output = Utils.toJson(sp);
        }

        //}
        //show output 
//        if (output != null) {
//            request.setAttribute("message", output);
//            request.getRequestDispatcher("/NewCapeWatch/messageToUser.jsp").forward(request, response);
//
//        }
       PrintWriter pw = response.getWriter();
        pw.write(output);
        pw.flush();
        pw.close();      

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
