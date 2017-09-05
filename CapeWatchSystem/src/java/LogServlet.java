/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//package capewatchpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author TINASHE
// */
//@WebServlet(
//		description = "Login Servlet", 
//		urlPatterns = { "/LogServlet" }, 
//		initParams = { 
//				@WebInitParam(name = "Email", value = "tylergray207@gmail.com"), 
//				@WebInitParam(name = "password", value = "1996TG")
//		})
public class LogServlet extends HttpServlet {

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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
            try (PrintWriter out = response.getWriter()) {
                String n=request.getParameter("email");
                String p=request.getParameter("password");
                
//                String email = getServletConfig().getInitParameter("Email");
//		String password = getServletConfig().getInitParameter("password");

                
//                log("Email="+email+"::password="+p);
                
//                if(email.equals(n) && password.equals(p))
//			response.sendRedirect("index.html");
                
                if(Login.validate(n, p)){
                    RequestDispatcher rd=request.getRequestDispatcher("index.html");
                    rd.forward(request,response);
                }
                else{
                    out.print("Sorry username or password error");
                    RequestDispatcher rd=request.getRequestDispatcher("login.html");
                    rd.include(request,response);
                }
            
	}

    }

}
