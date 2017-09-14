/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tyler Gray
 */
public class registerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            // read form fields
            String officerID = request.getParameter("id");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String policeStation = request.getParameter("department");
            String division = request.getParameter("division");
            String rank = request.getParameter("rank");

            System.out.println("officerID: " + officerID);
            System.out.println("email: " + email);
            System.out.println("password: " + password);
            System.out.println("name: " + name);
            System.out.println("surname: " + surname);
            System.out.println("policeStation: " + policeStation);
            System.out.println("division: " + division);
            System.out.println("rank: " + rank);

            // do some processing here...
            // get response writer
            PrintWriter writer = response.getWriter();

            // build HTML code
            String htmlRespone = "<html>";
            htmlRespone += "<h2>Your officerID is: " + officerID + "<br/>";
            htmlRespone += "Your email is: " + email + "</h2>";
            htmlRespone += "Your password is: " + password + "</h2>";
            htmlRespone += "Your name is: " + name + "</h2>";
            htmlRespone += "Your surname is: " + surname + "</h2>";
            htmlRespone += "Your policeStation is: " + policeStation + "</h2>";
            htmlRespone += "Your division is: " + division + "</h2>";
            htmlRespone += "Your rank is: " + rank + "</h2>";
            htmlRespone += "</html>";
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        String connURL = "jdbc:mysql://127.0.0.1:3306/capewatchdb"; //change connetcion route
        Connection conn;
        try {
            String officerID = request.getParameter("officerID");
            if (officerID == null) {
                officerID = "";
            }
            String email = request.getParameter("email");
            if (email == null) {
                email = "";
            }
            String password = request.getParameter("password");
            if (password == null) {
                password = "";
            }
            String name = request.getParameter("name");
            if (name == null) {
                name = "";
            }
            String surname = request.getParameter("surname");
            if (surname == null) {
                surname = "";
            }
            String policeStation = request.getParameter("policeStation");
            if (policeStation == null) {
                policeStation = "";
            }
            String division = request.getParameter("division");
            if (division == null) {
                division = "";
            }

            String rank = request.getParameter("rank");
            if (rank == null) {
                rank = "";
            }
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(connURL, "root", "");
            PreparedStatement statement = conn.prepareStatement("insert into police_user(officerID,name,surname,division,rank,policeStation,password) values(?,?,?,?,?,?,?,?)");
            statement.setString(1, officerID);
            statement.setString(2, name);
            statement.setString(3, surname);
            statement.setString(4, division);
            statement.setString(5, rank);
            statement.setString(6, policeStation);
            statement.setString(7, password);
            
            int i = statement.executeUpdate();
            if(i!=0){
                writer.println("<br>Successfully inserted!");
            }
            else{
                writer.println("Failed to insert");
            }
            

        } catch (Exception e) {
            writer.println(e);
        }
        

//        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//        /**
//         * Handles the HTTP <code>GET</code> method.
//         *
//         * @param request servlet request
//         * @param response servlet response
//         * @throws ServletException if a servlet-specific error occurs
//         * @throws IOException if an I/O error occurs
//         */
//        @Override
//        protected void doGet
//        (HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//            processRequest(request, response);
//        }
//
//        /**
//         * Handles the HTTP <code>POST</code> method.
//         *
//         * @param request servlet request
//         * @param response servlet response
//         * @throws ServletException if a servlet-specific error occurs
//         * @throws IOException if an I/O error occurs
//         */
//        @Override
//        protected void doPost
//        (HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//            processRequest(request, response);
//        }
//
//        /**
//         * Returns a short description of the servlet.
//         *
//         * @return a String containing servlet description
//         */
//        @Override
//        public String getServletInfo
//        
//            () {
//        return "Short description";
        ///}// </editor-fold>

    }
}
