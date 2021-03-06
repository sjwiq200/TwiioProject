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
	<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAMEXsdx-RuPFYaZ-ygp2Z_rlq75XG-w1s&libraries=places"></script> -->
	
	<!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<script type = "text/javascript" async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwwqenPL4wZOiFh9Ljfohh2vadO29GeFM&libraries=places&callback=initialize&sensor=true">
</script>

  <!--  ///////////////////////// CSS ////////////////////////// -->
<link rel="stylesheet" href="/resources/css/font.css" />


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
		console.log("initialize()");
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
			console.log("Setmarker()");
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
			console.log("codeAddress()");
				if (geocodemarker.length > 0)
				{
					console.log("codeAddress if else")
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
									console.log("123"+servicemarker);
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		 $(function() {		
			$( "button#go" ).on("click" , function() {
				if($("#mapImg").val() == ''){
					swal("위치를 표시해 주세요!");
				}else{
					swal({
						  title: "일정이 등록되었습니다!",
						  icon: "success",
						  button: true,
						}).then((next) =>{
							if(next){
								$.ajax(
				    					{
				    						url : "/schedule/json/addSchedule/",
				    						method : "POST",
				    						data : JSON.stringify({
				    							roomKey : $("#roomKey").val(),
				    							scheduleTitle : $("#scheduleTitle").val(),
				    							scheduleDate : $("#scheduleDate").val(),
				    							scheduleAddress : $("#addr1").val(),
				    							mapImg : $("#mapImg").val()
				    						}),
				    						dataType : "json",
				    						headers :{
				    							"Accept" : "application/json",
											"Content-Type" : "application/json"
				    						},
				    						success : function(JSONData, status){
				    							
				    							console.log(status);
				    							if(status == 'success'){
				    								window.close();
				    							}
				    						}
				    					}		
				    				)//end ajax
							}//end if
							
						})//end swal
					
				}
				
			
			});
			
			
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				/* $("form")[0].reset(); */
				window.close();
			});
		});	

	</script>
		
    <style>
    #map {
        height: 400px;
        width: 400px;
        padding-left : 30px;
	padding-right : 30px;
      }
    body {
    		/* padding-top : 10% ; */
    		  font-family:JEJUGOTHIC;
    		  	background: #f4f4f4;
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
    
    
    text-transform: none;
    letter-spacing: 10;
}

/* /////////////////dayoung////////////////// */
/* Button-dy css  */
.btn-dy {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 23px;
  font-family:TYPO_JEONGJOL;
  color: #ffffff;
  font-size: 14px;
  background: #D73A31;
  padding: 4px 20px 4px 20px;
  border: solid #D73A31 2px;
  text-decoration: none;
  margin-top: 3%;
   opacity: 0.8;
}

.btn-dy:hover {
  background: #D73A31;
  text-decoration: none;
  color:#ffffff;
  opacity: 0.5;
}
    		
    </style>
    
</head>

<body>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" style="background:#f4f4f4">
		<div class="jumbotron">
			<h3 align="center" style="background:#ffffff;padding-top:30px;padding-bottom:30px;border-radius: 23px;border: 1px dashed #D73A31;"><strong><ans>FIX YOUR SCHEDULE<ans></strong></h3>
			<h6 align="center">만나는 일정을 정하여 친구들에게 알려주세요</h6>
	
			<div class="panel-body">
				<div class="row">
					<div class="col-md-12">
						<div class="col-sm-10 col-sm-offset-1">
							<!-- form Start /////////////////////////////////////-->
							<form class="form-horizontal">
							
							<div class="form-group">
								<input type="hidden" id="roomKey" name="roomKey" value="${roomKey}">
							    <label for="scheduleTitle" class="col-sm-offset-1 col-sm-3 control-label">일정 제목 </label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="scheduleTitle" name="scheduleTitle" value="">
							    </div>
							  </div>
							
							  <div class="form-group">
							    <label for="scheduleDate" class="col-sm-offset-1 col-sm-3 control-label">일정 날짜 </label>
							    <div class="col-sm-4">
							      <input type="date" class="form-control" id="scheduleDate" name="scheduleDate" value="">
							    </div>
							  </div>
							  
							  <div class="form-group">
							  	<label for="scheduleAddress" class="col-sm-offset-1 col-sm-3 control-label">일정 주소 </label>
							  	 <div class="col-sm-3">
								<input type="text" class="form-control" id="addr1" name="scheduleAddress" value="" />
								</div>
								<div class="col-sm-1">
								<button name="submit" class="btn-dy" value="okay" onclick='codeAddress(); return false;' style="font-family:JEJUGOTHIC !important;">SEARCH</button></div>
							  </div>
								<div> &nbsp; </div>
								<div id="map" align="center"></div>
								<input type="hidden" name="mapImg"  id="mapImg" value=""  style="margin-left:10vw" align="center"/>
							  	</div>
							  <div class="form-group" style="margin-top:3vh;" style="  font-family:JEJUGOTHIC !important;">
							    <div class="col-sm-offset-4  col-sm-4 text-center">
							      <button type="button" class="btn-dy" id="go" style="font-family:JEJUGOTHIC !important;">확 &nbsp;정</button>
								  <a class="btn-dy" href="#" role="button" id="cancel" style="font-family:JEJUGOTHIC !important;padding-top:6.4px;padding-bottom:6.4px">취&nbsp;소</a>
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