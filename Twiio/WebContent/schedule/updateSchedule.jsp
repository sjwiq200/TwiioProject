<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       #map {
        height: 400px;
        width: 400px;
        padding-left : 30px;
	padding-right : 30px;
      }
    body {
    		padding-top : 10% ;
    		font-family: "Source Sans Pro", Helvetica, sans-serif;
    }
 	.jumbotron {

	padding-top : 30px;
	padding-bottom : 30px;
	/* background-color: rgba(0, 0, 0, 0.6);  */
   	background: rgba(255, 255, 255, 0.6);
	padding-left : 30px;
	padding-right : 30px;
}

.btn-sm {
	font-size:13px;
	line-height:16px;
	border: 2px solid;
	width: 100px;
	text-align: center;
}

.btn {
	letter-spacing: 1px;
	text-decoration: none;
	background: none;
    -moz-user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 0;
    cursor: pointer;
    display: inline-block;
    margin-bottom: 0;
    vertical-align: middle;
    white-space: nowrap;
	line-height:20px;
	font-weight:700;
	text-transform:uppercase;
	border: 3px solid;
	padding:8px 20px;
}

.btn-outlined.btn-theme:hover,
.btn-outlined.btn-theme:active {
    color: #dedede;
    background: #08708A;
    border-color: #08708A;
}

.btn-outlined.btn-theme {
    background: #dedede;
    color: #08708A;
	border-color: #08708A;
}
.btn-outlined.btn-light:hover,
.btn-outlined.btn-light:active {
    color: #dedede;
    background: #D73A31;
    border-color: #D73A31;
}

.btn-outlined.btn-light {
    background: #dedede;
    color: #D73A31;
	border-color: #D73A31;
}

.btn-xs{
	font-size:11px;
	line-height:14px;
	border: 3px solid;
	padding:5px 10px;
}

h3{
	/* color : #dedede; */
	color :#474747;
    font-size: 3em;
    padding: 0 0.5em 0.25em 0.5em;
    font-weight: 500;
    
    
    text-transform: none;
    letter-spacing: 10;
    font-style: Pacifico;
    text-shadow: 0 5px 5px rgba(0, 0, 0, .1);
}
    </style>
    
    <script type = "text/javascript" async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwwqenPL4wZOiFh9Ljfohh2vadO29GeFM&libraries=places&callback=initialize&sensor=true">
</script>
<script type = "text/javascript">


		var map;
		var infowindow;
		var marker =[];
		var markerCurrentLocation=[];
		var geocoder;
		var geocoder2;
		var geocodemarker = [];
		var service;
		var servicemarker = [];
		var input;
		var autocomplete;
		var lat2;
		var lng2;
		var latlng2;
		var GreenIcon;
		
	    	var mapImage;
		
		$(document).ready(function(){
		    $("#addMap").on('shown.bs.modal', function () {
		        google.maps.event.trigger(map, 'resize');
			});
		});

		function initialize(){
		var latlng = new google.maps.LatLng(37.5240220, 126.9265940);
		var myOptions = {
				zoom: 13,
				center:latlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP
		};
	
			input = document.getElementById('addr1');
			autocomplete = new google.maps.places.Autocomplete(input);
			infowindow = new google.maps.InfoWindow;
			map = new google.maps.Map(document.getElementById("map"), myOptions);
			geocoder =  new google.maps.Geocoder();
			geocoder2 = new google.maps.Geocoder();
			service = new google.maps.places.PlacesService(map);

		
		// Try HTML5 geolocation.
		if (navigator.geolocation) {
		  navigator.geolocation.getCurrentPosition(function(position) {
		    var pos = {
		      lat: position.coords.latitude,
		      lng: position.coords.longitude
		    };
		    
		    GreenIcon = new google.maps.MarkerImage(
		 		   "http://labs.google.com/ridefinder/images/mm_20_green.png",
		 		   new google.maps.Size(12, 20),
		 		   new google.maps.Point(0, 0),
		 		   new google.maps.Point(6, 20)
			 );

		  });
		} 
		google.maps.event.addListener(map, 'click', codeCoordinate);
		}
		
		function handleLocationError(markerCurrentLocation,latlng2){
			geocoder2.geocode({'latLng' : latlng2}, function(results, status) {
		
				if (status == google.maps.GeocoderStatus.OK)  {
					infowindow.setContent(results[1].formatted_address);
					infowindow.open(map,markerCurrentLocation[0]);	
					google.maps.event.addListener(markerCurrentLocation[0], 'click', function() {
						if (results[1]){
							infowindow.setContent(results[1].formatted_address);
							infowindow.open(map,markerCurrentLocation[0]);
							}
					});
				}
			});
		}
		
		function Setmarker(latLng) {
			if (marker.length > 0)
		    {
				marker[0].setMap(null);
			}
			marker = [];
			marker.length = 0;
		  	marker.push(new google.maps.Marker({
				position: latLng,
				map: map
				})
		  	);
		
		}
		/////////////////////////////////////////////////////////////////////
		function codeAddress(event) {
				if (geocodemarker.length > 0)
				{
						servicemarker.setMap(null);
						if (marker.length > 0)
					    {marker[0].setMap(null);}
						
							for (var i=0;i<geocodemarker.length ;i++ )
								{geocodemarker[i].setMap(null);}
					
						geocodemarker =[];
						geocodemarker.length = 0;
						}
				
				var address = document.getElementById("addr1").value;
				
				geocoder.geocode( {'address': address}, function(results, status) {
						if (status == google.maps.GeocoderStatus.OK)  //Geocoding이 성공적이라면,
						{
							for(var i=0;i<results.length;i++)
							{
									map.setCenter(results[i].geometry.location);
									map.setZoom(12);
									geocodemarker.push(new google.maps.Marker({
									center: results[i].geometry.location,
									position: results[i].geometry.location,
									map: map
								})
								);
								service.getDetails({
								    placeId:results[0].place_id
								}, function(place, status) {
									servicemarker = new google.maps.Marker({
								        map: map,
								        position: results[0].geometry.location
								      });
									
									address=place.formatted_address;
			        		    	types=place.types;
			        		    	url = place.url;
			        		    	phone = place.formatted_phone_number;
			        		    	name = place.name;
			        		    	website = place.website;
			        		    			
									
									
									
									
									
									mapImage = results[0].geometry.location;
									$("#mapImg").val(mapImage);
								    google.maps.event.addListener(servicemarker, 'click', function() {
								    	console.log(JSON.stringify(place));
								        
								        infowindow.open(map, this);
								      });
								});
							} 
				}else{ alert("검색 결과가 없습니다. 재입력 부탁드립니다." + status); }
		});
		}

		
		
		function codeCoordinate(event) {
			
			console.log("codeCoordinate");
		
		Setmarker(event.latLng);
		geocoder.geocode({'latLng' : event.latLng}, function(results, status) {
		
		if (status == google.maps.GeocoderStatus.OK)  {
			
			service.getDetails({
			    placeId:results[0].place_id
			}, function(place, status) {
				
				infowindow.setContent(
				      	 '<div><strong>' + place.formatted_address + '</strong><br>' +
				          'permanently_closed: ' + place.permanently_closed + '<br>' +
				          'types: ' + place.types  + '<br>' +
				          'place_id: ' + place.place_id + '<br>' +
				          '<br></div>');
				        infowindow.open(map, marker[0]);
				
				
			    google.maps.event.addListener(marker[0], 'click', function() {
			        infowindow.setContent(
			      	 '<div><strong>' + place.formatted_address + '</strong><br>' +
			          'permanently_closed: ' + place.permanently_closed + '<br>' +
			          'types: ' + place.types  + '<br>' +
			          'place_id: ' + place.place_id + '<br>' +
			          '<br></div>');
			        infowindow.open(map, this);
			      });
			});
		}
		3
		});
		}

		

