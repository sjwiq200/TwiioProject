<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	
	
	<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCmTcIdw0uowsiJrs4YNA0lhjLnN8PigjE&callback=initMap">
    </script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
	
	 #map {
        	height: 400px;
        	width: 100%;
       }
	
	/* image sliding following by scroll <START> */
	  .slideanim {visibility:hidden;}
  		.slide {
      animation-name: slide;
      -webkit-animation-name: slide;
      animation-duration: 1s;
      -webkit-animation-duration: 1s;
      visibility: visible;
  }
  
	@keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
        width: 100%;
        margin-bottom: 35px;
    }
  }
  @media screen and (max-width: 480px) {
    .logo {
        font-size: 150px;
    }
  }
  
  /* image sliding following by scroll <START> */
  
   	</style>
   	
   	
   	<script type="text/javascript">
   	
   	var geocoder;
    var map;
    
    var address = [];
	   	
	<c:forEach var="schedule" items="${list}">
	address.push("${schedule.scheduleAddress}")

	</c:forEach>	
		  
   	
   	
	function initMap() {
		for( i =0 ; i < address.length ; i ++){
			console.log(address[i]);
		}
        
        var uluru = {lat:37.494762, lng:127.027583};
        
        map = new google.maps.Map(document.getElementById("map"), {
          zoom: 1,
          center: uluru
        });
        
        geocoder = new google.maps.Geocoder();
        for (i = 0; i < address.length; i++) {
          codeAddress(geocoder, map,address[i]);
        }
        google.maps.event.addDomListener(window, "load", initMap);
	}
	   	
	   	function codeAddress(geocoder, map, hello) {
	        geocoder.geocode({'address': hello}, function(results, status) {
	          if (status === 'OK') {
	            /* map.setCenter(results[0].geometry.location); */

	            var marker = new google.maps.Marker({
	              map: map,
	              position: results[0].geometry.location
	            });
	          } else {
	            /* alert('Geocode was not successful for the following reason: ' + status); */
	          }
	        });
	      }

	   	
	   	
	   	
	   	
	   	/* image sliding following by scroll <START> */
	   	
	   	$(document).ready(function(){
	   	  // Add smooth scrolling to all links in navbar + footer link
	   	  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
	   	    // Make sure this.hash has a value before overriding default behavior
	   	    if (this.hash !== "") {
	   	      // Prevent default anchor click behavior
	   	      event.preventDefault();

	   	      // Store hash
	   	      var hash = this.hash;

	   	      // Using jQuery's animate() method to add smooth page scroll
	   	      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
	   	      $('html, body').animate({
	   	        scrollTop: $(hash).offset().top
	   	      }, 900, function(){
	   	   
	   	        // Add hash (#) to URL when done scrolling (default click behavior)
	   	        window.location.hash = hash;
	   	      });
	   	    } // End if
	   	  });
	   	  
	   	  $(window).scroll(function() {
	   	    $(".slideanim").each(function(){
	   	      var pos = $(this).offset().top;

	   	      var winTop = $(window).scrollTop();
	   	        if (pos < winTop + 600) {
	   	          $(this).addClass("slide");
	   	        }
	   	    });
	   	  });
	   	})
	   	/* image sliding following by scroll <START> */
	   	
    </script>
    
   	
