<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cape Watch</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">

<title>Insert title here</title>
</head>
<body class="image-background">

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>


<%



String email = request.getParameter("email");
session.putValue("email", email);
String password = request.getParameter("password");
String x = request.getParameter("submit");

String error ="";

String user= "root";
String pass= "";
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/capewatchdb", user, pass);
Statement st= conn.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM police_user where email='"+email+"'");

if ("confirm".equals(x)){
if(email.isEmpty()){

	error = error + "<p>An email is required</p>";

}

if(password.isEmpty()){

	error = error + "<p>An password is required</p>";

}

}

if(rs.next()){

	if (rs.getString(8).equals(password) && rs.getString(7).equals(email)){

	response.sendRedirect("profile.jsp");
	String name = rs.getString(2);
	String id = rs.getString(1);
	session = request.getSession();
	session.setAttribute("username", id);

	} else if(rs.getString(7).equals(email) && password.isEmpty() == false){

		error = error + "<p>Wrong Password</p>";

	}
}

if(session.getAttribute("mustlogIn") != null ){
	
	error = error + session.getAttribute("mustlogIn").toString();
	session.invalidate();
}


%>

<nav class="navbar navbar-default navbar-inverse">
      <div class="container-fluid"></div>
      <div class="navbar-header">
        <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar-links" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="index.html"><img src="images/CapeWatchLogo.png" alt="Police logo" id="badge"></a>
        <a class="navbar-text" href="index." id="whiteText">Cape Watch</a>
      </div>
      <div class="collapse navbar-collapse" id="navbar-links">
        <ul class="nav navbar-nav navbar-right"></ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="index.html">Home</a></li>
          <li class="active"><a href="login.jsp">Login</a></li>
          <li><a href="profile.jsp">Profile</a></li>
          <li><a href="reports.jsp">Reports</a></li>
          <li><a href="stats.html">Statistics</a></li>
          <li><a href="hotspots.html">Hotspots</a></li>
          <li><a href="relatedCrimes.html">Related Crimes</a></li>
          <li><a href="contact.jsp">Contact Us</a></li>
        </ul>
      </div>
    </nav>

    <div class="container">
      <div class="login-div">
        <div class="text-center">
          <h4>Login</h4>
          <div class="login-form-1">
            <form class="text-left" id="login-form" action="login.jsp" method="post">
              <div class="login-form-main-message"></div>
              <div class="main-login-form">
                <div class="login-group">
                  <div class="form-group">
                    <input class="form-control" type="email"  name="email" placeholder="Email" id="llg_username">
                  </div>
                  <div class="form-group">
                    <input class="form-control" type="password" name="password" placeholder="password" id="lg_password">
                  </div>
                </div>
                <button class="login-button" value="confirm" name="submit" type="submit"><i class="glyphicon glyphicon-chevron-right"></i></button>
                <p class="marginTops text-center" id="whiteText">new user?    <a href="register.html">create account</a></p>
                <div class="text-center" id="whiteText"><a href="#">forgot password?</a></div>
              </div>
            </form>
          </div>
          <br>
          
          <% if(!error.isEmpty()){ 
        	  out.println("<div class='container alert alert-danger' style='width:120px; margin-top:10px;'>" + error +"'</div>'");
          }
        	  %>

        </div>
      </div>
    </div>
</body>
</html>
