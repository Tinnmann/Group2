<%@page import="forgotPassword.util.Setup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>


<%

    String detail_reportID = request.getParameter("detailID");

    String error = "";

    String user = Setup.DB_USERNAME;
    String pass = Setup.DB_PASSWORD;
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/capewatchdb", user, pass);
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM injured_party where reportID='" + detail_reportID + "'");

    String race = "";

    while (rs.next()) {

        race = rs.getString(3);

    }

    out.print(race);


%>