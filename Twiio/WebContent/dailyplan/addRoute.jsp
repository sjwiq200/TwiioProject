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
body::-webkit-scrollbar {
  width: 0.7em;
  background: transparent;
}
body::-webkit-scrollbar-thumb {
  background: transparent;
}

#mainBody {
	padding-top: 70px;
	font-family:'JEJUGOTHIC';
	background: #f4f4f4;
}

#innerMain {
	font-size: 3em;
	margin-top: 1.5em;
}

#thumbnailMainBox {
	min-height: 1500px;
	font-family:'JEJUMYEONGJO';
	background: linear-gradient(-45deg, #08708A, transparent),linear-gradient(45deg, #D73A31, transparent);
	border-radius: 8px;
	border-color: #000000;
	border-width: 10px;
	display: inline-block;
	padding: 2px;
	text-decoration: none;
}

#thumbnailMainThumbBox {
	min-height: 1500px;
	background: #fff;
	display: inline-block;
	border-radius: 6px;
}

#resultMap4Detail {
	font-size: 0.8em;
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

#routeQuery {
	font-family: 'JEJUGOTHIC';
	font-size: 1.2em;
}
</style>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC3XuExiWoSEQ7kAr0GPntmjPwgUPYq5o8&sensor=false&libraries=places"></script>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link
	href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
		$("#resultMapSummary").remove();
		$("#resultMap").remove();
		$("#resultMap").remove();
		$("#addMapToPlan").remove();
		$("#box1").append('<div class="col-xs-12"><div id="resultMapSummary"></div></div>'
				+'<div class="col-xs-12"><button type="button" class="btn btn-default" name="addMapToPlan" id="addMapToPlan">내 플랜에 추가하기</button></div>');
		$("#box2").append('<div id="resultMap"></div>');

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
								totalDisplay = '<h2>길찾기 결과</h2></br><strong>총 이동 소요시간</strong>:  '+ response.routes[0].legs[0].duration.text+ '</br>'
										+ '<strong>출발</strong>:  '+ response.routes[0].legs[0].start_address+ '</br>'
										+ '<strong>도착</strong>:  '+ response.routes[0].legs[0].end_address+ '</br>'
										+ '<strong>거리</strong>:  '+ response.routes[0].legs[0].distance.text+ '</br>';

								$("#resultMapSummary").append("<div align='center' style='font-family:\'JEJUGOTHIC\'; border-bottom: 2px dotted #3B3B3B;>"+ totalDisplay+ "</div>");

								var flagRight = true;
								var resultA = "<tr align='center' style='word-wrap:break-word;word-break:break-all; > <td width='150px'></td> <td width='150px'></td> <td width='150px'></td> <td width='150px'></td> <td width='150px'></td> <td width='150px' align='center'> <img src='/resources/images/icon/plan/downCircle.png' width='30px'></td> </tr>";
								var resultB = "<tr align='center' style='word-wrap:break-word;word-break:break-all;' align='center'><td width='150px' > <img src='/resources/images/icon/plan/downCircle.png' width='30px'></td><td width='150px'> </td><td width='150px'></td><td width='150px'>  </td> <td width='150px'>  </td></tr>";

								var resultC = "<tr align='center'>";
								var count = 0;
								var resultNotYet = "";
								var num=0;
								for (var i = 0; i < response.routes[0].legs[0].steps.length; i++) {

									if (flagRight) {//to the right////////////////////////////////////////
										resultNotYet += "<td  style='word-break:break-all;' width='150px'>"
										num++;
										if (response.routes[0].legs[0].steps[i].transit == null) {

											detailedDisplay = '';
											if ((response.routes[0].legs[0].steps[i].travel_mode).includes("WALKING")) {
												detailedDisplay += "<img src='/resources/images/icon/plan/walkwalk.png' width='70px'><br/>";
											}
											if ((response.routes[0].legs[0].steps[i].travel_mode).includes("DRIVING")) {
												detailedDisplay += "<img src='/resources/images/icon/plan/automobile.png' width='100px'><br/>";
											}

											if ((response.routes[0].legs[0].steps[i].travel_mode).includes("BICYCLING")) {
												detailedDisplay += "<img src='/resources/images/icon/plan/cycle.png' width='100px'><br/>";
											}
											detailedDisplay += '<div align="left" style="font-family:\'JEJUGOTHIC\';">'
													+ response.routes[0].legs[0].steps[i].duration.text+ ' / '+ response.routes[0].legs[0].steps[i].distance.text+ '</br>'
													+ response.routes[0].legs[0].steps[i].instructions
													+ '</br></div>';

											/*+ '-----------'; */
										} else {
											if ((response.routes[0].legs[0].steps[i].transit.line.vehicle.name).includes("지하철")) {
												detailedDisplay += "<img src='/resources/images/icon/plan/tramway.png' width='100px'><br/>";
											}
											if ((response.routes[0].legs[0].steps[i].transit.line.vehicle.name).includes("기차")) {
												detailedDisplay += "<img src='/resources/images/icon/plan/train2.png' width='100px'><br/>";
											}
											if ((response.routes[0].legs[0].steps[i].transit.line.vehicle.name).includes("장거리")) {
												detailedDisplay += "<img src='/resources/images/icon/plan/train2.png' width='100px'><br/>";
											}
											if ((response.routes[0].legs[0].steps[i].transit.line.vehicle.name).includes("버스")) {
												detailedDisplay += "<img src='/resources/images/icon/plan/buses.png' width='100px'><br/>";
											}
											detailedDisplay += '<div align="left" style="font-family:\'JEJUGOTHIC\';">'
													+ response.routes[0].legs[0].steps[i].duration.text+ ' / '+ response.routes[0].legs[0].steps[i].distance.text+ ' / '
													+ response.routes[0].legs[0].steps[i].transit.line.vehicle.name+ '</br>'
													+ ' <strong>출발장소</strong> :'+ response.routes[0].legs[0].steps[i].transit.departure_stop.name+ '</br>'
													+ ' <strong>도착장소</strong> :'+ response.routes[0].legs[0].steps[i].transit.arrival_stop.name+ '</br>'
													+ ' <strong>차량이름</strong>:'+ response.routes[0].legs[0].steps[i].transit.line.name+ '</br>'
													+ ' <strong>차량번호</strong>:'+ response.routes[0].legs[0].steps[i].transit.line.short_name+ '</br></div>';

										}
										resultNotYet += detailedDisplay + "</td>";
										detailedDisplay = '';

										if (i % 3 == 2) {//choose whether it needs to have a new row or not
											if (count == response.routes[0].legs[0].steps.length - 1) {//but if it is last, it needs to delete arrow
												resultC += "<tr align='center'>"+ resultNotYet+ "</tr>";
												flagRight = false;
												$("#resultMap").append("<table id='myTable' width='600px' style='word-wrap:break-word;word-break:break-all;'>"+ resultC+ "</table>");
												resultC = "";
												resultNotYet = "";
											} else {
												resultC += "<tr align='center'>"+ resultNotYet+ "</tr>";
												flagRight = false;
												$("#resultMap").append(
																"<table id='myTable' width='600px' style='word-wrap:break-word;word-break:break-all;'>"+ resultC+ resultA+ "</table>");
												resultC = "";
												resultNotYet = "";
											}
										} else if (count == response.routes[0].legs[0].steps.length - 1) {
											
											var rest = num%3;
											if(rest == 1){
												resultC += resultNotYet;flagRight = false;
												$("#resultMap").append("<table id='myTable' width='600px' style='word-wrap:break-word;word-break:break-all;'><tr align='center'>"+ resultC+ "<td></td><td></td><td></td><td></td></tr></table>");
											}else if(rest == 2){
												resultC += resultNotYet;flagRight = false;
												$("#resultMap").append("<table id='myTable' width='600px' style='word-wrap:break-word;word-break:break-all;'><tr align='center'>"+ resultC+ "<td></td><td></td></tr></table>");
											}else{
												resultC += "<tr align='center'>"+ resultNotYet + "</tr>";flagRight = false;
												$("#resultMap").append("<table id='myTable' width='600px' style='word-wrap:break-word;word-break:break-all;'>"+ resultC+ "</table>");
											}
											resultC = "";
											resultNotYet = "";
										} else {	
											resultNotYet = resultNotYet
													+ "<td width='150px' style='word-break:break-all;'><img src='/resources/images/icon/plan/rightCircle.png' width='30px'> </td>";
										}
									} else {//headed to left///////////////////////////////////////////////////
										num++;
										detailedDisplay = '';
										detailedDisplay += "<td style='word-break:break-all;' width='150px'>";
										if (response.routes[0].legs[0].steps[i].transit == null) {
											if ((response.routes[0].legs[0].steps[i].travel_mode).includes("WALKING")) {
												detailedDisplay += "<img src='/resources/images/icon/plan/walkwalk.png' width='70px'><br/>";
											}
											if ((response.routes[0].legs[0].steps[i].travel_mode).includes("DRIVING")) {
												detailedDisplay += "<img src='/resources/images/icon/plan/automobileLeft.png' width='100px'><br/>";
											}
											if ((response.routes[0].legs[0].steps[i].travel_mode).includes("BICYCLING")) {
												detailedDisplay += "<img src='/resources/images/icon/plan/cycle.png' width='100px'><br/>";
											}

											detailedDisplay += '<div align="left" style="font-family:\'JEJUGOTHIC\';">'
													+ response.routes[0].legs[0].steps[i].duration.text+ '</br>'
													+ response.routes[0].legs[0].steps[i].distance.text+ '</br>'
													+ response.routes[0].legs[0].steps[i].instructions+ '</br></div>';
											/*+ '-----------'; */
										} else {
											if ((response.routes[0].legs[0].steps[i].transit.line.vehicle.name).includes("지하철")) {
												detailedDisplay += "<img src='/resources/images/icon/plan/tramway.png' width='100px'><br/>";
											}
											if ((response.routes[0].legs[0].steps[i].transit.line.vehicle.name).includes("기차")) {
												detailedDisplay += "<img src='/resources/images/icon/plan/train.png' width='100px'><br/>";
											}
											if ((response.routes[0].legs[0].steps[i].transit.line.vehicle.name).includes("장거리")) {
												detailedDisplay += "<img src='/resources/images/icon/plan/train2.png' width='100px'><br/>";
											}
											if ((response.routes[0].legs[0].steps[i].transit.line.vehicle.name).includes("버스")) {
												detailedDisplay += "<img src='/resources/images/icon/plan/buses.png' width='100px'><br/>";
											}
											detailedDisplay += '<div align="left" style="font-family:\'JEJUGOTHIC\';">'
													+ response.routes[0].legs[0].steps[i].duration.text+ ' / '+ response.routes[0].legs[0].steps[i].distance.text+ ' / '
													+ response.routes[0].legs[0].steps[i].transit.line.vehicle.name+ '</br>'
													+ '<strong>출발장소</strong>:'+ response.routes[0].legs[0].steps[i].transit.departure_stop.name+ '</br>'
													+ '<strong>도착장소</strong>:'+ response.routes[0].legs[0].steps[i].transit.arrival_stop.name+ '</br>'
													+ '<strong>차량이름</strong>:'+ response.routes[0].legs[0].steps[i].transit.line.name+ '</br>'
													+ '<strong>차량번호</strong>:'+ response.routes[0].legs[0].steps[i].transit.line.short_name+ '</br></div>';

										}
										var a = detailedDisplay + "</td>";
										resultNotYet = a + resultNotYet;
										detailedDisplay = '';
										if (i % 3 == 2) {
											if (count == response.routes[0].legs[0].steps.length - 1) {//마지막인데 짝수인 경우 
												resultC += "<tr align='center'>"+ resultNotYet+ "</tr>";
												flagRight = true;
												$("#resultMap").append("<table id='myTable' width='600px' style='word-wrap:break-word;word-break:break-all;'>"+ resultC	+ "</table>");
												resultC = "";
												resultNotYet = "";
											} else {
												resultC += "<tr align='center'>"+ resultNotYet+ "</tr>";
												flagRight = true;
												$("#resultMap").append("<table id='myTable' width='600px' style='word-wrap:break-word;word-break:break-all;'>"+ resultC+ resultB+ "</table>");
												resultC = "";
												resultNotYet = "";
											}
										} else if (count == response.routes[0].legs[0].steps.length - 1) {
											//$("#resultMap").append("<table id='myTable' width='600px' style='word-wrap:break-word;word-break:break-all;'>"	+ resultC+ "</table>");
											alert("num%3 :: "+num%3);
											var rest = num%3;
											if(rest == 1){
												resultC += resultNotYet;flagRight = true;
												$("#resultMap").append("<table id='myTable' width='600px' style='word-wrap:break-word;word-break:break-all;'><tr align='center'><td></td><td></td><td></td><td></td>"+ resultC+ "</tr></table>");
											}else if(rest == 2){
												resultC += resultNotYet;flagRight = true;
												$("#resultMap").append("<table id='myTable' width='600px' style='word-wrap:break-word;word-break:break-all;'><tr align='center'><td></td><td></td>"+ resultC+ "</tr></table>");
											}else{
												resultC += "<tr align='center'>"+ resultNotYet + "</tr>";flagRight = true;
												$("#resultMap").append("<table id='myTable' width='600px' style='word-wrap:break-word;word-break:break-all;'>"+ resultC+ "</table>");
											}
											resultC = "";
											resultNotYet = "";
										} else {
											resultNotYet = "<td width='150px' style='word-break:break-all;'><img src='/resources/images/icon/plan/leftCircle.png' width='30px'></td>"+ resultNotYet;
										}

									}
									count++;
								}

								
								var resultMap=$("#resultMap").html();
								var resultMapSummary=$("#resultMapSummary").html();
								//alert(resultMapSummary);
								$("#totalDisplay").val(resultMapSummary);
								$("#detailedDisplay").val(resultMap);
