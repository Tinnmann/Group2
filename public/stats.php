<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cape Watch</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
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
          <div class="container" id="headings">
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
          <table class="table table-striped" style="font-size:15px;">
            <thead>
                  <tr>
                      <th>Crimes</th>
                      <th>Numbers</th>
                  </tr>
            </thead>
            <!-- PHP -->
            <?php
              $link = mysqli_connect("shareddb1c.hosting.stackcp.net", "statistics-32301843", "MEzdpFu4SwjQ", "statistics-32301843");
              $query = "SELECT * FROM overallCrimes LIMIT 6";
              $result = mysqli_query($link, $query)  or die('Query fail: ' . mysqli_error());
            ?>
            <tbody>
            <!-- more PHP -->
            <?php while($row = mysqli_fetch_array($result))
            { echo"<tr>
                    <td>".$row[0]. "</td>
                    <td>" .$row[1] . "</td>
                  </tr>";
            }
            ?>
            </tbody>
          </table>
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


  </div>
  </body>
</html>
