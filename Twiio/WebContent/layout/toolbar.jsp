<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>



<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar-wrapper">
    <div class="container-fluid">
        <nav class="navbar navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/">TWIIO</a>
		
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
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">

	             
	              
	              	<li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">

	                         <span >TwiiChat</span>
	                         <span class="caret"></span>
	                     </a>

	                 </li> 
	     
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >Blabla</span>
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
	                         <!-- <span class="caret"></span> -->
	                     </a>
	                     <!-- <ul class="dropdown-menu">
	                         <li><a href="#">Trip Product</a></li>
	                         
	                         
	                         <li class="divider"></li>
	                         
	                     </ul> -->
	                 </li>
	                 
	                 <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >MyTripBook</span>
	                         <!-- <span class="caret"></span> -->
	                     </a>
	                     
	                 </li>
	                 
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	             	<c:if test="${sessionScope.user == null}">
	                  <li><a href="#">Login</a></li>
	                </c:if>
	                <c:if test="${sessionScope.user != null}">
	                  <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >MyPage</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                     	 <li><a href="#">개인정보조회</a></li>	                     	 
	                         <li><a href="#">Message</a></li>
	                         <li><a href="#">Friend</a></li>
	                         <c:if test="${sessionScope.user.userType != '3'}">
	                         <li><a href="#">구매목록조회</a></li>
	                          </c:if>
	                         <c:if test="${sessionScope.user.userType == '2'}">
	                        	 <li><a href="#">판매목록조회</a></li>
	                         </c:if>
	                         <c:if test="${sessionScope.user.userType == '3'}">
	                         <li><a href="#">회원리스트조회</a></li>
	                         <li><a href="#">신고목록조회</a></li>
	                         <li><a href="#">환불목록조회</a></li>
	                         </c:if>
	                         <!--<li><a href="#">일정목록조회</a></li>
	                         <li><a href="#">친구목록조회</a></li> -->
	                         <li class="divider"></li>
	                     </ul>
	                 </li>
	                  <li><a href="#">Logout</a></li>
	                </c:if>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
        </nav>
    </div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->

   	
	
   	<script type="text/javascript">
   	
	
		//============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('Logout')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= ȸ��������ȸ Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  ����������ȸȸ Event  ó�� =============	
			
		/* Messenger*/
			
		$( "a:contains('TwiiChat')" ).on("click" , function() {
			$(self.location).attr("href","/room/listRoom");
			/* $(self.location).attr("href","/room/mainRoom.jsp"); */
			
		});
		
		$( "a:contains('My TwiiChat List')" ).on("click" , function() {
			$(self.location).attr("href","/room/listMyRoom");
		});
		
		$( "a:contains('My Schedule List')" ).on("click" , function() {
			$(self.location).attr("href","/schedule/listSchedule");
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
		
		$( "a:contains('DailyTour')" ).on("click" , function() {
			$(self.location).attr("href","/product/listProduct");
		});		
		
		
		/* Planer */
		
		$( "a:contains('MyTripBook')" ).on("click" , function() {
			
			if(${sessionScope.user == null}){
				$(self.location).attr("href","/user/login");
			}else{
				$(self.location).attr("href","/mainplan/listMainPlan");
			}
		});
		
		/* Login */
		
		$( "a:contains('Login')" ).on("click" , function() {
			$(self.location).attr("href","/user/login");
		});
		
		
		/* MyPage */
		
		/* $( "a:contains('MyPage')" ).on("click" , function() {
			$(self.location).attr("href","/mypage/myPageMain");
		}); */
		
		$( "a:contains('Message')" ).on("click" , function() {
			$(self.location).attr("href","/mypage/message/listMessage");
		});
		
		$( "a:contains('구매목록조회')" ).on("click" , function() {
			$(self.location).attr("href","/transaction/listTransaction");
		});
		
		$( "a:contains('판매목록조회')" ).on("click" , function() {
			$(self.location).attr("href","/product/listHostProduct");
		});
		
		$( "a:contains('신고목록조회')" ).on("click" , function() {
			$(self.location).attr("href","/common/listReport");
		});
		
		$( "a:contains('개인정보조회')" ).on("click" , function() {
			$(self.location).attr("href","/user/getUser?userNo=${sessionScope.user.userNo}");
		});
		
		$( "a:contains('회원리스트조회')" ).on("click" , function() {
			$(self.location).attr("href","/user/listUser");
		});
		
		$( "a:contains('환불목록조회')" ).on("click" , function() {
			$(self.location).attr("href","/transaction/listRefund");
		});
		/*
		$( "a:contains('일정목록조회')" ).on("click" , function() {
			$(self.location).attr("href","/schedule/listSchedule");
		});
		*/
		 $( "a:contains('Friend')" ).on("click" , function() {
			$(self.location).attr("href","/common/listFriend");
		});
		 
	</script>  
	
	
	<style>
				
			.navbar, .dropdown-menu{
			background:rgba(215, 58, 49, 0.8);
			border: none;
			}
			
			 .nav>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover, .dropdown-menu>li>a, .dropdown-menu>li{
			  border-bottom: 3px solid transparent;
			} 
			.nav>li>a:focus, .nav>li>a:hover,.nav .open>a, .nav .open>a:focus, .nav .open>a:hover, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover{
			  border-bottom: 3px solid transparent;
			  background: none;
			}
			.navbar a, .dropdown-menu>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover, .navbar-toggle{
			 color: #fff;
			}
			.dropdown-menu{
			      -webkit-box-shadow: none;
			    box-shadow:none;
			}
			
			.nav li:hover, .nav li.active{
			  border-bottom: #fff 3px solid;
			}
			
			.navbar-toggle .icon-bar{
			    color: #fff;
			    background: #fff;
			}

			
			/* Modal Content/Box */
			.modal-content {
			    background-color: #fefefe;
			    margin: 15% auto; /* 15% from the top and centered */
			    padding: 20px;
			    border: 1px solid #888;
			    width: 80%; /* Could be more or less, depending on screen size */
			}
			
			/* The Close Button */
			.close {
			    color: #aaa;
			    float: right;
			    font-size: 28px;
			    font-weight: bold;
			}
			
			.close:hover,
			.close:focus {
			    color: black;
			    text-decoration: none;
			    cursor: pointer;
			}
			

        
    </style>