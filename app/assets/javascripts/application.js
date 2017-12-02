//= require jquery
//= require jquery_ujs
//= require_tree ./libraries
//= require_tree .

$(window).ready(function() {
  $('.date_picker').datetimepicker({
    language: 'fr',
    format: 'YYYY-MM-DD',
    pickTime: false
  });
});
