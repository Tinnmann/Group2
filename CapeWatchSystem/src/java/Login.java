/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//package capewatchpackage;

/**
 *
 * @author TINASHE
 */
import java.sql.*;

public class Login {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL ="jdbc:mysql://127.0.0.1:3306/capewatchdb";
    static final String username="root";
    static final String pwd="";
    static final String table = "login_details";
   public static boolean validate(String email,String password)
   {
      boolean status=false;
      try
         {
         	Class.forName("com.mysql.jdbc.Driver");
         	Connection con=DriverManager.getConnection(DB_URL, username, pwd );
         	
         	PreparedStatement ps=con.prepareStatement("select * from login_details where email=? and password=?");
         	ps.setString(1,email);
         	ps.setString(2,password);
         	
         	ResultSet rs=ps.executeQuery();
         	status=rs.next();
         }
      catch(ClassNotFoundException | SQLException e)
         {
            System.out.println(e);
         }
         
      return status;
   }
    
}
