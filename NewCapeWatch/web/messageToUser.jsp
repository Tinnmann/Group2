<%--
    Document   : messageToUser
    Created on : 13 Oct 2017, 2:41:07 PM
    Author     : Sydney Twigg
--%>


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
                <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar-links" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                <a
                    class="navbar-brand" href="index.html"> <img src="images/CapeWatchLogo.png" alt="Police logo" id="badge"></a><a class="navbar-text" href="index." id="whiteText">Cape Watch</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-links">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="login.html">Login</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li><a href="stats3.jsp">Statistics</a></li>
                    <li><a href="hotspots.html">Hotspots</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="row" style="margin-top: 3%;">
                <div class="col-lg-6 col-lg-push-3">
                    <h2 class="text-center bigger-text" id="whiteText" style="margin-bottom: 30px;"><%String header = (String) request.getAttribute("header");%> <%=header%></h2>
                    <div style="width: 500px; margin: auto;">
                        <div class="jumbotron">
                            <p>
                                <%
                                    String message = (String) request.getAttribute("message");
                                %>
                                <%=message%>
                            </p>
                        </div>
                    </div>
                    <button class="btn btn-warning col-sm-2 col-sm-push-5" style="text-align: center" onclick="goBack()">Go Back <i class="glyphicon glyphicon-share-alt"></i></button>
                    <script>
                        function goBack() {
                            window.history.back();
                        }
                    </script>
                </div>
            </div>
    </body>

</html>
