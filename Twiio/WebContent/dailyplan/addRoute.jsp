<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<%
	String dailyPlanNo = (String) request.getParameter("data");
	String mainPlanNo = (String) request.getParameter("mainPlanNo");
%>


<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="UTF-8">
<title>Directions service</title>



<style type="text/css">

body {
}
#mainBody {
	padding-top: 140px;
}

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

#map-canvas {
	border-radius: 5%;

}

#title {
 	font-size: 5.5em;
	padding: 0 0.5em 0.25em 0.5em;
	font-family: "Pacifico", cursive;
	margin-bottom: 30px;
	text-transform: none;
	letter-spacing: 10;
}
#routeQuery {
	font-family:'JEJUGOTHIC';
	font-size: 1.2em;
}
</style>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC3XuExiWoSEQ7kAr0GPntmjPwgUPYq5o8&sensor=false&libraries=places"></script>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Hover Jquery -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="/resources/css/plan-getDailyPlan.css" />

	

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
								
										
								var flagRight=true;
								var resultA="<tr><td> Row1 cell1 </td><td> Row1 Cell3 </td><td> Row1 cell2 </td><td> Row1 Cell3 </td> <td> 화살표 아래 </td></tr>";
								var resultB="<tr><td> 화살표 아래 </td><td> Row1 Cell3 </td><td> Row1 cell2 </td><td> Row1 Cell3 </td> <td> Row1 Cell3 </td></tr>";
								
						/* 		var result = "<table id='myTable'>"; */
								//var count= 0 ; 
						/* 		for (var i = 0; i < response.routes[0].legs[0].steps.length; i++) {
									if(count%3==0){
										 result += "<tr>"
										 				+"<td> Row1 cell 1</td><td> Row1 Cell3 </td><td> Row1 cell2 </td><td> Row1 Cell3 </td> <td> Row1 Cell3 </td>"
										 			+"</tr>"
									}
									count++;
								}
								result += "</table>";
								
								$("#resultMap").append(result); */
								
								var resultC="<tr>";
								var middle="";
								var resultNotYet= "";
								for (var i = 0; i < response.routes[0].legs[0].steps.length; i++) {
									if(flagRight){
										resultNotYet += "<td>"
										if(response.routes[0].legs[0].steps[i].transit == null){
											detailedDisplay='';
											detailedDisplay += '#'
												
											 +	' //이동수단:'+ response.routes[0].legs[0].steps[i].travel_mode;
											/*+ ' 이동 소요시간:'+ response.routes[0].legs[0].steps[i].duration.text
											+ ' 거리:'+ response.routes[0].legs[0].steps[i].distance.text
											+ ' 설명:'+ response.routes[0].legs[0].steps[i].instructions
											+ '-----------'; */
										}else{
												detailedDisplay += '#'
											/* 		'//이동 소요시간:'+ response.routes[0].legs[0].steps[i].duration.text
												+ ' 거리:'+ response.routes[0].legs[0].steps[i].distance.text
												+ ' 설명:'+ response.routes[0].legs[0].steps[i].instructions*/
												+ ' 대중교통수단 :'+ response.routes[0].legs[0].steps[i].transit.line.vehicle.name;
											/*	+ ' 출발장소:'+ response.routes[0].legs[0].steps[i].transit.departure_stop.name
												+ ' 도착장소:'+ response.routes[0].legs[0].steps[i].transit.arrival_stop.name
												+ ' 차량이름:'+ response.routes[0].legs[0].steps[i].transit.line.name
												+ ' 차량번호:'+ response.routes[0].legs[0].steps[i].transit.line.short_name
												+'---------------'; */
										}
										resultNotYet +=detailedDisplay+"</td>";
										detailedDisplay='';
										
										
										//middle +="</td>"
										if(i%3==2){
											resultC +="<tr>"+resultNotYet+"</tr>";
											flagRight=false;
											$("#resultMap").append("<table id='myTable'>"+resultC+resultA+"</table>");
											resultC = "";
											resultNotYet="";
										}else{
											resultNotYet = resultNotYet+"<td>-></td>";
										}
									}else{
										detailedDisplay='';
										detailedDisplay += "<td>";
											if(response.routes[0].legs[0].steps[i].transit == null){
												detailedDisplay += '%'
											 	+	' //이동수단:'+ response.routes[0].legs[0].steps[i].travel_mode;
												/*+ ' 이동 소요시간:'+ response.routes[0].legs[0].steps[i].duration.text
												+ ' 거리:'+ response.routes[0].legs[0].steps[i].distance.text
												+ ' 설명:'+ response.routes[0].legs[0].steps[i].instructions
												+ '-----------'; */
											}else{
													detailedDisplay +='%'
											/* 		'//이동 소요시간:'+ response.routes[0].legs[0].steps[i].duration.text
													+ ' 거리:'+ response.routes[0].legs[0].steps[i].distance.text
													+ ' 설명:'+ response.routes[0].legs[0].steps[i].instructions*/
													+ ' 대중교통수단 :'+ response.routes[0].legs[0].steps[i].transit.line.vehicle.name
												/*	+ ' 출발장소:'+ response.routes[0].legs[0].steps[i].transit.departure_stop.name
													+ ' 도착장소:'+ response.routes[0].legs[0].steps[i].transit.arrival_stop.name
													+ ' 차량이름:'+ response.routes[0].legs[0].steps[i].transit.line.name
													+ ' 차량번호:'+ response.routes[0].legs[0].steps[i].transit.line.short_name
													+'---------------'; */
											}
											var a = detailedDisplay+"</td>";
											resultNotYet = a+resultNotYet;
											detailedDisplay='';
											if(i%3==2){
												resultC +="<tr>"+resultNotYet+"</tr>";
												flagRight=true;
												$("#resultMap").append("<table id='myTable'>"+resultC+resultB+"</table>");
												resultC = "";
												resultNotYet="";
											}else{
												resultNotYet = "<td><-</td>"+resultNotYet;
											}
										
									}
								}
								
								
								//$("#totalDisplay").val(totalDisplay);
								//$("#detailedDisplay").val(detailedDisplay);
								
								/* $.ajax( 
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
												
												$("#resultMap").append("<div class='col-xs-12 innerMain'align='center'><img src='/resources/images/dailyPlanContent/route.png' width='100px'></div>");
												
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
											
							}); */
								
								

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
<body id="mainBody">


	<div><jsp:include page="/layout/toolbar.jsp" /></div>
	
	<div align="center">
		<div class="col-xs-12" id="title">
		<h1>Save your route</h1>
		</div>
		
		<div class="row" id="routeQuery">
		<div class="col-xs-12" >
		<b>출발지 : </b> <input type="text" id="start" value="카타루냐 광장" /> </div>
		<div class="col-xs-12" >
		<b>도착지: </b> <input type="text" id="end" value="마드리드 왕궁" /></div>
		
		<div class="col-xs-12" >
			<strong>이동방법</strong> <select id="mode">
				<option value="DRIVING">자동차</option>
				<option value="WALKING">도보</option>
				<option value="BICYCLING">자전거</option>
				<option value="TRANSIT" selected>대중교통</option>
			</select>
		<div> <button type="button" class="btn btn-default"  onclick="Javascript:calcRoute();" /> 길찾기</button></div>
		
		</div>
		</div>
		
		<div class="col-xs-12">&nbsp;</div>
		<div id="map-canvas"></div>
		<button type="button" class="btn btn-default" name="addMapToPlan" id="addMapToPlan">내 플랜에 추가하기</button>
		<div id="resultMap"></div>
		
		<div id="resultMap4Detail"></div>

			<form>
				<input type="hidden" name="dailyPlanNo" value="${dailyPlanNo}" />
				<input type="hidden" name="mainPlanNo" value="${mainPlanNo}" />
				<input type="hidden" name="totalDisplay" id="totalDisplay"/> 
				<input type="hidden" name="detailedDisplay" id="detailedDisplay"/>
				<input type="hidden" name="type" id="type"/>
			</form>
		
		<div>&nbsp;</div>
		
	
	</div>
</body>

</html>