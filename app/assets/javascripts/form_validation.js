$(document).ready(function () {
  $('#party_title').on("blur", function () {
    if (!this.value) { 
      $(this).css("border", '2px solid red');
      $(this).attr("placeholder", "Title (required field)");
       }
    else { 
      $('#party_title').css("border", '2px solid black'); 
    }
  });
});