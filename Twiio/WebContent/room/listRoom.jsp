<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/resources/css/animate.min.css" rel="stylesheet">
   <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  
  <!-- ---------Floating Button------------ -->
  <link href="/resources/css/floatingButtonRoom.css" rel="stylesheet" type="text/css" />
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
  <script>
  	$(function() {
  		
  		$("#myListRoom").on("click" , function() {
			$(self.location).attr("href","/room/listMyRoom");
		}); //END Myroom Event
		
		$( "#scheduleList" ).on("click" , function() {
			$(self.location).attr("href","/schedule/listSchedule");
		});
		 
		 $("button:contains('J O I N')").on("click",function(){
			 
			 var roomKey = $(this).html().split('value="')[1].split('"')[0];
			 var master = $(this).html().split('id="master" value="')[1].split('"')[0];
			 
			 $.ajax({
				 url : "/room/json/addRoomUser/"+roomKey,
				 method : "POST",
				 dataType : "json",
				 headders : {
					 "Accept" : "application/json",
					"Content-Type" : "application/json"
				 },
				 success : function(JSONData, status){
					 alert(JSONData);
				 }
			 })
			 /* window.open("http://218.156.17.126:8282/#/"+roomKey+"/${user.userId}/${user.userNo}/"+master,'Chat','location=no,menubar=no,resizable=no,status=no,right=0'); */
			  window.open("http://192.168.0.33:8282/#/"+roomKey+"/${user.userId}/${user.userNo}/"+master,'Chat','location=no,menubar=no,resizable=no,status=no,right=0');
			   /* window.open("http://localhost:8282/#/"+roomKey+"/${user.userId}/${user.userNo}/"+master,'Chat','location=no,menubar=no,resizable=no,status=no,right=0'); */ 
		 });
		 
		 $("button#search").on("click",function(){
			 
 			fncGetRoomList(1);
 		});
		 
		 function fncGetRoomList(currentPage){
	            $("#currentPage").val(currentPage);
	            $("form").attr("method","POST").attr("action","/room/listRoom").submit();
	            $( '.row' ).scrollIntoView(true);
	        };
		 
	 });//end of function()
	 
	 //infinite scroll
	    var page = 1;
		var flag = 0;
		var flag2 = 0;
		var roomCount = ${resultPage.totalCount};

		if (self.name != 'reload') {
			self.name = 'reload';
			self.location.reload(true);
		} else
			self.name = '';

		$(function() {
			$(window).scroll(function() {
								var documentHeight = $(document).height();
								console.log('$(window).scrollTop() :: '+ ($(window).scrollTop()));
								console.log('$(document).height() - $(window).height() :: '+ ($(document).height() - $(window).height()));
								if (($(window).scrollTop()) != $(document).height()- $(window).height()& flag2 == 1) {
									flag2 = 0;
									console.log('flag :: ' + flag2);
								}
								if (($(window).scrollTop() + 0.8) >= $(document).height()- $(window).height()& flag2 == 0) {
									flag2 = 1;
									console.log('$(window).scrollTop() :: '+ $(window).scrollTop());
									console.log('$(document).height() - $(window).height() :: '+ ($(document).height() - $(window).height()));
									page = page + 1;
									
									$.ajax({
											url : "/room/json/listRoom",
											method : "POST",
											dataType : "json",
											contentType : "application/json;charset=UTF-8",
											data : JSON.stringify({
												"currentPage" : page,
												"searchCondition" : $('#searchCondition').val(),
												"searchKeyword" : $('#searchKeyword').val(),
												"prodSearchType" :  $('#prodSearchType').val()
											}),
											headers : {
												"Accept" : "application/json",
												"Content-Type" : "application/json"
											},
											success : function(JSONData, status) {
												if (flag == 0) {
													roomCount = roomCount- JSONData.length;
													flag = 1;
												}

												for (var i = 0; i < JSONData.length; i++) {
													if(JSONData[i].open == true) {
														/* var displayValue = '<div class="col-sm-3 " style="padding-top : 2%" >' */
														var displayValue = '<div class="col-sm-4 "  style="border-radius: 23px;margin-top:20px;padding-top : 2%;border: dashed #5b5b5b 0.5px;">'
															/* + '<div class="thumbnail" name="getPro" style="height:500px;">' */
															+'<div class="thumbnail" name="getPro" style="max-height:550px;">'
															
															  if(JSONData[i].type == '식사'){
																  displayValue += '<img src="/resources/images/room/hygge01.png" alt="" class="img-rounded" style="height:190px;">';
															  }
															  else if(JSONData[i].type == '체험' ) {
																  displayValue += '<img src="/resources/images/room/hygge02.png" alt="" class="img-rounded" style="height:190px;">';
															  }
															  else if(JSONData[i].type == '관람') {
																  displayValue += '<img src="/resources/images/room/hygge03.png" alt="" class="img-rounded" style="height:190px;">';
															  }
															  else if(JSONData[i].type == '미정') {
																  displayValue += '<img src="/resources/images/room/hygge01.png" alt="" class="img-rounded" style="height:190px;">';
															  }
															
															/* displayValue += '<div class="caption" style="text-align: center;">' */
															
																displayValue += '<div class="col-sm-12">'
										               		+'<div class="col-sm-12">'
										               		+'<div class="caption" style="margin-top:5px;text-align: left;">'
															+ '<h3>'
															+ JSONData[i].roomName
															+ '</h3>'
															+ '<p><strong>국가</strong> : '
															+ JSONData[i].country
															+ '</p>'
															+ '<p> <strong>도시</strong> : '
															+ JSONData[i].city
															+ '</p>'
															+ '<p> <strong>날짜</strong> : '
															+ JSONData[i].date
															+ '</p>'
															+ '<p> <strong>인원</strong> : '
															+ JSONData[i].headCount
															+ '명 </p>'
															/* + '<a href="#" class=" btn btn-default" role="button" style="position: absolute;bottom:8%; right:10%" >참가' */
															<c:if test="${!empty user}">
															+'<div align="center">'
			            										+'<button class="btn-dy3" style="padding-top:6px;padding-bottom:6px;padding-left:20px;padding-right:20px;font-family:JEJUGOTHIC;"> J O I N<input type="hidden" id="roomKey" value="'
															+ JSONData[i].roomKey
															+ '">'
															+ '<input type="hidden" id="master" value="'
															+ JSONData[i].userNo
															+ '"></button></div>'
															</c:if>
															displayValue += '</div></div></div>'

													$('div.row2').append(displayValue);
													}//End if
													
												}//End for Loof
											}//End success
										});//End ajax
								}
							});
		}); 

  	
  	<!--  ///////////////////////// tooltip ////////////////////////// -->
  	$(function(){
  		$('[data-toggle="tooltip"]').tooltip({title: "Hooray", placement: "left"});
  		$("#floating-button").on("click",function(){
  			$("form").attr("method" , "GET").attr("action" , "/room/addRoom").submit();
  		})
  	});
  </script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
