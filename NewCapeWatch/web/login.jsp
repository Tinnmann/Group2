
<%@page import="forgotPassword.db.DBException"%>
<%@page import="forgotPassword.model.UserPojo"%>
<%@page import="forgotPassword.dao.UserDAO"%>
<%@page import="forgotPassword.model.StatusPojo"%>
<%@page import="forgotPassword.util.BCrypt"%>
<%@page import="forgotPassword.util.Setup"%>
<%
        //java stuff
        //get email and password from form
        String email = request.getParameter("email");
        String password = BCrypt.hashpw(request.getParameter("password"), Setup.SALT);

        String error = "";
        StatusPojo sp = new StatusPojo();


            if (email.isEmpty()) {
                error = error + "<p>An email is required</p>";
            }
            if (password.isEmpty()) {
                error = error + "<p>An password is required</p>";
            }
        

        try {
            //get user details 
            UserPojo user = UserDAO.verifyLogin(email, password);
            if (user != null) {

                //if user's account is active they can log in
                if (user.getSTATUS().equalsIgnoreCase("active")) {
                    //start session for user
                    request.getSession().setAttribute("username", user.getOFFICERID());
                    //sp.setCode(0);
                    //sp.setMessage("Success");
                    request.setAttribute("userMessage", "Sucessfully logged in");
                    request.getRequestDispatcher("/profile.jsp").forward(request, response);
                } //if user's account is unverified - "new" or in the process of resetting password - "resetPassword" they cant log in
                else if (user.getSTATUS().equalsIgnoreCase("new") || user.getSTATUS().equalsIgnoreCase("resetPassword")) {
                   // sp.setCode(0);
                   // sp.setMessage("Account activation pending, please check your email");
                   error = error + "<p> Email not activated, please check your email</p>";


                } else {
                   // sp.setCode(-1);
                   // sp.setMessage("Unknown error");
                   error = error + "<p> User not found </p>";
                }
            } else {
                //sp.setCode(-1);
                //sp.setMessage("Email or password is not valid");
                error = error + "<p> Email or password is not valid </p>";
                request.setAttribute("error", "Invalid username or password");
            }
        } catch (DBException e) {
            //sp.setCode(-1);
           // sp.setMessage(e.getMessage());
           error = error + "<p> Something went wrong </p>";

        }
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cape Watch</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    </head>
    <body class="image-background">
        <nav class="navbar navbar-default navbar-inverse">
            <div class="container-fluid"></div>
            <div class="navbar-header">
                <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar-links" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">
                    <img src="images/CapeWatchLogo.png" alt="Police logo" id="badge"></a><a class="navbar-text" href="index." id="whiteText">Cape Watch</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-links">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><a href="login.html">Login</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li><a href="stat3.jsp">Statistics</a></li>
                    <li><a href="hotspots.html">Hotspots</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="login-div">
                <div class="text-center">
                    <h4 class="bigger-text" style="margin-bottom: 30px">Login</h4>
                    <div class="login-form-1">
                        <form class="text-left" id="login-form" role = "form" method="post" action="login" >
                            <div class="login-form-main-message"></div>
                            <div class="main-login-form">
                                <div class="login-group">
                                    <div class="form-group">
                                        <input class="form-control larger-text" type="email" placeholder="Email" name="email" id="email">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control larger-text" type="password" placeholder="Password" name="password" id="password">
                                    </div>
                                </div>
                                <button class="login-button" type="submit" name="submit"><i class="glyphicon glyphicon-chevron-right"></i></button>
                                <p class="marginTops text-center larger-text" id="whiteText">New user?    <a href="register.html">Create account</a></p>
                                <div class="text-center larger-text" id="whiteText"><a href="forgotPass.html">Forgot password?</a></div>
                            </div>
                        </form>
                    </div>
                    <br>
                    <% if (!error.isEmpty () 
                            ) { out.println("<div class='container alert alert-danger' style='width:120px; margin-top:10px;'>" + error + "'</div>'");
                        }%> 
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>

