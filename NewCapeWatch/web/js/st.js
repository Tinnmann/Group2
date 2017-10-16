/* var coordinates = {Atlantis,Strand,NoordHoek,FishHoek,Harare,Kraaifontein,LingelethuWest,Khayelitsha,Mfuleni,Delft,MitchellsPlain,PhillippiEast,
						Muizenberg,Steenberg,GrassyPark,Kirstenhof,Parow,Nyanga,ElsiesRiver,HoutBay,PhilippiCentral,BishopLavis,Gugulethu,Goodwood,
						Dieprivier,Manenberg,Milnerton,Wynberg,Langa,Lansdowne,Athlone,Mowbray,Claremont,Pinelands,Maitland,Rondebosch,SeaPoint,
						Woodstock,CapeTownCentral} */
						
	var colors = {Atlantis:"",Strand:"",NoordHoek:"",FishHoek:"",Harare:"",Kraaifontein:"",LingelethuWest:"",Khayelitsha:"",Mfuleni:"",Delft:"",MitchellsPlain:"",PhillippiEast:"",Muizenberg:"",Steenberg:"",GrassyPark:"",Kirstenhof:"",Parow:"",Nyanga:"",ElsiesRiver:"",HoutBay:"",					  PhilippiCentral:"",BishopLavis:"",Gugulethu:"",Goodwood:"",Dieprivier:"",Manenberg:"",Milnerton:"",Wynberg:"",Langa:"",Lansdowne:"",					 Athlone:"",Mowbray:"",Claremont:"",Pinelands:"",Maitland:"",Rondebosch:"",SeaPoint:"",Woodstock:"",CapeTownCentral:"",Belhar:"",                                  Bellville:"",BellvilleSouth:"",Bothasig:"",Brackenfell:"",CampsBay:"",Durbanville:"",Kensington:"",Kleinvlei:"",KuilsRivier:"",Macassar:"",                                   OceansView:"",Ravensmead:"",SimonsTown:"",SomersetWest:"",Stellenbosch:"",Strandfontein:"",TableView:""};
						
	var coordinates = {Atlantis:{lat:{lat1:-33.471857, lat2:-33.608355},lng:{lng1:18.446434, lng2:18.520935}},
					   Strand:{lat:{lat1:-34.095505, lat2:-34.136435},lng:{lng1:18.830722, lng2:18.862823}},
					   NoordHoek:{lat:{lat1:-34.083236, lat2:-34.118416},lng:{lng1: 18.366030, lng2:18.399675}},
					   FishHoek:{lat:{lat1:-34.115163, lat2:-34.145074},lng:{lng1:18.411717, lng2:18.425364}},
					   Harare:{lat:{lat1:-34.052962, lat2:-34.060251},lng:{lng1:18.670295, lng2:18.677162}},
					   Kraaifontein:{lat:{lat1:-33.822836, lat2:-33.877153},lng:{lng1:18.703874, lng2:18.752625}},
					   LingelethuWest:{lat:{lat1:-34.041445, lat2:-34.042814},lng:{lng1:18.659357, lng2:18.661357}},
					   Khayelitsha:{lat:{lat1:-33.986797, lat2:-34.054948},lng:{lng1:18.698977, lng2:18.644217}},
					   Mfuleni:{lat:{lat1:-33.986032, lat2:-34.012218},lng:{lng1:18.656260, lng2:18.685356}},
					   Delft:{lat:{lat1:-33.952950, lat2:-33.991956},lng:{lng1:18.631508, lng2:18.652966}},
					   MitchellsPlain:{lat:{lat1:-34.023476, lat2:-34.070130},lng:{lng1:18.541656, lng2:18.638988}},
					   PhillippiEast:{lat:{lat1:-34.001728, lat2:-34.056927},lng:{lng1:18.524193, lng2:18.622040}},
					   Muizenberg:{lat:{lat1:-34.106879, lat2:-34.090248},lng:{lng1:18.484668, lng2:18.495311}},
					   Steenberg:{lat:{lat1:-34.072638, lat2:-34.071945},lng:{lng1:18.471668, lng2:18.471732}},
					   GrassyPark:{lat:{lat1:-34.024518, lat2:-34.091502},lng:{lng1:18.491509, lng2:18.530133}},
					   Kirstenhof:{lat:{lat1:-34.065203, lat2:-34.079067,},lng:{lng1:18.447661, lng2:18.457317}},
					   Parow:{lat:{lat1:-33.860693, lat2:-33.932507},lng:{lng1:18.574142, lng2:18.614655}},
					   Nyanga:{lat:{lat1:-33.982970, lat2:-34.000655},lng:{lng1:18.573071, lng2:18.591267}},
					   ElsiesRiver:{lat:{lat1:-33.91024, lat2:-33.936737},lng:{lng1: 18.564379, lng2:18.581889}},
					   HoutBay:{lat:{lat1:-34.001239, lat2:-34.078337},lng:{lng1: 18.334708, lng2:18.402686}},
					   PhilippiCentral:{lat:{lat1:-34.001728, lat2:-34.056927},lng:{lng1:18.524193, lng2:18.622040}},
					   BishopLavis:{lat:{lat1:-33.946231, lat2:-33.947477},lng:{lng1:18.579889, lng2:18.591089}},
					   Gugulethu:{lat:{lat1:-33.964809, lat2:-33.998118},lng:{lng1:18.560642, lng2:18.577035}},
					   Goodwood:{lat:{lat1:-33.886026, lat2:-33.924066},lng:{lng1:18.522316, lng2:18.569351}},
					   Dieprivier:{lat:{lat1:-34.029996, lat2:-34.066265,},lng:{lng1:18.461057, lng2:18.465691}},
					   Manenberg:{lat:{lat1:-33.970337, lat2:-34.001438},lng:{lng1:18.548790, lng2: 18.560892}},
					   Milnerton:{lat:{lat1:-33.871578, lat2:-33.874001},lng:{lng1:18.523148, lng2:18.530872}},
					   Wynberg:{lat:{lat1:-34.005108, lat2:-34.004147,},lng:{lng1:18.458660, lng2:18.476942}},
					   Langa:{lat:{lat1:-33.945101, lat2:-33.946419},lng:{lng1:18.531835, lng2:18.531706}},
					   Lansdowne:{lat:{lat1:-33.984194, lat2:-33.985261},lng:{lng1:18.500577, lng2:18.501994}},
					   Athlone:{lat:{lat1:-33.964546, lat2:-33.967785},lng:{lng1:18.503715, lng2:18.504101}},
					   Mowbray:{lat:{lat1:-33.948813, lat2:-33.947069},lng:{lng1:18.478914, lng2:18.486811}},
					   Claremont:{lat:{lat1:-33.986100, lat2:-33.982186},lng:{lng1:18.469279, lng2:18.472240}},
					   Pinelands:{lat:{lat1:-33.940832, lat2:-33.930898},lng:{lng1:18.507435, lng2:18.514688}},
					   Maitland:{lat:{lat1:-33.922763, lat2:-33.914999},lng:{lng1:18.497802, lng2:18.527413}},
					   Rondebosch:{lat:{lat1:-33.957765, lat2:-33.969369},lng:{lng1:18.475219, lng2:18.481313}},
					   SeaPoint:{lat:{lat1:-33.923388, lat2:-33.910781},lng:{lng1:18.390588, lng2:18.386168}},
					   Woodstock:{lat:{lat1:-33.927092, lat2:-33.927983},lng:{lng1:18.449554, lng2:18.452129}},
					   CapeTownCentral:{lat:{lat1:-33.928181, lat2:-33.915931},lng:{lng1:18.420294, lng2: 18.421968}},
                                           SimonsTown:{lat:{lat1:-34.14349, lat2:-34.24289},lng:{lng1:18.34820, lng2: 18.51849}},
                                           Belhar:{lat:{lat1:-33.91979, lat2:-33.96963},lng:{lng1:18.58329, lng2: 18.66843}},
                                           Bellville:{lat:{lat1:-33.84818, lat2:-33.94792},lng:{lng1:18.54269, lng2: 18.71298}},
                                           BellvilleSouth:{lat:{lat1:-33.89115, lat2:-33.94101},lng:{lng1:18.60191, lng2: 18.68706}},
                                           Bothasig:{lat:{lat1:-33.83449, lat2:-33.88438},lng:{lng1:18.49857, lng2: 18.58372}},
                                           Brackenfell:{lat:{lat1:-33.83321, lat2:-33.93296},lng:{lng1:18.61479, lng2: 18.78508}},
                                           CampsBay:{lat:{lat1:-33.93004, lat2:-33.97988},lng:{lng1:18.33961, lng2: 18.42476}},
                                           Durbanville:{lat:{lat1:-33.79042, lat2:-33.89022},lng:{lng1:18.56432, lng2: 18.73461}},
                                           Kensington:{lat:{lat1:-33.89863, lat2:-33.92356},lng:{lng1:18.48424, lng2: 18.52681}},
                                           Kleinvlei:{lat:{lat1:-33.96095, lat2:-34.01076},lng:{lng1:18.67187, lng2: 18.75701}},
                                           KuilsRivier:{lat:{lat1:-33.85609, lat2:-33.88103},lng:{lng1:18.64822, lng2: 18.69079}},
                                           Macassar:{lat:{lat1:-34.04121, lat2:-34.09098},lng:{lng1:18.72491, lng2: 18.81005}},
                                           OceansView:{lat:{lat1:-33.90640, lat2:-33.90952},lng:{lng1:18.41498, lng2: 18.42030}},
                                           Ravensmead:{lat:{lat1:-33.89621, lat2:-33.94607},lng:{lng1:18.56380, lng2: 18.64895}},
                                           SomersetWest:{lat:{lat1:-34.03232, lat2:-34.13184},lng:{lng1:18.76413, lng2: 18.93442}},
                                           Stellenbosch:{lat:{lat1:-33.88452, lat2:-33.98422},lng:{lng1:18.78405, lng2: 18.95433}},
                                           TableView:{lat:{lat1:-33.79969, lat2:-33.84960},lng:{lng1:18.45205, lng2: 18.53720}},
                                           Strandfontein:{lat:{lat1:-31.72999, lat2:-31.78108},lng:{lng1:18.18469, lng2: 18.26983}}
                                           
					  };
						
	//variables to be used to show information on the map
	var locationClusters;
	var locationStatistics;
	var crimes;
	var morning; var noon; var evening; var night;
	var Sunday; var Monday; var Tuesday; var Wednesday; var Thursday; var Friday; var Saturday;
	
	
	//getLocationClusters();
	//getLocationStatistics();
	//getGraphTotals();
	
	//this calls variables for statistics and clusters
	
	
	var content;
	
	var map;
	
	function initialize() {
			
		//alert('init');
		var mapCanvas = document.getElementById('map');
		
		
                var mapOptions = {
		  center: new google.maps.LatLng(-33.975415, 18.575200),
		  zoom: 11,
		  mapTypeId: google.maps.MapTypeId.ROADMAP
		};
                
		map = new google.maps.Map(mapCanvas, mapOptions);
		
		getVariables("http://localhost:8080/NewCapeWatch/js/GraphTotals.txt","totals");
		  
	}
	
	function newMap(){
		var mapCanvas = document.getElementById('map');
		
		var mapOptions = {
		  center: new google.maps.LatLng(-33.975415, 18.575200),
		  zoom: 11,
		  mapTypeId: google.maps.MapTypeId.ROADMAP
		}
                
		map = new google.maps.Map(mapCanvas, mapOptions);
	
	}
		
    function getVariables(url,type)
    {   //alert('get vars');
        var textfile;
        if (window.XMLHttpRequest)
        { 
            textfile = new XMLHttpRequest(); 
        }
        
        textfile.onreadystatechange = function ()
        {   
            if (textfile.readyState == 4 && textfile.status == 200)
            { 
                content = textfile.responseText; 
                //alert(content);
                if (type =="clusters"){

                        locationClusters = eval("("+content+")");
                        //alert('locclust !!' + locationClusters);
                        //showClusterStatistics();
                        //alert(locationClusters["Wynberg"]["gang8"]);
                }else if (type == "statistics"){
                        locationStatistics = eval("("+content+")");
                        //alert(locationStatistics["Wynberg"]["crimes"]);

                        //first get the max number of crimes commited in any area
                        getMaxCrimes();

                        showGraphStatistics("crimes");

                }else if (type =="totals"){
                        createTotals(content);

                        getVariables("http://localhost:8080/NewCapeWatch/js/GraphStatistics.txt","statistics");
                        getVariables("http://localhost:8080/NewCapeWatch/js/ClusterStatistics.txt","clusters");
                }
            }
        }
        textfile.open("GET", url, true);
        textfile.send();
    }
	
    function createTotals(totals){
		var lines = totals.split("\n");
        for (var i = 0, len = lines.length; i < len; i++) {
			var line = lines[i].split("=");
			if (line[0] == "morning"){
				morning = parseInt(line[1]);
				//alert("morn "+(morning+4));
			}else if (line[0] == "noon"){
				noon= parseInt(line[1]);
				//alert("noon "+noon);
			}else if (line[0] == "evening"){
				evening= parseInt(line[1]);
				//alert("eve "+evening);
			}else if (line[0] == "night"){
				night= parseInt(line[1]);
				//alert("night "+night);
			}else if (line[0] == "crimes"){
				crimes= parseInt(line[1]);
				//alert("sat "+saturday);
			}
        }
		//alert('after tots');
    }
	

