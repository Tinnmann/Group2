<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cape Watch</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/Chart.min.js"></script>
    <script type="text/javascript" src="js/stats.js"></script>
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
            <img src="images/sheriff.svg" alt="Police logo" id="badge">
          </a>
      </div>
      <div class="collapse navbar-collapse" id="navbar-links">
        <ul class="nav navbar-nav navbar-right"></ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="index.html">Home</a></li>
          <li><a href="login.html">Login</a></li>
          <li><a href="profile.html">Profile</a></li>
          <li><a href="reports.html">Reports</a></li>
          <li class="active"><a href="stats.php">Statistics</a></li>
          <li><a href="hotspots.html">Hotspots</a></li>
          <li><a href="contact.html">Contact Us</a></li>
        </ul>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12">


            <div class="search-bar">
              <a href="#" class="btn btn-link" id="menu-toggle" style="color: white">
                <i class="glyphicon glyphicon-search" aria-hidden="true" style="padding-right:6px;"></i>
                Search Menu
              </a>
            </div>
  <!-- searchbar can go here
            <div id="sidebar-wrapper">
              <ul class="sidebar-nav" style="text-align:center; padding-top:82px;">
                <br>
                <hr>
                  <li>
                    <p>
                      <em>Search Area</em>
                    </p>
                  </li>
                <hr>
                <br>

              <form method="post">
                <li>
                  <p>Enter the name of a suburb</p>
                </li>
                <li style="margin-left:55px;">
                  <input type="text" class="form-control txt-auto" name="city" id="city" placeholder="e.g. Sea Point" style="text-align:center; width:80%; border-radius:5px;">
                </li>
                <br>
                <li>
                  <p>Type of Crime</p>
                </li>
                <li style="margin-left:55px;">
                  <input type="text" class="form-control txt-auto" name="city" id="city" placeholder="e.g. Murder" style="text-align:center; width:80%; border-radius:5px;">
                </li>
                <div id="cityList"></div>
                    <br>
                <li style="padding-top:42px;">
                  <button type="button" class="btn btn-sm btn-secondary" onclick="showDiv()">Submit</button>
                </li>
              </form>
                </ul>
            </div>
          -->

          <!-- Heading -->
          <div id="headings">
            <h1 id="header-center-white">STATISTICS</h1>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-sm-5 col-sm-offset-1">
          <h4 class="text-center">Regions Concerned</h4>
          <img src="region.png" id="regionmap">
        </div>
        <div class="col-sm-6">
          <h4 class="text-center">Feeds</h4>
        <div class="table-responsive">
          <table class="table table-striped" style="font-size:15px;">
            <thead>
                  <tr>
                      <th>Crimes</th>
                      <th>Numbers</th>
                  </tr>
            </thead>
            <!-- PHP for DB connect -->
            <tbody>
            <!-- PHP for table rows -->
              <tr>
                <td>row 1</td>
                <td>" row 2 "</td>
              </tr>
            </tbody>
          </table>
        </div>
          <button type="button" id="allcrime-btn" class="btn btn-secondary">
            <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
            Show More
          </button>

        </div>
    </div>

    <div class="row">
      <div class="col-sm-12" id="PrecinctStats">
        <h4 class="text-center"> General Statistics By Precincts</h4>
            <!--  New query  found in precinct.php-->
            <!-- Chart section by Precinct -->
          <canvas id="mycanvas" class="widgetcanvas"></canvas>
          
          <button type="button" id="crimeRelated" class="btn btn-secondary" style="border:none; background-color:transparent; letter-spacing:2px;">
            <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
            Related Crimes
          </button>
      </div>
    </div>

    <div id="searchDiv">
      <canvas id="mycanvas2" class="widgetcanvas"></canvas>
    </div>
    <!-- where is the modal code? -->
    <div id="modal" class="modal" onclick="this.style.display='none'">
    </div>

    <div id="footer2">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <h5>Head Office Address</h5>
                <p class="Footerinfo">11 Imam Haron Road<br>Claremont<br>Cape-Town  <br>7708<br>South Africa<br>+27 (0)711-711-711</p>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <h5 style="float:right; padding-right:20px !important;"> Where we stay <br> <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3308.3746314959844!2d18.467969950155833!3d-33.982909880529675!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1dcc42d744c835bf%3A0xd27135616b9ed72!2sBrookside+Office+Park%2C+11+Imam+Haron+Rd%2C+Claremont%2C+Cape+Town%2C+7708!5e0!3m2!1sen!2sza!4v1502104444977" width="200" height="117" frameborder="0" style="border:0; margin-top:25px;" allowfullscreen></iframe>
                </h5>
            </div>
        </div>
        <p class="copywrite"> &copy; Copywrite - Xmeagol - 2017</p>
    </div>

      </div>
    </div>
  </div>
  </body>
</html>
