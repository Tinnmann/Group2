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
    <link rel="stylesheet" href="css/stats.css">
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
        <li class="active"><a href="login.html">Login</a></li>
        <li><a href="profile.jsp">Profile</a></li>
        <li><a href="stats.jsp">Statistics</a></li>
        <li><a href="hotspots.html">Hotspots</a></li>
        <li><a href="contact.jsp">Contact Us</a></li>
      </ul>
    </div>
  </nav>

  <div class="container-fluid text-center" >

  </div>
    <div class="row content" style="background-color:#474545;">
      <div class="col-sm-2 left-side">
      </div>

      <!-- middle -->
      <div class="col-sm-8">

        <div id="box">
        	<div id="particles-js2">
        		<script
        		src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js">
        		</script>
        	</div>
        </div>
        <script src="js/particles-stats.js" type="text/javascript"></script>


        <div class="panel panel-info" id="feeds">
          <div class="panel-heading">
            <h3 class="panel-title text-center" style="font-size: 30px;">Feeds</h3>
          </div>
          <div class="panel-body">
              <div class="table-responsive" style="height: 300px; overflow-y: scroll">
                <table class="table table-hover" style="font-size: 20px;">
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


                      out.println("<thead><tr><th>Crimes</th><th>Numbers</th><tr></thead>");

                      while(rs.next()){
                        crimeType=rs.getString(1);
                        //count = rt.getInt(1);
                        count=rs.getInt(2);
                        out.println("<tbody><tr><td>" + crimeType + "</td><td>" + count + "</td></tr></tbody>");
                      }
                    }catch(Exception e){
                      System.out.println(e);
                      }
                  %>
                </table>
              </div>
            </div>
        </div>




</div>
      <div class="col-sm-2 right-side">
      </div>

    </div>
    <div class="row content" style="background: rgb(217, 237, 247);">

      <div class="col-sm-2">

      </div>

      <div class="col-sm-8">


            <div name="graph" id="TypeOfCrime" style="height: 400px; margin-top: 50px;"></div>
            <br />
            <div name="graph"id="locationCrime" style="height: 400px;  margin-top: 50px;"></div>

            <script>
              window.onload = function() {
                var chart = new CanvasJS.Chart("locationCrime", {
                  animationEnabled: true,
                  theme: "light2",
                  title: {
                    text: "Crime by Location"
                  },
                  data: [{
                    type: "pie",
                    startAngle: 240,
                    yValueFormatString: "##0.00\"%\"",
                    indexLabel: "{label} {y}",
                    indexLabelFontSize: 25,
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
                  theme: "light2",
                  title:{ text: "Type of Crime"},
                  axisX:{
                    labelFontSize: 25
                  },
                  axisY:{
                    labelFontSize: 25
                  },
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

                  <div class="col-sm-2">

                  </div>
            </div>

  </div>
  </body>
  </html>
