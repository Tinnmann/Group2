<%--
    Document   : contact
    Created on : 13 Sep 2017, 12:18:09 PM
    Author     : Sydney Twigg
--%>

<%@ page import="mail.java.ContactUs"%>
<%@ page import="javax.mail.MessagingException;"%>

<%
    String serverMessage = null;
    String status = null;
    String name =  request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    if (request.getParameter("submit") != null){
        ContactUs contactUs = new ContactUs();
        contactUs.setMailServerProperties();

        String emailSubject = "--NEW MESSAGE - CAPE WATCH--";
        String emailBody = "Name: " + name + "\n\nEmail Address: " + email + "\n\nMessage:" + message;

        /*if (request.getParameter("name") != null){
            emailBody = "Sender Name: " + name;
        }
        if (request.getParameter("email") != null){
            emailBody = "\nSender Email: " + email;
        }
        if (request.getParameter("message") != null){
            emailBody = "\nMessage: \n" + message;
        }*/

        contactUs.createEmailMessage(emailSubject, emailBody);
            try {
                contactUs.sendEmail();
        } catch (MessagingException me) {
                serverMessage = "Error in Sending Email!" + me.toString();
        }
}

%>
<!DOCTYPE html>
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
    <link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet">
  </head>
  <body class="world_background">
    <nav class="navbar navbar-default navbar-inverse">
      <div class="container-fluid"></div>
      <div class="navbar-header">
        <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar-links" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="index.html"><img src="images/CapeWatchLogo.png" alt="Police logo" id="badge"></a>
        <a class="navbar-text" href="index." id="whiteText">Cape Watch</a>
      </div>
      <div class="collapse navbar-collapse" id="navbar-links">
        <ul class="nav navbar-nav navbar-right"></ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="index.html">Home</a></li>
          <li><a href="login.html">Login</a></li>
          <li><a href="profile.jsp">Profile</a></li>
          <li><a href="stats3.jsp">Statistics</a></li>
          <li><a href="hotspots.html">Hotspots</a></li>
          <li class="active"><a href="contact.jsp">Contact Us</a></li>
        </ul>
      </div>
    </nav>
    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="about_us">
            <h1>Contact Us</h1>
            <div class="titleline-icon"></div>
            <p class="larger-text">Send us a message </p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-8">
            <div class="contactUS">
              <form name="sendMessage" novalidate id="contactForm">
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <input class="form-control" type="text" placeholder="Enter your name" required="" pattern="^[A-Z]{1}[a-z]+[a-zA-Z\-\s]+" title="Please enter your name" data-validation-required-message="Please enter your name." id="name" name="name">
                    </div>
                    <div class="form-group">
                      <input type="email" placeholder="Enter your email" required="" data-validation-required-message="Please enter your E-mail address" id="email" name="email">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <textarea class="form-control" placeholder="Your message..." required="" data-validation-required-message="Please enter a message" id="message" name="message"></textarea>
                    </div>
                  </div>
                  <div class="col-lg-12 text-center col-sm-offset-3">
                    <div id="success">
                      <button class="btn btn-xl get btn-warning" type="submit" name="submit">Send Message</button>
                    </div>
                  </div>
                </div>


              <!--Test
              <%
                if (null != serverMessage) {
                        out.println("<div class='" + status + "'>"
                                        + serverMessage + "</div>");
                }
		%>
             -->

              </form>
            </div>
          </div>
          <div class="col-md-4" id="whiteText">
            <p class="large-text">
              Xmeagol is a website and software solutions company based in Cape Town, South Africa. Created due to a group project.</p>
              <br>
                <p class="large-text">
                    We offer services in:
                </p>
            <ul class="large-text">
              <li>Web design</li>
              <li>Web development</li>
              <li>Software development</li>
              <li>Database development</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>
