<?php

 session_start();

$error ="";

if (array_key_exists("logout", $_GET)){

    unset($_SESSION);

    setcookie("id", "", time() - 60*60);

    $_COOKIE["id"] = " ";

} else if (array_key_exists("id", $_SESSION) OR array_key_exists("id", $_COOKIE)){

    header("Location: profile.php?login=1");
}

if (array_key_exists("submit", $_POST)){

    $link = mysqli_connect("localhost", "root", "root", "capewatchdb");

    if(mysqli_connect_error()){

        die("Datbase Connection Error");
    }



    if (!$_POST["email"]){

        $error.= "An email address is required<br>";
    }

    if (!$_POST["password"]){

        $error.= "A password is required<br>";
    }

    if($error != ""){
        $error = "<p> There were error(s) in your form:</p>".$error;

    } else {



        $query = "SELECT * FROM `police_user` WHERE email = '".mysqli_real_escape_string($link, $_POST['email'])."'";

        $result = mysqli_query($link, $query);


        $row = mysqli_fetch_array($result);



        if(isset($row)){

            $hashedPassword = md5(md5($row['id']).$_POST['password']);

            if ($hashedPassword == $row['password']){

                $_SESSION['id'] = $row['id'];



                if($_POST['stayLoggedIn'] == '1') {

                    setcookie("id", $row['id'], time() + 60*60*24*365);

                }

                header("Location: profile.php");
            }      
        }  else {

            $error .= "That email/password combination could not be found";
        }
    }
}

?>

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
  <body class="image-background">
    <nav class="navbar navbar-default navbar-inverse">
      <div class="container-fluid"></div>
      <div class="navbar-header">
        <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar-links" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="index.html"><img src="images/sheriff.svg" alt="Police logo" id="badge"></a>
      </div>
      <div class="collapse navbar-collapse" id="navbar-links">
        <ul class="nav navbar-nav navbar-right"></ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="index.html">Home</a></li>
          <li class="active"><a href="login.php">Login</a></li>
          <li><a href="profile.php">Profile</a></li>
          <li><a href="reports.html">Reports</a></li>
          <li><a href="Statistics/statistic.php">Statistics</a></li>
          <li><a href="hotspots.html">Hotspots</a></li>
          <li><a href="contact.html">Contact Us</a></li>
        </ul>
      </div>
    </nav>
    <div class="container">
      <div class="login-div">
        <div class="text-center">
          <h4>Login</h4>
          <div class="login-form-1">

            <form class="text-left" id="login-form" method="post" action="profile.php">
              <div class="login-form-main-message"></div>
              <div class="main-login-form">
                <div class="login-group" >
                  <div class="form-group">
                    <input class="form-control" type="email" name="email" placeholder="Email" id="llg_username">
                  </div>
                  <div class="form-group">
                    <input class="form-control" type="password" name="password" placeholder="Password" id="lg_password">
                  </div>
                <div class="form-group">
                    <p><input style="color:white" type="checkbox" name="StayLoggedIn" value=1> Stay Logged in</p>
                  </div>


                </div>


                <button class="login-button" type="submit"  name="submit"><i class="glyphicon glyphicon-chevron-right"></i></button>
                <p class="marginTops text-center" id="whiteText">New User?    <a href="register.php">Create Account</a></p>
                <div class="text-center" id="whiteText"><a href="#">Forgot Password?</a></div>
              </div>
            </form>
              <br>
              <div class="alert alert-danger">

                  <?php print_r($error)?>

              </div>
          </div>
        </div>
      </div>
    </div>


  </body>
</html>
