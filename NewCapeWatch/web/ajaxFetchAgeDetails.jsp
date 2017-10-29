<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>


<% 

String detail_reportID = request.getParameter("detailID");

String error ="";

String user= "root";
String pass= "";
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/capewatchdb", user, pass);
Statement st= conn.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM injured_party where reportID='"+detail_reportID+"'");



String [] detailsCrimeCase = new String[3];


String age= "";

 
while (rs.next()){
     age = rs.getString(2);
   }

	

	out.print(age);
	



	
	
	
	

	

	



%>