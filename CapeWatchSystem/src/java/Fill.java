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
            String reportID = request.getParameter("report ID"); 
            if (reportID==null){
                reportID="";
            }
            String crimeID = request.getParameter("Crime ID");
            if (crimeID==null){
                crimeID="";
            }
            String victim = request.getParameter("Victim");
            if (victim==null){
                victim="";
            }
            String userID = request.getParameter("User ID");
            if (userID==null){
                userID="";
            }
            String date = request.getParameter("Date");
            if (date==null){
                date="";
            }
            String location = request.getParameter("Location");
            if (location==null){
                location="";
            }
            String time = request.getParameter("Time");
                if (time==null){
                time="";
            }
            String crimeType = request.getParameter("Crime Type");
            if (crimeType==null){
                crimeType="";
            }
            String status = request.getParameter("Status");
            if (status==null){
                status="";
            }
         
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(connURL, "root", "");
            PreparedStatement statement = conn.prepareStatement("insert into Data(incident_day,incident_time,victim,victim_age,suspect,suspect_age,method_victim_capture,substance_abuse_suspected,suspect_disguised,incident_loc) values(?,?,?,?,?,?,?,?,?,?)");//Data is the name of the table
            statement.setString(1,reportID);
            statement.setString(2,crimeID);      
            statement.setString(3,victim);
            statement.setString(4,userID);
            statement.setString(5,date);
            statement.setString(6,location);
            statement.setString(7,time);
            statement.setString(8,crimeType);
            statement.setString(9,status);

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

