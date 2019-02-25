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
  form.submit(function(e) {
    e.preventDefault();
    $('input[type=radio]').each(function () {
      if($(this).is(':checked')){

      }
    });
    $('.form_errors').removeClass('display_none');
  });

};
