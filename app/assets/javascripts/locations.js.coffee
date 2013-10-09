displayPosition = () ->
  pos = new google.maps.LatLng(@location.coords.latitude, @location.coords.longitude)
  options =
    zoom: 16
    center: pos
    mapTypeId: google.maps.MapTypeId.ROADMAP
    
  cookie_val = @location.coords.latitude + "|" + position.coords.longitude
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
getRandomInRange = (from, to, fixed) ->
  (Math.random() * (to - from) + from).toFixed(fixed) * 1
generateRandomData = ->
  heatData = new Array(100000)
  i = 0

  while i < heatData.length
    lat = getRandomInRange(43.645527, 43.660527, 4)
    lon = getRandomInRange(-79.390961, -79.372961, 4)
    heatData[i] = new google.maps.LatLng(lat, lon)
    i++
  heatData
if navigator.geolocation
  timeoutVal = 10 * 1000 * 1000
  navigator.geolocation.getCurrentPosition displayPosition, displayError,
    enableHighAccuracy: true
    timeout: timeoutVal
    maximumAge: 0

else
  alert "Geolocation is not supported by this browser"