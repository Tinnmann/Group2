<%--
    Document   : reports
    Created on : 21 Sep 2017, 5:07:29 PM
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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <body class="backgroundcolor">
    <nav class="navbar navbar-default navbar-inverse">
      <div class="container-fluid"></div>
      <div class="navbar-header">
        <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar-links" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="index.html"><img src="images/CapeWatchLogo.png" alt="Police logo" id="badge"/></a><a class="navbar-text" href="index." id="whiteText">Cape Watch </a>
      </div>
      <div class="collapse navbar-collapse" id="navbar-links">
        <ul class="nav navbar-nav navbar-right"></ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="index.html">Home</a></li>
          <li><a href="login.html">Login</a></li>
          <li><a href="profile.html">Profile</a></li>
          <li class="active"><a href="reports.jsp">Reports</a></li>
          <li><a href="stats.html">Statistics</a></li>
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
                  <input class="form-control" type="text" name="q" placeholder="Search for" required="required" id="system-search"/><span class="input-group-btn">
                    <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button></span>
                </div>
              </form>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <div class="table-responsive">
                <table class="table table-list-search" id="reportTable">
                    <%
                        try{
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/capewatchdb", "root", "");
                            String q = "SELECT * FROM crime_case";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(q);

                            String crimeID = "";
                            String postedBy= "";
                            String date= "";
                            String location= "";
                            String time= "";
                            String crimeType= "";
                            String status= "";

                            while (rs.next()){
                                crimeID = rs.getString(2);
                                postedBy = rs.getString(3);
                                date = rs.getString(4);
                                location = rs.getString(5);
                                time = rs.getString(6);
                                crimeType = rs.getString(7);
                                status = rs.getString(8);
                            }

                    %>

                        <thead>
                        <tr>
                            <th>Reports ID</th>
                            <th>Officer ID</th>
                            <th>Date</th>
                            <th>Location</th>
                            <th>Time</th>
                            <th>Crime Type</th>
                            <th>Status</th>
                            <th>Details</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td> <% out.println(crimeID);%></td>
                            <td><% out.println(postedBy); %>; </td>
                            <td><% out.println(date); %></td>
                            <td><% out.println(location); %></td>
                            <td> <% out.println(time); %></td>
                            <td> <% out.println(crimeType); %></td>
                            <td>
                            <div class="currentStatus"><span class="label label-warning"><% out.println(status); %></span>
                                <button class="btn btn-default" type="button" name="editButton" id="editButton"><i class="glyphicon glyphicon-pencil"></i></button>
                            </div>
                            </td>
                            <td>
                                <button class="btn btn-success btn-xs" type="button" data-title="Details" data-toggle="modal" data-target="#detailsModal"> <span class="glyphicon glyphicon-zoom-in"></span></button>
                            </td>
                            <td>
                                <button class="btn btn-danger btn-xs" type="button" name="delete"> <span class="glyphicon glyphicon-remove"></span></button>
                            </td>
                        </tr>

                        </tbody>
                        <%
                        }

                        catch(Exception e){
                            System.out.println(e);
                        }
                        %>
                    </table>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-3">
              <button class="btn btn-info" id="submitBtn"type="button" data-toggle="modal" data-target="#myModal">submit a Report </button>
            </div>
            <div class="col-sm-2 col-sm-offset-7">
              <button class="btn btn-info" type="button" data-toggle="modal" data-target="#uploadModal">upload a file</button>
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
                        <input type="text" name="officerID" required="required"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="date">Date</label>
                      <div class="col-sm-4">
                        <input id="date" name="date" placeholder="MM/DD/YYYY" type="text" data-date-end-date="0d" required="required"/>
                      </div>
                      <label class="col-sm-2 control-label" for="location">Location</label>
                      <div class="col-sm-4">
                        <input type="text" name="location" required="required"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="time">Time</label>
                      <div class="col-sm-4">
                        <input type="time" name="time" required="required"/>
                      </div>
                      <label class="col-sm-2 control-label" for="status">Status</label>
                      <div class="col-sm-4">
                        <select id="modal-select">
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
                            <option>Murder</option>
                            <option>Sexual offences</option>
                            <option>Attempted Murder</option>
                            <option>Assault with the intent to inflict grievous bodily</option>
                            <option>Common assault</option>
                            <option>Common robbery</option>
                            <option>Robbery with aggravating circumstances</option>
                          </optgroup>
                          <optgroup label="Contact related crimes">
                            <option>Arson</option>
                            <option>Malicious damage to property</option>
                          </optgroup>
                          <optgroup label="Property Related crimes">
                            <option>Burglary at non-residential premises</option>
                            <option>Burglary at residential premises</option>
                            <option>Theft of motor vehicle and motorcycle</option>
                            <option>Theft out of or from motor vehicle</option>
                            <option>Stock-theft</option>
                          </optgroup>
                          <optgroup label="Crime detected as a result of police action">
                            <option>Illegal possession of firearms and ammunition</option>
                            <option>Drug related crime</option>
                            <option>Driving under the influence of alcohol or drugs</option>
                            <option>Sexual offences as a result of police action</option>
                          </optgroup>
                          <optgroup label="Other serious crimes">
                            <option>All theft not mentioned elsewhere</option>
                            <option>Commercial crime</option>
                            <option>Shoplifting</option>
                          </optgroup>
                          <optgroup label="Subcategories of aggravated robbery">
                            <option>Carjacking</option>
                            <option>Truck hijacking</option>
                            <option>Robbery at residential premises</option>
                            <option>Robbery at non-residential premises</option>
                            <option>Bank robbery</option>
                            <option>Robbery of cash in transit</option>
                          </optgroup>
                          <optgroup label="Other ">
                            <option>Culpable homicide</option>
                            <option>Public violence</option>
                            <option>Crimen injuria</option>
                            <option>Neglect and ill-treatment of children</option>
                            <option>Kidnapping</option>
                          </optgroup>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <h3 class="col-sm-12 text-center" id="header">Injured Party (optional)</h3>
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
                        <input type="text" name="race"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="age">Age </label>
                      <div class="col-sm-4">
                        <input type="number" min="1" max="100" name="age"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-2 col-sm-offset-5">
                        <button class="btn btn-default" type="submit" onclick="submitForm()">Submit</button>
                      </div>
                    </div>
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
          <div class="modal fade" role="dialog" id="uploadModal">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header text-center" id="header">Select a file from your computer
                  <button class="close" type="button" data-dismiss="modal">&times</button>
                </div>
                <div class="modal-body">
                  <form action="" method="post" enctype="multipart/form-data" id="js-upload-form">
                    <div class="form-inline">
                      <div class="form-group">
                        <div class="col-sm-4">
                          <input type="file" name="file"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-4">
                          <button class="btn btn-sm btn-primary" type="submit" id="js-upload-submit">Upload files</button>
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
