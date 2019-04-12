$(function() {
  $('.accordion').each(function() { $(this).accordion() });
  $('.display_hidden_radio').each(function() { $(this).displayHiddenRadio() });
  $('.display_hidden_checkbox').each(function() { $(this).displayHiddenCheckbox() });
  // $('#firstQuestion').blankValidation('radio');
  $('#stepQuestion_2').blankValidation('checkbox');
  $('#stepQuestion_3').blankValidation('checkbox');
  $('#validate_mobile').blankValidation('tel');
  $("#toTop").click(function() {
    $("html, body").animate({scrollTop: 0}, 750);
  });
  $('#firstQuestion #new_response').on('submit', function(e) {
    if (!$("input[type='radio']:checked").val()) {
      e.preventDefault();
      $('.form_errors').removeClass('display_none');
      window.scrollTo(0, 0);
      return false;
    } else {
      $('#firstQuestion #new_response').submit();
    }
  });
});


$(window).scroll(function() {
  if ($(this).scrollTop()) {
    $('#toTop').fadeIn();
  } else {
    $('#toTop').fadeOut();
  }
});


