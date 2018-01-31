<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">
  <head>
    <title>Geocoding service</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 	<script src="/js/viewTinted.js"></script>
 	
 	
 <style>
      #map {
        height: 300px;
        width: 500px;

      }
      html, body {
        height: 100%;
        width: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
/*         position: absolute;
        top: 10px;
        left: 50%; */
        z-index: 10;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      
      .pac-container {
    z-index: 100000;
}

    </style>
  </head>
  <body>
  
  	
    <div id="floating-panel">
      <input id="address" type="textbox" value="">
      <input id="submit" type="button" value="검색">
      <div id="resultMap" type="textbox" value=""> - </div>
    </div>
    
    <div id="map">
    </div>
    
    
    
    <script>
      

    $(function(){
        $(document).viewTinted();
    });
    
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
        		    	var log = {
        		    				formatted_address:JSON.stringify(place.formatted_address),
									types:JSON.stringify(place.types),
									url:JSON.stringify(place.url),
									formatted_phone_number:(JSON.stringify(place.formatted_phone_number)==null?0:JSON.stringify(place.formatted_phone_number)),
									international_phone_number:(JSON.stringify(place.international_phone_number)==null?0:JSON.stringify(place.international_phone_number)),
									rating:(JSON.stringify(place.rating)==null?0:JSON.stringify(place.rating)),
									website:(JSON.stringify(place.website)==null?0:JSON.stringify(place.website))
									};
        		    	console.log(log);
        		    
        		    	var address=JSON.stringify(place.formatted_address);
        		    	var types=JSON.stringify(place.types);
        		    	var url = JSON.stringify(place.url);
        		    	
        		    	$("#resultMap")
        		    	.append("<div align=\"center\">"+address+"</div>")
        		    	.append("<div align=\"center\">"+types+"</div>")
        		    	.append("<div align=\"center\">"+url+"</div>");
        		    	
        		    	
        		});
           
          } else {
            alert('찾으시는 장소가 검색되지 않네요 흑흑 다른 검색어로 한번 다시 해볼까요?' + status);
          }
        });
      }
      
			
      
      $('#addMap').on('show.bs.modal', function() {
   	   //Must wait until the render of the modal appear, thats why we use the resizeMap and NOT resizingMap!! ;-)
   	   resizeMap();
   	})

   	function resizeMap() {
   	   if(typeof map =="undefined") return;
   	   setTimeout( function(){resizingMap();} , 400);
   	}

   	function resizingMap() {
   	   if(typeof map =="undefined") return;
   	   var center = map.getCenter();
   	   google.maps.event.trigger(map, "resize");
   	   map.setCenter(center); 
   	}
   	
   	
   	
    </script>
    <script type = "text/javascript" async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwwqenPL4wZOiFh9Ljfohh2vadO29GeFM&libraries=places&callback=initMap&sensor=true">
	</script>
   
  </body>
</html>