$(function() {
  $('.accordion').each(function() { $(this).accordion() });
  $('.display_hidden_radio').each(function() { $(this).displayHiddenRadio() });
  $('.display_hidden_checkbox').each(function() { $(this).displayHiddenCheckbox() });
  $('#firstQuestion').blankValidation('radio');
  $('#stepQuestion_3').blankValidation('checkbox');
  $('#stepQuestion_4').blankValidation('checkbox');
  $('#validate_mobile').blankValidation('tel');
  $("#toTop").click(function() {
    $("html, body").animate({scrollTop: 0}, 750);
  });
});



$(window).scroll(function() {
  if ($(this).scrollTop()) {
    $('#toTop').fadeIn();
  } else {
    $('#toTop').fadeOut();
  }
});


