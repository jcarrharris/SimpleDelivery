var myOptions = {
  zoom: 16,
  center: new google.maps.LatLng(gon.lat,gon.lng),
  mapTypeId: google.maps.MapTypeId.ROADMAP
};
var map = new google.maps.Map(document.getElementById("locationMap"), myOptions);
var marker = new google.maps.Marker({
  map: map,
  position: new google.maps.LatLng(gon.lat,gon.lng),
  title: "Location Address"
});