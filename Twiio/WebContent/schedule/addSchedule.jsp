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
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAMEXsdx-RuPFYaZ-ygp2Z_rlq75XG-w1s&libraries=places"></script>
	
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBQvxf8JDd5GFYSU4d9ejEHQ7y3QiQyizk&libraries=places&callback=initAutocomplete"
        async defer></script>
        
        
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		 $(function() {		
			$( "button.btn.btn-primary" ).on("click" , function() {
				
				$.ajax(
    					{
    						url : "/schedule/json/addSchedule/",
    						method : "POST",
    						data : JSON.stringify({
    							roomKey : $("#roomKey").val(),
    							scheduleTitle : $("#scheduleTitle").val(),
    							scheduleDate : $("#scheduleDate").val(),
    							scheduleAddress : $("#scheduleAddress").val()
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
    				)
			
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
	<script>
      // This example displays an address form, using the autocomplete feature
      // of the Google Places API to help users fill in the information.

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      var placeSearch, autocomplete;
      var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name'
      };

      function initAutocomplete() {
        // Create the autocomplete object, restricting the search to geographical
        // location types.
        autocomplete = new google.maps.places.Autocomplete(
            /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
            {types: ['geocode']});

        // When the user selects an address from the dropdown, populate the address
        // fields in the form.
        autocomplete.addListener('place_changed', fillInAddress);
      }

      function fillInAddress() {
        // Get the place details from the autocomplete object.
        var place = autocomplete.getPlace();

        for (var component in componentForm) {
          document.getElementById(component).value = '';
          document.getElementById(component).disabled = false;
        }

        // Get each component of the address from the place details
        // and fill the corresponding field on the form.
        for (var i = 0; i < place.address_components.length; i++) {
          var addressType = place.address_components[i].types[0];
          if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById(addressType).value = val;
          }
        }
      }

      // Bias the autocomplete object to the user's geographical location,
      // as supplied by the browser's 'navigator.geolocation' object.
      function geolocate() {
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var geolocation = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            var circle = new google.maps.Circle({
              center: geolocation,
              radius: position.coords.accuracy
            });
            autocomplete.setBounds(circle.getBounds());
          });
        }
      }
    </script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">일정 등록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<div class="form-group">
			<input type="hidden" id="roomKey" name="roomKey" value="${roomKey}">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">일정 제목 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="scheduleTitle" name="scheduleTitle" value="">
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">일정 날짜 </label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="scheduleDate" name="scheduleDate" value="">
		    </div>
		  </div>
		  
		  <div id="locationField" class="form-group">
		  	  <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">일정 위치 </label>
		  	  </div class="col-sm-4">
		  	  	<input id="autocomplete" placeholder="Enter your address" onFocus="geolocate()" type="text"></input>
		  	  </div>
	      </div>
		  
		  <!-- <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">일정 위치 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="scheduleAddress" name="scheduleAddress" value="">
		    </div>
		  </div> -->
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >확 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>