body {
    padding-top : 50px;
}
/*       
.btn.btn-default:hover, .btn.btn-default:active{
	color: #FFF;
	background: #08708A;
	border-color: #08708A;
  }

.btn.btn-default{
	background: #f4f4f4;
	color: #08708A;
	border-color: #08708A;
}
.btn-outlined.btn-theme:hover,.btn-outlined.btn-theme:active {
    color: #FFF;
    background: #08708A;
    border-color: #08708A;
}
	
.btn-outlined.btn-theme {
    background: #FFF;
    color: #08708A;
	border-color: #08708A;
} */
h2 {
	/* color : #dedede; */
	color :#474747;
    font-size: 6vw;
    /* padding: 0 0.5em 0.25em 0.5em; */
    font-weight: 500;
    font-family: "Pacifico", cursive;
    text-transform: none;
    letter-spacing: 10;
    font-style: Pacifico;
    text-shadow: 0 5px 5px rgba(0, 0, 0, .5);
}
/* /////////////////dayoung////////////////// */
/* Button-dy css  */
.btn-dy {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 23px;
  font-family:TYPO_JEONGJOL;
  color: #545454;
  font-size: 16px;
  background: #ffffff;
  padding: 6px 20px 6px 20px;
  border: solid #545454 0.5px;
  text-decoration: none;
}

