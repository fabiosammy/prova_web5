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
//= require turbolinks
//= require semantic-ui
//= require_tree 


jQuery(function($){
    $("#number").mask("(+55) 99999-9999");
});

jQuery(function($){
   $("#birthday").mask("99/99/9999");
});

var url = window.location.href.toString().split(window.location.host)[1];
var localhost = 'http://localhost:3000'; 
var js  = '/phones.json'
var json = localhost+url+js;

$.ajax({
  type : "GET",
  url :  json,
  dataType: 'json',
  success: function(response) {
  	$.each(response, function(i, k) {
  		
  		// em cada loop de $.each, k será uma
  		// alert(json);
  		$("#seuSelect").append(new Option(k.number, k.id));
  	});
  }
});

