<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lnag ="ko">

<head>
 <title>Geocoding service</title>
 <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
 <meta charset="utf-8">
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>

<style type="text/css">

	#map {
        height: 100%;
        width: 100%;
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
      #autocomplete {
        width: 100%;
      }

</style>
</head>
<body>

<div id="floating-panel">
 <input type="text"  id="addr1" name="address" value="강남역"/>
 <input name="submit" type="submit" value="Search" onclick='codeAddress(); return false;'/> 
</div>

<div id="map"></div>
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


function initialize(){
var latlng = new google.maps.LatLng(37.5240220, 126.9265940);
var myOptions = {
		zoom: 11,
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
    lat2 = position.coords.latitude;
    lng2 = position.coords.longitude;
    latlng2 = new google.maps.LatLng(lat2, lng2);
    
    map.setZoom(14);
    map.setCenter(pos);
    
    GreenIcon = new google.maps.MarkerImage(

 		   "http://labs.google.com/ridefinder/images/mm_20_green.png",

 		   new google.maps.Size(12, 20),

 		   new google.maps.Point(0, 0),

 		   new google.maps.Point(6, 20)
	 );
    
    
    markerCurrentLocation.push(new google.maps.Marker({
		position: latlng2,
		icon: GreenIcon,
		map: map
	})
  	);
    //alert('마커커런트 :: '+markerCurrentLocation[0]);
    handleLocationError(markerCurrentLocation,latlng2);
    
  });
} 

google.maps.event.addListener(map, 'click', codeCoordinate);
        /*아랫글에서 설명한 event를 이용 지도를 'click'하면 codeCoordinate함수를 실행합니다.
           codeCoordinate함수는 클릭한 지점의 좌표를 가지고 주소를 찾는 함수입니다. */
}

