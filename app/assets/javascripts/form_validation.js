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
  $('#party_zip_code').ready(function () {
    if (!this.value) {
      $('#party_zip_code').css("border", '2px solid red');
      $('#party_zip_code').attr("placeholder", "Zip code (required field)");
    }
  })
});