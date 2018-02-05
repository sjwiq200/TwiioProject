<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<%
	String dailyPlanNo = (String) request.getParameter("data");
%>


<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="UTF-8">
<title>Directions service</title>



<style type="text/css">

#resultMap4Detail{
	font-size : 0.8em;
}

#map-canvas, #map_canvas {
	height: 500px;
	width: 500px;
}

@media print {
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


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC3XuExiWoSEQ7kAr0GPntmjPwgUPYq5o8&sensor=false&libraries=places"></script>


<script>
	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();
	var mapRoute;
	var totalDisplay;
	var detailedDisplay = '';

	function initialize() {
		directionsDisplay = new google.maps.DirectionsRenderer();
		var seoul = new google.maps.LatLng(37.5662952, 126.97794509999994);
		var mapOptions = {
			zoom : 7,
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			center : seoul
		}

		var input = document.getElementById('start');
		var input2 = document.getElementById('end');
		var autocomplete = new google.maps.places.Autocomplete(input);
		var autocomplete2 = new google.maps.places.Autocomplete(input2);
		mapRoute = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		directionsDisplay.setMap(mapRoute);
	}

	function calcRoute() {
		var start = document.getElementById('start').value;
		var end = document.getElementById('end').value;
		var mode = document.getElementById('mode').value;

		var request = {
			origin : start,
			destination : end,
			travelMode : eval("google.maps.DirectionsTravelMode." + mode)
		};

		directionsService
				.route(
						request,
						function(response, status) {
							if (status == google.maps.DirectionsStatus.OK) {
								$(".routeMainResult").remove();
								$(".routeDetailResult").remove();
								
								directionsDisplay.setDirections(response);
								totalDisplay = '총 이동 소요시간:'+ response.routes[0].legs[0].duration.text
										+ ' //출발:'+ response.routes[0].legs[0].start_address
										+ ' //도착:'+ response.routes[0].legs[0].end_address
										+ ' //거리:'+ response.routes[0].legs[0].distance.text;

								for (var i = 0; i < response.routes[0].legs[0].steps.length; i++) {
									detailedDisplay += ' //이동수단:'+ response.routes[0].legs[0].steps[i].travel_mode
											+ '//이동 소요시간:'+ response.routes[0].legs[0].steps[i].duration.text
											+ ' //거리:'+ response.routes[0].legs[0].steps[i].distance.text
											+ ' //설명:'+ response.routes[0].legs[0].steps[i].instructions;

									if (response.routes[0].legs[0].steps[i].transit != null) {
										detailedDisplay += ' //대중교통수단 :'+ response.routes[0].legs[0].steps[i].transit.line.vehicle.name
												+ ' //출발장소:'+ response.routes[0].legs[0].steps[i].transit.departure_stop.name;
												+ ' //도착장소:'+ response.routes[0].legs[0].steps[i].transit.arrival_stop.name
												+ ' //차량이름:'+ response.routes[0].legs[0].steps[i].transit.line.name
												+ ' //차량번호:'+ response.routes[0].legs[0].steps[i].transit.line.short_name;
												
									}
									console.log('detailedDisplay : '
											+ detailedDisplay);

								}
								
								$("#totalDisplay").val(totalDisplay);
								$("#detailedDisplay").val(detailedDisplay);
								
								$.ajax( 
										{
											url : "/dailyplan/json/getRouteResult/",
											method : "POST" ,
											data : {
												"totalDisplay" : totalDisplay,
												"detailedDisplay" : detailedDisplay
											},
											headers : {
												"Accept" : "application/json",
												"Content-Type" : "application/json"
											},
											success : function(JSONData , status) {
												mainResultEnd = JSONData.mainResultEnd;
												detailResultFinal = JSONData.detailResultFinal;
												
												$("#resultMap").append("<img src='/resources/images/dailyPlanContent/routeIcon.png' width='100px'>");
												
												for(var i=0;i<mainResultEnd.length;i++){
													$("#resultMap")
							        		    			.append("<div class=\"routeMainResult\"  align=\"center\"><strong></strong>"+mainResultEnd[i]+"</div>");
													
												}
												
												for(var i=0;i<detailResultFinal.length;i++){
													$("#resultMap4Detail")
							        		    			.append("<div class=\"routeDetailResult\"  align=\"center\">"+detailResultFinal[i]+"</div>");
												}
												
												var resultMap = $("#resultMap").html();
												var resultMap4Detail = $("#resultMap4Detail").html();
												//alert(resultMap);
												//alert(resultMap4Detail);
												$("#totalDisplay").val(resultMap);
												$("#detailedDisplay").val(resultMap4Detail);
												$("#type").val(mode);
												
											}
											
							});
								
								

							} else {
								alert('값을 불러올 수 없습니다. 재입력 부탁드립니다. [비행기 정보 출력되지 않습니다.]');
							}
						});
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);
	
	$(function() {
		$("#addMapToPlan").on("click",function() {
					$("form").attr("method", "POST").attr("action","/dailyplan/addRoute").submit();
				});
	});

</script>
</head>

<body>

	<div align="center">
		<b>출발지 : </b> <input type="text" id="start" value="카타루냐 광장" /> <b>도착지
			: </b> <input type="text" id="end" value="마드리드 왕궁" />
		<div>
			<strong>이동방법</strong> <select id="mode">
				<option value="DRIVING">자동차</option>
				<option value="WALKING">도보</option>
				<option value="BICYCLING">자전거</option>
				<option value="TRANSIT" selected>대중교통</option>
			</select> <input type="button" value="길찾기" onclick="Javascript:calcRoute();" />
		</div>

		
		<div id="map-canvas"></div>
		<button type="button" class="btn btn-success" name="addMapToPlan" id="addMapToPlan">내 플랜에 추가하기</button>
		<div id="resultMap"></div>
		
		<div id="resultMap4Detail"></div>

			<form>
				<input type="hidden" name="dailyPlanNo" value="${dailyPlanNo}" />
				<input type="hidden" name="totalDisplay" id="totalDisplay"  /> 
				<input type="hidden" name="detailedDisplay" id="detailedDisplay"  />
				<input type="hidden" name="type" id="type" />
			</form>
		
		<div>&nbsp;</div>
		
	
	</div>
</body>

</html>