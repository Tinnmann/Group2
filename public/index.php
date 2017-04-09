<?php


     session_start();

    $error = "";    

    if (array_key_exists("logout", $_GET)) {
        
        unset($_SESSION);
        setcookie("id", "", time() - 60*60);
        $_COOKIE["id"] = "";  
        
    } 


    if (array_key_exists("submit", $_POST)){
        
        include ("connection.php");
        
        
        if (!$_POST['email']) {
            
            $error .= "An email address is required<br>";  
        } 
        
        
        if (!$_POST['password']) {
            
            $error .= "A password is required<br>";   
        } 
        
        
        if ($error != "") {
            
            $error = "<p>There were error(s) in your form:</p>".$error;
            
        } else {
            
            if ($_POST['signUP'] == '1') {
            
                    $query = "SELECT id FROM `users` WHERE email = '".mysqli_real_escape_string($link, $_POST['email'])."' LIMIT 1";

                    $result = mysqli_query($link, $query);

                    if (mysqli_num_rows($result) > 0) {

                        $error = "That email address is taken.";

            } else {

                    $query = "INSERT INTO `users` (`email`, `password`) VALUES ('".mysqli_real_escape_string($link, $_POST['email'])."', '".mysqli_real_escape_string($link, $_POST['password'])."')";

                        if (!mysqli_query($link, $query)) {

                            $error = "<p>Could not sign you up - please try again later.</p>";

                        } else {

                            $query = "UPDATE `users` SET password = '".md5(md5(mysqli_insert_id($link)).$_POST['password'])."' WHERE id = ".mysqli_insert_id($link)." LIMIT 1";

                            mysqli_query($link, $query);

                            $_SESSION['id'] = mysqli_insert_id($link);

                                if ($_POST['stayLoggedIn'] == '1') {

                                    setcookie("id", mysqli_insert_id($link), time() + 60*60*24*365);

                                    } 

                            header("Location: loggedinpage.php");

                        }

                } 
                
            } else {
                    
                    $query = "SELECT * FROM `users` WHERE email = '".mysqli_real_escape_string($link, $_POST['email'])."'";
                
                    $result = mysqli_query($link, $query);
                
                    $row = mysqli_fetch_array($result);
                
                    if (isset($row)) {
                        
                        $hashedPassword = md5(md5($row['id']).$_POST['password']);
                        
                        if ($hashedPassword == $row['password']) {
                            
                            $_SESSION['id'] = $row['id'];
                            
                            if ($_POST['stayLoggedIn'] == '1') {

                                    setcookie("id", $row['id'], time() + 60*60*24*365);

                                } 

                            header("Location: loggedinpage.php");
                                
                        } else {
                            
                            $error = "Your email/password is incorrect.";
                            
                        }
                        
                    } else {
                        
                        $error = "That email/password combination could not be found.";
                        
                    }
                    
                }
            
            }
        
        
    }
     
     
     
?>     




      

<nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse">
    
<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    
        <span class="navbar-toggler-icon"></span>
</button>
 
  <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      
    <ul class="navbar-nav ">
        
      <li class="nav-item">
        <a class="nav-link" href="index2.html">Home</a>
      </li>
        
        
      <li class="nav-item active">
        <a class="nav-link" href="#">Login<span class="sr-only">(current)</span></a>
      </li>
        
        
      <li class="nav-item">
        <a class="nav-link" href="#">Reports</a>
      </li>
        
        
      <li class="nav-item">
        <a class="nav-link" href="#">Statistics</a>
      </li>
        
        
        <li class="nav-item">
        <a class="nav-link" href="#">Hotspots</a>
      </li>
        
        
        <li class="nav-item">
        <a class="nav-link" href="#">About us</a>
      </li>
        
        <li class="nav-item">
        <a class="nav-link" href="#">Contact us</a>
      </li>
        
    </ul>
      
  </div>
    
</nav>


<?php include ("header.php"); ?>;
      
    <div class="container">
        
    
        <h1> Login </h1>
        
        
        <div id="error"><?php echo $error; ?></div>
        

        <form method="post" id="signUpForm">
    
            <p> Register </p>
    
            <fieldset class="form-group">
        
                <input type="email" class="form-control" name="email" placeholder="E-mail address">
        
            </fieldset>
            
    
            <fieldset class="form-group">
    
                <input type="password" class="form-control" name="password" placeholder="Choose a Password">
        
            </fieldset>
            
    
            <div class="checkbox">
                <label>
                
                    <input type="checkbox" name="stayLoggedIn" value=1>
                    Stay Logged in
                </label>
                
            </div>
    
            
            <fieldset class="form-group">
    
                <input type="hidden" name="signUP" value="1">

                <input type="submit" class="btn btn-success" name="submit" value="Sign Up">
        
            </fieldset>
    
            <p><a class="toggleForms">Log in</a></p>
    

        </form>
        
        

        <form method="post" id="logInForm">
            
    
            <p> Log in using your username and password.</p>
            

            <fieldset class="form-group">
        
                <input type="email" class="form-control" name="email" placeholder="E-mail address">

            </fieldset>
    
            <fieldset class="form-group">
    
                <input type="password" class="form-control" name="password" placeholder="Your Password">
        
            </fieldset>
            
            
    
            <div class="checkbox">
                <label>

                <input type="checkbox" name="stayLoggedIn" value=1>

                Stay Logged in

             </label>
            </div>
            
    
            <input type="hidden" name="signUP" value="0">
    
            
            <fieldset class="form-group">

                <input type="submit" class="btn btn-success" name="submit" value="Log in">

            </fieldset>
            
    
            <p><a class="toggleForms">Sign up</a></p>

        </form>
        
</div>
      

    <?php include ("footer.php"); ?>
