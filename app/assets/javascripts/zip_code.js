$(document).ready(function(){
  $(document).click(function(){
    $('.hidden-form').slideUp();
  });
  $('.zip-search').click(function(button) {
    button.stopPropagation();
  });
  $('.hidden-form').click(function(button) {
    button.stopPropagation();
  });

  $('.hidden-form').hide();
  $('.hidden-button').hide();
  $(".zip-search").click(function(){
    if ($('.hidden-drop').height() > 0) {
      $('.hidden-form').slideUp();
    }
    $(this).parent().children('.hidden-form').slideToggle(function(){
      $(this).children(".hidden-drop").focus();
    });
  });
});
