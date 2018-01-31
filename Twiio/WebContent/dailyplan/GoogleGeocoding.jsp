<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">
  <head>
    <title>Geocoding service</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 80%;
        width: 50%;
        display: none;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        width: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 10;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
    </style>
  </head>
  <body>
  
  	
    <div id="floating-panel">
      <input id="address" type="textbox" value="">
      <input id="submit" type="button" value="Geocode">
    </div>
    
    <div id="map"></div>
    <script>
      
  	var service;
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 10,
          center: {lat: 37.5240220, lng: 126.9265940},
        disableDefaultUI: true
        });
  
        var geocoder = new google.maps.Geocoder;
		var infowindow = new google.maps.InfoWindow;
		var address = document.getElementById('address');
		service = new google.maps.places.PlacesService(map);
		var autocomplete = new google.maps.places.Autocomplete(address);
        document.getElementById('submit').addEventListener('click', function() {
        geocodeAddress(geocoder, map);
        });
      }

      function geocodeAddress(geocoder, resultsMap) {
        var address = document.getElementById('address').value;
 
        geocoder.geocode({'address': address}, function(results, status) {
        	if (status === 'OK') {
        		service.getDetails({
        		    placeId:results[0].place_id
        		}, function(place, status) {
        		    	//alert(JSON.stringify(place));
        		    	alert(JSON.stringify(place.url));
        		    	var log = {
        		    				formatted_address:JSON.stringify(place.formatted_address),
        		    				formatted_phone_number:(JSON.stringify(place.formatted_phone_number)==null?0:JSON.stringify(place.formatted_phone_number)),
									international_phone_number:(JSON.stringify(place.international_phone_number)==null?0:JSON.stringify(place.international_phone_number)),
									weekday_text:(JSON.stringify(place.opening_hours.weekday_text)==null?0:JSON.stringify(place.opening_hours.weekday_text)),
									rating:JSON.stringify(place.rating),
									types:JSON.stringify(place.types),
									url:JSON.stringify(place.url),
									website:JSON.stringify(place.website)
									};
        		    	console.log(log);
        		});
           
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
      
			
    </script>
    <script type = "text/javascript" async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwwqenPL4wZOiFh9Ljfohh2vadO29GeFM&libraries=places&callback=initMap&sensor=true">
	</script>
   
  </body>
</html>