</head>
	<body>
	
	
	<jsp:include page="/layout/toolbar.jsp" />

		<!— Header —>
			<header id="header" class="alt">
				<div class="inner">
					<h1>TWIIO</h1>
					<h3 style="font-family:JEJUGOTHIC !important;">THE WORLD IS IN OURS</h3>
					<h5 style="font-family:JEJUGOTHIC !important;">여행을 맞이 하는 설렘부터</h5>
				</div>
			</header>

		<!— Wrapper —>
			<div id="wrapper" style="font-family:JEJUGOTHIC !important;">

				<!— Banner —>
					
					<section id="intro" class="main">
					
					<p>전 세계의 약속 현황<br />
					<div id="map">maps error</div>
						 <span class="slideanim"><img src="/resources/images/icon/logo.png" width="120px" style="margin-top:50px;margin-bottom:50px;"></span>
						<p>여행의 설렘, 새로운 만남의 설렘<br />
						Twiio팀은 지금까지는 없었던 새로운 여행플랫폼을 만들었습니다. <br />
						직접 동행을 구하고, 현지인이 제공하는 신선한 여행 상품을 찾고, 자신에게 딱 맞는 여행책을 만들 수 있는 서비스<br />
						가장 가까이서 좋은 여행 친구가 되어드리겠습니다.  <br/>
						<br/>
					
					</section> 
					<section class="bg-light" id="team">
					
      <div class="container slideanim" align="center">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Our Amazing Team</h2>
            <h3 class="section-subheading text-muted">TWIIO</h3>
          </div>
        </div>
        <div class="row">
          
          <div class="col-sm-4">
            <div class="team-member">
               <img class="mx-auto rounded-circle" src="/resources/images/userimages/daeunProfile.jpg" width="250px" height="250px" style="margin-bottom:20px;border-color:#C2C2C2;border-style: solid;border-width: 3px;border-radius: 50%;" alt="">
              <h4>KANG DA EUN</h4>
              <p class="text-muted">강다은</p>
              <ul class="list-inline social-buttons">
              
              </ul>
            </div>
          </div>
          
          <div class="col-sm-4">
            <div class="team-member">
               <img class="mx-auto rounded-circle" src="/resources/images/userimages/jaewooProfile.jpg" width="250px" height="250px" style="margin-bottom:20px;border-color:#C2C2C2;border-style: solid;border-width: 3px;border-radius: 50%;" alt="">
              <h4>SHIM JAE WOO</h4>
              <p class="text-muted">심재우</p>
              <ul class="list-inline social-buttons">
            
              </ul>
            </div>
          </div>
          
          <div class="col-sm-4">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="/resources/images/userimages/dayoungProfile.jpg" width="250px" height="250px" style="margin-bottom:20px;border-color:#C2C2C2;border-style: solid;border-width: 3px;border-radius: 50%;" alt="">
              <h4>KIM DA YOUNG</h4>
              <p class="text-muted">김다영</p>
              <ul class="list-inline social-buttons">
                
              </ul>
            </div>
          </div>
          
          <div class="col-sm-2"></div>
            <div class="col-sm-4">
	            <div class="team-member">
	              <img class="mx-auto rounded-circle" src="/resources/images/userimages/seungseopProfile.jpg" width="250px" height="250px" style="margin-bottom:20px;border-color:#C2C2C2;border-style: solid;border-width: 3px;border-radius: 50%;" alt="">
	              <h4>LEE SEUNG SEOP</h4>
	              <p class="text-muted">이승섭</p>
	              <ul class="list-inline social-buttons">
	                
	              </ul>
	            </div>
          	</div>
            <div class="col-sm-4">
	            <div class="team-member">
	              <img class="mx-auto rounded-circle" src="/resources/images/userimages/eunaeProfile.jpg" width="250px" height="250px" style="margin-bottom:20px;border-color:#C2C2C2;border-style: solid;border-width: 3px;border-radius: 50%;" alt="">
	              <h4>JANG EUN AE</h4>
	              <p class="text-muted">장은애</p>
	              <ul class="list-inline social-buttons">
	                
	              </ul>
	            </div>
         	 </div>
         	 <div class="col-sm-2"></div>
        </div>
      
      </div>
    </section>
    
				<!— Items —>
					<section class="main items">
						<article class="item slideanim">
							<header>
								<a href="#"><img src="/resources/images/bf3.jpg" alt="" /></a>
								<h3>TWIICHAT : 트위챗</h3>
							</header>
							<p>	나홀로 여행을 떠난 어느 저녁, 왠지 모를 외로움.. 같이 맥주 한 잔 할 친구가 필요한가요?  
							현지에서 친구를 찾을 수도 있고, 동행인을 구해 미리 여행 계획을 짤 수도 있습니다.  
							트위챗을 통해 새로운 인연을 만들어보세요, 여행은 끝이나도 인연은 계속 됩니다.
							</p>
							
						
						</article>
						<article class="item slideanim">
							<header>
								<a href="#"><img src="/resources/images/planner.jpg" alt="" /></a>
								<h3>TWIIBOOK : 트위북</h3>
							</header>
							<p>여행에 필요한 모든 정보를 트위북에 적어보세요. 
							나의 트위북이 당신만을 위한 여행책이 되어드릴 것입니다. 그 뿐만이 아닙니다. 자신와 같은 일정에 떠나는 친구들을 찾을 수 있고, 
							같이 여행책을 만들 수 있는 친구들을 정할 수도 있습니다.  </p>
						
						</article>
						<article class="item slideanim">
							<header>
								<a href="#"><img src="/resources/images/carhand.jpg" alt="" /></a>
								<h3>ALL ABOUT TRIP : 올어바웃트립</h3>
							</header>
							<p>여행가기 전 필요한 모든 정보, 여기서 확인하세요. 전세계 모든 비행기, 호텔과 여행에 필요한 위험지역정보, 환율, 날씨
							그리고 완벽한 밤을 위한 Night Life까지 !</p>
							
						</article>
						<article class="item slideanim">
							<header>
								<a href="#"><img src="/resources/images/backpackers.jpg" alt="" /></a>
								<h3>DAILY TOUR : 데일리투어</h3>
							</header>
							<p>뻔한 여행 코스에 지치셨나요? 그렇다면 트위오에서 제공하는 데일리투어를 이용해보세요. 
							 현지인이 직접 제공하는 투어를 나라별/도시별/종류별로 만나볼 수 있습니다. 새로운 체험을 즐길 준비 되셨나요?</p>
							
						</article>
					</section>
					
			
						
						<article class="item slideanim">
							<header>
								<a href="#"><img src="/resources/images/twiichat.jpg" alt="" /></a>
								<h3>BLAH BLAH : 블라블라</h3>
							</header>
							<p>여행하고 난 뒤, 나만 알기 아까운 곳이 있으셨나요? 그렇다면 블라블라 게시판에 글을 남겨 많은 친구들이 그 곳을 알 수 있도록 해보세요!
							궁금한게 있을 때에도 블라블라! </p>
							<ul class="actions slideanim">
							</ul>
						</article>
					</section>

			

			</div>
			

		<!— Scripts —>
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>