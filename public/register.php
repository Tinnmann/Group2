<?php

 session_start();

$error ="";



if (array_key_exists("submit", $_POST)){
    
    $link = mysqli_connect("localhost", "root", "root", "capewatchdb");
    
    if(mysqli_connect_error()){
        
        die("Datbase Connection Error");
    }
    
    
    if (!$_POST["officerId"]){
        
        $error.= "An Officer ID is required<br>";
    }
    
    if (!$_POST["email"]){
        
        $error.= "An email address is required<br>";
    }
    
    if (!$_POST["password"]){
        
        $error.= "A password is required<br>";
    }
    
    if (!$_POST["name"]){
        
        $error.= "A name is required<br>";
    }
    
    if (!$_POST["surname"]){
        
        $error.= "Your surname is required<br>";
    }
    
    if (!$_POST["policeStation"]){
        
        $error.= "A police Station is required<br>";
    }
    
    if (!$_POST["division"]){
        
        $error.= "A division is required<br>";
    }
    
    if (!$_POST["rank"]){
        
        $error.= "A rank is required<br>";
    }
    
    
    
    if($error != ""){
        $error = "<p> There were error(s) in your form:</p>".$error;
        
    } else {
        
        $query = "SELECT id FROM `police_user` WHERE email = '".mysqli_real_escape_string($link, $_POST['email'])."' LIMIT 1";
        
        $result = mysqli_query($link, $query);
        
        if(mysqli_num_rows($result) > 0){
            
            $error = "- The user already exists";
            
        } else {
            
            $query = "INSERT INTO `police_user` (`officierID`, `email`, `password`, `name`, `surname`, `policeStation`, `division`, `rank`) VALUES ('".mysqli_real_escape_string($link, $_POST['officierId'])."', '".mysqli_real_escape_string($link, $_POST['email'])."', '".mysqli_real_escape_string($link, $_POST['password'])."', '".mysqli_real_escape_string($link, $_POST['name'])."', '".mysqli_real_escape_string($link, $_POST['surname'])."', '".mysqli_real_escape_string($link, $_POST['policeStation'])."',
            '".mysqli_real_escape_string($link, $_POST['division'])."',
            '".mysqli_real_escape_string($link, $_POST['rank'])."' )";
            
            if (!mysqli_query($link, $query)){
                
                $error = "<p> Could not signed you up - Please try again later.</p>";
            } else {
                
                $query = "UPDATE `police_user` SET password = '".md5(md5(mysqli_insert_id($link)).$_POST['password'])."' WHERE id = ".mysqli_insert_id($link)." LIMIT 1";
                
                mysqli_query($link, $query);
                
                $_SESSION['id'] = mysqli_insert_id($link);
                
                if ($_POST['StayLoggedIn'] == "1" ){
                    
                    setcookie('id', mysqli_insert_id($link), time() + 60*60*24*365);
                }
                
                header("Location: profile.php");
                
               
            }
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
      <script src="https://use.fontawesome.com/5149f9eb72.js"></script>
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
          <li><a href="login.php">Login</a></li>
          <li><a href="profile.html">Profile</a></li>
          <li><a href="reports.html">Reports</a></li>
          <li><a href="stats.html">Statistics</a></li>
          <li><a href="hotspots.html">Hotspots</a></li>
          <li><a href="contact.html">Contact Us</a></li>
        </ul>
      </div>
    </nav>
    <div class="container">
      <div class="row">
        <div class="col-lg-6 col-lg-push-3 col-md-12">
          <h2 class="text-center" id="whiteText">Register</h2>
          <form class="main-login form-horizontal" method="post">
            <div class="form-group">
              <label class="col-sm-2 control-label" for="officierId">Officer ID</label>
              <div class="col-sm-10">
                <input class="form-control" type="text" name="officerId" >
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="email">Email</label>
              <div class="col-sm-10">
                <input class="form-control" type="email" name="email" >
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="password">Password</label>
              <div class="col-sm-10"> 
                <input class="form-control" type="password" name="password" >
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="password">Confirm Password</label>
              <div class="col-sm-10"> 
                <input class="form-control" type="password" name="password" >
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="name">Name</label>
              <div class="col-sm-4">
                <input class="form-control" type="text" name="name" >
              </div>
              <label class="col-sm-2 control-label" for="surname">Surname </label>
              <div class="col-sm-4">
                <input class="form-control" type="text" name="surname" >
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" >Police Station </label>
              <div class="col-sm-10">
                <div class="dropdown">
                  <select class="form-control" style="width:37%;" name="policeStation">
                       
                      <?php 

                            $link = mysqli_connect("localhost", "root", "root", "capewatchdb");

                            $query = "SELECT policestation FROM `police_station`";

                            $result = mysqli_query($link, $query)  or die('Query fail: ' . mysqli_error());
                        
                            while($row = mysqli_fetch_array($result)){
                                echo "<option value=\"rank1\">".$row['policestation']."<option>";
                            }

                        ?>
                    </select>
                </div>
              </div>
            </div>
              
              
            <div class="form-group">
              <label class="col-sm-2 control-label">Division </label>
              <div class="col-sm-4">
                <div class="dropdown">
                  <select class="form-control" name="division">
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
              <label class="col-sm-2 control-label">Rank </label>
              <div class="col-sm-4">
                <div class="dropdown dropdown-content">
                    
                    <select class="form-control" name="rank">
                        <option value=""></option>
                        <option value="Chef">General</option>
                        <option value="Lieutnant-General">Lieutnant-General</option>
                        <option value="MajorGeneral">Major-General</option>
                        <option value="Brigadier">Brigadier</option>
                        <option value="Colonel">Colonel</option>
                        <option value="Major">Major</option>
                        <option value="Lieutenant">Lieutenant</option>
                        <option value="Sergeant">Sergeant</option>
                    </select>
                </div>
              </div>
            </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label">Stay Logged in </label>
                    <div class="col-sm-4">
                        <input style="color:white" type="checkbox" name="StayLoggedIn" value=1>
                  </div> 
                </div>
              
            <div class="form-group">
              <div class="col-sm-offset-3 col-sm-4">
                <button class="btn btn-primary pull-right" type="submit" name="submit">Submit</button>
              </div>
            </div>
              
              <div class="form-group">
                <button class="btn btn-primary pull-right" type="submit"><a href="login.php" style="color:white;"><i class="fa fa-arrow-left" aria-hidden="true"></i>   Go Back !</a></button>
              </div>
          </form>
            
             <br>
            <div id="error" style="text-align:center; width:250px; margin:0 auto;"><?php if ($error!="") {
    
                    echo '<div class="alert alert-danger" role="alert">'.$error.'</div>';
    
            } ?></div>
        
            
            
            
        </div>
          
      </div>
        
        
          
          
        
        <br>
          
    </div>
      
     
  </body>
</html>