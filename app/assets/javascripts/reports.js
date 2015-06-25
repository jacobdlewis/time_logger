$(document).ready(function(){
  function toggleButtonColor(param, target) {
    $.each($('.report-button'), function(index, button) {
      if (window.location.href.indexOf(param) > -1) {
        $(target).css('background-color', 'plum');
        $('#week-button').removeClass('btn-active');
      }
    });
  }

  toggleButtonColor("month", "#month-button")
  toggleButtonColor("year", "#year-button")

});