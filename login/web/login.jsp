<%-- 
    Document   : login
    Created on : 14 Sep 2017, 9:56:01 PM
    Author     : Sydney Twigg
--%>
<%@page import="java.sql.*;"%>
<%@page import="javax.sql.*;"%>
<%@page import="login.java.LoginDB"%>

<%
    String email = request.getParameter("email");
    session.putValue("email", email);
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/capewatchdb","root","sqlPass");
    Statement st = conn.createStatement();
    
ResultSet rs = st.executeQuery("SELECT * FROM police_user WHERE email='"+email+"'");

if(rs.next()){
    if(rs.getString(7).equals(password)){
        response.sendRedirect("profile.html");
    }
    else{
        out.println("Invalid password");
    }
}
%>
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cape Watch</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  </head>
  <body class="image-background">
    <nav class="navbar navbar-default navbar-inverse">
      <div class="container-fluid"></div>
      <div class="navbar-header">
        <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar-links" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="index.html"><img src="images/sheriff.svg" alt="Police logo" id="badge"></a>
      </div>
      <div class="collapse navbar-collapse" id="navbar-links">
        <ul class="nav navbar-nav navbar-right"></ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="index.html">Home</a></li>
          <li class="active"><a href="login.html">Login</a></li>
          <li><a href="profile.html">Profile</a></li>
          <li><a href="reports.html">Reports</a></li>
          <li><a href="stats.html">Statistics</a></li>
          <li><a href="../NewCapewatch/web/hotspots.html">Hotspots</a></li>
          <li><a href="../NewCapewatch/web/contact.jsp">Contact Us</a></li>
        </ul>
      </div>
    </nav>
    <div class="container">
      <div class="login-div">                   
        <div class="text-center">
          <h4>Login</h4>
          <div class="login-form-1">
            <form class="text-left" id="login-form">
              <div class="login-form-main-message"></div>
              <div class="main-login-form">
                <div class="login-group">
                  <div class="form-group">
                    <input class="form-control" type="email" placeholder="Email" name="email" id="lg_email">
                  </div>
                  <div class="form-group">
                    <input class="form-control" type="password" placeholder="Password" name="password" id="lg_password">
                  </div>
                </div>
                <button class="login-button" type="submit" name="submit"><i class="glyphicon glyphicon-chevron-right"></i></button>
                <p class="marginTops text-center" id="whiteText">New user?    <a href="register.html">Create account</a></p>
                <div class="text-center" id="whiteText"><a href="#">Forgot password?</a></div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
