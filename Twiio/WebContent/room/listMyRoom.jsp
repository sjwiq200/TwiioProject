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
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  
  <script>
  	$(function() {
		 
		 $( "button.btn.btn-default:contains('방생성')" ).on("click" , function() {
			 $("form").attr("method" , "GET").attr("action" , "/room/addRoom").submit();
		});
		 
		 $("a:contains('참가')").on("click",function(){
			 
			 var roomKey = $(this).html().split('value="')[1].split('"')[0];
			 var master = $(this).html().split('id="master" value="')[1].split('"')[0];
			 console.log(roomKey);
			 
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
			  window.open("http://192.168.0.9:8282/#/"+roomKey+"/${user.userId}/${user.userNo}/"+master,'Chat','location=no,menubar=no,resizable=no,status=no,right=0');
			 /* window.open("http://localhost:8282/#/"+roomKey+"/${user.userId}/${user.userNo}/"+master,'Chat','location=no,menubar=no,resizable=no,status=no,right=0'); */ 
		 });
		 
		 $("#out").on("click",function(){
			 var roomKey = $(this).html().split('value="')[1].split('"')[0];
			 swal({
				  title: "채팅방을 나가시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    swal("채팅방에서 퇴장했습니다.", {
				      icon: "success",
				    }).then((next) => {
				    		$("form").attr("method","POST").attr("action", "/room/deleteRoomUser/"+roomKey).submit();
				    });
				  } 
				});//end swal
		 })
		 
		 $("button.btn.btn-default").on("click",function(){
			 alert("hello")
 			fncGetRoomList(1);
 		});
		 
		 function fncGetRoomList(currentPage){
	            $("#currentPage").val(currentPage);
	            $("form").attr("method","POST").attr("action","/room/listRoom").submit();
	        };
		 
		 $("a:contains('방 수정')").on("click",function(){
			 var roomKey = $(this).html().split('value="')[1].split('"')[0];
			 self.location = "/room/updateRoom/"+roomKey;
		 });
		 
	 });
  	
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
										url : "/room/json/listMyRoom",
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
												var displayValue = '<div class="col-sm-3 " style="padding-top : 2%" >'
														+ '<div class="thumbnail" name="getPro" style="height:550px;">'
														
														if(JSONData[i].type == '식사'){
															  displayValue += '<img src="/resources/images/room/hygge01.png" alt="" class="img-rounded" >';
														  }
														  else if(JSONData[i].type == '체험' ) {
															  displayValue += '<img src="/resources/images/room/hygge02.png" alt="" class="img-rounded" >';
														  }
														  else if(JSONData[i].type == '관람') {
															  displayValue += '<img src="/resources/images/room/hygge03.png" alt="" class="img-rounded" >';
														  }
														  else if(JSONData[i].type == '미정') {
															  displayValue += '<img src="/resources/images/room/hygge01.png" alt="" class="img-rounded" >';
														  }
														/* + '<img src="https://i.pinimg.com/236x/90/fa/d5/90fad5ab4057d05ad3f82f4d12aa22da.jpg" alt="..." class="img-rounded">' */
														displayValue += '<div class="caption" style="text-align: center;">'
														+ '<h3>'
														+ JSONData[i].roomName
														+ '</h3>'
														+ '<p> Date : '
														+ JSONData[i].date
														+ '</p>'
														+ '<p> country : '
														+ JSONData[i].country
														+ '</p>'
														+ '<p> city : '
														+ JSONData[i].city
														+ '</p>'
														+ '<p>'
														+ JSONData[i].headCount
														+ '명 </p>'
														+ '<p style="position: absolute;bottom:10%; right:10%" >'
														<c:if test="${!empty user}">
														
														+ '<a href="#" class=" btn btn-default" role="button">참가'
														+ '<input type="hidden" id="roomKey" value="'
														+ JSONData[i].roomKey
														+ '">'
														+ '<input type="hidden" id="master" value="'
														+ JSONData[i].userNo
														+ '"></a>'
														+ '<a class="btn btn-outlined btn-light btn-sm" id="out">'
														+ '<input type="hidden" id="roomKey" value="'
														+ JSONData[i].roomKey
														+'">나가기</a>'
														</c:if>
														displayValue += '</p><p>'
														var userNo = ${user.userNo};
														if( userNo == JSONData[i].userNo){
															displayvalue += '<a href="#" class=" btn btn-default" style="position: absolute;bottom:5%; right:15%">방 수정<input type="hidden" id="roomKey" value="'
										            			+ JSONData[i].roomKey
										            			+'"></a>'	
														}
									            			displayValue += '</div>'
												$('.row2').append(displayValue);
											}//END for Loof
										}//End success
									});//End ajax
							}
						});
	});
  </script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
		<style>
	  body {
            padding-top : 50px;
        }
        
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
		
		
		.btn-outlined.btn-theme:hover,
