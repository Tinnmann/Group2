<?php

session_start();




//if (isset($_COOKIE['id'])  ) {

  //  $_SESSION['id'] = $_COOKIE['id'];

<<<<<<< HEAD
 $link = mysqli_connect("localhost", "root", "", "capewatchdb");
=======
//}
>>>>>>> 44a4080aad5cde064f70b61d1942f74f21ab62d0

//if(array_key_exists("id", $_SESSION)) {

  //  $logout= "<p><a href='login.php?logout=1'>Log out</a></p>";

//} else {

//    header("Location: login.php");
//}

// $link = mysqli_connect("localhost", "root", "root", "capewatchdb");

//$query = "SELECT * FROM `police_user` WHERE email = '".mysqli_real_escape_string($link, $_POST['email'])."'";

  //      $result = mysqli_query($link, $query);


    //    $row = mysqli_fetch_array($result);

//$officierID = $row['officierID'];
//$email = $row['email'];
//$password = $row['password'];
//$name = $row['name'];
//$surname = $row['surname'];
//$policeStation = $row['name'];
//$division = $row['division'];
//$rank = $row['rank'];





//?>

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
  </head>
  <body style="background-image: linear-gradient(rgba(0, 0, 0, 0.80),rgba(255, 255, 255, 0.10))">
    <nav class="navbar navbar-default navbar-inverse">
      <div class="container-fluid"></div>
      <div class="navbar-header">
        <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar-links" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="index.html"><img src="images/sheriff.svg" alt="Police logo" id="badge"></a>
      </div>
      <div class="collapse navbar-collapse" id="navbar-links">
        <ul class="nav navbar-nav navbar-right"></ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="index.html">Home</a></li>
          <li><a href="login.php">Login</a></li>
          <li class="active"><a href="profile.php">Profile</a></li>
          <li><a href="reports.html">Reports</a></li>
          <li><a href="stats.html">Statistics</a></li>
          <li><a href="hotspots.html">Hotspots</a></li>
          <li><a href="contact.html">Contact Us</a></li>
        </ul>
      </div>
    </nav>
    <section>
      <div class="container">
        <div class="row">

            <div class="col-sm-6">

                <div style="background-color: rgb(136, 23, 27); padding-left: 5px; border-radius: 10px">
                <h1 style="color:white;"> Welcome Back, <?php print_r($name)?></h1>
                </div>

                <div class="card" style="width: 100%;">
                  <div class="card-body">
                    <h4 class="card-title" style="color:black; opacity:0.8;"><i class="glyphicon glyphicon-user" style="color: white"></i><em><?php print_r($name." ".$surname)?></em></h4>
                    <h6 class="card-subtitle mb-2 text-muted" id="date" style="text-align:right; color: white"></h6>
                    <p class="card-text list-group-item"><b>Officier ID: </b> <?php print_r($officierID)?></p>
                    <p class="card-text list-group-item"><b>Name :</b> <?php print_r($name)?></p>
                    <p class="card-text list-group-item"><b>Surame:</b> <?php print_r($surname)?></p>
                    <p class="card-text list-group-item"><b>Email:</b> <?php print_r($email)?></p>
                    <p class="card-text list-group-item"><b>Division:</b> <?php print_r($division)?></p>
                    <p class="card-text list-group-item"><b>Rank:</b> <?php print_r($rank)?></p>

                      <br>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal" style="background-color: #9D0D0D; border-color: rgb(136, 23, 27)">Edit Profile</button>
                    <a href="#" class="card-link"><?php print_r($logout)?></a>
                  </div>
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
                        <form class="form-horizontal" method="post" action="updateProfile.php">
                            <div class="form-group">
                                  <label class="col-sm-2 control-label" for="date">Name</label>
                                  <div class="col-sm-4">
                                    <input name="name" placeholder="<?php print_r($name)?>" type="text"/>
                                  </div>
                                  <label class="col-sm-2 control-label" for="location">Surname</label>
                                  <div class="col-sm-4">
                                    <input name="surname" placeholder="<?php print_r($surname)?>" type="text"/>
                                  </div>
                            </div>
                            <div class="form-group">
                                  <label class="col-sm-2 control-label" for="time">Email</label>
                                  <div class="col-sm-4">
                                    <input type="email" placeholder="<?php print_r($email)?>" name="email"/>
                                  </div>
                                  <label class="col-sm-2 control-label" for="crimeType">Division</label>
                                  <div class="col-sm-4">
                                    <div class="dropdown dropdown-content">

                                        <select class="form-control" name="rank" style="width: 150px;">

                                            <option value=""></option>
                                            <option value="prevention">Prevention</option>
                                            <option value="criminalRecord">Criminal Record</option>
                                            <option value="forensicScience">Forensic Science</option>
                                            <option value="management">Management</option>
                                            <option value="operational response">Operational Response</option>
                                            <option value="protectionSecurity">Protection and Security</option>
                                        </select>
                                    </div>
                                  </div>
                            </div>

                            <div class="form-group">
                                  <label class="col-sm-2 control-label" for="status">Rank</label>
                                  <div class="col-sm-4">
                                    <div class="dropdown dropdown-content">

                                        <select class="form-control" name="rank" style="width: 150px;">
                                            <option value=""></option>
                                            <option value="chef">General</option>
                                            <option value="lieutnantGeneral">Lieutnant-General</option>
                                            <option value="majorGeneral">Major-General</option>
                                            <option value="brigadier">Brigadier</option>
                                            <option value="colonel">Colonel</option>
                                            <option value="major">Major</option>
                                            <option value="lieutenant">Lieutenant</option>
                                            <option value="sergeant">Sergeant</option>
                                        </select>
                                    </div>
                                  </div>
                                <label class="col-sm-2 control-label" >Police Station </label>
                                  <div class="col-sm-4">
                                    <div class="dropdown">
                                      <select class="form-control" style="width:150px;" name="policeStation">
                                          <option value=""></option>
                                          <?php

                                              //  $link = mysqli_connect("localhost", "root", "root", "capewatchdb");

                                              //  $query = "SELECT policestation FROM `police_station`";

                                              //  $result = mysqli_query($link, $query)  or die('Query fail: ' . mysqli_error());

                                            //    while($row = mysqli_fetch_array($result)){
                                              //      echo "<option value=".$row['policestation'].">".$row['policestation']."<option>";
                                                //}

                                            ?>
                                        </select>
                                    </div>
                                  </div>
                            </div>

                    </form>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-danger" name="save">Save changes</button>
                      </div>
                    </div>
                  </div>
                </div>


                <br>
                <div class="card-div">
                    <div class="card-1 col-sm-3 col-sm-offset-1" style="margin-top: 10px; width:20rem; border:black solid 1px; padding:10px; background-color: white; border-radius:10px;">
                      <p style="text-align:center;"><img class="card-img-top" src="images/reports.png" alt="Card image cap" style="width:50%;"></p>
                        <div class="card-body">
                          <div class="card-title">
                            <h4 style="color: #9D0D0D">Reports</h4>
                          </div>
                            <p class="card-text">Go to the <b>Reports</b> page to view reports or file a new case report</p>
                            <a href="reports.html" class="btn btn-danger">Reports  <i class="glyphicon glyphicon-share-alt"></i></a>

                        </div>
                    </div>

                    <div class="card-2 col-sm-3 col-sm-offset-1" style="margin-top: 10px; width:20rem; border:black solid 1px; padding:10px; background-color: white; border-radius:10px;">
                      <p style="text-align:center;"><img class="card-img-top" src="images/icon-graph.png" alt="Card image cap" style="width:50%;"></p>
                        <div class="card-body">
                          <div class="card-title">
                            <h4 style="color: #9D0D0D">Statistics</h4>
                          </div>
                            <p class="card-text">View the current <b>crime statistics</b> of the greater Cape Town area</p>
                            <a href="stats.html" class="btn btn-danger">Statistics  <i class="glyphicon glyphicon-share-alt"></i></a>
                        </div>
                    </div>

                    <div class="card-3 col-sm-3 col-sm-offset-1" style="margin-top: 20px; width:20rem; border:black solid 1px; padding:10px; background-color: white; border-radius:10px;">
                      <p style="text-align:center;"><img class="card-img-top" src="images/alert-icon.png" alt="Card image cap" style="width:50%;"></p>
                        <div class="card-body">
                          <div class="card-title">
                            <h4 style="color: #9D0D0D">Hotspots</h4>
                          </div>
                            <p class="card-text">View the latest crime rates per area on the <b>hotspots</b> page</p>
                            <a href="hotspots.html" class="btn btn-danger">Hotspots  <i class="glyphicon glyphicon-share-alt"></i></a>
                        </div>
                    </div>

                    <div class="card-4 col-sm-3 col-sm-offset-1" style=" margin-top: 20px; width:20rem; border:black solid 1px; padding:10px; background-color: white; border-radius:10px;">
                      <p style="text-align:center;"><img class="card-img-top" src="images/contact-icon.png" alt="Card image cap" style="width:50%;"></p>
                        <div class="card-body">
                          <div class="card-title">
                            <h4 style="color: #9D0D0D">Contact Us</h4>
                          </div>
                            <p class="card-text"> Visit the <b>contact us</b> page to get in touch with the developers</p>
                            <a href="contact.html" class="btn btn-danger">Contact Us  <i class="glyphicon glyphicon-share-alt"></i></a>
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

          n =  new Date();
          y = n.getFullYear();
          m = n.getMonth() + 1;
          d = n.getDate();
          document.getElementById("date").innerHTML = m + "/" + d + "/" + y;


      </script>
  </body>
</html>
