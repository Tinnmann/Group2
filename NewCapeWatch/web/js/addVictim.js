$(document).ready(function(){

	 var x = 1;

	
  function addVictim() {
	  
    $('#victim-menu').append($('#victim').clone());
     x= x+1;
    $("#ageid").find("input").attr("name", "age" + x);
    $("#raceid").find("select").attr("name", "race" + x);
    $("#genderid").find("select").attr("name", "gender" + x);

  
  }
  // addVictim(); // Makes sure there is always a field available.
  $("#button-toggle").click(function(){
    addVictim();
  });
});
