<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TWIIO main</title>

<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/resources/css/animate.min.css" rel="stylesheet">
   <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
   
   <link rel="stylesheet" href="/resources/assets/css/main.css" />
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!--  ///////////////////////// google sign-in ////////////////////////// -->
	<meta name="google-signin-scope" content="profile email">
	<meta name="google-signin-client_id" content="733503970005-o1b49h0gsl2ajne6adkbph2ti7a5en3e.apps.googleusercontent.com.apps.googleusercontent.com">    
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    
    <!--  ///////////////////////// kakao login ////////////////////////// -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/> 
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
	
	 #map {
        	height: 400px;
        	width: 100%;
       }
	
	
   	</style>
   	
   	
   	<script type="text/javascript">
	
	function initMap() {
		//var num1 = ${lat};
		//var num2 = ${lng};
		
		//alert(num1);alert(num2);
		
        var uluru = {lat:37.494762, lng:127.027583};
        
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 2,
          center: uluru
        });
        /* var marker = new google.maps.Marker({
          position: uluru,
          map: map
        }); */
      }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwwqenPL4wZOiFh9Ljfohh2vadO29GeFM&callback=initMap">
			
	</script>
   	
</head>
	<body>
	
	
	<jsp:include page="/layout/toolbar.jsp" />

		<!-- Header -->
			<header id="header" class="alt">
				<div class="inner">
					<h1>TWIIO</h1>
					<h3>THE WORLD IS IN OURS</h3>
				</div>
			</header>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Banner -->
					
					<section id="intro" class="main">
					
					<div id="map"></div>
						<!--  <span class="icon fa-diamond major"></span>
						<h2>Magna porta maximus</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae<br />
						malesuada turpis. Nam pellentesque in ac aliquam. Aliquam tempor<br />
						mi porta egestas maximus lorem ipsum dolor.</p>
						<ul class="actions">
							<li><a href="#" class="button big">Learn More</a></li>
						</ul> -->
					</section> 

				<!-- Items -->
					<section class="main items">
						<article class="item">
							<header>
								<a href="#"><img src="/resources/images/pic01.jpg" alt="" /></a>
								<h3>Feugiat et faucibus</h3>
							</header>
							<p>Fusce malesuada efficitur venenatis. Pellentesque tempor leo sed massa hendrerit hendrerit. In sed feugiat est, eu congue elit. Ut porta magna vel felis sodales vulputate. Donec faucibus dapibus lacus non ornare.</p>
							<ul class="actions">
								<li><a href="#" class="button">More</a></li>
							</ul>
						</article>
						<article class="item">
							<header>
								<a href="#"><img src="/resources/images/pic02.jpg" alt="" /></a>
								<h3>Blandit adipiscing</h3>
							</header>
							<p>Fusce malesuada efficitur venenatis. Pellentesque tempor leo sed massa hendrerit hendrerit. In sed feugiat est, eu congue elit. Ut porta magna vel felis sodales vulputate. Donec faucibus dapibus lacus non ornare.</p>
							<ul class="actions">
								<li><a href="#" class="button">More</a></li>
							</ul>
						</article>
						<article class="item">
							<header>
								<a href="#"><img src="/resources/images/pic03.jpg" alt="" /></a>
								<h3>Lorem massa nulla</h3>
							</header>
							<p>Fusce malesuada efficitur venenatis. Pellentesque tempor leo sed massa hendrerit hendrerit. In sed feugiat est, eu congue elit. Ut porta magna vel felis sodales vulputate. Donec faucibus dapibus lacus non ornare.</p>
							<ul class="actions">
								<li><a href="#" class="button">More</a></li>
							</ul>
						</article>
						<article class="item">
							<header>
								<a href="#"><img src="/resources/images/pic04.jpg" alt="" /></a>
								<h3>Ipsum sed tempus</h3>
							</header>
							<p>Fusce malesuada efficitur venenatis. Pellentesque tempor leo sed massa hendrerit hendrerit. In sed feugiat est, eu congue elit. Ut porta magna vel felis sodales vulputate. Donec faucibus dapibus lacus non ornare.</p>
							<ul class="actions">
								<li><a href="#" class="button">More</a></li>
							</ul>
						</article>
					</section>
					
					
					
					
					<article class="item">
							<header>
								<a href="#"><img src="/resources/images/pic03.jpg" alt="" /></a>
								<h3>Lorem massa nulla</h3>
							</header>
							<p>Fusce malesuada efficitur venenatis. Pellentesque tempor leo sed massa hendrerit hendrerit. In sed feugiat est, eu congue elit. Ut porta magna vel felis sodales vulputate. Donec faucibus dapibus lacus non ornare.</p>
							<ul class="actions">
								<li><a href="#" class="button">More</a></li>
							</ul>
						</article>
						
						<article class="item">
							<header>
								<a href="#"><img src="/resources/images/pic04.jpg" alt="" /></a>
								<h3>Ipsum sed tempus</h3>
							</header>
							<p>Fusce malesuada efficitur venenatis. Pellentesque tempor leo sed massa hendrerit hendrerit. In sed feugiat est, eu congue elit. Ut porta magna vel felis sodales vulputate. Donec faucibus dapibus lacus non ornare.</p>
							<ul class="actions">
								<li><a href="#" class="button">More</a></li>
							</ul>
						</article>
					</section>

			

			</div>
			

		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>