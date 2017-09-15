// package capewatchpackage;

/*
**Fill Servlet
**Fills in the database with information entered from the crime form
**Tinashe Madzingaidzo, VFGY64QJ5
**
*/

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;

public class LgServlet extends HttpServlet{

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    
    @Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
            try (PrintWriter out = response.getWriter()) {
                String e=request.getParameter("email");
                String p=request.getParameter("password");
                
                String email = getServletConfig().getInitParameter("email");
		String password = getServletConfig().getInitParameter("password");

                
                log("email="+e+"::password="+p);
                
                if(email.equals(e) && password.equals(p)){
			response.sendRedirect("index.html");
                
                if(LoginDB.validate(e, p)){
                    RequestDispatcher rd=request.getRequestDispatcher("login.html");
                    //rd.forward(request,response);
                }
                else{
                    out.print("Sorry email or password error");
                    RequestDispatcher rd=request.getRequestDispatcher("login.html");
                    rd.include(request,response);
                }
            }
	}

    }
}