function getMaxCrimes(type){
		var maxCrimes = 0;
		for (var location in locationStatistics) {
			var crimeNum = locationStatistics[location][type];
			
			if (crimeNum > maxCrimes){
				maxCrimes = crimeNum;
			}
		}
		return maxCrimes;
	}
	
	function showGraphStatistics(type){
		newMap();
		//alert('in show');
		
                //Number of gangs in the area
                //alert ("the length "+Object.keys( locationStatistics).length);
                
		for (var location in locationStatistics) {
			//get percentage of location
                        //alert("1");
			var num = parseInt (locationStatistics[location][type]);
                        // alert("2");
			var maxCrimes = getMaxCrimes(type);
			// alert("3");
			var perc = (num/maxCrimes)*100;
			//alert(location+" "+num);
			
			//get the coordinate to put the circle on the map
			var coordinate = getCoordinates(location,1,1);
			var lat = coordinate["lat"];
			var lng = coordinate["lng"];
			
			//depending on the relative number of crimes committed get a color code
			var color = getColor(perc);
			
			var amsterdam=new google.maps.LatLng(lat,lng);
			//Now put the boundaries
			var coords = location+"Coords";
			
			//first put the boundary before the information
			var bermudaTriangle = new google.maps.Polygon({
				paths: eval(coords),
				strokeColor: color,
				strokeOpacity: 0.8,
				strokeWeight: 2,
				fillColor: color,
				fillOpacity: 0.35
			});
			bermudaTriangle.setMap(map);
			
			var image = 'fonts/'+color.substring(1)+'_stats.PNG';
			
                      
                        var beachMarker;
                        if (num >= 10){
                            beachMarker = new google.maps.Marker({
				position: amsterdam,
				map: map,
				icon: image,
				label: "*"
                            });
                        }else{
                            
                            beachMarker = new google.maps.Marker({
				position: amsterdam,
				map: map,
				icon: image,
				label: ''+num
                            });
                        }
                        
			
			
			var content = document.createElement("DIV");
			if (type =="crimes"){
				content.innerHTML = '<div class="crime-stats" style="height:100px;width:200px;" >'+location+'<br>Crimes : '+num+'<br>Total Crimes : '+crimes+'</div>';
			} else if (type =="morning" || type=="noon" || type=="evening" || type == "night") {
				content.innerHTML = '<div class="crime-stats" style="height:100px;width:300px;" >'+location+'<br>At : '+type+'<br>Crimes : '+num+'<br>Total Crimes at '+type+' : '+eval(type)+'</div>';
			} else{
				content.innerHTML = '<div class="crime-stats" style="height:100px;width:300px;" >'+location+'<br>On : '+type+'<br>Crimes : '+num+'<br>Total Crimes On '+type+' : '+eval(type)+'</div>';
			}
			
			//alert(content.innerHTML);
			var infowindow = new google.maps.InfoWindow({
				content: content,
				maxWidth: 5000
			});
			
			 // Open the infowindow on marker click
			(function(beachMarker,infowindow) {google.maps.event.addListener(beachMarker, "click", function() {
				//alert('clicked');
				infowindow.open(map, beachMarker );
				
			}); }(beachMarker,infowindow));
				
		}
	}
	
	function showClusterStatistics(){
		newMap();
		//alert('in cluster show'+locationClusters["Wynberg"]["gang7"]["perc"]);
		
		for (var location in locationClusters) {
			
			//Number of gangs in the area
			var gangNum = Object.keys( locationClusters[location] ).length;
			//get percentage of location
			var num = parseInt (locationStatistics[location]["crimes"]);
			var maxCrimes = getMaxCrimes("crimes");
			
			var perc = (num/maxCrimes)*100;
			
			//get the coordinate to put the circle on the map
			var coordinate = getCoordinates(location,1,1);
			var lat = coordinate["lat"];
			var lng = coordinate["lng"];
			
			//depending on the relative number of crimes committed get a color code
			var color = getColor(perc);
			
			var amsterdam=new google.maps.LatLng(lat,lng);
			//Now put the boundaries
			var coords = location+"Coords";
			
			//first put the boundary before the information
			var bermudaTriangle = new google.maps.Polygon({
				paths: eval(coords),
				strokeColor: color,
				strokeOpacity: 0.8,
				strokeWeight: 2,
				fillColor: color,
				fillOpacity: 0.35
			});
			bermudaTriangle.setMap(map);
			
			var image = 'fonts/'+color.substring(1)+'_cluster.png';
			//alert('clust '+image);
                        
                        var beachMarker;
                        if (gangNum >= 10){
                            beachMarker = new google.maps.Marker({
				position: amsterdam,
				map: map,
				icon: image,
				label: "*"
                            });
                        }else{  
                             beachMarker = new google.maps.Marker({
				position: amsterdam,
				map: map,
				icon: image,
				label: ''+ gangNum
                            });
                        } 
                        
                        var pieDiv = document.getElementById(location);
                        
                        var content;
                        
                        if(pieDiv != null){
                           content = pieDiv;
                        }else{
                           content = document.createElement("DIV");
                        }
                       
			content.innerHTML = '<div id="'+location+'" style="height:100px;width:300px;" class="overlay '+location+'"></div>';
			document.getElementById("temp").appendChild(content);
		
			var piechart = createPieChart(location);
			piechart.render();
			
			
			//alert(content.innerHTML);
			var infowindow = new google.maps.InfoWindow({
				content: content,
				maxWidth: 5000
			});
			
			 // Open the infowindow on marker click
			(function(beachMarker,infowindow,piechart) {google.maps.event.addListener(beachMarker, "click", function() {
				//alert('clicked');
				infowindow.open(map, beachMarker );
				
			}); }(beachMarker,infowindow,piechart));
			
			
		}
		
	}
	
	
	
	function createPieChart(location){
	
		var chartPoints = new Array();
		
		for (var gang in locationClusters[location]) {
			//alert(locationClusters[location][gang]["perc"]);
			var point = {y:parseInt (locationClusters[location][gang]["perc"]),legendText:gang,label:gang,location:location}
			
			chartPoints.push(point);
		
		}
		
		//alert(chartPoints[0]["y"]+" "+chartPoints[0]["legendText"]);
		
		var chart = new CanvasJS.Chart(location,
		{
			backgroundColor: "transparent",
			color:"#fff",
			title:{
				text: location,
				fontSize: 20,
				fontColor: "#800000"
			},
					animationEnabled: true,
			legend:{
				verticalAlign: "center",
				horizontalAlign: "left",
				fontSize: 14,
				 fontColor: "#800000",
				fontFamily: "Helvetica"        
			},
			theme: "theme2",
			data: [
			{        
				type: "pie", 
				click: onClick,
				indexLabelFontFamily: "Garamond",       
				indexLabelFontSize: 20,
				indexLabelFontColor: "#fff",
				indexLabel: "{label} {y}%",
				indexLabelLineColor: "#fff",
				startAngle:-20,      
				showInLegend: true,
				toolTipContent:"{legendText} {y}%",
				dataPoints: chartPoints
			}
			]
		});
		
		return chart;
	}
	
	function onClick(e){
		//alert('clicked');
		//alert(  e.dataSeries.type + ", dataPoint { x:" + e.dataPoint.location + ", y: "+ e.dataPoint.y + " }" );
		var html = locationClusters[e.dataPoint.location][e.dataPoint.label]["html"];
		document.getElementById("google-map-overlay").innerHTML = html;
		document.getElementById("google-map-overlay").scrollIntoView();
	}
	

	
	function getColor(perc){
		var color;
		if (perc > 80){
			color = "#F90E0E";   //red
		} else if (perc > 60 && perc <= 80){
			color = "#F90E64";
		} else if (perc > 40 && perc <= 60){
			color = "#F90EE9";
		} else if (perc > 20 && perc <= 40){
			color = "#BA0EF9";
		} else if (perc <= 20 ){
			color = "#0E1DF9";
		} 
		
		return color;
	}
	
	function getCoordinates(location,numItems,numItem){
		
		var lat1 = coordinates[location]["lat"]["lat1"];
		var lat2 = coordinates[location]["lat"]["lat2"];
		var lng1 = coordinates[location]["lng"]["lng1"];
		var lng2 = coordinates[location]["lng"]["lng2"];
		
		var lat = ( Math.abs(lat1 - lat2)/(numItems + 1) *numItem ) + Math.min(lat1,lat2);
		var lng = ( Math.abs(lng1 - lng2)/(numItems + 1) *numItem ) + Math.min(lng1,lng2);
		
		var coordinate = {lat:lat,lng:lng};
		
		return coordinate;
		
	}
	
	// Define the LatLng coordinates for the polygon's path.
	var AtlantisCoords = [
		{lat: -33.510797, lng:18.426521},
		{lat: -33.498201, lng:18.440254},
		{lat:-33.471857, lng:18.455704},
		{lat: -33.479589, lng:18.492096},
		{lat: -33.489039, lng:18.509605},
		{lat: -33.503640, lng:18.524368},
		{lat: -33.528829, lng:18.524712},
		{lat: -33.550291, lng:18.506859},
		{lat:-33.556013, lng:18.503082},
		{lat:-33.551436, lng:18.530548},
		{lat: -33.579185, lng:18.514069},
		{lat: -33.614073, lng:18.468407},
		{lat: -33.596345, lng:18.453644},
		{lat: -33.576897, lng:18.470467},
		{lat: -33.562880, lng:18.447807},
		{lat: -33.535125, lng:18.476646},
		{lat: -33.532549, lng:18.473556},
		{lat:-33.520529, lng:18.453300}
	];
		
	var StrandCoords = [
		{lat: -34.101617, lng:18.810981},
		{lat: -34.100622, lng:18.812869},
		{lat:-34.090103, lng:18.847030},
		{lat: -34.093941, lng:18.849777},
		{lat: -34.094652, lng:18.857330},
		{lat: -34.097637, lng:18.856300},
		{lat: -34.100764, lng:18.851322},
		{lat: -34.113414, lng:18.869346},
		{lat:-34.114835, lng:18.866771},
		{lat:-34.119951, lng:18.872608},
		{lat: -34.117820, lng:18.876212},
		{lat: -34.122083, lng:18.883251},
		{lat: -34.123646, lng:18.876727},
		{lat: -34.126631, lng:18.880159},
		{lat: -34.132750, lng:18.883597},
		{lat: -34.135312, lng:18.877924},
		{lat: -34.125351, lng:18.870532},
		{lat:-34.128197, lng:18.868641},
		{lat:-34.130758, lng:18.864859},
		{lat: -34.135027, lng:18.867954},
		{lat: -34.144560, lng:18.849215},
		{lat: -34.123928, lng:18.828586}
	];

	
	var NoordHoekCoords = [
		{lat: -34.095959, lng:18.357275},
		{lat: -34.088496, lng:18.359592},
		{lat:-34.079468, lng:18.375299},
		{lat: -34.077833, lng:18.385857},
		{lat: -34.090486, lng:18.405254},
		{lat: -34.105483, lng:18.402765},
		{lat: -34.113584, lng:18.403108},
		{lat: -34.119127, lng:18.401564},
		{lat:-34.120193, lng:18.397444},
		{lat:-34.118488, lng:18.392465},
		{lat: -34.113016, lng:18.387058},
		{lat: -34.112518, lng:18.381565},
		{lat: -34.121756, lng:18.369205},
		{lat: -34.120619, lng:18.366459},
		{lat: -34.111595, lng:18.368776},
		{lat:-34.107402, lng:18.359850},
		{lat: -34.101787, lng:18.361051},
		{lat: -34.103977, lng:18.370800},
		{lat: -34.105984, lng:18.375109},
		{lat: -34.096842, lng:18.378789},
		{lat: -34.096693, lng:18.372775},
		{lat:-34.096990, lng:18.371069},
		{lat:-34.094612, lng:18.372057},
		{lat: -34.091341, lng:18.368646},
		{lat: -34.096247, lng:18.365594},
		{lat: -34.095801, lng:18.360119}
	];

	
	var FishHoekCoords = [
		{lat: -34.132713, lng:18.401933},
		{lat: -34.119000, lng:18.401675},
		{lat:-34.113671, lng:18.403220},
		{lat: -34.117295, lng:18.415494},
		{lat: -34.121771, lng:18.421244},
		{lat: -34.126177, lng:18.427338},
		{lat: -34.132500, lng:18.437896},
		{lat: -34.141380, lng:18.432145},
		{lat:-34.144506, lng:18.437381},
		{lat:-34.148839, lng:18.439698},
		{lat: -34.151680, lng:18.439183},
		{lat: -34.145358, lng:18.421244}
	];

	
	var HarareCoords = [
		{lat: -34.058367, lng:18.661154},
		{lat: -34.056731, lng:18.662056},
		{lat:-34.054562, lng:18.664158},
		{lat: -34.052322, lng:18.666047},
		{lat: -34.050367, lng:18.671840},
		{lat: -34.053674,lng: 18.674501},
		{lat: -34.054811, lng:18.677848},
		{lat: -34.054811, lng:18.683899},
		{lat:-34.058616, lng:18.683814},
		{lat:-34.060642, lng:18.682355},
		{lat: -34.063451, lng:18.682440},
		{lat: -34.065086, lng:18.681453},
		{lat: -34.062527, lng:18.676904}
	];

	
	var KraaifonteinCoords = [
		{lat: -33.835385, lng:18.675035},
		{lat: -33.835385, lng:18.679154},
		{lat:-33.829396, lng:18.674348},
		{lat: -33.822123, lng:18.697522},
		{lat: -33.819841, lng:18.696836},
		{lat: -33.822693, lng:18.688252},
		{lat: -33.822123, lng:18.682931},
		{lat: -33.818130, lng:18.682588},
		{lat:-33.809857, lng:18.694604},
		{lat: -33.816275, lng:18.696321},
		{lat:-33.818985, lng:18.708337},
		{lat: -33.827399, lng:18.709538},
		{lat: -33.829681, lng:18.722928},
		{lat: -33.823264, lng:18.721211},
		{lat: -33.822693, lng:18.742669},
		{lat: -33.834386, lng:18.739408},
		{lat: -33.830394, lng:18.752625},
		{lat: -33.850355, lng:18.752969},
		{lat: -33.860049, lng:18.745931},
		{lat: -33.873875, lng:18.745931},
		{lat:-33.884421, lng:18.752969},
		{lat: -33.893114, lng:18.751424},
		{lat: -33.887556, lng:18.745587},
		{lat: -33.893541, lng:18.737176},
		{lat: -33.877580, lng:18.724645},
		{lat:-33.880573, lng:18.719495},
		{lat: -33.868316, lng:18.704560},
		{lat:-33.860334, lng:18.717092},
		{lat: -33.859194, lng:18.698895},
		{lat: -33.847646, lng:18.697865},
		{lat: -33.844367, lng:18.686193},
		{lat: -33.839377, lng:18.687566},
		{lat: -33.838521, lng:18.680013}
	];

	
	var LingelethuWestCoords = [
		{lat: -34.040761, lng:18.659199},
		{lat: -34.040369, lng:18.660679},
		{lat:-34.042556, lng:18.663040},
		{lat: -34.043801, lng:18.659306}
	];
	
	var KhayelitshaCoords = [
		{lat: -33.987081, lng:18.647306},
		{lat: -33.985658, lng:18.668936},
		{lat:-33.988505, lng:18.674257},
		{lat: -34.000744, lng:18.681124},
		{lat: -33.996333, lng:18.685244},
		{lat: -34.015117, lng:18.693827},
		{lat: -34.022942, lng:18.720606},
		{lat: -34.006721, lng:18.710993},
		{lat:-33.999606, lng:18.727129},
		{lat:-34.021235, lng:18.740347},
		{lat: -34.026357, lng:18.734854},
		{lat: -34.053953, lng:18.715799},
		{lat: -34.069738, lng:18.740175},
		{lat:-34.074999, lng:18.738630},
		{lat: -34.074857, lng:18.722494},
		{lat: -34.075141, lng:18.685587},
		{lat: -34.073435, lng:18.667219},
		{lat: -34.040298, lng:18.634432},
		{lat: -33.999179, lng:18.628595},
		{lat: -33.995906, lng:18.637865}
	];

	
	var MfuleniCoords = [
		{lat: -34.005316, lng:18.646389},
		{lat: -34.002613, lng:18.650166},
		{lat:-33.985961, lng:18.664585},
		{lat: -33.985676, lng:18.669049},
		{lat: -33.988808, lng:18.674370},
		{lat: -34.000763, lng:18.680893},
		{lat: -33.996351, lng:18.685185},
		{lat: -34.006882, lng:18.691021},
		{lat:-34.015420, lng:18.693940},
		{lat: -34.023672, lng:18.722950},
		{lat: -34.026517, lng:18.724839},
		{lat: -34.026517, lng:18.730503},
		{lat: -34.028936, lng:18.730332},
		{lat: -34.035764, lng:18.724839},
		{lat: -34.037614, lng:18.718830},
		{lat: -34.033773, lng:18.710076},
		{lat: -34.021964, lng:18.691193},
		{lat: -34.014139, lng:18.685700},
		{lat: -34.012289, lng:18.678147},
		{lat: -34.007878, lng:18.677460},
		{lat: -34.002613, lng:18.673683},
		{lat: -34.004605, lng:18.670937}
	];

		
	var DelftCoords = [
		{lat: -33.997863, lng:18.625157},
		{lat: -33.960140, lng:18.634255},
		{lat:-33.953021, lng:18.633396},
		{lat: -33.954658, lng:18.655884},
		{lat: -33.958930, lng:18.656056},
		{lat: -33.976370, lng:18.652022},
		{lat: -33.978648, lng:18.650648},
		{lat: -33.982704, lng:18.650992},
		{lat:-33.996155, lng:18.637259},
		{lat: -33.998930, lng:18.629276}
	];

	
	var MitchellsPlainCoords = [
		{lat: -34.090888, lng:18.552127},
		{lat: -34.088897, lng:18.549037},
		{lat:-34.079798, lng:18.545432},
		{lat: -34.072263, lng:18.538223},
		{lat: -34.061313, lng:18.583370},
		{lat: -34.050078, lng:18.586803},
		{lat: -34.033720, lng:18.581138},
		{lat: -34.023903, lng:18.574272},
		{lat:-34.018781, lng:18.606372},
		{lat: -34.020773, lng:18.607746},
		{lat: -34.019066, lng:18.619762},
		{lat: -34.014797, lng:18.619418},
		{lat: -34.005833, lng:18.628517},
		{lat:-34.007967, lng:18.630576},
		{lat: -34.041259, lng:18.635383},
		{lat: -34.048655, lng:18.643279},
		{lat: -34.067143, lng:18.660274},
		{lat: -34.070414, lng:18.667655},
		{lat:-34.073684, lng:18.667312},
		{lat:-34.076528, lng:18.618904},
		{lat: -34.082500, lng:18.578735}
	];

	
	var PhillippiEastCoords = [
		{lat: -34.073565, lng:18.533291},
		{lat: -34.017238, lng:18.521275},
		{lat:-34.009270, lng:18.522477},
		{lat: -34.002155, lng:18.521103},
		{lat: -33.999166, lng:18.545651},
		{lat: -34.002297, lng:18.560929},
		{lat: -33.997032, lng:18.607449},
		{lat: -33.997885, lng:18.624959},
		{lat:-33.999166, lng:18.629937},
		{lat: -34.007847, lng:18.630795},
		{lat: -34.014962, lng:18.619294},
		{lat: -34.019373, lng:18.619980},
		{lat: -34.020369, lng:18.607277},
		{lat: -34.018946, lng:18.606247},
		{lat: -34.023783, lng:18.574490},
		{lat: -34.049815, lng:18.587193},
		{lat: -34.061193, lng:18.583760},
		{lat: -34.073280, lng:18.533120}
	];

	
	var MuizenbergCoords = [
		{lat: -34.116330, lng:18.457717},
		{lat:-34.113772, lng:18.463296},
		{lat:-34.111854, lng:18.464669},
		{lat: -34.107377, lng:18.466128},
		{lat: -34.108798, lng:18.463553},
		{lat: -34.105458, lng:18.458146},
		{lat: -34.103041, lng:18.462438},
		{lat: -34.097498, lng:18.464498},
		{lat:-34.095650, lng:18.467759},
		{lat: -34.096218, lng:18.479775},
		{lat: -34.102117, lng:18.480119},
		{lat: -34.098208, lng:18.490933},
		{lat: -34.096787, lng:18.491620},
		{lat:-34.097995, lng:18.493422},
		{lat: -34.096645, lng:18.495311},
		{lat:-34.093446, lng:18.492392},
		{lat:-34.090745, lng:18.489474},
		{lat: -34.089110, lng:18.488187},
		{lat: -34.086907, lng:18.489303},
		{lat: -34.086694, lng:18.492135},
		{lat: -34.081718, lng:18.491191},
		{lat: -34.080580, lng:18.491706},
		{lat:-34.077381, lng:18.510417},
		{lat: -34.083992, lng:18.507499},
		{lat: -34.096645, lng:18.510331},
		{lat: -34.103894, lng:18.483895},
		{lat: -34.109580, lng:18.470420},
		{lat:-34.118036, lng:18.459691}
	];	

	
	var SteenbergCoords = [
		{lat: -34.075500, lng:18.463879},
		{lat: -34.069243, lng:18.463600},
		{lat:-34.069083, lng:18.468685},
		{lat: -34.070488, lng:18.468750},
		{lat: -34.070168, lng:18.478084},
		{lat: -34.071714, lng:18.481303},
		{lat: -34.075002, lng:18.478985}
	];

	
	var GrassyParkCoords = [
		{lat: -34.096335, lng:18.510392},
		{lat: -34.084110, lng:18.507302},
		{lat:-34.077285, lng:18.510392},
		{lat: -34.078849, lng:18.499921},
		{lat: -34.063350, lng:18.489106},
		{lat: -34.045430, lng:18.486703},
		{lat: -34.038033, lng:18.491509},
		{lat: -34.028644, lng:18.489793},
		{lat:-34.025230, lng:18.496488},
		{lat: -34.024091, lng:18.522923},
		{lat: -34.073304, lng:18.533223},
		{lat: -34.072451, lng:18.538373},
		{lat: -34.079702, lng:18.545926},
		{lat:-34.088943, lng:18.549016}
	];

	
	var KirstenhofCoords = [
		{lat: -34.078924, lng:18.447060},
		{lat: -34.075583, lng:18.446717},
		{lat:-34.066696, lng:18.448905},
		{lat: -34.064634, lng:18.449893},
		{lat: -34.065949, lng:18.458733},
		{lat: -34.079102, lng:18.456158}
	];
	
	
	var ParowCoords = [
		{lat: -33.857700, lng:18.557320},
		{lat: -33.862546, lng:18.567104},
		{lat:-33.856417, lng:18.578777},
		{lat: -33.858555, lng:18.579807},
		{lat: -33.861976, lng:18.579121},
		{lat: -33.864685, lng:18.581352},
		{lat:-33.861976, lng:18.590279},
		{lat: -33.866965, lng:18.594914},
		{lat: -33.879365, lng:18.596630},
		{lat: -33.885208, lng:18.600235},
		{lat:-33.888200, lng:18.605042},
		{lat:-33.899457, lng:18.606758},
		{lat: -33.903019, lng:18.611221},
		{lat: -33.908576, lng:18.607960},
		{lat: -33.915984, lng:18.609676},
		{lat:-33.915271, lng:18.615341},
		{lat: -33.919972, lng:18.617744},
		{lat: -33.923391, lng:18.617401},
		{lat: -33.923391, lng:18.622894},
		{lat:-33.928376, lng:18.620663},
		{lat:-33.928234, lng:18.618088},
		{lat: -33.933076, lng:18.620663},
		{lat: -33.944042, lng:18.606072},
		{lat: -33.949290, lng:18.596348},
		{lat:-33.941240, lng:18.591496},
		{lat: -33.937859, lng:18.587420},
		{lat: -33.907578, lng:18.576889},
		{lat:-33.903732, lng:18.570881},
		{lat: -33.888200, lng:18.564014}
	];
	
	var NyangaCoords = [
		{lat: -34.001437, lng:18.569723},
		{lat: -34.001046, lng:18.573715},
		{lat:-33.989838, lng:18.572942},
		{lat: -33.983148, lng:18.577362},
		{lat: -33.988628, lng:18.591439},
		{lat: -33.992080, lng:18.591052},
		{lat: -33.999623, lng:18.591868},
		{lat: -34.001010, lng:18.586546},
		{lat: -34.002113, lng:18.569766}
	];
	
	var ElsiesRiverCoords = [
		{lat: -33.936737, lng:18.566697},
		{lat: -33.928120, lng:18.566439},
		{lat:-33.923349, lng:18.563264},
		{lat: -33.910528, lng:18.559573},
		{lat: -33.910599, lng:18.567383},
		{lat: -33.909175, lng:18.567383},
		{lat: -33.907607, lng:18.576653},
		{lat: -33.909744, lng:18.576739},
		{lat:-33.921782, lng:18.583605},
		{lat: -33.935527, lng:18.586781},
		{lat: -33.936880, lng:18.578370}
	];

	
	var HoutBayCoords = [
		{lat: -34.095823, lng:18.357368},
		{lat:-34.095397, lng:18.351703},
		{lat:-34.091985, lng:18.349300},
		{lat: -34.088715, lng:18.352218},
		{lat: -34.079901, lng:18.355651},
		{lat: -34.076488, lng:18.354449},
		{lat: -34.073076, lng:18.363719},
		{lat: -34.062553, lng:18.367839},
		{lat:-34.048615, lng:18.360629},
		{lat: -34.047477, lng:18.348613},
		{lat: -34.054020, lng:18.347926},
		{lat: -34.062126, lng:18.341918},
		{lat: -34.058144, lng:18.329044},
		{lat: -34.044775, lng:18.318229},
		{lat: -34.041219, lng:18.308101},
		{lat: -34.037378, lng:18.307758},
		{lat: -34.030977, lng:18.316341},
		{lat: -34.027989, lng:18.310676},
		{lat: -34.026851, lng:18.312221},
		{lat:-34.026709, lng:18.322864},
		{lat: -34.021871, lng:18.332133},
		{lat: -34.012481, lng:18.333507},
		{lat: -34.003959, lng:18.338897},
		{lat: -33.998911, lng:18.360854},
		{lat: -34.003806, lng:18.373217},
		{lat: -34.000747, lng:18.375431},
		{lat: -34.011760, lng:18.394436},
		{lat: -34.008548, lng:18.398864},
		{lat: -34.008548, lng:18.401447},
		{lat: -34.012066, lng:18.405876},
		{lat:-34.033934, lng:18.400156},
		{lat: -34.033934, lng:18.385210},
		{lat: -34.064358, lng:18.386317},
		{lat: -34.063593, lng:18.382996},
		{lat: -34.072458, lng:18.380044},
		{lat: -34.078113, lng:18.385764},
		{lat: -34.079030, lng:18.375431},
		{lat: -34.088199, lng:18.359378}
	];
	
	var PhilippiCentralCoords = [
		{lat: -34.073565, lng:18.533291},
		{lat: -34.017238, lng:18.521275},
		{lat:-34.009270, lng:18.522477},
		{lat: -34.002155, lng:18.521103},
		{lat: -33.999166, lng:18.545651},
		{lat: -34.002297, lng:18.560929},
		{lat: -33.997032, lng:18.607449},
		{lat: -33.997885, lng:18.624959},
		{lat:-33.999166, lng:18.629937},
		{lat: -34.007847, lng:18.630795},
		{lat: -34.014962, lng:18.619294},
		{lat: -34.019373, lng:18.619980},
		{lat: -34.020369, lng:18.607277},
		{lat: -34.018946, lng:18.606247},
		{lat: -34.023783, lng:18.574490},
		{lat: -34.049815, lng:18.587193},
		{lat: -34.061193, lng:18.583760},
		{lat: -34.073280, lng:18.533120}
	];
		
	var BishopLavisCoords = [
		{lat: -33.949008, lng:18.566542},
		{lat: -33.943241, lng:18.566628},
		{lat:-33.942992, lng:18.580446},
		{lat: -33.943988, lng:18.589244},
		{lat: -33.943170, lng:18.592892},
		{lat: -33.949328, lng:18.596411},
		{lat: -33.954206, lng:18.589931},
		{lat: -33.954348, lng:18.587957},
		{lat:-33.953885, lng:18.587399},
		{lat: -33.954206, lng:18.586626},
		{lat: -33.953850, lng:18.585596},
		{lat: -33.953494, lng:18.579502},
		{lat: -33.950183, lng:18.572850},
		{lat: -33.949222, lng:18.572850}
	];
	
	var GugulethuCoords = [
		{lat: -33.993990, lng:18.559268},
		{lat: -33.964382, lng:18.562101},
		{lat:-33.967443, lng:18.569053},
		{lat: -33.974276, lng:18.575576},
		{lat: -33.979116, lng:18.575662},
		{lat: -33.981394, lng:18.573860},
		{lat: -33.983102, lng:18.577379},
		{lat: -33.989934, lng:18.572830},
		{lat:-34.000893, lng:18.573688},
		{lat: -34.001533, lng:18.569740},
		{lat: -34.002173, lng:18.569911},
		{lat: -34.002387, lng:18.563560},
		{lat: -34.000821, lng:18.561242},
		{lat: -33.997335, lng:18.561328},
		{lat: -33.994915, lng:18.562272},
		{lat: -33.993777, lng:18.560727}
	];
	
		
	var GoodwoodCoords = [
		{lat: -33.904844, lng:18.501716},
		{lat: -33.898290, lng:18.504463},
		{lat:-33.900712, lng:18.508926},
		{lat: -33.887176, lng:18.524719},
		{lat: -33.885323, lng:18.530384},
		{lat: -33.886321, lng:18.537765},
		{lat: -33.890596, lng:18.547721},
		{lat: -33.888601, lng:18.564373},
		{lat:-33.904844, lng:18.571067},
		{lat: -33.907266, lng:18.577075},
		{lat: -33.910400, lng:18.567291},
		{lat: -33.910970, lng:18.559394},
		{lat: -33.928919, lng:18.566776},
		{lat: -33.943303, lng:18.566261},
		{lat: -33.938461, lng:18.525405},
		{lat: -33.941309, lng:18.518196},
		{lat: -33.931197, lng:18.521457},
		{lat: -33.923648, lng:18.517681},
		{lat: -33.916811, lng:18.541542},
		{lat:-33.913819, lng:18.540512},
		{lat: -33.916384, lng:18.522831},
		{lat: -33.901282, lng:18.521972}
	];
	
		
	var DieprivierCoords = [
		{lat: -34.070183, lng:18.457835},
		{lat: -34.042708, lng:18.463392},
		{lat: -34.042114, lng:18.461240},
		{lat:-34.029314, lng:18.459825},
		{lat: -34.030011, lng:18.465575},
		{lat: -34.029198, lng:18.465715},
		{lat: -34.029081, lng:18.468660},
		{lat: -34.040703, lng:18.466136},
		{lat:-34.053601, lng:18.466136},
		{lat: -34.053369, lng:18.470343},
		{lat: -34.069285, lng:18.464313}
	];
	

	
	var WoodstockCoords = [
		{lat: -33.931864, lng: 18.440198},
		{lat: -33.927876, lng: 18.440713},
		{lat: -33.927983, lng: 18.442344},
		{lat: -33.921395, lng:18.442902},
		{lat: -33.921039, lng:18.448910},
		{lat: -33.918332, lng:18.458394},
		{lat: -33.915412, lng:18.460798},
		{lat: -33.918724, lng:18.465690},
		{lat: -33.921039, lng:18.460283},
		{lat: -33.928089, lng:18.460197},
		{lat: -33.931259, lng:18.455304},
		{lat: -33.936884, lng:18.453201},
		{lat: -33.932790, lng:18.446035}
	];
	
	var SeaPointCoords = [
		{lat: -33.924385, lng:18.376341},
		{lat: -33.921928, lng:18.376126},
		{lat: -33.917584, lng:18.384494},
		{lat: -33.913595, lng:18.385310},
		{lat: -33.907968, lng:18.391232},
		{lat: -33.911494, lng:18.396682},
		{lat: -33.910603, lng:18.398399},
		{lat: -33.913257, lng:18.399558},
		{lat: -33.913417, lng:18.397498},
		{lat: -33.913737, lng:18.398270},
		{lat: -33.922589, lng:18.390101},
		{lat: -33.920362, lng:18.391550},
		{lat: -33.919605, lng:18.390155},
		{lat: -33.921253, lng:18.388920},
		{lat: -33.920095, lng:18.386290},
		{lat: -33.926197, lng:18.381566},
		{lat: -33.924238, lng:18.379365}
	];
	
	var RondeboschCoords = [
		{lat: -33.954490, lng:18.458825},
		{lat: -33.954490, lng:18.464747},
		{lat: -33.955985, lng:18.471099},
		{lat: -33.960898, lng:18.472472},
		{lat: -33.959545, lng:18.479510},
		{lat: -33.951286, lng:18.483802},
		{lat: -33.957552, lng:18.494960},
		{lat: -33.978551, lng:18.490754},
		{lat: -33.975490, lng:18.487407},
		{lat: -33.978052, lng:18.482514},
		{lat: -33.969084, lng:18.465863},
		{lat: -33.971504, lng:18.465005},
		{lat: -33.967304, lng:18.455649},
		{lat: -33.961111, lng:18.459941},
		{lat: -33.959118, lng:18.456078}
	];
	
	var MaitlandCoords = [
		{lat: -33.927321, lng:18.476602},
		{lat: -33.917635, lng:18.478318},
		{lat: -33.910440, lng:18.498832},
		{lat: -33.916068, lng:18.496343},
		{lat: -33.918774, lng:18.500119},
		{lat: -33.917991, lng:18.505441},
		{lat: -33.915498, lng:18.505012},
		{lat: -33.914928, lng:18.507758},
		{lat: -33.916851, lng:18.508273},
		{lat:-33.914216, lng:18.523036},
		{lat: -33.916566, lng:18.523036},
		{lat: -33.913717, lng:18.540374},
		{lat: -33.916210, lng:18.541146},
		{lat: -33.918632, lng:18.535481},
		{lat: -33.925469, lng:18.485785},
		{lat: -33.927036, lng:18.486043},
		{lat: -33.927534, lng:18.481666},
		{lat: -33.926324, lng:18.481322}
	];
	
	var PinelandsCoords = [
		{lat: -33.929296, lng:18.507692},
		{lat: -33.922103, lng:18.506405},
		{lat: -33.919325, lng:18.527948},
		{lat: -33.920322, lng:18.528120},
		{lat: -33.923598, lng:18.517820},
		{lat: -33.930222, lng:18.520395},
		{lat: -33.938269, lng:18.521597},
		{lat: -33.947668, lng:18.508465},
		{lat:-33.949519, lng:18.501598},
		{lat: -33.944819, lng:18.498680},
		{lat: -33.946172, lng:18.493101},
		{lat: -33.943751, lng:18.490955},
		{lat: -33.933497, lng:18.492500}
	];
	
	var ClaremontCoords = [
		{lat: -33.976834, lng:18.467146},
		{lat: -33.983336, lng:18.467745},
		{lat: -33.972362, lng:18.472889},
		{lat: -33.978118, lng:18.482478},
		{lat: -33.975509, lng:18.487422},
		{lat: -33.979029, lng:18.491118},
		{lat: -33.988430, lng:18.489669},
		{lat: -33.990997, lng:18.484625},
		{lat:-33.990956, lng:18.478782},
		{lat: -33.989548, lng:18.471890},
		{lat: -33.992032, lng:18.468544},
		{lat: -33.990583, lng:18.461153},
		{lat: -33.995511, lng:18.4577070},	
		{lat:-33.986359, lng:18.451514},
		{lat: -33.984372, lng:18.452962},
		{lat: -33.982384, lng:18.452413},
		{lat: -33.980893, lng:18.453961},
		{lat: -33.981431, lng:18.456109}
	];
	
	var MowbrayCoords = [
		{lat: -33.951946, lng:18.465782},
		{lat: -33.946713, lng:18.466082},
		{lat: -33.944328, lng:18.473764},
		{lat: -33.943651, lng:18.485909},
		{lat: -33.946108, lng:18.488570},
		{lat: -33.944897, lng:18.491574},
		{lat: -33.946143, lng:18.492990},
		{lat: -33.944826, lng:18.494407},
		{lat:-33.944790, lng:18.498698},
		{lat: -33.948457, lng:18.501745},
		{lat: -33.949810, lng:18.502861},
		{lat: -33.951163, lng:18.502046},
		{lat: -33.953584, lng:18.495909},	
		{lat:-33.957748, lng:18.497239},
		{lat: -33.957642, lng:18.495050},
		{lat: -33.951626, lng:18.483377},
		{lat: -33.951305, lng:18.472048},
		{lat:-33.951590, lng:18.469310},
		{lat: -33.950063, lng:18.469526}
	];
	
	var AthloneCoords = [
		{lat: -33.968390, lng:18.494188},
		{lat: -33.964724, lng:18.495475},
		{lat: -33.960915, lng:18.494445},
		{lat: -33.960310, lng:18.504788},
		{lat: -33.962232, lng:18.510410},
		{lat: -33.968105, lng:18.510839},
		{lat: -33.968283, lng:18.507191},
		{lat: -33.974049, lng:18.507663},
		{lat:-33.973479, lng:18.501398},
		{lat: -33.968568, lng:18.501526}
	];
	
	var LansdowneCoords = [
		{lat: -33.988944, lng:18.489677},
		{lat: -33.988375, lng:18.489591},
		{lat: -33.980368, lng:18.490449},
		{lat: -33.981222, lng:18.501393},
		{lat: -33.986133, lng:18.503195},
		{lat: -33.984923, lng:18.508474},
		{lat: -33.987094, lng:18.511177},
		{lat: -33.989300, lng:18.511950},
		{lat:-33.989869, lng:18.508860},
		{lat: -33.989798, lng:18.495685},
		{lat: -33.988838, lng:18.492638}
	];
	
	var LangaCoords = [
		{lat:-33.947700, lng:18.516643},
		{lat: -33.942396, lng:18.516943},
		{lat: -33.941185, lng:18.519990},
		{lat: -33.938479, lng:18.524454},
		{lat: -33.938479, lng:18.526256},
		{lat: -33.941078, lng:18.534796},
		{lat: -33.941648, lng:18.543079},
		{lat: -33.954322, lng:18.542907},
		{lat:-33.955781, lng:18.542263},
		{lat: -33.950548, lng:18.526213},
		{lat: -33.950335, lng:18.522737},
		{lat: -33.948590, lng:18.522823},
		{lat:-33.948056, lng:18.521020},
		{lat: -33.949338, lng:18.520548},
		{lat: -33.949623, lng:18.518660},
		{lat: -33.947807, lng:18.518789}
	];
	
	var WynbergCoords = [
		{lat: -34.000660, lng:18.449004},
		{lat: -33.994185, lng:18.455399},
		{lat: -33.995288, lng:18.457888},
		{lat: -33.996533, lng:18.463081},
		{lat: -34.001052, lng:18.466471},
		{lat: -33.999700, lng:18.468230},
		{lat: -34.002368, lng:18.469132},
		{lat: -34.002404, lng:18.482135},
		{lat:-34.004147, lng:18.482307},
		{lat: -34.004183, lng:18.480590},
		{lat: -34.006388, lng:18.478788},
		{lat: -34.014499, lng:18.481277},
		{lat: -34.015638, lng:18.471449},	
		{lat:-34.013041, lng:18.470247},
		{lat: -34.014748, lng:18.467115},
		{lat: -34.013752, lng:18.457416},
		{lat: -34.012934, lng:18.458617},
		{lat:-34.003862, lng:18.451665},
		{lat: -34.003934, lng:18.450506}
	];
	
	var MilnertonCoords = [
		{lat: -33.889677, lng:18.482807},
		{lat: -33.868015, lng:18.489159},
		{lat: -33.844208, lng:18.487270},
		{lat:-33.851337, lng:18.495167},
		{lat: -33.856326, lng:18.496712},
		{lat: -33.858749, lng:18.500488},
		{lat: -33.844066, lng:18.521259},
		{lat: -33.850339, lng:18.519886},
		{lat:-33.855043, lng:18.530701},
		{lat: -33.846917, lng:18.527782},
		{lat: -33.843495, lng:18.537567},
		{lat: -33.847345, lng:18.554905},
		{lat: -33.888537, lng:18.564003},	
		{lat:-33.890105, lng:18.546493},
		{lat: -33.885402, lng:18.527267},
		{lat: -33.900934, lng:18.508900},
		{lat: -33.892385, lng:18.497227}
	];
	
	var ManenbergCoords = [
		{lat: -34.000228, lng:18.549648},
		{lat: -33.984786, lng:18.548704},
		{lat: -33.980729, lng:18.547760},
		{lat:-33.970479, lng:18.550936},
		{lat: -33.973825, lng:18.561407},
		{lat: -34.002078, lng:18.558317}
	];
	
	var CapeTownCentralCoords = [
		{lat: -33.925456, lng:18.411237},
		{lat: -33.918904, lng:18.417589},
		{lat: -33.918191, lng:18.416902},
		{lat:-33.914559, lng:18.421537},
		{lat: -33.913490, lng:18.425228},
		{lat: -33.913989, lng:18.427288},
		{lat: -33.919616, lng:18.435613},
		{lat: -33.922465, lng:18.432094},
		{lat:-33.918832, lng:18.426601},
		{lat: -33.922892, lng:18.422739},
		{lat: -33.925377, lng:18.425860},
		{lat: -33.929203, lng:18.421680},
		{lat: -33.929754, lng:18.422344},	
		{lat:-33.931051, lng:18.421328},
		{lat: -33.931602, lng:18.419922},
		{lat: -33.931018, lng:18.417851},
		{lat: -33.932607, lng:18.414257},
		{lat: -33.930208, lng:18.412616},
		{lat: -33.927323, lng:18.413670}
	];
        
        
        var BelharCoords = [
         //   {lat: , lng:},
        ];
        
        var BellvilleCoords = [
            
        ];
        
        var BellvilleSouthCoords = [
            
        ];        
        
        var BothasigCoords = [
            
        ];        
        
        var BrackenfellCoords = [
            
        ];
        
        var CampsBayCoords = [
            
        ];
        
        var DurbanvilleCoords = [
            
        ];
        
        var KensingtonCoords = [
            
        ];
        
        var KleinvleiCoords = [
            
        ];
        
        var KuilsRivierCoords = [
            
        ];
        
        var MacassarCoords = [
            
        ];
        
        var OceanViewCoords = [
            
        ];
        
        var RavensmeadCoords = [
            
        ];
        
        var SimonsTownCoords = [
            
        ];
        
        var SomersetWestCoords = [
            
        ];
        
        var StellenboschCoords = [
            
        ];
        

        var StrandfonteinCoords = [
            
        ];
        
        var TableViewCoords = [
            
        ];        
	/*
	locationDist.put("Cape Town Central",0.65);
         */