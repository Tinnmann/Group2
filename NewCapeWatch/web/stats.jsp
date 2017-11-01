<%--
    Document   : stats
    Created on : 11 Oct 2017, 5:40:41 AM
    Author     : TINASHE
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Cape Watch</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="js/filter-menu.js"></script>
  <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Jura" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Playfair Display" rel="stylesheet">

</head>

<body>
  <nav class="navbar navbar-default navbar-inverse">
    <div class="container-fluid"></div>
    <div class="navbar-header">
      <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar-links" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span><span class="icon-bar">
          </span>
        </button>
      <a class="navbar-brand" href="index.html">
        <img src="images/CapeWatchLogo.png" alt="Police logo" id="badge">
      </a>
      <a class="navbar-text" href="index." id="whiteText">Cape Watch</a>
    </div>
    <div class="collapse navbar-collapse" id="navbar-links">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="index.html">Home</a></li>
        <li><a href="login.html">Login</a></li>
        <li><a href="profile.jsp">Profile</a></li>
        <li class="active"><a href="stats.jsp">Statistics</a></li>
        <li><a href="hotspots.html">Hotspots</a></li>
        <li><a href="contact.jsp">Contact Us</a></li>
      </ul>
    </div>
  </nav>

  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-12">
        <!-- Heading -->
        <div id="headings" style="margin-top: 10px;">
          <h1 id="header-center-white">STATISTICS</h1>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-sm-4 col-sm-offset-1">
        <h4 class="text-center">Regions Concerned</h4>
        <img src="region.png" id="regionmap">
      </div>
      <div class="col-sm-6">
        <h4 class="text-center">Feeds</h4>
        <div class="table-responsive" style="height: 300px; overflow-y: scroll">
          <table class="table table-striped" style="font-size:15px;">
              <%
                  try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/capewatchdb", "root", "");
                    String q = "SELECT crimeType, COUNT(crimeType) FROM crime_case GROUP BY crimeType";
                    //String r = "SELECT `COUNT(crimeType)`";
                    Statement st = conn.createStatement();
                    ResultSet rs = st.executeQuery(q);
                    //ResultSet rt= st.executeQuery(r);
                    String crimeType= "";
                    int count=0;
                    String status="";
                    out.println("<tr><th>Crimes</th><th>Numbers</th><tr>");
                    while(rs.next()){
                        crimeType=rs.getString(1);
                        //count = rt.getInt(1);
                        count=rs.getInt(2);
                        out.println("<tr><td>" + crimeType + "</td><td>" + count + "</td></tr>");
                    }
                  }catch(Exception e){
                      System.out.println(e);
                  }
              %>

          </table>
        </div>

        <button type="button" id="process Data" class="btn btn-secondary" href="#Processing" onclick= "document.getElementById('DriverClass').submit();">
            Proccess Data
            <form id="DriverClass" action="DriverClass" method="post" role="form"></form>
          </button>
      </div>

    </div>
    <div class="row">
      <div class="col-sm-6" id="PrecinctStats">
        <!-- Chart section by Precinct -->
        <div name="graph" id="TypeOfCrime" style="margin: 20px 20px 20px 20px;">
        </div>
      </div>
      <div class="col-sm-6">
        <div name="graph" id="locationCrime" style="margin: 20px 20px 20px 20px;">
          <script>
            window.onload = function() {
              var chart = new CanvasJS.Chart("locationCrime", {
                animationEnabled: true,
                title: {
                  text: "Location Crime"
                },
                data: [{
                  type: "pie",
                  startAngle: 240,
                  yValueFormatString: "##0.00\"%\"",
                  indexLabel: "{label} {y}",
                  dataPoints: [
                    {y: 79.45, label: "Camps Bay"},
                    {y: 7.31, label: "Greenpoint"},
                    {y: 7.06, label: "Milnerton"},
                    {y: 4.91, label: "Wynberg"},
                    {y: 1.26, label: "Others (etc.. thers so many)"}
                  ]
                }]
              });
              chart.render();
              var cchart = new CanvasJS.Chart("TypeOfCrime", {
                title:{ text: "Type of Crime"},
                data: [{
                  dataPoints: [
                    { x: 1, y: 297571, label: "Murder"},
                    { x: 2, y: 267017,  label: "Saudi" },
                    { x: 3, y: 175200,  label: "Canada"},
                    { x: 4, y: 154580,  label: "Iran"},
                    { x: 5, y: 116000,  label: "Russia"},
                    { x: 6, y: 97800, label: "UAE"},
                    { x: 7, y: 20682,  label: "US"},
                    { x: 8, y: 20350,  label: "China"}
                  ]
                }]
              });
              cchart.render();
            }
          </script>
        </div>
      </div>
    </div>
    <div class="row">
      <div>

      </div>
    </div>
  </div>
</body>

</html>
