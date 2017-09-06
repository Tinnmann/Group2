<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
      
      <!-- Main Css--> 
      <link rel="stylesheet" type="text/css" href="statistic.css?version=50">
      
      <!-- Font awesom link -->
      <script src="https://use.fontawesome.com/5149f9eb72.js"></script>
      
      <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair Display" rel="stylesheet">
      
      
  </head>
    
    
    
    
    
  <body>
      
      <!-- Navbar -->
      
    
        <nav class="navbar fixed-top navbar-toggleable-sm navbar-inverse bg-inverse">
        
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
  <a class="navbar-brand" href="#"><img style="width:30px; height:30px;" src="sheriff.png"></a>
  <div class="collapse navbar-collapse  justify-content-end" id="navbarNavAltMarkup">
    <ul class="navbar-nav ">
        
      <li class="nav-item">
        <a class="nav-link" href="index2.html">Home</a>
      </li>
        
        
      <li class="nav-item">
        <a class="nav-link" href="#">Login</a>
      </li>
        
        
      <li class="nav-item">
        <a class="nav-link" href="#">Reports</a>
      </li>
        
        
      <li class="nav-item active">
        <a class="nav-link" href="#">Statistics<span class="sr-only">(current)</span></a>
      </li>
        
        
        <li class="nav-item">
        <a class="nav-link" href="#">Hotspots</a>
      </li>
        
        
        
        
        <li class="nav-item">
        <a class="nav-link" href="#">Contact us</a>
      </li>
        
    </ul>
