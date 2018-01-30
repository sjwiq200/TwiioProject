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
 <input type="text"  id="addr1" name="address" value="������"/>
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
    
    map.setZoom(6);
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
    //alert('��ĿĿ��Ʈ :: '+markerCurrentLocation[0]);
    handleLocationError(markerCurrentLocation,latlng2);
    
  });
} 

google.maps.event.addListener(map, 'click', codeCoordinate);
        /*�Ʒ��ۿ��� ������ event�� �̿� ������ 'click'�ϸ� codeCoordinate�Լ��� �����մϴ�.
           codeCoordinate�Լ��� Ŭ���� ������ ��ǥ�� ������ �ּҸ� ã�� �Լ��Դϴ�. */
}

function handleLocationError(markerCurrentLocation,latlng2){
	//alert('��ĿĿ��Ʈ :: '+markerCurrentLocation[0]);
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
		//infowindow�� �ּҸ� ǥ���մϴ�.
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

// marker.length�� marker��� �迭�� ������ �����Դϴ�.

// ���� �� ������ 0�� �ƴ϶�� marker�� map�� ǥ�õ��� �ʰ� �մϴ�.

// �̴� �ٸ� ������ Ŭ���� �� ������ ��Ŀ�� �����ϱ� �����Դϴ�.
	marker = [];

	marker.length = 0;
// marker�� �� �迭�� �����, marker �迭�� ������ 0���� ����� marker �迭�� �ʱ�ȭ�մ�

// ��.

  	marker.push(new google.maps.Marker({
		position: latLng,
		map: map
		})
  	);

// marker �迭�� �� marker object�� push �Լ��� �߰��մϴ�.
}

/*Ŭ���� ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�.

   �׷��� �� �Լ��� �� ���� �ϴ� ���� �ٷ� marker�� �������� �ʰ� marker��� �迭 �ȿ� Marker 

   obejct  ���Ҹ� ��� �߰��ϰ� �ֽ��ϴ�. �̴� �Ź� Ŭ���� ������ ���ο� ��Ŀ�� �����ϱ� �����Դ�

   ��. */



//�Է� ���� �ּҸ� �����ڵ� ��û�ϰ� ����� ��Ŀ�� ������ ǥ���մϴ�.

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
//�� �κе� ���� ���� �ּҸ� �Է��� �� ǥ�õǴ� marker�� �Ź� ���� ��Ÿ���� �ϱ� �����Դϴ�.
var address = document.getElementById("addr1").value;
        //�Ʒ��� �ּ� �Է�â���� ���� ������ address ������ �����մϴ�.
        //�����ڵ��ϴ� �κ��Դϴ�.
geocoder.geocode( {'address': address}, function(results, status) {
if (status == google.maps.GeocoderStatus.OK)  //Geocoding�� �������̶��,
{
//alert(latlng);

alert(results.length + "���� ����� ã�ҽ��ϴ�.");
   //����� ������ ǥ���ϴ� â�� ���ϴ�. alert �Լ��� �˸�â �Լ��Դϴ�.
for(var i=0;i<results.length;i++)
{

map.setCenter(results[i].geometry.location);
map.setZoom(8);


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
          'opening_hours: ' + place.opening_hours.weekday_text+ '<br>' +
          'permanently_closed: ' + place.permanently_closed + '<br>' +
          'rating: ' + place.rating+ '<br>' +
          'reviews: ' + place.reviews[0].author_name+ '<br>' +
          'reviews: ' + place.reviews[0].rating+ '<br>' +
          'reviews: ' + place.reviews[0].relative_time_description+ '<br>' +
          'reviews: ' + place.reviews[0].text+ '<br>' +
          'types: ' + place.types  + '<br>' +
          'url: ' + place.url + '<br>' +
          //'vicinity: ' + place.vicinity + '<br>' +
          //'website: ' + place.website��  + '<br>' +
          'place_id: ' + place.place_id + '<br>' +
          //'photos: ' + place.photos[0].height+''+place.photos[0].width+
          '<br></div>');
        infowindow.open(map, this);
      });
});

} 
   
   
   
                        //����� ���� ���� �� �ֱ� ������ ��� ����� ������ marker�� ǥ���մϴ�.
}

else

{ alert("Geocode was not successful for the following reason: " + status); 

}

});

}


//Ŭ�� �̺�Ʈ �߻� �� �� ��ǥ�� �ּҷ� ��ȯ�ϴ� �Լ��Դϴ�.

function codeCoordinate(event) {
	

Setmarker(event.latLng);
//alert(event.latLng);
        //�̺�Ʈ �߻� �� �� ��ǥ�� ��Ŀ�� �����մϴ�.
        // ��ǥ�� �޾� reverse geocoding(��ǥ�� �ּҷ� �ٲٱ�)�� �����մϴ�.
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
		          'url: ' + place.url + '<br>' +
		          //'vicinity: ' + place.vicinity + '<br>' +
		          //'website: ' + place.website��  + '<br>' +
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
	          //'website: ' + place.website��  + '<br>' +
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
//infowindow�� �ּҸ� ǥ���մϴ�.
}
}); */

}

});

}

//



</script>



</body>
</html>