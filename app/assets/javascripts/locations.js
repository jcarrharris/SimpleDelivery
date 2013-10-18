$(document).ready( function() {
  var myOptions = {
    zoom: 16,
    center: new google.maps.LatLng($('#locationMap').data('latitude'),$('#locationMap').data('longitude')),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("locationMap"), myOptions);
  var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng($('#locationMap').data('latitude'),$('#locationMap').data('longitude')),
    title: "Location Address"
  });
});