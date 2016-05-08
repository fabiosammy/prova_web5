
var url  window.location.href.toString().split(window.location.host)[1];
var localhost = 'http://localhost:3000'; 
var js  = '/contact.json'
var json = localhost+url+js;

$.ajax({
  type : "GET",
  url :  json,
  dataType: 'json',
  success: function(response) {
    $.each(response, function(i, k) {
      
      // em cada loop de $.each, k será uma
      alert("oi");
      // $("#seuSelect").append(new Option(k.number, k.id));
    });
  }
});