<%@page import="forgotPassword.util.Setup"%>
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
        <script type="text/javascript" src="js/openmodal.js"></script>
        <script type="text/javascript" src="js/addVictim.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script type="text/javascript">

            $(document).ready(function () {

                $('#reportTable').on('click', '.buttonD', function () {

                    var currentRow = $(this).closest("tr");

                    var detailID = currentRow.find("td:eq(0)").html();
                    var detailDate = currentRow.find("td:eq(2)").html();
                    var detailLocation = currentRow.find("td:eq(3)").html();
                    var detailCrimeType = currentRow.find("td:eq(5)").html();
                    var detailStatus = currentRow.find("td:eq(6)").text();

                    $('#dateD').html(detailDate);
                    $('#locationD').html(detailLocation);
                    $('#crimeTypeD').html(detailCrimeType);
                    $('#statusD').html(detailStatus);

                    $.ajax({
                        type: 'POST',
                        data: {
                            detailID: detailID
                        },
                        url: 'ajaxFetchAgeDetails.jsp',
                        success: function (result) {
                            $('#ageD').html(result);
                        }
                    });

                    $.ajax({
                        type: 'POST',
                        data: {
                            detailID: detailID
                        },
                        url: 'ajaxFetchRaceDetails.jsp',
                        success: function (result1) {
                            $('#raceD').html(result1);
                        }
                    });

                    $.ajax({
                        type: 'POST',
                        data: {
                            detailID: detailID
                        },
                        url: 'ajaxFetchGenderDetails.jsp',
                        success: function (result2) {
                            $('#genderD').html(result2);
                        }
                    });

                });

                $('#reportTable').on('click', '.buttonE', function () {

                    var currentRow = $(this).closest("tr");

                    var detailID = currentRow.find("td:eq(0)").html();
                    var detailStatus = currentRow.find("td:eq(6)").html();

                    var editBname = $("#editS").attr("name");
                    var editBvalue = $("#editS").attr("value");

                    if ($('.buttonCh').click(function () {
                        var valueOption = $(".changeCaseStat").val();

                        $.ajax({
                            type: 'POST',
                            data: {
                                detailID: detailID,
                                editBname: editBname,
                                editBvalue: editBvalue,
                                valueOption: valueOption
                            },
                            url: 'ajaxUpdateCaseStatus.jsp'
                        });

                    }))
                        ;

                }
                );

                $("span:contains('Closed')").removeClass().addClass("label label-primary");

            });
        </script>
    </head>
    <body class="backgroundcolor">
        <nav class="navbar navbar-default navbar-inverse">
            <div class="container-fluid"></div>
            <div class="navbar-header">
                <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar-links" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><img src="images/CapeWatchLogo.png" alt="Police logo" id="badge"/></a>
                <a class="navbar-text" href="index.html" id="whiteText">Cape Watch
                </a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-links">
                <ul class="nav navbar-nav navbar-right"></ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li>
                        <a href="login.html">Login</a>
                    </li>
                    <li>
                        <a href="profile.jsp">Profile</a>
                    </li>
                    <li class="active">
                        <a href="reports.jsp">Reports</a>
                    </li>
                    <li>
                        <a href="stat3.jsp">Statistics</a>
                    </li>
                    <li>
                        <a href="hotspots.html">Hotspots</a>
                    </li>
                    <li>
                        <a href="contact.jsp">Contact Us</a>
                    </li>
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
                        <div class="col-sm-3 col-sm-offset-9" style="margin-bottom: 10px">
                            <form action="#" method="get">
                                <div class="input-group">
                                    <input class="form-control" type="text" name="q" placeholder="Search for" required="required" id="system-search"/>
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="submit" style="height: 28px;">
                                            <span>
                                                <i class="glyphicon glyphicon-search"></i>
                                            </span>
                                        </button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="span3">
                        <form method="post">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="table-responsive" style="max-height: 80vh; overflow-y: scroll;">
                                        <table class="table table-list-search" id="reportTable">
                                            <%

                                                String id = "";
                                                if (session.getAttribute("username") != null) {
                                                    id = session.getAttribute("username").toString();
                                                }

                                                String error = "";
                                                String test = "";
                                                String success = "";
                                                int reportID;

                                                int reportID2;
                                                String ageD = "";
                                                String raceD = "";
                                                String genderD = "";
                                                String areaD = "";

                                                try {
                                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                    Connection conn = DriverManager.getConnection(Setup.DB_URL, Setup.DB_USERNAME, Setup.DB_PASSWORD);
                                                    String q = "SELECT * FROM crime_case";
                                                    Statement st = conn.createStatement();
                                                    ResultSet rs = st.executeQuery(q);

                                                    String crimeID = "";
                                                    String postedBy = "";
                                                    String date = "";
                                                    String location = "";
                                                    String time = "";
                                                    String crimeType = "";
                                                    String status = "";

                                                    out.println("<thead><tr><th>Report ID</th><th>Officer ID:</th><th>Date</th><th>Location</th><th>Time</th><th>Crime Type</th><th>Status</th><th>Details</th><tr></thead>");
                                                    while (rs.next()) {
                                                        reportID = rs.getInt("reportID");
                                                        crimeID = rs.getString("crimeID");
                                                        postedBy = rs.getString("userID");
                                                        date = rs.getString("date");
                                                        location = rs.getString("location");
                                                        time = rs.getString("time");
                                                        crimeType = rs.getString("crimeType");
                                                        status = rs.getString("status");
                                                        out.println("<tbody id='myTable'><tr><form method='post'><td>" + reportID + "</td><td>" + postedBy + "</td><td>" + date + "</td><td>" + location + "</td><td>" + time + "</td><td>" + crimeType + "</td><td><div" + " class='currentStatus'><span class='label label-danger' id='colorStat'>" + status + "</span> <button class='btn btn-default buttonE' type='button' name='editButton' data-toggle='modal' data-target='#editModal' id='editButton'><i class='glyphicon glyphicon-pencil'>" + "</i></button></div></td><td><button class='btn btn-success btn-xs buttonD' data-title='Details' data-toggle='modal' data-target='#detailsModal' type='button'><span class='glyphicon glyphicon-zoom-in'></span> </button> </td></tr></form></tbody>");

                                                    }

                                                    String save = request.getParameter("submit");

                                                    
                                                    String date1 = request.getParameter("date");
                                                    String location1 = request.getParameter("location");
                                                    String time1 = request.getParameter("time");
                                                    String status1 = request.getParameter("status");
                                                    String crimeType1 = request.getParameter("crimeType");

                                                    String gender1 = request.getParameter("gender");
                                                    String race1 = request.getParameter("race");
                                                    String age1 = request.getParameter("age");
                                                    
                                                    String gender2 = request.getParameter("gender2");
                            String race2 = request.getParameter("race2");
                            String age2 = request.getParameter("age2");
                            
                            String gender3 = request.getParameter("gender3");
                            String race3 = request.getParameter("race2");
                            String age3 = request.getParameter("age3");
                            
                            String gender4 = request.getParameter("gender4");
                            String race4 = request.getParameter("race4");
                            String age4 = request.getParameter("age4");
                            
                            
                            String gender5 = request.getParameter("gender5");
                            String race5 = request.getParameter("race2");
                            String age5 = request.getParameter("age5");
                            
                            String gender6 = request.getParameter("gender6");
                            String race6 = request.getParameter("race6");
                            String age6 = request.getParameter("age6");
                            
                            String gender7 = request.getParameter("gender7");
                            String race7 = request.getParameter("race7");
                            String age7 = request.getParameter("age7");
                            
                            String gender8 = request.getParameter("gender8");
                            String race8 = request.getParameter("race8");
                            String age8 = request.getParameter("age8");
                            
                            
                            String gender9 = request.getParameter("gender9");
                            String race9 = request.getParameter("race9");
                            String age9 = request.getParameter("age9");
                            
                            String gender10 = request.getParameter("gender10");
                            String race10 = request.getParameter("race10");
                            String age10 = request.getParameter("age10");


                                                    String sql = "insert into crime_case(crimeID,userID,date,location,time,crimeType,status) values((select crimeID FROM type_of_crime where crimeName='" + crimeType1 + "'),'" + id + "','" + date1 + "','" + location1 + "','" + time1 + "','" + crimeType1 + "','" + status1 + "')";
                                                    int generatedKey = 0;
                                                    PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

                                                    if ("confirm".equals(save)) {

                                                        if (date1.isEmpty() == false && location1.isEmpty() == false && time1.isEmpty() == false && status1.isEmpty() == false && crimeType1.isEmpty() == false) {

                                                            ps.executeUpdate();
                                                            ResultSet rs1 = ps.getGeneratedKeys();

                                                            if (rs1.next()) {
                                                                generatedKey = rs1.getInt(1);
                                                            }

                                                            out.println(generatedKey);
                                                            success = success + "<p> You have successfully inserted a report</p>";

                                                        } else {

                                                            error = error + "<p>All fields must be completed - Please Try again</p>";
                                                        }

                                                        if (gender1.isEmpty() == false && age1.isEmpty() == false && race1.isEmpty() == false && location1.isEmpty() == false) {

                                                            st.executeUpdate("insert into injured_party(reportID,age,race,gender,area) values('" + generatedKey + "','" + age1 + "','" + race1 + "','" + gender1 + "','" + location1 + "')");

                                                        }
                                                        
                                                        if (gender2.isEmpty() == false && age2.isEmpty() == false && race2.isEmpty() == false && location1.isEmpty() == false) {
                                                            st.executeUpdate("insert into injured_party(reportID,age,race,gender,area) values('" + generatedKey + "','" + age2 + "','" + race2 + "','" + gender2 + "','" + location1 + "')");
                                                        }
                                                        if (gender3.isEmpty() == false && age3.isEmpty() == false && race3.isEmpty() == false && location1.isEmpty() == false) {
                                                            st.executeUpdate("insert into injured_party(reportID,age,race,gender,area) values('" + generatedKey + "','" + age3 + "','" + race3 + "','" + gender3 + "','" + location1 + "')");
                                                        }
                                                        if (gender4.isEmpty() == false && age4.isEmpty() == false && race4.isEmpty() == false && location1.isEmpty() == false) {
                                                            st.executeUpdate("insert into injured_party(reportID,age,race,gender,area) values('" + generatedKey + "','" + age4 + "','" + race4 + "','" + gender4 + "','" + location1 + "')");
                                                        }
                                                        if (gender5.isEmpty() == false && age5.isEmpty() == false && race5.isEmpty() == false && location1.isEmpty() == false) {
                                                            st.executeUpdate("insert into injured_party(reportID,age,race,gender,area) values('" + generatedKey + "','" + age5 + "','" + race5 + "','" + gender5 + "','" + location1 + "')");
                                                        }
                                                        if (gender6.isEmpty() == false && age6.isEmpty() == false && race6.isEmpty() == false && location1.isEmpty() == false) {
                                                            st.executeUpdate("insert into injured_party(reportID,age,race,gender,area) values('" + generatedKey + "','" + age6 + "','" + race6 + "','" + gender6 + "','" + location1 + "')");
                                                        }
                                                        if (gender7.isEmpty() == false && age7.isEmpty() == false && race7.isEmpty() == false && location1.isEmpty() == false) {
                                                            st.executeUpdate("insert into injured_party(reportID,age,race,gender,area) values('" + generatedKey + "','" + age7 + "','" + race7 + "','" + gender7 + "','" + location1 + "')");
                                                        }
                                                        if (gender8.isEmpty() == false && age8.isEmpty() == false && race8.isEmpty() == false && location1.isEmpty() == false) {
                                                            st.executeUpdate("insert into injured_party(reportID,age,race,gender,area) values('" + generatedKey + "','" + age8 + "','" + race8 + "','" + gender8 + "','" + location1 + "')");
                                                        }
                                                        if (gender9.isEmpty() == false && age9.isEmpty() == false && race9.isEmpty() == false && location1.isEmpty() == false) {
                                                            st.executeUpdate("insert into injured_party(reportID,age,race,gender,area) values('" + generatedKey + "','" + age8 + "','" + race9 + "','" + gender9 + "','" + location1 + "')");
                                                        }
                                                        if (gender10.isEmpty() == false && age10.isEmpty() == false && race10.isEmpty() == false && location1.isEmpty() == false) {
                                                            st.executeUpdate("insert into injured_party(reportID,age,race,gender,area) values('" + generatedKey + "','" + age10 + "','" + race10 + "','" + gender10 + "','" + location1 + "')");
                                                        }

                                                    }

                                                    String editStatus = request.getParameter("submitEdit");

                                                    String injuredDetails = request.getParameter("injuredID");
                                                    String q1 = "SELECT * FROM injured_party where reportID='" + injuredDetails + "'";

                                                    ResultSet rs1 = st.executeQuery(q1);

                                                    while (rs1.next()) {

                                                        reportID2 = rs1.getInt(1);
                                                        ageD = rs1.getString(2);
                                                        raceD = rs1.getString(3);
                                                        genderD = rs1.getString(4);
                                                        areaD = rs1.getString(5);

                                                    }

                                                } catch (Exception e) {
                                                    System.out.println(e);
                                                }
                                            %>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="row">
                            <div class="col-sm-3">
                                <button class="btn btn-info" id="submitBtn" type="button" data-toggle="modal" data-target="#myModal">Submit a Report
                                </button>
                            </div>

                            <%
                                if (!error.isEmpty()) {
                                    out.println("<div class='container alert alert-danger' style='width:220px;text-align:center; margin-top:10px;height:70px;'>" + error + "'</div>'");
                                } else if (!success.isEmpty()) {
                                    out.println("<div class='container alert alert-success' style='width:220px;text-align:center; margin-top:10px;height:70px;'>" + success + "'</div>'");
                                }
                            %>
                        </div>
                        <div class="modal fade" role="dialog" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header text-center" id="header">Submit a Report
                                        <button class="close" type="button" data-dismiss="modal">&times</button>
                                    </div>

                                    <!-- MODAL SUBMIT REPORT-->
                                    <div class="modal-body">
                                        <form class="form-horizontal" method="post" action="reports.jsp" id="report-form">
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
                                                    <input type="time" name="time" placeholder="HH:MM" pattern="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" title="Time should be input as HH:MM" required/>
                                                </div>
                                                <label class="col-sm-2 control-label" for="status">Status</label>
                                                <div class="col-sm-4">
                                                    <select name="status" id="modal-select">
                                                        <option value="Open" name="open">Open</option>
                                                        <option value="Closed" name="closed">Closed</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="crimeType">Crime Type</label>
                                                <div class="col-sm-10">
                                                    <select name="crimeType" id="modal-select">
                                                        <optgroup label="Contact Crimes (Crimes against the person)">
                                                            <option value="Murder">Murder</option>
                                                            <option value="Sexual offences">Sexual offences</option>
                                                            <option value="Attempted Murder">Attempted Murder</option>
                                                            <option value="Assault with the intent to inflict grievous bodily harm">Assault with the intent to inflict grievous bodily harm</option>
                                                            <option value="Common assault">Common assault</option>
                                                            <option value="Common robbery">Common robbery</option>
                                                            <option value="Robbery with aggravating circumstances">Robbery with aggravating circumstances</option>
                                                        </optgroup>
                                                        <optgroup label="Contact related crimes">
                                                            <option value="Arson">Arson</option>
                                                            <option value="Malicious damage to property">Malicious damage to property</option>
                                                        </optgroup>
                                                        <optgroup label="Property Related crimes">
                                                            <option value="Burglary at non-residential premises">Burglary at non-residential premises</option>
                                                            <option value="Burglary at residential premises">Burglary at residential premises</option>
                                                            <option value="Theft of motor vehicle and motorcycle">Theft of motor vehicle and motorcycle</option>
                                                            <option value="Theft out of or from motor vehicle">Theft out of or from motor vehicle</option>
                                                            <option value="Stock-theft">Stock-theft</option>
                                                        </optgroup>
                                                        <optgroup label="Crime detected as a result of police action">
                                                            <option value="Illegal possession of firearms and ammunition">Illegal possession of firearms and ammunition</option>
                                                            <option value="Drug related crime">Drug related crime</option>
                                                            <option value="Driving under the influence of alcohol or drugs">Driving under the influence of alcohol or drugs</option>
                                                            <option value="Sexual offences as a result of police action">Sexual offences as a result of police action</option>
                                                        </optgroup>
                                                        <optgroup label="Other serious crimes">
                                                            <option value="All theft not mentioned elsewhere">All theft not mentioned elsewhere</option>
                                                            <option value="Commercial crime">Commercial crime</option>
                                                            <option value="Shoplifting">Shoplifting</option>
                                                        </optgroup>
                                                        <optgroup label="Subcategories of aggravated robbery">
                                                            <option value="Carjacking">Carjacking</option>
                                                            <option value="Truck hijacking">Truck hijacking</option>
                                                            <option value="Robbery at residential premises">Robbery at residential premises</option>
                                                            <option value="Robbery at non-residential premises">Robbery at non-residential premises</option>
                                                            <option value="Bank robbery">Bank robbery</option>
                                                            <option value="RRobbery of cash in transit">Robbery of cash in transit</option>
                                                        </optgroup>
                                                        <optgroup label="Other ">
                                                            <option value="Culpable homicide">Culpable homicide</option>
                                                            <option value="Public violence">Public violence</option>
                                                            <option value="Crimen injuria">Crimen injuria</option>
                                                            <option value="Neglect and ill-treatment of children">Neglect and ill-treatment of children</option>
                                                            <option value="Kidnapping">Kidnapping</option>
                                                        </optgroup>
                                                    </select>
                                                </div>

                                            </div>
                                            <div class="form-group">
                                                <h3 class="col-sm-12 text-center" id="header2">Injured Party (Optional)</h3>
                                            </div>
                                            <div class="form-group">
                                                <input type="hidden" name="counter" value="1"/>
                                                <div id="victim-menu">
                                                    <div id="victim">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label" for="gender">Gender</label>
                                                            <div class="col-sm-4" id="genderid">
                                                                <select id="modal-select" name="gender" class="genderid">
                                                                    <option value=""></option>
                                                                    <option value="female">Female</option>
                                                                    <option value="male">Male</option>
                                                                    <option value="other" name="other">Other</option>
                                                                </select>
                                                            </div>
                                                            <label class="col-sm-2 control-label" for="race">Race</label>
                                                            <div class="col-sm-4" style="padding-right: 30px;" id="raceid">
                                                                <select id="modal-select" name="race">
                                                                    <option value=""></option>
                                                                    <option value="white">White</option>
                                                                    <option value="black">Black</option>
                                                                    <option value="coloured">Coloured</option>
                                                                    <option value="asian">Asian</option>
                                                                    <option value="indian">Indian</option>
                                                                    <option value="other">Other</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label" for="age">Age
                                                            </label>
                                                            <div class="col-sm-4"  id="ageid">
                                                                <input type="number" min="0" max="100" name="age"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="btn" id="button-toggle">
                                                    <i class="glyphicon glyphicon-plus" aria-hidden="true" id="icon-padding"></i>Add Injured Party</label>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-2 col-sm-offset-5">
                                                    <button class="btn btn-default" value="confirm" name="submit" type="submit">Submit</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- MODAL VIEW DETAILS -->

                        <div class="modal fade" role="dialog" id="detailsModal">
                            <div class="modal-dialog" style="width:80% !important;">
                                <form method="post">
                                    <div class="modal-content">
                                        <div class="modal-header text-center" id="header">More Details
                                            <button class="close" type="button" data-dismiss="modal">&times</button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <label class="control-label">Date:</label>
                                                    <p style="float:right;">
                                                        <span id="dateD"></span>
                                                    </p>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="control-label">Location:</label>
                                                    <p style="float:right;text-transform:capitalize;">
                                                        <span id="locationD"></span>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <label class="control-label">Injured Party Age:</label>
                                                    <p style="float:right;text-transform:capitalize;">
                                                        <span id="ageD"></span>
                                                    </p>

                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="control-label">Injured Party Race:</label>
                                                    <p style="float:right;text-transform:capitalize;">
                                                        <span id="raceD"></span>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <label class="control-label">Injured Party Gender:</label>
                                                    <p style="float:right; text-transform:capitalize;">
                                                        <span id="genderD"></span>
                                                    </p>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="control-label">Crime Type:</label>
                                                    <p style="float:right;text-transform:capitalize;">
                                                        <span id="crimeTypeD"></span>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <label class="control-label">Status:</label>
                                                    <p style="float:right;text-transform:capitalize;">
                                                        <span id="statusD"></span>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-default" type="button" data-dismiss="modal" role="button">
                                                <a href="reports.jsp">Close</a>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- MODAL Edit Status -->

                        <div class="modal fade" role="dialog" id="editModal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header text-center" id="header">Edit Status
                                        <button class="close" type="button" data-dismiss="modal">&times</button>
                                    </div>
                                    <div class="modal-body">
                                        <form method="post">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label status-font" for="status">Status</label>
                                                    <div class="col-sm-4">
                                                        <select name="status2" id="modal-select" class="changeCaseStat">
                                                            <option value="Open" name="openE">Open</option>
                                                            <option value="Closed" name="closedE">Closed</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-sm-2 col-sm-offset-2">
                                                        <button class="btn btn-default buttonCh" type="submit" id="editS" name="submitEdit" value="confirmEdit">Submit</button>
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
    </div>

</html>
