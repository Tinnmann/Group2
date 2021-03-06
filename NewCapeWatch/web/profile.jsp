<%@page import="forgotPassword.db.DBConnect"%>
<%@page import="forgotPassword.db.DBException"%>
<%@page import="forgotPassword.model.UserPojo"%>
<%@page import="forgotPassword.dao.UserDAO"%>
<%@page import="forgotPassword.util.Setup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

        <style type="text/css">

            .card-text.profile:hover {
                font-size: 17px;
                font-style: oblique;
                text-transform: capitalize;
            }

        </style>
    </head>
    <body>

        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.*" %>
        <%@ page import="java.sql.Connection" %>
        <%@ page import="java.sql.PreparedStatement" %>
        <%@ page import="java.sql.ResultSet" %>
        <%
            session = request.getSession(false);

            String name = "";
            String officerID = "";
            String surname = "";
            String email = "";
            String division = "";
            String rank = "";
            String policeStation = "";
            String password = "";

            String error = "";
            String success = "";

            String name1 = "";
            String officerID1 = "";
            String surname1 = "";
            String email1 = "";
            String division1 = "";
            String rank1 = "";
            String policeStation1 = "";
            String password1 = "";
            String password2 = "";

            if (session.getAttribute("username") != null) { //what is username?
                String id = session.getAttribute("username").toString();
                String user = Setup.DB_USERNAME;
                String pass = Setup.DB_PASSWORD;
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection conn = DriverManager.getConnection(Setup.DB_URL, user, pass);
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM police_user where officerID='" + id + "'");

                while (rs.next()) {
                    officerID = rs.getString("OfficerID");
                    name = rs.getString("name");
                    surname = rs.getString("surname");
                    email = rs.getString("email"); //change these to user.getEmail etc
                    division = rs.getString("division");
                    rank = rs.getString("rank");
                    policeStation = rs.getString("policeStation");
                    password = rs.getString("password");
                }
                String save = request.getParameter("submit");
                name1 = request.getParameter("name1");
                surname1 = request.getParameter("surname1");
                division1 = request.getParameter("division1");
                email1 = request.getParameter("email1");
                rank1 = request.getParameter("rank1");
                policeStation1 = request.getParameter("policeStation1");
                password1 = request.getParameter("password1");
                password2 = request.getParameter("password2");
                if ("confirm".equals(save)) {
                    if (name1.isEmpty() == false) {
                        st.executeUpdate("UPDATE police_user SET name='" + name1 + "' where officerID='" + id + "'");
                        success = success + "<p>- Name has been  successfuly changed</p>";

                    } else if (surname1.isEmpty() == false) {
                        st.executeUpdate("UPDATE police_user SET surname='" + surname1 + "' where officerID='" + id + "'");
                        success = success + "<p>- Surname has been  successfuly changed</p>";

                    } else if (email1.isEmpty() == false) {
                        st.executeUpdate("UPDATE police_user SET email='" + email1 + "' where officerID='" + id + "'");
                        success = success + "<p>- Email has been  successfuly changed</p>";

                    } else if (division1.isEmpty() == false) {
                        st.executeUpdate("UPDATE police_user SET division='" + division1 + "' where officerID='" + id + "'");
                        success = success + "<p>- Division has been  successfuly changed</p>";

                    }
                    if (rank1.isEmpty() == false) {
                        st.executeUpdate("UPDATE police_user SET rank='" + rank1 + "' where officerID='" + id + "'");
                        success = success + "<p>- Rank has been  successfuly changed</p>";

                    }
                    if (policeStation1.isEmpty() == false) {
                        st.executeUpdate("UPDATE police_user SET policeStation='" + policeStation1 + "' where officerID='" + id + "'");
                        success = success + "<p>- The police Station has been  successfuly changed</p>";

                    }
                    if (password1.isEmpty() == false && password2.isEmpty() == false && password1.equals(password2)) {
                        st.executeUpdate("UPDATE police_user SET password='" + password1 + "' where officerID='" + id + "'");
                        success = success + "<p>- Password has been  successfuly changed</p>";

                    } else if (password1.isEmpty() == false && password2.isEmpty() == false && !password1.equals(password2)) {
                        error = error + "<p>Passwords were not the same - Please try again</p>";
                    }
                }
            } else {
                String mustlogIn = "You must log in to access your profile!";
                session = request.getSession();
                session.setAttribute("mustlogIn", mustlogIn);
                response.sendRedirect("login.html");
            }
        %>

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
                    <img src="images/CapeWatchLogo.png" alt="Police logo" id="badge"></a>
                <a class="navbar-text" href="index." id="whiteText">Cape Watch</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-links">
                <ul class="nav navbar-nav navbar-right"></ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li>
                        <a href="login.html">Login</a>
                    </li>
                    <li class="active">
                        <a href="profile.jsp">Profile</a>
                    </li>
                    <li>
                        <a href="stat3.jsp">Statistics</a>
                    </li>
                    <li>
                        <a href="hotspots.html">Hotspots</a>
                    </li>
                    <li>
                        <a href="contact.jsp">Contact Us</a>
                    </li>
                </ul>
            </div>
        </nav>
        <section style="background-image: linear-gradient(to right, #434343 0%, black 100%);">
            <div class="container">
                <div class="row">

                    <div class="col-sm-6">

                        <div style="padding-left: 5px; border-radius: 10px; display:inline-block; width:100%;background-color: rgb(136, 23, 27);">
                            <h1 style="color:white; font-size: 30px; float:left;">
                                Welcome Back,
                                <% out.println(name); %>
                            </h1>
                            <button type="button" class="btn btn-default " name="logout" style="float: right; margin-top:22px;  margin-right:10px;">
                                <a href="logout.jsp" style="color: black;">
                                    <b>
                                        <em>Logout</em>
                                    </b>
                                </a>
                            </button>
                        </div>
                        <br>

                        <div class="card" style="width: 100%;">
                            <h4 class="card-title" style="color:white; opacity:0.8;">
                                <i class="glyphicon glyphicon-user" style="color: white"></i><% out.println(" " + name + " " + surname); %></h4>
                            <h6 class="card-subtitle mb-2 text-muted" id="date" style="text-align:right; color: white"></h6>

                            <div class="card-body" style="padding-top: 30px; text-transform: capitalize;">
                                <p class="card-text list-group-item profile">
                                    <b>Officer ID :
                                        <span style=" color:#88171B; float:right;"><% out.println(officerID); %></span>
                                    </b>
                                </p>
                                <p class="card-text list-group-item profile">
                                    <b>Name :
                                        <span style="color:#88171B; float:right;"><% out.println(name); %></span>
                                    </b>
                                </p>
                                <p class="card-text list-group-item profile">
                                    <b>Surname:
                                        <span style="color:#88171B; float:right;"><% out.println(surname); %></span>
                                    </b>
                                </p>
                                <p class="card-text list-group-item profile">
                                    <b>Email:
                                        <span style="color:#88171B; float:right;"><% out.println(email); %></span>
                                    </b>
                                </p>
                                <p class="card-text list-group-item profile">
                                    <b>Division:
                                        <span style="color:#88171B; float:right;"><% out.println(division); %></span>
                                    </b>
                                </p>
                                <p class="card-text list-group-item profile">
                                    <b>Rank:
                                        <span style="color:#88171B; float:right;"><% out.println(rank); %></span>
                                    </b>
                                </p>

                                <br>
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal" style="background-color: #9D0D0D; border-color: rgb(136, 23, 27)">Edit Profile</button>

                                <a href="#" class="card-link"></a>
                            </div>
                            <br>
                            <% if (!error.isEmpty()) {
                                    out.println("<div class='container alert alert-danger' style='width:220px;text-align:center; margin-top:10px;height:70px;'>" + error + "'</div>'");
                                }
                                if (!success.isEmpty()) {
                                    out.println("<div class='container alert alert-success' style='width:220px;text-align:center; margin-top:10px;'>" + success + "'</div>'");
                                }%>
                            <br>
                        </div>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                        <h4 class="modal-title text-center" id="exampleModalLabel" style="color: black">Edit Profile</h4>

                                    </div>

                                    <div class="modal-body">
                                        <form class="form-horizontal" method="post" id="editForm" action="profile.jsp">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="date">Name</label>
                                                <div class="col-sm-4">
                                                    <input name="name1" placeholder="<% out.println(name); %>" type="text" pattern="^[A-Z]{1}[a-z]+[a-zA-Z\-\s]+" title="Invalid input: Name should start with a capital letter and contains no digits." style="width: 150px;"/>
                                                </div>
                                                <label class="col-sm-2 control-label" for="location">Surname</label>
                                                <div class="col-sm-4">
                                                    <input style="width: 150px;" name="surname1" placeholder="<% out.println(surname); %>" type="text" pattern="^[A-Z]{1}['a-z]+[a-zA-Z\-\s]+" title="Invalid input"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="password">New Password</label>
                                                <div class="col-sm-4">
                                                    <input style="width: 150px;" id="password1" name="password1" placeholder="" pattern="[A-Za-z0-9]{5,16}" title="Password should be 5 - 16 characters long with no special characters" type="password"/>
                                                </div>
                                                <label class="col-sm-2 control-label" for="location">Re-enter Password</label>
                                                <div class="col-sm-4">
                                                    <input style="width: 150px;" id="password2" name="password2" placeholder="" pattern="[A-Za-z0-9]{5,16}" title="Password should be 5 - 16 characters long with no special characters" type="password"/>
                                                </div>
                                                <script>
                                                    var password = document.getElementById("password1"),
                                                            confirm_password = document.getElementById("password2");

                                                    function validatePassword() {
                                                        if (password1.value != password2.value) {
                                                            confirm_password.setCustomValidity("Passwords don't match");
                                                        } else {
                                                            confirm_password.setCustomValidity('');
                                                        }
                                                    }
                                                    password.onchange = validatePassword;
                                                    confirm_password.onkeyup = validatePassword;
                                                </script>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="time">Email</label>
                                                <div class="col-sm-4">
                                                    <input style="width: 150px;" type="email" placeholder="<% out.println(email); %>" name="email1"/>
                                                </div>
                                                <label class="col-sm-2 control-label" for="crimeType">Division</label>
                                                <div class="col-sm-4">
                                                    <div class="dropdown dropdown-content">

                                                        <select class="form-control" name="division1" style="width: 150px;">

                                                            <option value=""></option>
                                                            <option value="Crime Combating and Investigation Division">Crime Combating and Investigation Division</option>
                                                            <option value="Visible Policing Division">Visible Policing Division</option>
                                                            <option value="Internal Stability Division">Internal Stability Division</option>
                                                            <option value="Community Relations Division">Community Relations Division</option>
                                                            <option value="Supporting Services Division">Supporting Services Division</option>
                                                            <option value="Human Resources Management Division">Human Resources Management Division</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="status">Rank</label>
                                                <div class="col-sm-4">
                                                    <div class="dropdown dropdown-content">

                                                        <select class="form-control" name="rank1" style="width: 150px;">
                                                            <option value=""></option>
                                                            <option value="General">General</option>
                                                            <option value="Lieutenant-General">Lieutenant-General</option>
                                                            <option value="Major-General">Major-General</option>
                                                            <option value="Brigadier">Brigadier</option>
                                                            <option value="Colonel">Colonel</option>
                                                            <option value="Lieutenant-Colonel">Lieutenant-Colonel</option>
                                                            <option value="Major">Major</option>
                                                            <option value="Lieutenant">Lieutenant</option>
                                                            <option value="Sergeant">Sergeant</option>
                                                            <option value="Warrant Officer">Warrant Officer</option>
                                                            <option value="Constable">Constable</option>
                                                            <option value="Captain">Captain</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <label class="col-sm-2 control-label">Police Station
                                                </label>
                                                <div class="col-sm-4">
                                                    <div class="dropdown">
                                                        <select class="form-control" style="width:150px;" name="policeStation1">
                                                            <option value=""></option>
                                                            <% String user = Setup.DB_USERNAME;
                                                                String pass = Setup.DB_PASSWORD;
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                java.sql.Connection conn = DriverManager.getConnection(Setup.DB_URL, user, pass);
                                                                Statement st = conn.createStatement();
                                                                ResultSet rs1
                                                                        = st.executeQuery("SELECT policestation FROM police_station");
                                                                while (rs1.next()) {
                                                                    out.println("<option value=" + rs1.getString(1) + ">" + rs1.getString(1) + "</option>");
                                                                }%>

                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                    </form>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button class="btn btn-danger" id="save" value="confirm" name="submit" type="submit">Save Changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="card-div">
                            <div class="card-1 col-sm-3 col-sm-offset-1" style="margin-top: 10px; width:20rem; border:black solid 1px; padding:10px; background-color: white; border-radius:10px;">
                                <p style="text-align:center;">
                                    <img class="card-img-top" src="images/reports.png" alt="Card image cap" style="width:50%;"></p>
                                <div class="card-body">
                                    <div class="card-title">
                                        <h4 style="color: #9D0D0D">Reports</h4>
                                    </div>
                                    <p class="card-text text-center">Go to the
                                        <b>Reports</b>
                                        page to view reports or to add a new report</p>
                                    <a href="reports.jsp" class="btn btn-danger" style="margin-left: 39px">Reports
                                        <i class="glyphicon glyphicon-share-alt"></i>
                                    </a>

                                </div>
                            </div>

                            <div class="card-2 col-sm-3 col-sm-offset-1" style="margin-top: 10px; width:20rem; border:black solid 1px; padding:10px; background-color: white; border-radius:10px;">
                                <p style="text-align:center;">
                                    <img class="card-img-top" src="images/icon-graph.png" alt="Card image cap" style="width:50%;"></p>
                                <div class="card-body">
                                    <div class="card-title">
                                        <h4 style="color: #9D0D0D">Statistics</h4>
                                    </div>
                                    <p class="card-text">View the current
                                        <b>Crime Statistics</b>
                                        for the Greater Cape Town Area</p>
                                    <a href="stat3.jsp" class="btn btn-danger" style="margin-left: 39px">Statistics
                                        <i class="glyphicon glyphicon-share-alt"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="card-3 col-sm-3 col-sm-offset-1" style="margin-top: 20px; width:20rem; border:black solid 1px; padding:10px; background-color: white; border-radius:10px;">
                                <p style="text-align:center;">
                                    <img class="card-img-top" src="images/alert-icon.png" alt="Card image cap" style="width:50%;"></p>
                                <div class="card-body">
                                    <div class="card-title">
                                        <h4 style="color: #9D0D0D">Hotspots</h4>
                                    </div>
                                    <p class="card-text">View the latest crime rates per area on the
                                        <b>Hotspots</b>
                                        page</p>
                                    <a href="hotspots.html" class="btn btn-danger" style="margin-left: 39px">Hotspots
                                        <i class="glyphicon glyphicon-share-alt"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="card-4 col-sm-3 col-sm-offset-1" style=" margin-top: 20px; width:20rem; border:black solid 1px; padding:10px; background-color: white; border-radius:10px;">
                                <p style="text-align:center;">
                                    <img class="card-img-top" src="images/contact-icon.png" alt="Card image cap" style="width:50%;"></p>
                                <div class="card-body">
                                    <div class="card-title">
                                        <h4 style="color: #9D0D0D">Contact Us</h4>
                                    </div>
                                    <p class="card-text">
                                        Visit the
                                        <b>Contact Us</b>
                                        page to get in touch with the developers</p>
                                    <a href="contact.jsp" class="btn btn-danger" style="margin-left: 35px">Contact Us
                                        <i class="glyphicon glyphicon-share-alt"></i>
                                    </a>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-sm-4 col-sm-offset-2">
                        <h2 id="whiteText" class="text-center">News Feed</h2>
                        <iframe style="width: 100%; height: 100rem; padding:10px; border: none; background-color: white; border-radius: 10px" src="https://www.iol.co.za/dailynews"></iframe>

                    </div>

                </div>
                <div class="row">
                    <div class="profileContent"></div>
                </div>
            </div>
        </section>

        <script type="text/javascript">

            n = new Date();
            y = n.getFullYear();
            m = n.getMonth() + 1;
            d = n.getDate();
            document.getElementById("date").innerHTML = m + "/" + d + "/" + y;
        </script>

    </body>
</html>
