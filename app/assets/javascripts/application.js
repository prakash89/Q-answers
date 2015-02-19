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

$(function() {
        $("#commentLink1").click(function() {
            $("#commentContainer1_"+$(this).data("id")).toggle();
            // if ($("#commentContainer").is(":visible")) {
                // $("#commentContainer").load($(this).attr("href"));
            // } else {
                // $("#commentContainer").html("Loading..."); //Or just leave it as is...
            // }
            return false; //Prevent default action
        });
    });

$(function() {
    $(".commentLink").click(function() {
        $("#commentContainer_"+$(this).data("id")).toggle();
        return false; //Prevent default action
    });
});