$.fn.displayHiddenRadio = function() {
  var displayInput = this;
  $("input:radio").change(function () {
    if (displayInput.is(':checked')) {
      $('.hidden_field').show();
    } else {
      $('.hidden_field').hide().val('');
    }
  });
};

$.fn.displayHiddenCheckbox = function() {
  var displayInput = this;
  displayInput.change(function () {
    if (displayInput.is(':checked')) {
      $('.hidden_field').show();
    } else {
      $('.hidden_field').hide().val('');
    }
  });
};


$.fn.blankValidation = function(inputType = 'radio') {
  var form = this.find($('form'));
  if (inputType == 'tel') {
    form.submit(function(e) {
      if (!$("input[type=" + inputType + "]").val()) {
        $('.form_errors').removeClass('display_none');
        return false;
      }
    });
  } else {
    var count = $('input[type=' + inputType + ']').length;

    form.submit(function(e) {
      if (!$("input[type=" + inputType + "]:checked").val()) {
        $('.form_errors').removeClass('display_none');
        return false;
      }
    });
  }
};
