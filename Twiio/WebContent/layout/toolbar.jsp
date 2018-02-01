<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/main.jsp">TWIIO</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	              
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >TwiiChat</span>
	                         <span class="caret"></span>
	                     </a>
	                     <c:if test="${!empty user}">
	                     	<ul class="dropdown-menu">
		                         <li><a href="#">My TwiiChat List</a></li>
		                         <li class="divider"></li>
		                         
		                     </ul>
	                     </c:if>
	                 </li>
	     
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >Blabla~</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">Question Q&A</a></li>
		                         <li><a href="#">Trip Review</a></li>
		                         <li class="divider"></li>
		                         
		                     </ul>
		                </li>
	              
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >AllAboutTrip</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">Flight</a></li>
	                         <li><a href="#">Hotel</a></li>
	                         <li><a href="#">Currency</a></li>
	                         <li><a href="#">Weather</a></li>
	                         <li><a href="#">UnsafeRegion</a></li>
	                         <li><a href="#">nightLife</a></li>
	                         <li><a href="#">Best10</a></li>
	                         <li class="divider"></li>
	                         
	                     </ul>
	                 </li>
	                 
	                 <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >DailyTour</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">Trip Product</a></li>
	                         <li><a href="#">BEST10</a></li>
	                         
	                         <li class="divider"></li>
	                         
	                     </ul>
	                 </li>
	                 
	                 <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >MyTripBook</span>
	                         <span class="caret"></span>
	                     </a>
	                     
	                 </li>
	                 
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	             	<c:if test="${sessionScope.user == null}">
	                  <li><a href="#">Login</a></li>
	                </c:if>
	                <c:if test="${sessionScope.user != null}">
	                  <li><a href="#">Logout</a></li>
	                </c:if>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('Logout')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  개인정보조회회 Event  처리 =============	
			
		/* Messenger*/
			
		$( "a:contains('TwiiChat')" ).on("click" , function() {
			$(self.location).attr("href","/room/listRoom");
		});
		
		$( "a:contains('My TwiiChat List')" ).on("click" , function() {
			$(self.location).attr("href","/room/listMyRoom");
		});
		
		/* Community*/
		
		$( "a:contains('Question Q&A')" ).on("click" , function() {
			$(self.location).attr("href","/community/listCommunity?communityType=0");
		});
		$( "a:contains('Trip Review')" ).on("click" , function() {
			$(self.location).attr("href","/community/listCommunity?communityType=1");
		});
		
		/* Information */
		
		$( "a:contains('Flight')" ).on("click" , function() {
			$(self.location).attr("href","/information/getFlightList");
		});
		
		$( "a:contains('Hotel')" ).on("click" , function() {
			$(self.location).attr("href","/information/getHotel");
		});
		
		$( "a:contains('Currency')" ).on("click" , function() {
			$(self.location).attr("href","/information/getCurrency");
		});
		
		$( "a:contains('Weather')" ).on("click" , function() {
			$(self.location).attr("href","/information/searchNowWeather");
		});
		
		$( "a:contains('UnsafeRegion')" ).on("click" , function() {
			$(self.location).attr("href","/information/getUnsafeRegion");
		});
		
		$( "a:contains('nightLife')" ).on("click" , function() {
			$(self.location).attr("href","/information/listNightLife");
		});
		
		$( "a:contains('Best10')" ).on("click" , function() {
			$(self.location).attr("href","/information/getBest10");
		});
		
		$( "a:contains('UnsafeRegion')" ).on("click" , function() {
			$(self.location).attr("href","/information/getUnsafeRegion");
		});
		
		/* Product */
		
		$( "a:contains('Trip Product')" ).on("click" , function() {
			$(self.location).attr("href","/product/listProduct");
		});
		
		$( "a:contains('BEST10')" ).on("click" , function() {
			$(self.location).attr("href","/product/listBestProduct");
		});
		
		/* Planer */
		
		$( "a:contains('MyTripBook')" ).on("click" , function() {
			$(self.location).attr("href","/mainplan/listMainPlan");
		});
		
		/* Login */
		
		$( "a:contains('Login')" ).on("click" , function() {
			$(self.location).attr("href","/user/login");
		});
		
		
		
		
		
		
	 	
		
	</script>  