.btn-dy:hover {
  background: #D73A31;
  text-decoration: none;
  color:#ffffff;
  opacity: 0.8;
}


/* Button-dy css - listFriendRecommendation */
.btn-dy2 {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 10px;
  font-family:JEJUGOTHIC;
  color: #ffffff;
  font-size: 15px;
  background: transparent;
  padding: 5px 18x 5px 18px;
  border: solid #ffffff 2px;
  text-decoration: none;
}

.btn-dy2:hover {
  background: #D73A31;
  opacity: 0.8;
  border: solid #545454 0px;
  text-decoration: none;
  color:#ffffff;
}

/* Button-dy css - listRoom */
.btn-dy3 {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 10px;
   border: solid #ffffff 0px !important;
  font-family:JEJUGOTHIC;
  color: #ffffff;
  font-size: 1vw;
  background: #D73A31;
  opacity: 0.9;
  padding: 10px 25x 10px 25px;
  text-decoration: none;
}

.btn-dy3:hover {
  background: #D73A31;
  opacity: 0.5;
  border: solid #ffffff 0px;
  text-decoration: none;
  color:#ffffff;
}


/* ///////////Dayoung - Border/////////////    */      

#innerMain {
   font-size: 6em;
   margin-top: 1.5em;
}

#thumbnailMainBox {
   font-family:'JEJUMYEONGJO';
   border-color: #000000;
   display: inline-block;
   text-decoration: none;
}

#thumbnailMainThumbBox {
   background: #fff;
   display: inline-block;
   border-radius: 6px;
}

    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	
	
