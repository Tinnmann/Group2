<%@page import="forgotPassword.util.Setup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
 <%@ page import="java.util.*" %>
  <%@page import="org.json.JSONObject"%>
  


<% 


String location = request.getParameter("suburb");


String error ="";

String user= Setup.DB_USERNAME;
String pass= Setup.DB_PASSWORD;
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/capewatchdb", user, pass);
Statement st= conn.createStatement();
ResultSet rs = st.executeQuery("SELECT crimeType, COUNT(crimeType) FROM crime_case WHERE location = '"+location+"' GROUP BY crimeType");

List precinctdetails = new LinkedList();

JSONObject responseObj = new JSONObject();

JSONObject precinctObj = null;

String area="";
String crimetype = "";



while (rs.next()){
	
		area = rs.getString(1);
     	crimetype =rs.getString(2);
     	
   
     	precinctObj = new JSONObject();
     	precinctObj.put("area", area);
     	precinctObj.put("total", crimetype);
     	
     	precinctdetails.add(precinctObj);
   }

responseObj.put("precinctdetails", precinctdetails);

out.print(responseObj.toString());


	






%>