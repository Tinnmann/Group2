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
            //int reportID = request.getParameter("reportID"); 
            //if (reportID==null){
              //  reportID="";
            //}
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

            String age = request.getParameter("age");
            if (age==null){
                age="";
            }            

            String race = request.getParameter("race");
            if (race==null){
                race="";
            }

            String gender = request.getParameter("gender");
            if (gender==null){
                gender="";
            }            
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(connURL, "root", "");
            PreparedStatement statement = conn.prepareStatement("insert into crime_case(crimeID,userID,date,location,time,crimeType,status) values(?,?,?,?,?,?,?)");
            PreparedStatement statement2 = conn.prepareStatement("insert into injured_party(age,race,gender,area) values(?,?,?,?)");
           // statement.setInt(1,reportID);
           // statement.setString(1,crimeID);      
            //statement.setString(3,victim);
            statement.setString(1,crimeID);
            statement.setString(2,userID);
            statement.setString(3,date);
            statement.setString(4,location);
            statement.setString(5,time);
            statement.setString(6,crimeType);
            statement.setString(7,status);
            
            //statement2.setString(1,reportID);
            statement2.setString(1,age);
            statement2.setString(2,race);
            statement2.setString(3,gender);
            statement2.setString(4,location);
            

            int i = statement.executeUpdate();
            int j = statement2.executeUpdate();
            if((i!=0) && (j!=0)){
                writer.println("<br>Successfully inserted!");
            }
            else{
                writer.println("Failed to insert!");
            }
            
        }
        catch (Exception e){
            writer.println(e);
        }
    }
}

