# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
displayPosition = (position) ->
  pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
  options =
    zoom: 16
    center: pos
    mapTypeId: google.maps.MapTypeId.ROADMAP
    
  cookie_val = position.coords.latitude + "|" + position.coords.longitude
  document.cookie = "lat_lng=" + escape(cookie_val)
  map = new google.maps.Map(document.getElementById("googleMap"), options)
  marker = new google.maps.Marker(
    position: pos
    map: map
    title: "Current Location"
  )
  contentString = "<br/><b>Current location:</b> lat " + position.coords.latitude + ", long " + position.coords.longitude
  infowindow = new google.maps.InfoWindow(content: contentString)
  google.maps.event.addListener marker, "click", ->
    infowindow.open map, marker

displayError = (error) ->
  errors =
    1: "Permission denied"
    2: "Position unavailable"
    3: "Request timeout"

  alert "Error: " + errors[error.code]
  
if navigator.geolocation
  timeoutVal = 10 * 1000 * 1000
  navigator.geolocation.getCurrentPosition displayPosition, displayError,
    enableHighAccuracy: true
    timeout: timeoutVal
    maximumAge: 0

else
  alert "Geolocation is not supported by this browser"