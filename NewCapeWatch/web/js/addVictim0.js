$(document).ready(function(){
  var x = 0;

  function addVictim() {
    $('#victim-menu').append($('#victim').clone());
    $('input[name="counter"]').val(x);
  }
  // addVictim(); // Makes sure there is always a field available.
  $("#button-toggle").click(function(){
    addVictim();
  });
});
