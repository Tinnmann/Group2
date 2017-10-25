<%--
    Document   : reports
    Created on : 06 Oct 2017, 1:05:07 PM
    Author     : TINASHE
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Cape Watch</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css"/>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet"/>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
    <script type="text/javascript" src="js/datepicker.js"></script>
    <script type="text/javascript" src="js/tableFilter.js"></script>
    <script type="text/javascript" src="js/reset.js"></script>
    <script type="text/javascript" src="js/addVictim.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <body class="backgroundcolor">
    <nav class="navbar navbar-default navbar-inverse">
      <div class="container-fluid"></div>
      <div class="navbar-header">
        <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar-links" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="index.html"><img src="images/CapeWatchLogo.png" alt="Police logo" id="badge"/></a><a class="navbar-text" href="index." id="whiteText">Cape Watch </a>
      </div>
      <div class="collapse navbar-collapse" id="navbar-links">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="index.html">Home</a></li>
          <li><a href="login.html">Login</a></li>
          <li><a href="profile.jsp">Profile</a></li>
          <li><a href="stats.jsp">Statistics</a></li>
          <li><a href="hotspots.html">Hotspots</a></li>
          <li><a href="contact.jsp">Contact Us</a></li>
        </ul>
      </div>
    </nav>
  </body>
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <h2 class="text-center" id="whiteText">Crime Reports</h2>
        <div class="panel-body">
          <div class="row">
            <div class="col-sm-3 col-sm-offset-9">
              <form action="#" method="get">
                <div class="input-group">
                  <input class="form-control" type="text" name="q" placeholder="Search for" required="required" id="system-search"/>
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                      <i class="glyphicon glyphicon-search"></i>
                    </button>
                  </span>
                </div>
              </form>
            </div>
          </div>
          <div class="span3">
            <div class="row">
              <div class="col-sm-12">
                <div class="table-responsive" styl="height: 80%; overflow-y: scroll;">
                  <p>

                  </p>
                  <table class="table table-list-search" id="reportTable">
                    <thead>
                      <%
                        try{
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/capewatchdb", "root", "");
                            String q = "SELECT * FROM crime_case";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(q);

                            int reportID;
                            String crimeID = "";
                            String postedBy= "";
                            String date= "";
                            String location= "";
                            String time= "";
                            String crimeType= "";
                            String status= "";

                            out.println("<tr><th>Report ID</th><th>Officer ID:</th><th>Date</th><th>Location</th><th>Time</th><th>Crime Type</th><th>Status</th><th>Details</th><tr>");
                      %>
                            </thead>
                            <tbody>

                            <%
                            while (rs.next()){
                                reportID = rs.getInt(1);
                                crimeID = rs.getString(2);
                                postedBy = rs.getString(3);
                                date = rs.getString(4);
                                location = rs.getString(5);
                                time = rs.getString(6);
                                crimeType = rs.getString(7);
                                status = rs.getString(8);
                                out.println("<tr><td><label name="reportID">" + reportID + "</label></td><td>" + postedBy + "</td><td>" + date+ "</td><td>"+location+"</td><td>"+time+"</td><td>"+crimeType+"</td><td><div"+" class='currentStatus'><span class='label label-primary'>"+ status+"</span> <button class='btn btn-default' type='button' name='editButton' data-toggle='modal' data-target='#editModal' id='editButton'><i class='glyphicon glyphicon-pencil'>" +"</i></button></div></td><td><button "+"class='btn btn-success btn-xs' type='button' data-title='Details' data-toggle='modal' data-target='#detailsModal'> <span class='glyphicon glyphicon-zoom-in'></span> </button> </td></tr>");
                            }


                        }
                        catch(Exception e){
                            System.out.println(e);
                        }
                        %>
                        </tbody>
                    </table>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-3">
              <button class="btn btn-info" id="submitBtn"type="button" data-toggle="modal" data-target="#myModal">submit a Report </button>
            </div>
          </div>
          <div class="modal fade" role="dialog" id="myModal">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header text-center" id="header">Submit a report
                  <button class="close" type="button" data-dismiss="modal">&times</button>
                </div>
                <div class="modal-body">
                  <form class="form-horizontal" method="post" action="Fill" name="report-form" id="report-form">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="officerID">Officer ID</label>
                      <div class="col-sm-4">
                        <input type="text" name="userID" required="required"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="date">Date</label>
                      <div class="col-sm-4">
                        <input id="date" name="date" placeholder="MM/DD/YYYY" type="text" data-date-end-date="0d" required="required"/>
                      </div>
                      <label class="col-sm-2 control-label" for="location">Location</label>
                      <div class="col-sm-4">
                        <select name="location" required="required" id="modal-select">
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
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="time">Time</label>
                      <div class="col-sm-4">
                        <input type="time" name="time" required="required"/>
                      </div>
                      <label class="col-sm-2 control-label" for="status">Status</label>
                      <div class="col-sm-4">
                        <select name="status" id="modal-select">
                          <option value="open" name="open">open</option>
                          <option value="closed" name="closed">closed</option>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="crimeType">Crime Type</label>
                      <div class="col-sm-10">
                        <select name="crimeType" id="modal-select">
                          <optgroup label="Contact Crimes (Crimes against the person)">
                            <option value="Murder">Murder</option>
                            <option value="Sexual Offences">Sexual offences</option>
                            <option value="Attempted murder">Attempted Murder</option>
                            <option value="Assault">Assault with the intent to inflict grievous bodily harm</option>
                            <option value="Common Assault">Common assault</option>
                            <option value="Common Robbery">Common robbery</option>
                            <option value="Robbery">Robbery with aggravating circumstances</option>
                          </optgroup>
                          <optgroup label="Contact related crimes">
                            <option value="Arson">Arson</option>
                            <option value="Property Damage">Malicious damage to property</option>
                          </optgroup>
                          <optgroup label="Property Related crimes">
                            <option value="Burglary non-res">Burglary at non-residential premises</option>
                            <option value="Burglary res">Burglary at residential premises</option>
                            <option value="Vehicle theft">Theft of motor vehicle and motorcycle</option>
                            <option value="Theft from vehicle">Theft out of or from motor vehicle</option>
                            <option value="Stock-theft">Stock-theft</option>
                          </optgroup>
                          <optgroup label="Crime detected as a result of police action">
                            <option value="Illegal Firearms">Illegal possession of firearms and ammunition</option>
                            <option value="Drug related">Drug related crime</option>
                            <option value="Driving Alcohol">Driving under the influence of alcohol or drugs</option>
                            <option value="Sexual Offence Police">Sexual offences as a result of police action</option>
                          </optgroup>
                          <optgroup label="Other serious crimes">
                            <option value="Theft">All theft not mentioned elsewhere</option>
                            <option value="Commercial Crime">Commercial crime</option>
                            <option value="Shoplifting">Shoplifting</option>
                          </optgroup>
                          <optgroup label="Subcategories of aggravated robbery">
                            <option value="Carjacking">Carjacking</option>
                            <option value="Truck Hijacking">Truck hijacking</option>
                            <option value="Robbery res">Robbery at residential premises</option>
                            <option value="Robbery non-res">Robbery at non-residential premises</option>
                            <option value="Bank robbery">Bank robbery</option>
                            <option value="Robbery trans">Robbery of cash in transit</option>
                          </optgroup>
                          <optgroup label="Other ">
                            <option value="Culpable homicide">Culpable homicide</option>
                            <option value="Public violence">Public violence</option>
                            <option value="Crimen Injuria">Crimen injuria</option>
                            <option value="Child Neglect">Neglect and ill-treatment of children</option>
                            <option value="Kidnapping">Kidnapping</option>
                          </optgroup>
                        </select>
                      </div>

                    <div class="form-group">
                      <h3 class="col-sm-12 text-center" id="header2">Injured Party (optional)</h3>
                    </div>
                    <div class="form-group">
                      <input type="hidden" name="counter" value="1"/>
                      <div id="victim-menu">
                        <div id="victim">
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="gender">Gender</label>
                            <div class="col-sm-4">
                              <select id="modal-select">
                                <option value="female" name="female">female</option>
                                <option value="male" name="male">male</option>
                                <option value="other" name="other">other</option>
                              </select>
                            </div>
                            <label class="col-sm-2 control-label" for="race">Race</label>
                            <div class="col-sm-4">
                              <select id="modal-select">
                                <option value="white" name="white">white</option>
                                <option value="black" name="black">black</option>
                                <option value="coloured" name="coloured">coloured</option>
                                <option value="asian" name="asian">asian</option>
                                <option value="indian" name="indian">indian</option>
                                <option value="other" name="other">other</option>
                              </select>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="age">Age </label>
                            <div class="col-sm-4">
                              <input type="number" min="1" max="100" name="age"/>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="btn" id="button-toggle"><i class="glyphicon glyphicon-plus" aria-hidden="true" id="icon-padding"></i>Add Injured Party</label>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-2 col-sm-offset-5">
                        <button class="btn btn-default" type="submit" onclick="submitForm()">Submit</button>
                      </div>
                    </div>
                         <%
                             int crimeType = request.getParameter("crimeType");