</nav>
        
        
        
        <!-- ALL PAGE CONTENT + NavBar  -->
        
        <div id="wrapper" style="padding-top:45px;">
            
            <!-- Toggeable Sidebar -->
            
            <div id="sidebar-wrapper">
            
                <ul class="sidebar-nav" style="text-align:center; padding-top:82px;">
                    
                        <br>
                        <hr>
                    
                    <li><p><em>Search Area</em></p></li>
                    
                        <hr>
                        <br>
                    
                    <!-- Search Area sideBar -->
                    
                    <form method="post">
                        
                            <li><p>Enter the name of a suburb</p></li>

                            <li style="margin-left:55px;"><input type="text" class="form-control txt-auto" name="city" id="city" placeholder="e.g. Sea Point" style="text-align:center; width:80%; border-radius:5px;"></li>

                                <br>

                            <li><p>Type of Crime</p></li>

                            <li style="margin-left:55px;"><input type="text" class="form-control txt-auto" name="city" id="city" placeholder="e.g. Murder" style="text-align:center; width:80%; border-radius:5px;"></li>

                            <div id="cityList"></div>

                                <br>

                            <li style="padding-top:42px;"><button type="button" class="btn btn-sm btn-secondary" onclick="showDiv()">Submit</button></li>
                        
                    </form>
                    
                </ul>
            
            </div>
            
            
            
            <!-- ALL PAGE CONTENT excluding sidebar navigation -->
            
            <div id="page-content-wrapper">
            
                <div class="container-fluid">
                
                    <div class="row">
                        
                        <div class="col-lg-12">
                            
                            
                    
                            
                <a href="#" class="btn btn-link" style="color:gray;" id="menu-toggle"><i class="fa fa-search" aria-hidden="true" style="padding-right:6px;"></i>Search Menu</a>
                            
                
                
                <!--Dashboard content -->
                <div class="container" id="headings" style="margin-top:92px;">
                <h4><em>STATISTICS</em></h4>
                </div>
                
                
                <!-- Region / Feeds section -->
                <div class="container-fluid" style="padding-top:64px; width:100%;">
                
                    <div class="row">
                        
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >
                            <h5 style="font-size:19px;">Region Concerned</h3>
                            <img src="region.png" id="regionmap" style="padding-top:20px;">
                        
                        </div>
                        
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            
                            <div style="margin-left:24px;">
                             
                                <h5 style="font-size:19px;">Feeds</h5>
                            
                                <!--table summary -->
                                <table class="table table-striped" style="font-size:15px;">
                                  
                                  
                                      <thead>
                                          
                                            <tr>
                                                <th>Crimes</th>
                                                <th>Numbers</th>  
                                            </tr>
                                          
                                      </thead>
                                
                                                <!--Connection database -->
                                                <?php 

                                                    $link = mysqli_connect("shareddb1c.hosting.stackcp.net", "statistics-32301843", "MEzdpFu4SwjQ", "statistics-32301843");

                                                    $query = "SELECT * FROM overallCrimes LIMIT 6";

                                                    $result = mysqli_query($link, $query)  or die('Query fail: ' . mysqli_error());

                                                ?>

                                        <tbody>

                                            <!--Fill table according to database -->
                                            <?php while($row = mysqli_fetch_array($result)) { echo"<tr>
                                                                                                <td>".$row[0]. "</td>
                                                                                                <td>" .$row[1] . "</td>
                                                                                                </tr>";
                                                                                            }  
                                            ?>                                            
                               
                                        </tbody>
                                
                                </table>
                             
                             <button type="button" id="allcrime-btn" class="btn btn-secondary" style="float:right; border:none; background-color:transparent; letter-spacing:2px;"><i class="fa fa-plus" aria-hidden="true" ></i><em> Show More</em></button>
                            
                            
                            
                          </div>   
                        </div>
                    
                    </div>
                
                </div>
                
                            
                <!-- Statistic/Precinct section -->
            <div>
                
                <h5 style="margin-top:64px; padding-bottom:42px; text-align:center;font-family: 'Oxygen', sans-serif;">General Stats By Precincts</h5>
                    
                    <div class="row">
                    
                        <div class="col-lg-12" id="PrecinctStats">
                                    <!--  New query  found in precinct.php-->
                                    <!-- Chart section by Precinct -->
                                <canvas id="mycanvas" class="widgetcanvas"></canvas>
                            
                            <button type="button" id="crimeRelated" class="btn btn-secondary" style="float:right; border:none; background-color:transparent; letter-spacing:2px;"><i class="fa fa-plus" aria-hidden="true" ></i><em> Related Crimes </em></button>
                        </div>
                        
                        
                        
                    </div>
                
                
            </div>
                            
                    <!-- After search section -->
                            
             <div class="container-fluid" id="searchDiv">
                 
                 
                            
                            <canvas id="mycanvas2" class="widgetcanvas"></canvas>
                            
            
                            
                            
            </div>   
                        
                            
                            
            
             
                
                
                
                
                            
                      <!-- Full size on click Feed Section -->
            <div id="modal" class="modal" onclick="this.style.display='none'" style="background-color:white; opacity:0.94; overflow-y:scroll;">

            <span class="btn btn-default" title="Close content" role="button" style="margin-bottom:10px;"><i class="fa fa-times" aria-hidden="true" style="position:fixed; background-color:beige;opacity:0.7; width:20px;"></i></span>
                
                <table class="table">
                                  
                                  
                              <thead class="thead-inverse">
                                <tr>
                                  <th>Crimes</th>
                                  
                                   <th>Numbers</th>
                                </tr>
                              </thead>
                                <!--Connection database -->
                                <?php 
                                
                                $link = mysqli_connect("shareddb1c.hosting.stackcp.net", "statistics-32301843", "MEzdpFu4SwjQ", "statistics-32301843");
                                
                                $query = "SELECT * FROM overallCrimes";
                                
                                $result = mysqli_query($link, $query)  or die('Query fail: ' . mysqli_error());
                                                       
                                ?>
                                
                              <tbody>
                                  <!--Fill table according to database -->
                                  <?php while($row = mysqli_fetch_array($result)) { echo"<tr style='letter-spacing:2px;'>
                                            <td>".$row[0]. "</td>
                                            <td>" .$row[1] . "</td>
                                            </tr>";
                                   }  
                                  ?>                                            
                               
                              </tbody>
                    </table>
    
            </div>
                
                
            
                        
                        </div>
                    
                    
                    </div>
                
                </div>
                
                
                  <!--footer -->
            
            <div id="footer">
                
                <div class="row">
                
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        
                        <h5>Head Office Address</h5>
                        <p class="Footerinfo">11 Imam Haron Road<br>Claremont<br>Cape-Town  <br>7708<br>South Africa<br>+27 (0)711-711-711</p>
                      
                       
                    
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        
                        <h5 style="float:right; padding-right:20px !important;"> Where we stay <br> <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3308.3746314959844!2d18.467969950155833!3d-33.982909880529675!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1dcc42d744c835bf%3A0xd27135616b9ed72!2sBrookside+Office+Park%2C+11+Imam+Haron+Rd%2C+Claremont%2C+Cape+Town%2C+7708!5e0!3m2!1sen!2sza!4v1502104444977" width="200" height="117" frameborder="0" style="border:0; margin-top:25px;" allowfullscreen></iframe> </h5>
                        
                        
                    
                    
                    </div>
                    
                
                
                </div>
                
                <p class="copywrite"><em>&copy; Copywrite - Xmeagol - 2017</em></p>
                            
                            
            </div>
            
            </div>
        
            
          
        
        
        </div>
        
        
        
        
        
        
      
      
      
    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        
        
          <script type="text/javascript">
            
              var jQuery_3_1_1_slim = $.noConflict(true);
              
            document.getElementById("allcrime-btn").onclick = function() {
                
                document.getElementById("modal").style.display = "table-row";
                
            }
            
            document.getElementById("crimeRelated").onclick = function() {
                
                location.href = "crimeRelated.php";
                
            }
            
            
            
            
            
        </script>
        
        
        
        
        
        
        
        
        
        <!-- load jQuery 3.2.1 -->
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
        
    <!--Chart Javascript -->
    <script type="text/javascript" src="js/Chart.min.js"></script>
        
   
        <script type="text/javascript">
            
        var jQuery_3_2_1 = $.noConflict(true);
            
            
            // Graph number of Crimes by Precinct 
            
            
            jQuery_3_2_1(document).ready(function(){
   
            jQuery_3_2_1.ajax({
                url: "http://keviintondo.com/project/precinct.php",
                dataType: 'json',
                method: "GET",
                success: function(data){
                    console.log(data);
                    var Precinct = [];
                    var total = [];
                    
                    for (var i in data){
                        Precinct.push(data[i].Precinct);
                        total.push(data[i].total);
                        
                    }
                    
                 
                    var chartdata = {
                        labels: Precinct,
                        datasets : [
                            {
                                label : '#Crimes/Precinct',
                                backgroundColor : 'rgba(163,204,255, 0.85)',
                                borderColor : 'rgba(140,171,128, 0.85)',
                                hoverBackgroundColor: 'rgba(220,160,27, 1)',
                                hoverBorderColor: 'rgba(200, 200, 200,0.9)',
                                data : total
                            }
                        ]
                    };
                    
                    var ctx = jQuery_3_2_1("#mycanvas");
 
                    
                    var barGraph = new Chart(ctx, {
                        
                        type: 'bar',
                        data: chartdata
                       
                    });

                    
                },
                error: function(data){

                    console.log(data);
                }
            });
                
                
               
        });
            
            // Toggle Search Menu 
            
            jQuery_3_2_1("#menu-toggle").click(function (e) {
               
                e.preventDefault();
                jQuery_3_2_1("#wrapper").toggleClass("menuDisplayed");
                
            });
            
            // Search Javascript Graphs
            
            function showDiv() {
                
                var citySearched = document.getElementById("city").value;
                
                document.getElementById('searchDiv').style.display = "block";
                
                jQuery_3_2_1.ajax({
                url: "http://keviintondo.com/project/search.php",
                dataType: 'json',
                method: "POST",
                success: function(data){
                    console.log(data);
                    
                    var total = [];
                    
                    for (var i in data){
                       
                        total.push(data[i].SexualOffences);
                        
                    }
                    
                 
                    var chartdata = {
                        labels: [`Murder`,`Sexual Offences`, `Attempted murder`, `Assault with the intent to inflict grievous bodily harm`, `Common assault`, `Common robbery`, `Robbery with aggravating circumstances`, `Arson`, `Malicious damage to property`, `Burglary at non-residential premises`, `Burglary at residential premises`, `Theft of motor vehicle and motorcycle`, `Theft out of or from motor vehicle`, `Stock-theft`, `Illegal possession of firearms and ammunition`, `Drug-related crime`, `Driving under the influence of alcohol or drugs`, `Sexual offences as result of police action`, `Carjacking`, `Truck hijacking`, `Robbery at residential premises`, `Robbery at non-residential premises`],
                        datasets : [
                            {
                                label : 'Athlone',
                                backgroundColor : ["#061826", "#19535F","#3cba9f","#e8c3b9","#c45850", "#0B7A75", "#D7C9AA","#7B2D26","#D2FDFF","#3ABEFF", "#26FFE6", "#A5978B","#8D5B4C","#e8c3b9","#5C4742", "#CCDBDC","#9AD1D4","#007EA7","#003249",
                                "#89AAE6","#003249","#3e95cd"],
                                borderColor : 'rgba(140,171,128, 0.85)',
                                hoverBackgroundColor: 'rgba(220,160,27, 1)',
                                hoverBorderColor: 'rgba(200, 200, 200,0.9)',
                                data : [16,64,38,217,533,231,359,529,195,490,219,703,0,50,1377,125,0,19,0,23,26,24],
                            }
                        ]
                        
                    };
                    
                    var ctx = jQuery_3_2_1("#mycanvas2");
 
                    
                    var barGraph = new Chart(ctx, {
                        
                        type: 'doughnut',
                        data: chartdata,
                        options: {
                                  title: {
                                    display: true,
                                    text: 'Athlone in 2016'
                                  },
                                cutoutPercentage:40,
                               
                            }
                       
                    });

                    
                },
                error: function(data){

                    console.log(data);
                }
            });
            }
            
            
            
           
            
            
           
                 
        </script>
        
        
        
        
        
  </body>
</html>