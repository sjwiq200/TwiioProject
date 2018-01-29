<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">


<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->

<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>

<!-- jQuery UI toolTip 사용 CSS-->

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!--  ///////////////////////// CSS ////////////////////////// -->
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
        
        #map {
        	height: 400px;
        	width: 100%;
       }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	function initMap() {
		//var num1 = ${lat};
		//var num2 = ${lng};
		
		//alert(num1);alert(num2);
		
        var uluru = {lat:${lat} , lng:${lng}};
        
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwwqenPL4wZOiFh9Ljfohh2vadO29GeFM&callback=initMap">
			
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	
	<div class="page-header text-info">
	       <h3>NightLife 상세 정보</h3>
	</div>
	
		<div class="row">
	  		<div class="col-xs-12"><h3><strong>${context[0]}</strong></h3></div>
	  		<p>
			<div class="col-xs-12">${context[1]}</div>
			<p>
			<div class="col-xs-12">${context[2]}</div>
			<p>
			<div class="col-xs-12">${context[3]}</div>
		</div>
		<hr>
		
		<div class="row">
			<div class="col-xs-12"><img src="${hrefs[0]}"/></div>
			 	<c:forEach  items="${hrefs}" varStatus="status">
			 		<div class="col-xs-8 col-md-4"><img src="${hrefs[status.index]}"/></div>
			 	</c:forEach>
		</div>
		
		<div id="map"></div>
		
	
	
	    
 		</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
	</body>

</html>