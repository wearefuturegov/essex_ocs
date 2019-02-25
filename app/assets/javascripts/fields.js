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

$.fn.blankValidation = function() {
  var form = this.find($('form'));
  var count = $('input[type=radio]').length;

  form.submit(function(e) {
    if (!$("input[type=radio]:checked").val()) {
      $('.form_errors').removeClass('display_none');
      return false;
    }
  });
};
