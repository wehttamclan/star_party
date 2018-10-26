$(document).ready(function(){
  $('.bottom-weather-card').hide();
  $('.select').click(function(button) {
    button.stopPropagation();
  });
  $(".top-weather-card").click(function(){
    if ($('.bottom-weather-card').height() > 0) {
      $(this).parents().siblings().children('.bottom-weather-card').slideUp();
    }
    $(this).siblings('.bottom-weather-card').slideToggle();
  });
});
