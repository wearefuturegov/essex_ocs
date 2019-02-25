$.fn.displayHidden = function() {
  var displayInput = this;
  $("input:radio").change(function () {
    if (displayInput.is(':checked')) {
      $('.hidden_field').show();
    } else {
      $('.hidden_field').hide().val('');
    }
  });

};
