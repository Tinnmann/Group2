<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
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
  <script type="text/javascript" src="js/Chart.min.js"></script>
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
        <li ><a href="login.html">Login</a></li>
        <li><a href="profile.jsp">Profile</a></li>
        <li class="active"><a href="stat3.jsp">Statistics</a></li>
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
                    	String user= "root";
                    	String pass= "";
                    	Class.forName("com.mysql.jdbc.Driver");
                    	java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/capewatchdb", user, pass);
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



        	 <div class="col-lg-12" id="PrecinctStats" style="margin-top:10%;">

       	 <canvas id="mycanvas" class="widgetcanvas"></canvas>

              </div>



              <div id="searchSuburb" style="text-align:center; padding:15px; margin:10px; font-size:20px;">

                      <label class="big-text"style="letter-spacing:2px; font-weight:400; margin-bottom: 2%;">Select a location:</label>
                      <br>
                      <select name="location" required="required" id="editS" style=>
                        <option value="Athlone">Athlone</option>
                        <option value="Belhar">Belhar</option>
                        <option value="Bellville">Bellville</option>
                        <option value="Bellville South">Bellville South</option>
                        <option value="Bishop Lavis">Bishop Lavis</option>
                        <option value="Bothasig">Bothasig</option>
                        <option value="Brackenfell">Brackenfell</option>
                        <option value="Camps Bay">Camps Bay</option>
                        <option value="Cape Town Central">Cape Town Central</option>
                        <option value="Claremont">Claremont</option>
                        <option value="Delft">Delft</option>
                        <option value="Diep Rivier">Diep Rivier</option>
                        <option value="Durbanville">Durbanville</option>
                        <option value="Elsies River">Elsies River</option>
                        <option value="Fish Hoek">Fish Hoek</option>
                        <option value="Goodwood">Goodwood</option>
                        <option value="Grassy Park">Grassy Park</option>
                        <option value="Gugulethu">Gugulethu</option>
                        <option value="Harare">Harare</option>
                        <option value="Hout Bay">Hout Bay</option>
                        <option value="Kensington">Kensington</option>
                        <option value="Khayelitsha">Khayelitsha</option>
                        <option value="Kirstenhof">Kirstenhof</option>
                        <option value="Kleinvlei">Kleinvlei</option>
                        <option value="Kraaifontein">Kraaifontein</option>
                        <option value="Kuils Rivier">Kuils Rivier</option>
                        <option value="Langa">Langa</option>
                        <option value="Lansdowne">Lansdowne</option>
                        <option value="Lingelethu-West">Lingelethu-West</option>
                        <option value="Macassar">Macassar</option>
                        <option value="Maitland">Maitland</option>
                        <option value="Manenberg">Manenberg</option>
                        <option value="Mfuleni">Mfuleni</option>
                        <option value="Milnerton">Milnerton</option>
                        <option value="Mitchells Plain">Mitchells Plain</option>
                        <option value="Mowbray">Mowbray</option>
                        <option value="Muizenberg">Muizenberg</option>
                        <option value="Nyanga">Nyanga</option>
                        <option value="Ocean View">Ocean View</option>
                        <option value="Parow">Parow</option>
                        <option value="Philippi">Philippi</option>
                        <option value="Philippi East">Philippi East</option>
                        <option value="Pinelands">Pinelands</option>
                        <option value="Ravensmead">Ravensmead</option>
                        <option value="Rondebosch">Rondebosch</option>
                        <option value="Sea Point">Sea Point</option>
                        <option value="Simon's Town">Simon’s Town</option>
                        <option value="Somerset West">Somerset West</option>
                        <option value="Steenberg">Steenberg</option>
                        <option value="Stellenbosch">Stellenbosch</option>
                        <option value="Strand">Strand</option>
                        <option value="Strandfontein">Strandfontein</option>
                        <option value="Table Bay Harbour">Table Bay Harbour</option>
                        <option value="Table View">Table View</option>
                        <option value="Woodstock">Woodstock</option>
                        <option value="Wynberg">Wynberg</option>
                      </select>
                      <br>
                      <div  class="wrap"style="padding:10px;">
                        <button class="button larger-text" style="border-radius: 20px;" id="buttonS">Search</button>
                        </div>

                    </div>


              <div class="col-lg-12" id="PrecinctStats" style="padding:0 20%;">

              <canvas id="mycanvas2" class="widgetcanvas"></canvas>
            </div>
        </div>

            <script>
            $.ajax({
                url: "precinct.jsp",
                dataType: 'json',
                method: "GET",
                success: function(data){
              	  console.log(data);
                    var area = [];
                    var total = [];

                    for (var i in data) {

                  	  console.log(data[i]);

                  	  for (var j in data[i]){
                  		  area.push(data[i][j].area);
                  		  total.push(data[i][j].total);
                  	  }

                  	 }


                 console.log(area);
                 console.log(total);


                    var chartdata = {
                        labels: area,
                        datasets : [
                            {
                                label : '#Crimes/Precinct',
                                backgroundColor : 'rgb(136, 23, 27)',
                                borderColor : 'rgba(140,171,128, 0.85)',
                                hoverBackgroundColor: 'rgb(103, 144, 211)',
                                hoverBorderColor: 'rgba(200, 200, 200,0.9)',
                                data : total

                            }
                        ]
                    };

                    var ctx = $("#mycanvas");


                    var barGraph = new Chart(ctx, {

                        type: 'bar',
                        data: chartdata

                    });


                },
                error: function(data){

                    console.log(data);
                }
            });








          	$('#buttonS').click(function(){

          		var suburb = $("#editS").val();

          		$.ajax({
                      type: 'GET',
                      data: {suburb: suburb},
                      dataType: 'json',
                      url: 'searchL.jsp',
                      success: function(data){
                    	  console.log(data);
                          var area = [];
                          var total = [];

                          for (var i in data) {

                        	  console.log(data[i]);

                        	  for (var j in data[i]){
                        		  area.push(data[i][j].area);
                        		  total.push(data[i][j].total);
                        	  }

                        	 }


                       console.log(area);
                       console.log(total);


                          var chartdata = {
                              labels: area,
                              datasets : [
                                  {
                                      label : '#Crimes/Precinct',
                                      backgroundColor : ["#061826", "#19535F","#3cba9f","#e8c3b9","#c45850", "#0B7A75", "#D7C9AA","#7B2D26","#D2FDFF","#3ABEFF", "#26FFE6", "#A5978B","#8D5B4C","#e8c3b9","#5C4742", "#CCDBDC","#9AD1D4","#007EA7","#003249",
                                          "#89AAE6","#003249","#3e95cd"],
                                      borderColor : 'rgba(140,171,128, 0.85)',
                                      hoverBackgroundColor: 'rgb(136, 23, 27)',
                                      hoverBorderColor: 'rgba(200, 200, 200,0.9)',
                                      data : total

                                  }
                              ]
                          };

                          var ctx = $("#mycanvas2");


                          var barGraph = new Chart(ctx, {

                              type: 'doughnut',
                              data: chartdata,
                              options: {
                                  title: {
                                    display: true,
                                    text: suburb
                                  },
                                cutoutPercentage:40,

                            }

                          });


                      },
                      error: function(data){

                          console.log(data);
                      }
                    });



          	});


            </script>
                  </div>

                  <div class="col-sm-2">

                  </div>
            </div>

  </div>
  </body>
  </html>
