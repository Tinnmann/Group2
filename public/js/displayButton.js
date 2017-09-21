$(document).ready(function () {
  $(document).on('mouseenter', '.currentStatus', function () {
      $(this).find(":button").show();
  }).on('mouseleave', '.currentStatus', function () {
      $(this).find(":button").hide();
  });
