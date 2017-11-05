<%@page import="forgotPassword.util.Setup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
 <%@ page import="java.util.*" %>
  <%@page import="org.json.JSONObject"%>
  


<% 

String detail_reportID = request.getParameter("detailID");

String error ="";

String user= Setup.DB_USERNAME;
String pass=Setup.DB_PASSWORD;
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/capewatchdb", user, pass);
Statement st= conn.createStatement();
ResultSet rs = st.executeQuery("SELECT location, COUNT(reportID) FROM crime_case GROUP BY location;");

List precinctdetails = new LinkedList();

JSONObject responseObj = new JSONObject();

JSONObject precinctObj = null;

String area="";
String total = "";


while (rs.next()){
	
		area = rs.getString(1);
     	total =rs.getString(2);
   
     	precinctObj = new JSONObject();
     	precinctObj.put("area", area);
     	precinctObj.put("total", total);
     	
     	precinctdetails.add(precinctObj);
   }

responseObj.put("precinctdetails", precinctdetails);

out.print(responseObj.toString());
	


	



	
	
	
	

	

	



%>