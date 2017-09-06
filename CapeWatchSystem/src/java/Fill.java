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

public class Fill extends HttpServlet{

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
                                     throws ServletException, IOException{
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        String connURL = "jdbc:mysql://127.0.0.1:3306/capewatchdb";
        Connection conn;
        try{
            String date = request.getParameter("date");
            if (date==null){
                date="";
            }  
            String location = request.getParameter("location");
            if (location==null){
                location="";
            }
            String time = request.getParameter("time");
                if (time==null){
                time="";
            }
            String crimeType = request.getParameter("crimeType");
            if (crimeType==null){
                crimeType="";
            }
            String status = request.getParameter("status");
            if (status==null){
                status="";
            }            
            String reportID = request.getParameter("reportID"); 
            if (reportID==null){
                reportID="";
            }
            String crimeID = request.getParameter("crimeID");
            if (crimeID==null){
                crimeID="";
            }
//            String victim = request.getParameter("Victim");
//            if (victim==null){
//                victim="";
//            }
            String userID = request.getParameter("userID");
            if (userID==null){
                userID="";
            }


            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(connURL, "root", "");
            PreparedStatement statement = conn.prepareStatement("insert into crime_case(reportID,crimeID,userID,date,location,time,crimeType,status) values(?,?,?,?,?,?,?,?)");
            statement.setString(1,reportID);
            statement.setString(2,crimeID);      
            //statement.setString(3,victim);
            statement.setString(3,userID);
            statement.setString(4,date);
            statement.setString(5,location);
            statement.setString(6,time);
            statement.setString(7,crimeType);
            statement.setString(8,status);

            int i = statement.executeUpdate();
            if(i!=0){
                writer.println("<br>Successfully inserted!");
            }
            else{
                writer.println("Failed to insert");
            }
        }
        catch (Exception e){
            writer.println(e);
        }
    }
}

