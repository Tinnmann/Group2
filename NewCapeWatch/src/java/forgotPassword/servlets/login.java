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
import forgotPassword.util.Setup;
import forgotPassword.util.Utils;
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
public class login extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger( login.class.getName() );

    public login(){
        super();
    }
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get email and password from form
        String email = request.getParameter("email");
        String password = BCrypt.hashpw(request.getParameter("password"), Setup.SALT);
        
        StatusPojo sp = new StatusPojo();
        
        try{
            //get user details 
            UserPojo user = UserDAO.verifyLogin(email, password);
            if (user != null){
                //if user's account is active they can log in
                if (user.getSTATUS().equalsIgnoreCase("active") ){
                    //start session for user
                    request.getSession().setAttribute("username", user.getOFFICERID());
                    //request.getSession().setAttribute("userName", user.getNAME()+" "+user.getSURNAME());
                    sp.setCode(0);
                    sp.setMessage("Success");
                    request.getRequestDispatcher("/profile.jsp").forward(request, response);
                }
                //if user's account is unverified - "new" or in the process of resetting password - "resetPassword" they cant log in
                else if(user.getSTATUS().equalsIgnoreCase("new") || user.getSTATUS().equalsIgnoreCase("resetPassword")){
                    sp.setCode(0);
                    sp.setMessage("Account activation pending, please check your email");
                } else{
                    sp.setCode(-1);
                    sp.setMessage("Unknown error");
                }
            } else {
                sp.setCode(-1);
                sp.setMessage("Email or password is not valid");
            }
        } catch (DBException e){
            sp.setCode(-1);
            sp.setMessage(e.getMessage());
            LOGGER.log( Level.SEVERE, e.toString(), e );

        }
        PrintWriter pw = response.getWriter();
        pw.write(Utils.toJson(sp));
        pw.flush();
        pw.close();
    }


}