function handleLocationError(markerCurrentLocation,latlng2){
	//alert('마커커런트 :: '+markerCurrentLocation[0]);
	geocoder2.geocode({'latLng' : latlng2}, function(results, status) {

		if (status == google.maps.GeocoderStatus.OK)  {
		infowindow.setContent(results[1].formatted_address);
		infowindow.open(map,markerCurrentLocation[0]);	
		google.maps.event.addListener(markerCurrentLocation[0], 'click', function() {
		if (results[1])
		{
		//alert(latLng);
		infowindow.setContent(results[1].formatted_address);
		infowindow.open(map,markerCurrentLocation[0]);
		//infowindow.open(map, this);
		//infowindow로 주소를 표시합니다.
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

// marker.length는 marker라는 배열의 원소의 개수입니다.

// 만약 이 개수가 0이 아니라면 marker를 map에 표시되지 않게 합니다.

// 이는 다른 지점을 클릭할 때 기존의 마커를 제거하기 위함입니다.
	marker = [];

	marker.length = 0;
// marker를 빈 배열로 만들고, marker 배열의 개수를 0개로 만들어 marker 배열을 초기화합니

// 다.

  	marker.push(new google.maps.Marker({
		position: latLng,
		map: map
		})
  	);

// marker 배열에 새 marker object를 push 함수로 추가합니다.
}

/*클릭한 지점에 마커를 표시하는 함수입니다.

   그런데 이 함수를 잘 봐야 하는 것이 바로 marker를 생성하지 않고 marker라는 배열 안에 Marker 

   obejct  원소를 계속 추가하고 있습니다. 이는 매번 클릭할 때마다 새로운 마커를 생성하기 위함입니

   다. */



//입력 받은 주소를 지오코딩 요청하고 결과를 마커로 지도에 표시합니다.

function codeAddress(event) {
if (geocodemarker.length > 0)
{
	servicemarker.setMap(null);
	if (marker.length > 0)
    {
		marker[0].setMap(null);
	}
	
for (var i=0;i<geocodemarker.length ;i++ )
{
geocodemarker[i].setMap(null);
}

geocodemarker =[];
geocodemarker.length = 0;

}
//이 부분도 위와 같이 주소를 입력할 때 표시되는 marker가 매번 새로 나타나게 하기 위함입니다.
var address = document.getElementById("addr1").value;
        //아래의 주소 입력창에서 받은 정보를 address 변수에 저장합니다.
        //지오코딩하는 부분입니다.
geocoder.geocode( {'address': address}, function(results, status) {
if (status == google.maps.GeocoderStatus.OK)  //Geocoding이 성공적이라면,
{
//alert(latlng);

alert(results.length + "개의 결과를 찾았습니다.");
   //결과의 개수를 표시하는 창을 띄웁니다. alert 함수는 알림창 함수입니다.
for(var i=0;i<results.length;i++)
{

map.setCenter(results[i].geometry.location);
map.setZoom(16);


geocodemarker.push(new google.maps.Marker({

center: results[i].geometry.location,

position: results[i].geometry.location,

map: map

})
);

//alert(JSON.stringify(results[0].place_id));
//alert(JSON.stringify(results[0].types))
service.getDetails({
    placeId:results[0].place_id
}, function(place, status) {
	servicemarker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location
      });
    google.maps.event.addListener(servicemarker, 'click', function() {
    	alert(JSON.stringify(place));
    	console.log(JSON.stringify(place));
        infowindow.setContent(
      '<div><strong>' + place.formatted_address + '</strong><br>' +
          'formatted_phone_number: ' + place.formatted_phone_number + '<br>' +
          'icon: ' + place.icon + '<br>' +
          //'opening_hours: ' + place.opening_hours.weekday_text+ '<br>' +
          'permanently_closed: ' + place.permanently_closed + '<br>' +
          'rating: ' + place.rating+ '<br>' +
          'reviews: ' + place.reviews[0].author_name+ '<br>' +
          'reviews: ' + place.reviews[0].rating+ '<br>' +
          'reviews: ' + place.reviews[0].relative_time_description+ '<br>' +
          'reviews: ' + place.reviews[0].text+ '<br>' +
          'types: ' + place.types  + '<br>' +
          'url: ' + place.url + '<br>' +
          'vicinity: ' + place.vicinity + '<br>' +
          'website: ' + place.website는  + '<br>' +
          'place_id: ' + place.place_id + '<br>' +
          'photos: ' + place.photos[0].height+''+place.photos[0].width+ '<br></div>');
        infowindow.open(map, this);
      });
});

} 
   
   
   
                        //결과가 여러 개일 수 있기 때문에 모든 결과를 지도에 marker에 표시합니다.
}

else

{ alert("Geocode was not successful for the following reason: " + status); 

}

});

}


//클릭 이벤트 발생 시 그 좌표를 주소로 변환하는 함수입니다.

function codeCoordinate(event) {
	

Setmarker(event.latLng);
//alert(event.latLng);
        //이벤트 발생 시 그 좌표에 마커를 생성합니다.
        // 좌표를 받아 reverse geocoding(좌표를 주소로 바꾸기)를 실행합니다.
geocoder.geocode({'latLng' : event.latLng}, function(results, status) {

if (status == google.maps.GeocoderStatus.OK)  {
	
	service.getDetails({
	    placeId:results[0].place_id
	}, function(place, status) {
		
		infowindow.setContent(
				
		      	 '<div><strong>' + place.formatted_address + '</strong><br>' +
		          //'formatted_phone_number: ' + place.formatted_phone_number + '<br>' +
		          //'icon: ' + place.icon + '<br>' +
		          //'opening_hours: ' + place.opening_hours.weekday_text+ '<br>' +
		          'permanently_closed: ' + place.permanently_closed + '<br>' +
		          //'rating: ' + place.rating+ '<br>' +
		          //'reviews: ' + place.reviews[0].author_name+ '<br>' +
		          //'reviews: ' + place.reviews[0].rating+ '<br>' +
		          //'reviews: ' + place.reviews[0].relative_time_description+ '<br>' +
		          //'reviews: ' + place.reviews[0].text+ '<br>' +
		          'types: ' + place.types  + '<br>' +
		          //'url: ' + place.url + '<br>' +
		          //'vicinity: ' + place.vicinity + '<br>' +
		          //'website: ' + place.website는  + '<br>' +
		          'place_id: ' + place.place_id + '<br>' +
		          //'photos: ' + place.photos[0].height+''+place.photos[0].width+ 
		          '<br></div>');
		        infowindow.open(map, marker[0]);
		
		
	    google.maps.event.addListener(marker[0], 'click', function() {
	        infowindow.setContent(
	      	 '<div><strong>' + place.formatted_address + '</strong><br>' +
	          //'formatted_phone_number: ' + place.formatted_phone_number + '<br>' +
	          //'icon: ' + place.icon + '<br>' +
	          //'opening_hours: ' + place.opening_hours.weekday_text+ '<br>' +
	          'permanently_closed: ' + place.permanently_closed + '<br>' +
	          //'rating: ' + place.rating+ '<br>' +
	          //'reviews: ' + place.reviews[0].author_name+ '<br>' +
	          //'reviews: ' + place.reviews[0].rating+ '<br>' +
	          //'reviews: ' + place.reviews[0].relative_time_description+ '<br>' +
	          //'reviews: ' + place.reviews[0].text+ '<br>' +
	          'types: ' + place.types  + '<br>' +
	          //'url: ' + place.url + '<br>' +
	          //'vicinity: ' + place.vicinity + '<br>' +
	          //'website: ' + place.website는  + '<br>' +
	          'place_id: ' + place.place_id + '<br>' +
	          //'photos: ' + place.photos[0].height+''+place.photos[0].width+ 
	          '<br></div>');
	        infowindow.open(map, this);
	      });
	});

	//infowindow.open(map,marker[0]);
	
/* infowindow.setContent(results[1].formatted_address);
infowindow.open(map,marker[0]);	
google.maps.event.addListener(marker[0], 'click', function() {
if (results[1])
{
//alert(latLng);
infowindow.setContent(results[1].formatted_address);
infowindow.open(map,marker[0]);
//infowindow.open(map, this);
//infowindow로 주소를 표시합니다.
}
}); */

}

});

}

//



</script>



</body>
</html>