// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function show_signup()
{
 $("#login_div").fadeOut('fast', function() {
  $("#register_div").fadeIn();
 });
}
function show_login()
{
 $("#register_div").fadeOut('fast', function() {
  $("#login_div").fadeIn();
 });
}

function aboutReload() { 
  $('#Reloader').html('<iframe src="https://wheeldecide.com/e.php?id=281847" width="500" height="500" scrolling="no" frameborder="0"></iframe>');
 }

// function please(){
// var iframe = document.getElementById('wheel-doc');
// iframe.style.backgroundColor = "red";
// var innerDoc = iframe.contentDocument || iframe.contentWindow.document;
// innerDoc.getElementById('wheelbuttons').style.backgroundColor = "black";
// }

// function please() {
//    var iframe = document.getElementById("wheel");
//    var innerDoc = iframe.contentWindow.document.getElementById("wheelbuttons");
//    innerDoc.style.backgroundColor = "black";
// }


// function please() {
//    // var iframe = document.getElementById("wheel");
//    var innerDoc = document.getElementById("wheelbuttons");
//    innerDoc.style.backgroundColor = "black";
// }

// function please () {
// var iframe = document.getElementById('wheel');
// iframe.style.backgroundColor = "red";
// var innerDoc = (iframe.contentDocument) ? iframe.contentDocument : iframe.contentWindow.document;

// innerDoc.getElementById('wheelbuttons').style.backgroundColor = "black";

//      }       
         