/* 
								$.ajax({
											url : "/dailyplan/json/getRouteResult/",
											method : "POST",
											data : {
												"totalDisplay" : totalDisplay,
												"detailedDisplay" : detailedDisplay
											},
											headers : {
												"Accept" : "application/json",
												"Content-Type" : "application/json"
											},
											success : function(JSONData, status) {
												mainResultEnd = JSONData.mainResultEnd;
												detailResultFinal = JSONData.detailResultFinal;

												$("#resultMap").append("<div class='col-xs-12 innerMain'align='center'></div>");

												for (var i = 0; i < mainResultEnd.length; i++) {
													$("#resultMap").append("<div class=\"routeMainResult\"  align=\"center\"><strong></strong>"+ mainResultEnd[i]+ "</div>");
												}

												for (var i = 0; i < detailResultFinal.length; i++) {
													$("#resultMap4Detail").append("<div class=\"routeDetailResult\"  align=\"center\">"+ detailResultFinal[i]+ "</div>");
												}

												var resultMapSummary = $("#resultMapSummary").html();
												var resultMap = $("#resultMap").html();
												alert("resultMap : " + resultMap)
												$("#totalDisplay").val(resultMapSummary);
												$("#detailedDisplay").val(resultMap);
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
					$("form").attr("method", "POST").attr("action",
							"/dailyplan/addRoute").submit();
				});
	});
	
	$(document).on('click','#addMapToPlan', function(){
		$("form").attr("method", "POST").attr("action","/dailyplan/addRoute").submit();
	});
	
</script>
<body id="mainBody">
<div><jsp:include page="/layout/toolbar.jsp" /></div>

	<div class="container">
		<div class="col-xs-12 inner" id="thumbnailMainBox">
			<div align="center" class="col-xs-1">&nbsp;</div>
			<!-- 그라디언트 보이게 해주려고 한 부분 -->
			<div class="col-xs-12 inner" id="thumbnailMainThumbBox" align="center">
				<div class="col-xs-12">

					<div align="center">
						<div class="col-xs-12" align="left" style="margin:100px;font-size: 4em !important; font-family: 'Pacifico', cursive;">
							<h2>Save your route</h2>
						</div>

						<div class="row" id="routeQuery">
						</div>

						<div class="col-xs-12">&nbsp;</div>

						<div class="col-xs-12" style="font-family: 'JEJUGOTHIC';">

							<div class="col-xs-7">
								<div id="map-canvas" align="left"></div>
							</div>
							
							<div class="col-xs-5" align="center">
								<div id="box1">
									<h3>
										출발지 <input type="text" class="form-control input-lg" id="start" name="address" value="카타루냐 광장" />
									</h3>
									
									<h3>
										도착지 <input type="text" class="form-control input-lg" id="end" name="address" value="파리" />
									</h3>
									
									<h3>교통수단</h3>
									<select class="form-control input-lg" id="mode" align="center">
										<option value="DRIVING">자동차</option>
										<option value="WALKING">도보</option>
										<option value="BICYCLING">자전거</option>
										<option value="TRANSIT" selected>대중교통</option>
									</select>
									
									<div class="col-xs-6">
										<div>&nbsp;</div>
										<button type="button" align="right" class="btn btn-default btn-lg btn-block" onclick="Javascript:calcRoute();">길찾기</button>
										<div>&nbsp;</div>
										<div id="resultMapSummary" align="center"></div>
									</div>
								</div>
							</div>
							
							<div class="col-xs-12" style="border-top: 2px solid #C2C2C2;">
								<div id="box2">
									<div id="resultMap"></div>
									<div id="resultMap4Detail"></div>
								</div>
								<form>
									<input type="hidden" name="dailyPlanNo" value="${dailyPlanNo}" />
									<input type="hidden" name="mainPlanNo" value="${mainPlanNo}" />
									<input type="hidden" name="totalDisplay" id="totalDisplay" />
									<input type="hidden" name="detailedDisplay"
										id="detailedDisplay" /> <input type="hidden" name="type"
										id="type" />
								</form>
								<div>&nbsp;</div>
							</div>
						</div>

					</div>
				</div>
				<div align="right" class="col-xs-1">&nbsp;</div>
			</div>
		</div>
</body>

</html>