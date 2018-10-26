$(document).ready(function(){
  $('.bottom-card').hide();
  $('.top-btn').click(function(button) {
    button.stopPropagation();
  });
  $(".top-card").click(function(){
    if ($('.bottom-card').height() > 0) {
      $(this).parents().siblings().children('.bottom-card').slideUp();
    }
    $(this).siblings('.bottom-card').slideToggle();
  });
});
