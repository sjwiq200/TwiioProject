<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>



<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  ///////////////////////// CSS ////////////////////////// -->
<link rel="stylesheet" href="/resources/css/font.css" />

<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar-wrapper" style="color:#ffffff !important;">
    <div class="container-fluid">
        <nav class="navbar navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/" style="color:#ffffff !important;font-size:23px;font-family:Pacifico !important;"  >TWIIO</a>
		
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
		<div class="collapse navbar-collapse" id="target"
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">

	             
	              
	              	<li class="dropdown" style="color:#ffffff !important; font-size:0.8vw !important; font-weight: lighter !important; font-family: JEJUGOTHIC">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">

	                         <span>트위챗</span>
	                        
	                     </a>

	                 </li> 

	              <li class="dropdown" style="color:#ffffff !important; font-size:0.8vw !important; font-weight: lighter !important; font-family: JEJUGOTHIC">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >올어바웃트립</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu" style="color:#ffffff !important; font-size:0.8vw !important; font-weight: lighter !important;">
	                         <li style="color:#ffffff !important; font-size:0.7vw !important; font-weight: lighter !important;"><a style="font-family: JEJUGOTHIC" color:#ffffff !important; font-size:1vw !important; font-weight: lighter !important; href="#">비행기</a></li>
	                         <li style="color:#ffffff !important; font-size:0.7vw !important; font-weight: lighter !important;"><a style="font-family: JEJUGOTHIC" color:#ffffff !important; font-size:1vw !important; font-weight: lighter !important; href="#">호텔</a></li>
	                         <li style="color:#ffffff !important; font-size:0.7vw !important; font-weight: lighter !important;"><a style="font-family: JEJUGOTHIC" color:#ffffff !important; font-size:1vw !important; font-weight: lighter !important; href="#">환율</a></li>
	                         <li style="color:#ffffff !important; font-size:0.7vw !important; font-weight: lighter !important;"><a style="font-family: JEJUGOTHIC" color:#ffffff !important; font-size:1vw !important; font-weight: lighter !important; href="#">날씨</a></li>
	                         <li style="color:#ffffff !important; font-size:0.7vw !important; font-weight: lighter !important;"><a style="font-family: JEJUGOTHIC" color:#ffffff !important; font-size:1vw !important; font-weight: lighter !important; href="#">위험지역</a></li>
	                         <li style="color:#ffffff !important; font-size:0.7vw !important; font-weight: lighter !important;"><a style="font-family: JEJUGOTHIC" color:#ffffff !important; font-size:1vw !important; font-weight: lighter !important; href="#">나이트라이프</a></li>
	                         <li class="divider" style="color:#ffffff !important; font-size:0.7vw !important; font-weight: lighter !important;"></li>
	                         
	                     </ul>
	                 </li>
	                 
	                 <li class="dropdown" style="color:#ffffff !important; font-size:0.8vw !important; font-weight: lighter !important; font-family: JEJUGOTHIC">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >데일리투어</span>
	                         <!-- <span class="caret"></span> -->
	                     </a>
	                     <!-- <ul class="dropdown-menu">
	                         <li><a href="#">Trip Product</a></li>
	                         
	                         
	                         <li class="divider"></li>
	                         
	                     </ul> -->
	                 </li>
	                 
	                 <li class="dropdown" style="color:#ffffff !important; font-size:0.8vw !important; font-weight: lighter !important; font-family: JEJUGOTHIC">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >트위북</span>
	                         <!-- <span class="caret"></span> -->
	                     </a>
	                 </li>
	                 
	                 
		              <li class="dropdown" style="color:#ffffff !important; font-size:0.8vw !important; font-weight: lighter !important; font-family: JEJUGOTHIC">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >블라블라</span>

		                     </a>  

		                </li>
	                 
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right" style="color:#ffffff !important; font-size:0.8vw !important;  font-family: JEJUGOTHIC !important" >
	             	<c:if test="${sessionScope.user == null}">
	                  <li><a href="#">로그인</a></li>
	                </c:if>
	                <c:if test="${sessionScope.user != null}">
	                  <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >마이페이지</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu" align="right">
	                     	 <li><a href="#" align="right">유저정보</a></li>
	                         <li><a href="#" align="right">메세지</a></li>
	                         <!-- <li><a href="#">FRIEND</a></li> -->
	                         <c:if test="${sessionScope.user.userType != '3'}">
	                         	<li><a href="#" align="right">거래정보</a></li>
	                         </c:if>
	                         <c:if test="${sessionScope.user.userType == '2'}">   
	                        	<li><a href="#" align="right">상품정보</a></li>
	                         </c:if>
	                         <c:if test="${sessionScope.user.userType == '3'}">
	                         	<li><a href="#" align="right">유저리스트</a></li>
	                         	<li><a href="#" align="right">신고</a></li>
	                         	<li><a href="#" align="right">환불</a></li>
	                         </c:if>
	                         <li><a href="#" align="right">로그아웃</a></li>
	                         <!--<li><a href="#">일정목록조회</a></li>
	                         <li><a href="#">친구목록조회</a></li> -->
	                         <li class="divider"></li>
	                     </ul>
	                 </li>
	                  
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
		 	$("a:contains('로그아웃')").on("click" , function() {
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
			
		$( "a:contains('트위챗')" ).on("click" , function() {
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
		
		/* $( "a:contains('Question Q&A')" ).on("click" , function() {
			$(self.location).attr("href","/community/listCommunity?communityType=0");
		}); */
		$( "a:contains('블라블라')" ).on("click" , function() {
			$(self.location).attr("href","/community/listCommunity?communityType=1");
		});
		
		/* Information */
		
		$( "a:contains('비행기')" ).on("click" , function() {
			$(self.location).attr("href","/information/getFlightList");
		});
		
		$( "a:contains('호텔')" ).on("click" , function() {
			$(self.location).attr("href","/information/getHotel");
		});
		
		$( "a:contains('환율')" ).on("click" , function() {
			$(self.location).attr("href","/information/getCurrency");
		});
		
		$( "a:contains('날씨')" ).on("click" , function() {
			$(self.location).attr("href","/information/searchNowWeather");
		});
		
		$( "a:contains('위험지역')" ).on("click" , function() {
			$(self.location).attr("href","/information/getUnsafeRegion");
		});
		
		$( "a:contains('나이트라이프')" ).on("click" , function() {
			$(self.location).attr("href","/information/listNightLife");
		});
		
		$( "a:contains('위험지역')" ).on("click" , function() {
			$(self.location).attr("href","/information/getUnsafeRegion");
		});
		
		/* Product */
		
		$( "a:contains('데일리투어')" ).on("click" , function() {
			$(self.location).attr("href","/product/listProduct");
		});		
		
		
		/* Planer */
		
		$( "a:contains('트위북')" ).on("click" , function() {
			
			if(${sessionScope.user == null}){
				$(self.location).attr("href","/user/login");
			}else{
				$(self.location).attr("href","/mainplan/listMainPlan");
			}
		});
		
		/* Login */
		
		$( "a:contains('로그인')" ).on("click" , function() {
			$(self.location).attr("href","/user/login");
		});
		
		
		/* MyPage */
		
		/* $( "a:contains('MyPage')" ).on("click" , function() {
			$(self.location).attr("href","/mypage/myPageMain");
		}); */
		
		$( "a:contains('메세지')" ).on("click" , function() {
			$(self.location).attr("href","/mypage/message/listMessage");
		});
		
		$( "a:contains('거래')" ).on("click" , function() {
			$(self.location).attr("href","/transaction/listTransaction");
		});
		
		$( "a:contains('상품')" ).on("click" , function() {
			$(self.location).attr("href","/product/listHostProduct");
		});
		
		$( "a:contains('신고')" ).on("click" , function() {
			$(self.location).attr("href","/common/listReport");
		});
		
		$( "a:contains('유저정보')" ).on("click" , function() {
			$(self.location).attr("href","/user/getUser?userNo=${sessionScope.user.userNo}");
		});
		
		$( "a:contains('유저리스트')" ).on("click" , function() {
			$(self.location).attr("href","/user/listUser");
		});
		
		$( "a:contains('환불')" ).on("click" , function() {
			$(self.location).attr("href","/transaction/listRefund");
		});
		
		/*
		$( "a:contains('일정목록조회')" ).on("click" , function() {
			$(self.location).attr("href","/schedule/listSchedule");
		});
		*/
		 /* $( "a:contains('FRIEND')" ).on("click" , function() {
			$(self.location).attr("href","/common/listFriend");
		}); */
		 
	</script>  
	
	
	<style>	
			
			.navbar, .dropdown-menu{
			background:rgba(215, 58, 49, 0.8) !important;
			border: none !important;
				color: #ffffff !important;
			}
			
			 .nav>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover, .dropdown-menu>li>a, .dropdown-menu>li{
			  border-bottom: 3px solid transparent !important;
			} 
			.nav>li>a:focus, .nav>li>a:hover,.nav .open>a, .nav .open>a:focus, .nav .open>a:hover, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover{
			  border-bottom: 3px solid transparent !important;
			  background: none !important;
			}
			.navbar a, .dropdown-menu>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover, .navbar-toggle{
			 color: #fff !important;
			}
			.dropdown-menu{
			      -webkit-box-shadow: none !important;
			    box-shadow:none !important;
			}
			
			.nav li:hover, .nav li.active{
			  border-bottom: #fff 3px solid !important;
			}
			
			.navbar-toggle .icon-bar{
			    color: #fff !important;
			    background: #fff !important;
			}

			
			/* Modal Content/Box */
			.modal-content {
			    background-color: #fefefe !important;
			    margin: 15% auto !important; /* 15% from the top and centered */
			    padding: 20px !important;
			    border: 1px solid #888 !important;
			    width: 60% !important; /* Could be more or less, depending on screen size */
			}
			
			/* The Close Button */
			.close {
			    color: #aaa !important;
			    float: right !important;
			    font-size: 28px !important;
			    font-weight: bold !important;
			}
			
			.close:hover,
			.close:focus {
			    color: black !important;
			    text-decoration: none important;
			    cursor: pointer !important;
			}
			

        
    </style>