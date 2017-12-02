//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require libraries/amoment.min.js
//= require_tree ./libraries
//= require_tree .

$(window).ready(function() {
  $('.date_picker').datetimepicker({
    language: 'fr',
    format: 'YYYY-MM-DD',
    pickTime: false
  });
});
