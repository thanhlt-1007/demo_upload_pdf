//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$(document).on('ready', function() {
  $('.js-file-pdf').on('change', function() {
    var preview = $('.js-preview-pdf');
    var file = $(this)[0].files[0];

    var reader = new FileReader();
    reader.onload = function(e) {
      preview.attr('src', e.target.result);
    }
    reader.readAsDataURL(file);
  });
});
