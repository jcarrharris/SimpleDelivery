// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require bootstrap
//= require picker
//= require_tree .
$(function() {
  $("#orders th").on("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#orders_search input").keyup(function() {
      $.get($("#orders_search").attr("action"), $("#orders_search").serialize(), null, "script");
      return false;
    });
  $('#myTab a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
    $('#myTab a[href="#profile"]').tab('show');
  });
  $("#date").pickadate();
  $("#time").pickatime();
  $("#date2").pickadate();
  $("#time2").pickatime();

  $( "#accordion" ).accordion({ collapsible: true });
  $(this).addClass('newClass');

  $('.phone_us').mask('(000) 000-0000');

  $(".address").geocomplete({
  map: ".map_canvas"
  });

});