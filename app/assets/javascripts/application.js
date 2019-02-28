// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

jQuery(document).ready(function(){
        jQuery('#hideeditweekslist').on('click', function(event) {        
             jQuery('#labels').toggle('show');
             jQuery('#editweekslist').toggle('show');
        });
    });

jQuery(document).ready(function(){
        jQuery('#hidelabels').on('click', function(event) {        
             jQuery('#editweekslist').toggle('show');
             jQuery('#labels').toggle('show');
        });
    });

$("#alert").html("<%= flash[:success] %>");

function myFunction() {
    var x = document.getElementById("content");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}