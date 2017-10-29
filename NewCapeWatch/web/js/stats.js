
var jQuery_3_1_1_slim = $.noConflict(true);

document.getElementById("allcrime-btn").onclick = function() {

  document.getElementById("modal").style.display = "table-row";

}

document.getElementById("crimeRelated").onclick = function() {

  location.href = "crimeRelated.php";

}

var jQuery_3_2_1 = $.noConflict(true);
// Graph number of Crimes by Precinct
jQuery_3_2_1(document).ready(function() {

  jQuery_3_2_1.ajax({
    url: "http://keviintondo.com/project/precinct.php",
    dataType: 'json',
    method: "GET",
    success: function(data) {
      console.log(data);
      var Precinct = [];
      var total = [];

      for (var i in data) {
        Precinct.push(data[i].Precinct);
        total.push(data[i].total);

      }

      var chartdata = {
        labels: Precinct,
        datasets: [{
          label: '#Crimes/Precinct',
          backgroundColor: 'rgba(163,204,255, 0.85)',
          borderColor: 'rgba(140,171,128, 0.85)',
          hoverBackgroundColor: 'rgba(220,160,27, 1)',
          hoverBorderColor: 'rgba(200, 200, 200,0.9)',
          data: total
        }]
      };

      var ctx = jQuery_3_2_1("#mycanvas");

      var barGraph = new Chart(ctx, {

        type: 'bar',
        data: chartdata

      });

    },
    error: function(data) {

      console.log(data);
    }
  });
});

// Toggle Search Menu

jQuery_3_2_1("#menu-toggle").click(function(e) {

  e.preventDefault();
  jQuery_3_2_1("#wrapper").toggleClass("menuDisplayed");

});

// Search Javascript Graphs

function showDiv() {

  var citySearched = document.getElementById("city").value;

  document.getElementById('searchDiv').style.display = "block";

  jQuery_3_2_1.ajax({
    url: "http://keviintondo.com/project/search.php",
    dataType: 'json',
    method: "POST",
    success: function(data) {
      console.log(data);

      var total = [];

      for (var i in data) {

        total.push(data[i].SexualOffences);
      }

      var chartdata = {
        labels: [`Murder`, `Sexual Offences`, `Attempted murder`, `Assault with the intent to inflict grievous bodily harm`, `Common assault`, `Common robbery`, `Robbery with aggravating circumstances`, `Arson`, `Malicious damage to property`, `Burglary at non-residential premises`, `Burglary at residential premises`, `Theft of motor vehicle and motorcycle`, `Theft out of or from motor vehicle`, `Stock-theft`, `Illegal possession of firearms and ammunition`, `Drug-related crime`, `Driving under the influence of alcohol or drugs`, `Sexual offences as result of police action`, `Carjacking`, `Truck hijacking`, `Robbery at residential premises`, `Robbery at non-residential premises`],
        datasets: [{
          label: 'Athlone',
          backgroundColor: ["#061826", "#19535F", "#3cba9f", "#e8c3b9", "#c45850", "#0B7A75", "#D7C9AA", "#7B2D26", "#D2FDFF", "#3ABEFF", "#26FFE6", "#A5978B", "#8D5B4C", "#e8c3b9", "#5C4742", "#CCDBDC", "#9AD1D4", "#007EA7", "#003249",
            "#89AAE6", "#003249", "#3e95cd"
          ],
          borderColor: 'rgba(140,171,128, 0.85)',
          hoverBackgroundColor: 'rgba(220,160,27, 1)',
          hoverBorderColor: 'rgba(200, 200, 200,0.9)',
          data: [16, 64, 38, 217, 533, 231, 359, 529, 195, 490, 219, 703, 0, 50, 1377, 125, 0, 19, 0, 23, 26, 24],
        }]

      };
      var ctx = jQuery_3_2_1("#mycanvas2");
      var barGraph = new Chart(ctx, {
        type: 'doughnut',
        data: chartdata,
        options: {
          title: {
            display: true,
            text: 'Athlone in 2016'
          },
          cutoutPercentage: 40,
        }
      });

    },
    error: function(data) {

      console.log(data);
    }
  });
}
