$(function() {
  $('.accordion').each(function() { $(this).accordion() });
  $('.display_hidden_radio').each(function() { $(this).displayHiddenRadio() });
  $('.display_hidden_checkbox').each(function() { $(this).displayHiddenCheckbox() });
  // $('#firstQuestion').blankValidation('radio');
  $('#stepQuestion_2').blankValidation('checkbox');
  $('#stepQuestion_3').blankValidation('checkbox');
  $('#validate_mobile').blankValidation('tel');
  $("#toTop").click(function() {
    scrollToTop();
  });
  $('#firstQuestion #new_response').on('submit', function(e) {
    if (!$("input[type='radio']:checked").val()) {
      e.preventDefault();
      $('.form_errors').removeClass('display_none');
      scrollToTop();
      return false;
    } else {
      $('#firstQuestion #new_response').submit();
    }
  });
  $('.govuk-radios__input').change(function(){
    $("html, body").animate({scrollTop: $(window).height()}, 750);
  });
});

$( document ).on('turbolinks:load', function() {
  $('.display_hidden_radio').each(function() { $(this).displayHiddenRadio() });
  $('.display_hidden_checkbox').each(function() { $(this).displayHiddenCheckbox() });
})


$(window).scroll(function() {
  if ($(this).scrollTop()) {
    $('#toTop').fadeIn();
  } else {
    $('#toTop').fadeOut();
  }
});

function scrollToTop() {
  $("html, body").animate({scrollTop: $(window).height()}, 750);
};