String user= "root";
String pass= "";
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/capewatchdb", user, pass);
Statement st= conn.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM type_of_crime where crimeName='"+crimeType+"'");
                            crimeID = rs.getString(1);
                             /%>

                  </form>

                </div>
              </div>
            </div>
          </div>
          <div class="modal fade" role="dialog" id="detailsModal">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header text-center" id="header">More Details
                  <button class="close" type="button" data-dismiss="modal">&times</button>
                </div>
                <div class="modal-body">
                  <div class="row">
                    <div class="col-sm-6">
                      <label class="control-label">Date:</label>
                      <label class="detailsLabel" for="date" name="date">test</label>
                    </div>
                    <div class="col-sm-6">
                      <label class="control-label">Location:</label>
                      <label class="detailsLabel" for="location" name="location">test </label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <label class="control-label">Injured party age:</label>
                      <label class="detailsLabel" for="time" name="time" min="0" max="100">test</label>
                    </div>
                    <div class="col-sm-6">
                      <label class="control-label">Injured party race:</label>
                      <label class="detailsLabel" for="time" name="time">test</label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <label class="control-label">Injured party gender:</label>
                      <label class="detailsLabel" for="time" name="time">test</label>
                    </div>
                    <div class="col-sm-6">
                      <label class="control-label">Crime Type:</label>
                      <label class="detailsLabel" for="crimeType" name="crimeType">test</label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <label class="control-label">Status:</label>
                      <label class="detailsLabel" for="status" name="status">Open</label>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button class="btn btn-default" type="button" data-dismiss="modal" role="button">Close</button>
                </div>
              </div>
            </div>
          </div>
          <div class="modal fade" role="dialog" id="editModal">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header text-center" id="header">Edit Status
                  <button class="close" type="button" data-dismiss="modal">&times</button>
                </div>
                <div class="modal-body">
                  <form action="#" method="post" name="Status-form">
                    <div class="row">
                      <div class="form-group">
                        <label class="col-sm-2 control-label status-font" for="status">Status</label>
                        <div class="col-sm-4">
                          <select name="status" id="modal-select">
                            <option value="open" name="open">open</option>
                            <option value="closed" name="closed">closed</option>
                          </select>
                        </div>
                        <div class="col-sm-2 col-sm-offset-2">
                          <button class="btn btn-default" type="submit" onclick="submitForm()">Submit</button>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</html>
