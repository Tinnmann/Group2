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
    <script src="particles.js-master/demo/js/app.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Jura" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair Display" rel="stylesheet">

  </head>
  <body class="general-background">
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

      <div class="row">
        <div class="col-lg-12">

          <!-- searchbar can go here -->
            <div class="search-bar">
              <a href="#" class="btn btn-link" id="menu-toggle" style="color: white">
                <i class="glyphicon glyphicon-search" aria-hidden="true" style="padding-right:6px;"></i>
                Search Menu
              </a>
            </div>
            <!-- Seacrh bar -->
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
                  <!-- Search Area sideBar -->
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


          <div class="container" id="headings">
          <h1 id="header-center-white">STATISTICS</h1>

          </div>
        </div>
      </div>

  </body>
</html>