</head>
<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<div class="container" style="background: url('/resources/images/room/twiichatMain1.jpg') no-repeat center center; background-size:cover; height:90vh; width:100%;">
		
		<h2 class="text-center" style="color:#3B3B3B; margin-top:10%;"><strong>TwiiChat</strong></h2>
		<h3 class="text-center" style="font-family:'TYPO_JEONGJOL';color:#3B3B3B; margin-top:3%;"><strong>여행의 설렘, 새로운 만남의 설렘, 트위챗</strong></h3>
		<!-- FORM -->
		<div class="text-center" style="background: rgba(255, 255, 255, 0.3); margin-top:150px;margin-left:10%;margin-right:10%;min-width:300px;">
			<form role="form" style="padding:10px;">
				
	    			<div class="row">
	    				<div class="col-sm-2" >
						<div class="form-group">
						    <select class="form-control" id="searchCondition" name="searchCondition" style="text-align-last:center;">
		                        <option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
		                        <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>나라</option>
		                        <option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>도시</option>
							</select>
	  					</div>
	 					</div>
	 					
	  				<div class="col-sm-9">
					  <div class="form-group">
					    <label class="sr-only" for="searchKeyword" >어떤 친구를 만나게 될까요?</label>
					    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
					    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
					  	</div>
					  </div>
					 
		    			
		    			
	    				<div class="col-sm-1" align="center">
	    					<input type="hidden" id="currentPage" name="currentPage" value=""/>
	    				 	<!-- <button class="col-xs-6 btn btn-outlined btn-theme btn-sm" id="search" >검 &nbsp;색</button> -->
	    				 	<button class="btn-dy2" id="search" align="left" style="padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px;font-family:\'JEJUGOTHIC\';">SEARCH</button>
	    				</div>	
				</div><!-- End row -->
			</form>
			<!-- FORM -->
		</div>
		
		<c:if test="${!empty user }">
		<div class="col-sm-12" align="center" style="margin-top:15px;">
           <button id="myListRoom" class="btn-dy3" style="padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px;font-family:\'JEJUGOTHIC\'; background: #D73A31;"/>나의 방목록</button>
           <button id="scheduleList" class="btn-dy3" style="padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px;font-family:\'JEJUGOTHIC\'; background: #D73A31;"/>나의 &nbsp;일정</button>
        </div>         
		</c:if>
						
	</div>
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container contents">
	
		<div class="col-xs-12 inner" id="thumbnailMainBox">
            <div align="center" class="col-xs-1">&nbsp;</div><!-- 그라디언트 보이게 해주려고 한 부분 -->
            <div class="col-xs-12 inner" id="thumbnailMainThumbBox" align="center">
               <div class="col-xs-12" >
	
		<!-- <div class="page-header text-info">
	       <h3>메신저 방목록 조회 </h3>
	    </div> -->
	    
	    
	    <div class="row">
	    <div class="col-md-12 text-right" style=" background: #ededed; border-radius: 23px;">
              <h4>지금 진행되고 있는 방 ${resultPage.totalCount} 개</h4>
          </div> 
       </div>
	    
	    
	    
	    <!-- 위쪾 검색 END -->
	    
	    <div class="row2">
          
          <c:set var="i" value="0" />
		  <c:forEach var="room" items="${list}">
			<!-- <div class="row"> -->
			<c:if test="${room.open }">
		    <!-- <div class="col-sm-3 "  style="padding-top : 2%"> -->
		    <div class="col-sm-4 "  style="border-radius: 23px;margin-top:20px;padding-top : 2%;border: dashed #5b5b5b 0.5px;">
		      <!-- <div class="thumbnail" name="getPro" style="height:500px;"> -->
		      <div class="thumbnail" name="getPro" style="max-height:550px;">
		        <!-- <img src="https://i.pinimg.com/236x/90/fa/d5/90fad5ab4057d05ad3f82f4d12aa22da.jpg" alt="..." class="img-rounded"> -->
				  <c:if test="${room.type == '식사'}">
		        		<img src="/resources/images/room/hygge01.png" alt="" class="img-rounded" style="height:190px;">
				  </c:if>
				  <c:if test="${room.type == '체험' }">
				  	<img src="/resources/images/room/hygge02.png" alt="" class="img-rounded" style="height:190px;">
				  </c:if>
				  	
				  <c:if test="${room.type == '관람' }">
				  	<img src="/resources/images/room/hygge03.png" alt="" class="img-rounded" style="height:190px;">
				  </c:if>
				  	
				  <c:if test="${room.type == '미정' }">
				  	<img src="/resources/images/room/hygge01.png" alt="" class="img-rounded" style="height:190px;">
				  </c:if>
				  <div class="col-sm-12">
               		<div class="col-sm-12">
               		<div class="caption" style="margin-top:5px;text-align: left;">
		          <!-- <div class="caption" style="text-align: center;"> -->
		          	
		            <h3>${room.roomName} </h3>		            
		            <p><strong>국가</strong> : ${room.country}</p>
		            <p><strong>도시</strong> : ${room.city}</p>
		            <p><strong>날짜</strong> : ${room.date}</p>
		            <p><strong>인원</strong> : ${room.headCount}명</p>
		            <c:if test="${!empty user}" >
			            <!-- <a href="#" class=" btn btn-default" role="button" style="position: absolute;bottom:8%; right:10%">
			            참가 -->
			            <div align="center">
			            <button class="btn-dy3" style="padding-top:6px;padding-bottom:6px;padding-left:20px;padding-right:20px;font-family:\'JEJUGOTHIC\';"> J O I N 
			            <input type="hidden" id="roomKey" value="${room.roomKey}">
			            <input type="hidden" id="master" value="${room.userNo }">
			            </button>
			            <!-- </a> -->
			            </div>
		            </c:if>
		            </div>
		        </div>
		      </div>
		    </div>
		    </div>
		    
		    
		    </c:if>
		    </c:forEach>
		    </div>
		    </div>
		    </div>
		    <div align="right" class="col-xs-1">&nbsp;</div>
		    </div>
        </div>
        <!--  화면구성 div End /////////////////////////////////////-->
	  
	  <c:if test="${ !empty user }">
	  <!--  Floating Button <START> -->
		<div id="container-floating">
			<button id="floating-button" type="submit" data-toggle="tooltip" data-original-title="Create" title="방 생성">
				<p class="letter" id="addRoom">+</p>
			<button>
		</div>
	  <!--  Floating Button <END> -->
	  </c:if>
	  
 	
 	
	
</body>
</html>