</script>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		 $(function() {		
			$( "button#go" ).on("click" , function() {
				if($("#node").val() == 'node'){
					swal("일정 정보가 수정되었습니다.","","success").then((next) => {
						if(next){
							$("form").attr("method","POST").attr("action", "/schedule/updateScheduleNode").submit();		
						}
					});//end swal
				}else{
					$("form").attr("method","POST").attr("action", "/schedule/updateSchedule").submit();	
				}
			});
			
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				if($("#node").val() == 'node'){
					window.close()
				}else{
					$("form")[0].reset();	
				}
				 
			});
		});	
	

	</script>		
    
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<div class="container">
		<div class="jumbotron">
			<h3 align="center"><ins><strong>일정 수정 </strong></ins></h3>
	
			<div class="panel-body">
				<div class="row">
					<div class="col-md-12">
						<div class="col-sm-10 col-sm-offset-1">
							<!-- form Start /////////////////////////////////////-->
							<form class="form-horizontal">
							
							<div class="form-group">
								<input type="hidden" id="node" name="node" value="${node }">
								<input type="hidden" id="roomKey" name="roomKey" value="${schedule.roomKey}">
							    <label for="scheduleTitle" class="col-sm-offset-1 col-sm-3 control-label">일정 제목 </label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="scheduleTitle" name="scheduleTitle" value="${schedule.scheduleTitle }">
							    </div>
							  </div>
							
							  <div class="form-group">
							    <label for="scheduleDate" class="col-sm-offset-1 col-sm-3 control-label">일정 날짜 </label>
							    <div class="col-sm-4">
							      <input type="date" class="form-control" id="scheduleDate" name="scheduleDate" value="${schedule.scheduleDate }">
							    </div>
							  </div>
							  
							  <div class="form-group">
							  	<label for="scheduleAddress" class="col-sm-offset-1 col-sm-3 control-label">일정 주소 </label>
								<input type="text" id="addr1" name="scheduleAddress" value="${schedule.scheduleAddress }" />
								<span> &nbsp; </span>
								<button name="search" value="okay" onclick='codeAddress(); return false;'>♥</button>
							  </div>
								<div> &nbsp; </div>
								<div class="col-sm-4">
								<div id="map" class="form-group"></div>
								</div>
								
								<input type="hidden" name="mapImg"  id="mapImg" value="${schedule.mapImg }"  />
							  
							  <div class="form-group">
							    <div class="col-sm-offset-4  col-sm-4 text-center">
							      <button type="button" class="btn btn-outlined btn-light btn-sm" id="go" >수 &nbsp;정</button>
								  <a class="btn btn-outlined btn-theme btn-sm" href="#" role="button" id="cancel">취&nbsp;소</a>
							    </div>
							  </div>
							  
							</form>
						</div>
					</div>
				</div>
			</div>
 		</div>
	<!--  화면구성 div end /////////////////////////////////////-->
   
	
</body>

</html>