// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap.min
//= require tinymce
//= require turbolinks
//= require_tree .


$(document).on("click","#commentLink1", function(e) {
    e.preventDefault();
    $("#commentContainer1_"+$(this).data("id")).toggle();
});

$(document).on("click",".commentLink", function(e) {
    e.preventDefault();
    $("#commentContainer_"+$(this).data("id")).toggle();
});
