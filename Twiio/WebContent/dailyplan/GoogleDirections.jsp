<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<head>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
	<meta charset="utf-8">
	<title>Directions service</title>
	<style type="text/css">
		html, body {
		  height: 100%;
		  margin: 0;
		  padding: 0;
		}

		#map-canvas, #map_canvas {
		  height: 100%;
		}

		@media print {
		  html, body {
			height: auto;
		  }

		  #map_canvas {
			height: 650px;
		  }
		}
		
		 #autocomplete {
        width: 100%;
      }
		

		#panel {
		  position: absolute;
		  top: 5px;
		  left: 50%;
		  margin-left: -180px;
		  z-index: 5;
		  background-color: #fff;
		  padding: 5px;
		  border: 1px solid #999;
		}
	</style>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC3XuExiWoSEQ7kAr0GPntmjPwgUPYq5o8&sensor=false&libraries=places"></script>
	<script>
	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();
	var map;
	
	function initialize() {
	  directionsDisplay = new google.maps.DirectionsRenderer();
	  var seoul = new google.maps.LatLng(37.5662952,126.97794509999994);
	  var mapOptions = {
		zoom:7,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		center: seoul
	  }
	  
	  var input = document.getElementById('start');
	  var input2 = document.getElementById('end');
	  var autocomplete = new google.maps.places.Autocomplete(input);
	  var autocomplete2 = new google.maps.places.Autocomplete(input2);
	  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
	  directionsDisplay.setMap(map);
	}

	function calcRoute() {
	  var start = document.getElementById('start').value;
	  var end = document.getElementById('end').value;
	  var mode = document.getElementById('mode').value;

	  var request = {
		  origin:start,
		  destination:end,
		  travelMode: eval("google.maps.DirectionsTravelMode."+mode)
	  };
	  
	  directionsService.route(request, function(response, status) {
		//alert(status);  // 확인용 Alert..미사용시 삭제
		if (status == google.maps.DirectionsStatus.OK) {
			console.log(JSON.stringify(response));
			directionsDisplay.setDirections(response);
			alert(JSON.stringify(response.routes[0].legs[0].steps.length));
			var totaldisplay =
				' ＃ 총이동소요시간  : '+response.routes[0].legs[0].duration.text+
				' / 거리  : '+response.routes[0].legs[0].distance.text+
				' / 출발시간  : '+response.routes[0].legs[0].departure_time.text+
				' / 도착시간  : '+response.routes[0].legs[0].arrival_time.text+
				' / 출발장소  : '+response.routes[0].legs[0].start_address+
				' / 도착장소  : '+response.routes[0].legs[0].end_address;
			console.log('totaldisplay : '+totaldisplay);
			
			var detaildisplay='';
			
			for(var i=0; i<response.routes[0].legs[0].steps.length;i++){
				detaildisplay += 
					' / 이동소요시간  : '+response.routes[0].legs[0].steps[i].duration.text+
					' / 거리  : '+response.routes[0].legs[0].steps[i].distance.text+
					' / 설명  : '+response.routes[0].legs[0].steps[i].instructions+
					' / 이동수단  : '+response.routes[0].legs[0].steps[i].travel_mode;
				
				if(response.routes[0].legs[0].steps[i].transit != null){
					 detaildisplay +=
						' / 출발 장소  : '+response.routes[0].legs[0].steps[i].transit.departure_stop.name+
						' / 출발 시간  : '+response.routes[0].legs[0].steps[i].transit.departure_time.text+
						' / 도착 장소  : '+response.routes[0].legs[0].steps[i].transit.arrival_stop.name+
						' / 도착 시간  : '+response.routes[0].legs[0].steps[i].transit.arrival_time.text+
						' / 이동 방향  : '+response.routes[0].legs[0].steps[i].transit.headsign+
						' / 차량 이름  : '+response.routes[0].legs[0].steps[i].transit.line.name+
						' / 차량 번호  : '+response.routes[0].legs[0].steps[i].transit.line.short_name+
						' / 이동 수단  : '+response.routes[0].legs[0].steps[i].transit.line.vehicle.name+
						' / 이동 수단  : '+response.routes[0].legs[0].steps[i].transit.line.vehicle.type; 
				}	
				console.log('detaildisplay : '+detaildisplay); 
				detaildisplay ='';
			}
			
			
			
		}else{
			alert('fail');
		}
	  });
	}

	google.maps.event.addDomListener(window, 'load', initialize);

	</script>
	</head>
	
	<body>
		<div id="panel" >
			<b>Start: </b>
			<input type="text" id="start" value="카타루냐 광장"/>
			<b>End: </b>
			<input type="text" id="end" value="마드리드 왕궁"/>
			<div>
				<strong>Mode of Travel: </strong>
				<select id="mode">
				<option value="DRIVING">Driving</option>
				<option value="WALKING">Walking</option>
				<option value="BICYCLING">Bicycling</option>
				<option value="TRANSIT" selected>Transit</option>
				</select>
				<input type="button" value="길찾기" onclick="Javascript:calcRoute();" />
			</div>
		</div>
		
		<div id="map-canvas"></div>
	</body>
	
</html>