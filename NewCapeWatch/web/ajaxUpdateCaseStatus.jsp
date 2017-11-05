<%@page import="forgotPassword.util.Setup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>


<%

    String detail_reportID = request.getParameter("detailID");
    String editButtonName = request.getParameter("editBname");
    String editButtonValue = request.getParameter("editBvalue");

    String newValue = request.getParameter("valueOption");

    String user = Setup.DB_USERNAME;
    String pass = Setup.DB_PASSWORD;
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/capewatchdb", user, pass);
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM crime_case where reportID='" + detail_reportID + "'");

    st.executeUpdate("UPDATE crime_case SET status='" + newValue + "' WHERE reportID='" + detail_reportID + "'");

    out.println(newValue);


%>