.btn-outlined.btn-theme:active {
    color: #dedede;
    background: #08708A;
    border-color: #08708A;
}

.btn-outlined.btn-theme {
    background: #dedede;
    color: #08708A;
	border-color: #08708A;
}
.btn-outlined.btn-light:hover,
.btn-outlined.btn-light:active {
    color: #dedede;
    background: #D73A31;
    border-color: #D73A31;
}

.btn-outlined.btn-light {
    background: #dedede;
    color: #D73A31;
	border-color: #D73A31;
}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	
	
</head>
<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!--  Carousel Start /////////////////////////////////////-->
	<div class="container" height = "700px">
		<div id="carousel" class="carousel slide carousel-fade"
			data-ride="carousel">
			
			<!-- Carousel items -->
			<div class="carousel-inner carousel-zoom">
				<div class="active item">
					<img class="img-responsive"
						src="https://images.unsplash.com/photo-1419064642531-e575728395f2?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=1200">
					<div class="carousel-caption" style="top:0;">
					<h2>TwiiChat</h2>
					</div>
					<div class="carousel-caption">
									<!-- FORM -->
									
		<form role="form" >
			<div class="row centered-form" >
				 <div class="mainbox col-md-12" >
					<div class="panel" style="background: rgba(255, 255, 255, 0.3);">
			 			<div class="panel-body" >
				    			<div class="row">
				    				<div class="col-md-2" >
									<div class="form-group">
									    <select class="form-control" id="searchCondition" name="searchCondition" >
					                        <option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>방제목</option>
					                        <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>국가명</option>
					                        <option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>도시명</option>
										</select>
				  					</div>
			  					</div>
			  					
				  				<div class="col-md-10">
								  <div class="form-group">
								    <label class="sr-only" for="searchKeyword">검색어</label>
								    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
								    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
								  	</div>
								  </div>
								 
					    			</div>
					    			<div class="row">
					    			<div class="col-xs-8 col-sm-8 col-md-8 col-sm-offset-2">	
					    				<input type="hidden" id="currentPage" name="currentPage" value=""/>
					    				 <button class="col-xs-12 btn btn-outlined btn-theme btn-sm" id="search" >검 &nbsp;색</button>
					    			</div>
					    	</div>
			    		</div>
					</div>
				</div>
			</div>
		
		</form>
						<!-- FORM -->
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<!--  Carousel End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>참여한 방목록 조회 </h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수
		    	</p>
		    </div>
		    
		    <div class="col-md-10 text-right">
			   
	    		</div>
		</div>
		
		<div class="row2">
          
          <c:set var="i" value="0" />
		  <c:forEach var="room" items="${list}">
			<!-- <div class="row"> -->
		    <div class="col-sm-3 " style="padding-top : 2%">
		      <div class="thumbnail" name="getPro" style="height:550px;">
		    
		        <!-- <img src="https://i.pinimg.com/236x/90/fa/d5/90fad5ab4057d05ad3f82f4d12aa22da.jpg" alt="..." class="img-rounded"> -->
		        <c:if test="${room.type == '식사'}">
		        		<img src="/resources/images/room/hygge01.png" alt="" class="img-rounded" >
				  </c:if>
				  <c:if test="${room.type == '체험' }">
				  	<img src="/resources/images/room/hygge02.png" alt="" class="img-rounded" >
				  </c:if>
				  	
				  <c:if test="${room.type == '관람' }">
				  	<img src="/resources/images/room/hygge03.png" alt="" class="img-rounded" >
				  </c:if>
				  	
				  <c:if test="${room.type == '미정' }">
				  	<img src="/resources/images/room/hygge01.png" alt="" class="img-rounded" >
				  </c:if>
		          <div class="caption" style="text-align: center;">
		            <h3>${room.roomName} </h3>		            
		            <p>Date : ${room.date}</p>
		            <p>country : ${room.country}</p>
		            <p> city : ${room.city}</p>
		            <p>${room.headCount}명</p>
		            <p style="position: absolute;bottom:10%; right:10%" >
		            <c:if test="${!empty user}">
			            <a href="#" class=" btn btn-default" role="button">
			            참가
			            <input type="hidden" id="roomKey" value="${room.roomKey}">
			            <input type="hidden" id="master" value="${room.userNo }">
			            </a>
			            <a class="btn btn-outlined btn-light btn-sm" id="out">
			            <input type="hidden" id="roomKey" value="${room.roomKey}">
			            나가기
			            </a>
		            </c:if>
		            </p>
		            <p>
		            <c:if test="${user.userNo == room.userNo }">
		            		<a href="#" class=" btn btn-default" style="position: absolute;bottom:5%; right:15%">방 수정<input type="hidden" id="roomKey" value="${room.roomKey}"></a>
		            </c:if>
		            </p>
		            
		        </div>
		      </div>
		    </div>
		    </c:forEach>
		    </div>
        
        
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	
</body>
</html>