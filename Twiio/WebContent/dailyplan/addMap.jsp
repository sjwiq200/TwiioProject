<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang ="ko">

<head>

<% 
	String dailyPlanNo = (String) request.getParameter("data"); 
%>


 <title>Geocoding service</title>
 <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
 <meta charset="UTF-8">
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>

<style type="text/css">

	#map {
        height: 400px;
        width: 500px;
      }
      html, body {
        height: 100%;
        width: 100%;
        margin: 0;
        padding: 0;
      }

      #autocomplete {
        width: 100%;
      }
      .pac-container {
   			 z-index: 100000; /* AutoComplete이 Modal창 안에 뜰 수 있도록! */
		}

</style>

</head>


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
		
		var mapAddress;
    	var mapTypes;
    	var mapUrl;
    	var mapPhone;
    	var mapName;
    	var mapWebsite;
    	var staticMapUrl;
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
			        		    	
			        		    	$(".testmap").remove();
			        		    	
									$("#resultMap")
			        		    	.append("<div class=\"testmap\"  align=\"center\"><strong>["+name+"]</strong></div>")
			        		    	.append("<div class=\"testmap\"  align=\"center\"><strong>▶주소 : </strong>"+address+"</div>")
			        		    	.append("<div class=\"testmap\" align=\"center\"><strong>▶전화번호 : </strong>"+phone+"</div>")
			        		    	.append("<div class=\"testmap\"  align=\"center\"><strong>▶웹사이트 : </strong>"+website+"</div>")
									.append("<div class=\"testmap\"  align=\"center\"><strong>▶URL : </strong>"+url+"</div>")
									.append("<div class=\"testmap\"  align=\"center\"><strong>▶유형 : </strong>"+types+"</div>");
									
									$("#mapName").val(name);
									$("#mapAddress").val(address);
									$("#mapPhone").val(phone);
									$("#mapWebsite").val(website);
									$("#mapUrl").val(url);
									$("#mapType").val(types);
									
									
									mapImage = results[0].geometry.location;
									
								    google.maps.event.addListener(servicemarker, 'click', function() {
								    	console.log(JSON.stringify(place));
								        infowindow.setContent(
								      '<div><strong> 주소</strong> : ' + place.formatted_address + '<br>' +
								          '<strong>전화번호</strong>: ' + place.formatted_phone_number + '<br>' +
								          '<strong>오픈시간</strong>: ' + place.opening_hours.weekday_text+ '<br>' +
								          '<strong>평점</strong>: ' + place.rating+ '<br>' +
								          '<strong>장소유형</strong>: ' + place.types  + '<br>' +
								          '<strong>URL</strong>: ' + place.url + '<br>' +
								          '<strong>웹사이트 주소</strong>: ' + place.website는  + '<br>' );
								        infowindow.open(map, this);
								      });
								});
							} 
				}else{ alert("검색 결과가 없습니다. 재입력 부탁드립니다." + status); }
		});
		}

		
		
		function codeCoordinate(event) {
		
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

		$(function(){
			$("button[name='addMapToPlan']").on("click",function(){
				
				
				var mapUrl= $("#mapUrl").val().toString();
				var mapName = document.getElementById("addr1").value;
				var mapType = $("#mapType").val().toString();
				var mapPhone = $("#mapPhone").val().toString();
				var name=$("#addr1").val();
				var mapAddress = $("#mapAddress").val();
				var korName = encodeURI(encodeURIComponent(mapName));
				var korAddress= encodeURI(encodeURIComponent(mapAddress));
				var dailyPlanNo = <%=request.getParameter("data")%>;
				self.location = "/dailyplan/addMap?dailyPlanNo="+dailyPlanNo+"&mapType="+mapType+"&mapUrl="+mapUrl+"&mapPhone="+mapPhone+"&korName="+korName+"&korAddress="+korAddress+"&mapImage="+mapImage;
				
				//$("form").attr("method", "POST").attr("action",	"/dailyplan/addMap").submit();
			});
		});

</script>
<body>
		<div>
			<input type="text" id="addr1" name="address" value="" />
			<span> &nbsp; </span>
			<button name="submit" value="okay" onclick='codeAddress(); return false;'>♥</button>
		</div>
		<div> &nbsp; </div>
		<div id="map"></div>
		<div id="resultMap">
				<form>
				  <input type="hidden" name="dailyPlanNo" value="<%=dailyPlanNo%>" />
				  <input type="hidden" name="mapUrl" id="mapUrl" value="기본값" />
				  <input type="hidden" name="mapAddress" id="mapAddress"value="기본값"  />
				  <input type="hidden" name="mapName" id="mapName"  value="기본값" />
				  <input type="hidden" name="mapPhone"  id="mapPhone" value="기본값" />
				  <input type="hidden" name="mapWebsite"  id="mapWebsite" value="기본값"  />
				  <input type="hidden" name="mapType" id="mapType" value=""  />
				 </form>
		</div>
		<div> &nbsp; </div>
		<button type="button" class="btn btn-default" data-dismiss="modal" name="addMapToPlan">내 플랜에 추가하기</button>

</body>
</html>