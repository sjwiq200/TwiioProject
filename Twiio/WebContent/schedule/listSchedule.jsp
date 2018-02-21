<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- 캘린더 2 -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


<!-- ///////////////////////////////////////////////////////////////////////// -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bttn.css/0.2.4/bttn.min.css">
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    
<!-- Bootstrap Dropdown Hover CSS -->
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">

<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <!—  구글  —>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
</script>
  <script>
  	var totalCount=0;
  	$(function() {
  		
  		
  		$("#listMyRoom").on("click" , function() {
			$(self.location).attr("href","/room/listMyRoom");
		}); //END Myroom Event
		
		$( "#listRoom" ).on("click" , function() {
			$(self.location).attr("href","/room/listRoom");
		});
  		
  		$("button:contains('일정 수정')").on("click",function(){
			 var roomKey = $(this).html().split('value="')[1].split('"')[0];
			 self.location = "/schedule/updateSchedule/"+roomKey;
		 });
  		
  		$("button:contains('유저 평가')").on("click",function(){
  			alert("hello");
  			var roomKey = $(this).html().split('value="')[1].split('"')[0];
  			/* self.location = "/schedule/addEvalUser/"+roomKey */
  			
  			var result ="";

			 $.ajax({
	    				url:"/schedule/json/addEvalUser/"+roomKey,
	    				method:"GET",	    					
	    				dataType:"json",
	    				headers : {
						"Accept" : "application/json", 
						"Content-Type" : "application/json"
					},
					success:function(JSONData){
    					
    					
    					for(var i=0;i<JSONData.length;i++){
    						totalCount = JSONData.length;
    						console.log("tqtqtq========="+JSONData[i].userNo );	
    						console.log("tqtqtq========="+JSONData[i].userName );	
    						result += '<form class="form-horizontal" id="user'+i+'" style="padding-top: 20px;">'
    						+'<div class="col-xs-18">'
    						+'<div class="form-group">'
    						+'<input type="hidden" id="userNo'+i+'" name = "userNo'+i+'" value="'+JSONData[i].userNo+'">'
    						+'<label for="userName" class="col-xs-offset-1 col-xs-3 control-label">*유저 이름 </label>'
    						+'<div class="col-xs-6">'
    						+'<input type="text" class="form-control" id="userName'+i+'" name="userName'+i+'" value="'+JSONData[i].userName+'" readonly>'
    						+'</div>'
    						+'</div>'
    						+'<div class="form-group">'
    						+'<label for="attendanceTnF'+i+'" class="col-xs-offset-1 col-xs-3 control-label" >참석 여부 </label>'
    						
    						+'<div class ="col-xs-6" style="text-align:center">'
    						+'<label for="attendanceTnF'+i+'" class="chk_radio on">참석&nbsp;&nbsp;<input type="radio" name="attendanceTnF'+i+'"    checked="checked" value="1" /></label>'
    						+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
    						+'<label for="attendanceTnF'+i+'" class="chk_radio ">불참석&nbsp;&nbsp;<input type="radio" name="attendanceTnF'+i+'"  value="0" /></label>'
    						+'</div>'
    						
    						+'</div>'
    						+'<div class="form-group">'
    						+'<label for="profileTnF'+i+'" class="col-xs-offset-1 col-xs-3 control-label">프로필 진위 여부 </label>'
    						+'<div class ="col-xs-6" style="text-align:center">'
    						+'<label for="profileTnF'+i+'" class="chk_radio on">일치&nbsp;&nbsp;<input type="radio" name="profileTnF'+i+'"    checked="checked" value="1" /></label>'
    						+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
    						+'<label for="profileTnF'+i+'" class="chk_radio ">불일치&nbsp;&nbsp;<input type="radio" name="profileTnF'+i+'"  value="0" /></label>'
    						+'</div>'
    						+'</div>'
    						+'</div>'
    						+'</form>'
    						
    					}//END for Loof
    					
    					result += '<br/>'
   					+'<div class="form-group">'
    					+'<div class="col-xs-offset-2  col-xs-8 text-center">'
    					+'<button type="button" class="btn btn-outlined btn-light btn-sm" id="go">평 &nbsp;가</button>'
    					+'<button type="button" class="btn btn-outlined btn-theme btn-sm" id="cancel">취&nbsp;소</button>'
    					+'</div>'
    					+'</div>'
    					+'<input type="hidden" id="totalCount" value="'+JSONData.length+'">'
			    		+'<input type="hidden" id="hiddenRoomKey" value="'+roomKey+'">'			
	    				 $('#shareWithFriendList').html(result);
	    				 $('#shareWithFriend').modal('show');  
    					}//END success
			    });//END ajax
		 });
  		
  		$(document).on("click","#go",function(){
  			/* alert("aslfjakldfjkjdsf"); */
  			/* alert($("#hiddenRoomKey").val()); */
			for(var i = 0; i< $("#totalCount").val() ; i++){
				
				/* alert( $("#userNo"+i).val() );
				alert( $("input[name=attendanceTnF"+i+"]:checked").val() );
				alert( $("input[name=profileTnF"+i+"]:checked").val() ); */
				$.ajax({
					url: "/schedule/json/addEvalUser/"+$("#hiddenRoomKey").val(),
					method: "POST",
					data : JSON.stringify({
						targetNo : $("#userNo"+i).val(),
						attendanceTnF : $("input[name=attendanceTnF"+i+"]:checked").val(),
						profileTnF : $("input[name=profileTnF"+i+"]:checked").val()
					}),
					async: false,
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status){
						
					}
					
				});//END ajax
			}
			swal("평가가 완료되었습니다!","","success").then((next) => {
				if(next){
					self.location="/schedule/listSchedule";		
				}
			});//end swal
		});//END go Event
  		
  		
  		$("#searchCondition").change(function(){
  			if($("#searchCondition option:selected").val() == 0){
  	  			$("#searchKeyword").attr("type","date");
  	  		}else{
  	  			$("#searchKeyword").attr("type","text");
  	  		}	
  		});
  		
  		$("#search").on("click",function(){
			 
			fncGetScheduleList(1);
		});
  		
  		function fncGetScheduleList(currentPage){
            $("#currentPage").val(currentPage);
            $("#searchForm").attr("method","POST").attr("action","/schedule/listSchedule").submit();
        };
		
		 
	 });
  </script>
  
  <script type="text/javascript">
//infinite scroll
  var page = 1;
	var flag = 0;
	var flag2 = 0;
	var scheduleCount = ${resultPage.totalCount};

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
										url : "/schedule/json/listSchedule",
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
											console.log("SUCCESS");
											var scheduleObject = JSON.parse(JSON.stringify(JSONData));
											console.log(scheduleObject.room.length);
											console.log(scheduleObject.schedule);
											if (flag == 0) {
												/* scheduleCount = scheduleCount- JSONData.length; */
												scheduleCount = scheduleCount- scheduleObject.schedule.length;
												flag = 1;
											}

											/* for (var i = 0; i < JSONData.schedule.length; i++) { */
											for (var i = 0; i < scheduleObject.schedule.length; i++) {
												
												console.log("Hello"+scheduleObject.schedule[i].mapImg);
												/* var displayValue = '<div class="col-sm-3 " style="padding-top : 2%" >'
														+ '<div class="thumbnail" name="getPro" style="height:600px;">'
														if(scheduleObject.schedule[i].mapImg == null){
															displayValue +='<img src="https://i.pinimg.com/236x/90/fa/d5/90fad5ab4057d05ad3f82f4d12aa22da.jpg" alt="..." class="img-rounded">'
														}else{
															displayValue +='<img src="'+scheduleObject.schedule[i].mapImg+'&key=AIzaSyCmTcIdw0uowsiJrs4YNA0lhjLnN8PigjE" class="img-rounded">'
														}
														displayValue += '<div class="caption">'
														+ '<h3> Title :'
														+ scheduleObject.schedule[i].scheduleTitle
														+ '</h3>'
														+ '<p> Date : '
														+ scheduleObject.schedule[i].scheduleDate
														+ '</p>'
														+ '<p> Address : '
														+ scheduleObject.schedule[i].scheduleAddress
														+ '</p>'
														+ '<p> User : '
														+ scheduleObject.schedule[i].userNo
														+ '</p>'
														+ '<p> roomKey : '
														+ scheduleObject.schedule[i].roomKey
														+ '</p>'
														
														if(scheduleObject.room[i].userNo == ${user.userNo} ){
														+'<a href="#" class=" btn btn-default" style="position: absolute;bottom:5%; right:40%">일정 수정<input type="hidden" id="roomKey" value="'+scheduleObject.schedule[i].roomKey+'"></a>'
														}	
														
													 	displayValue += '<p>'
													 	+ '<a href="#" class="btn btn-outlined btn-light" style="position: absolute;bottom:5%; right:10%">유저 평가<input type="hidden" id="roomKey" value="'
													 	+scheduleObject.schedule[i].roomKey
													 	+'"></a></p>'
														+ '</div>' */
														var displayValue='<div class="realContents" >'
											    				+'<div class="col-xs-6" align="center">'
															+'<p class="contents">'
															+'<img src="'+scheduleObject.schedule[i].mapImg+'&key=AIzaSyCmTcIdw0uowsiJrs4YNA0lhjLnN8PigjE" name="mapImg" class="contentsDelete" width="300px" style="border-radius: 99%;"/>'
															+'</p>'
															+'</div>'
															+'<div class="col-xs-6"  style="margin-top:30px ;" align="left">'
															+'<p>&nbsp;</p>'
															+'<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">['+scheduleObject.schedule[i].scheduleTitle+']</p>'
															+'<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">날짜 : ['+scheduleObject.schedule[i].scheduleDate+']</p>'
															+'<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">약속장소 : ['+scheduleObject.schedule[i].scheduleAddress+']</p>'
															+'<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">방제목 : ['+scheduleObject.room[i].roomName+']</p>'
															+'<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">'
															var userNo = ${user.userNo};
															if(userNo == scheduleObject.room[i].userNo){
																displayValue += '<button class="btn-dy3" style="padding-top:6px;padding-bottom:6px;padding-left:10px;padding-right:10px;font-family:\'JEJUGOTHIC\';">일정 수정<input type="hidden" id="roomKey" value="'
																+scheduleObject.room[i].roomKey
																+'"></button>'
															}
															displayValue += '</p>'
															+'<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">'
															+'<button class="btn-dy3" style="padding-top:6px;padding-bottom:6px;padding-left:10px;padding-right:10px;font-family:\'JEJUGOTHIC\';">유저 평가<input type="hidden" id="roomKey" value="'
															+scheduleObject.room[i].roomKey
															+'"></button></p>]'
											    				+'</div>'
											    				+'<div class="col-xs-12"  style="height: 30px" align="center"></div>'
													    
												$('div.row2').append(displayValue);
											}
										}
									});
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
		
.btn-outlined.btn-theme:hover,.btn-outlined.btn-theme:active {
    color: #dedede;
    background: #08708A;
    border-color: #08708A;
}

.btn-outlined.btn-theme {
    background: #dedede;
    color: #08708A;
	border-color: #08708A;
}
.btn-outlined.btn-light:hover,.btn-outlined.btn-light:active {
    color: #dedede;
    background: #D73A31;
    border-color: #D73A31;
}

.btn-outlined.btn-light {
    background: #dedede;
    color: #D73A31;
	border-color: #D73A31;
}

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
  /* background: transparent; */
  background: #D73A31;
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
   	
   	<div class="container" style="background-size:cover; height:200px; width:100%;">
		
		<h2 class="text-center" style="color:#3B3B3B; margin-top:2%;"><strong>나의 일정</strong></h2>
		<h3 class="text-center" style="font-family:'TYPO_JEONGJOL';color:#3B3B3B; margin-top:3%;"><strong>나만의 설렘, 나만의 트위챗</strong></h3>
		<!-- FORM -->
		
		
		<c:if test="${!empty user }">
		<div class="col-sm-12" align="center" style="margin-top:10px;">
           <button id="listRoom" class="btn-dy3" style="padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px;font-family:\'JEJUGOTHIC\';"/>모든 방목록</button>
           <button id="listMyRoom" class="btn-dy3" style="padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px;font-family:\'JEJUGOTHIC\';"/>나의 방목록</button>
        </div>         
		</c:if>
						
	</div>
   	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container contents">
		<div class="col-xs-12 inner" id="thumbnailMainBox">
            <div align="center" class="col-xs-1">&nbsp;</div><!-- 그라디언트 보이게 해주려고 한 부분 -->
            		<div class="col-xs-12 inner" id="thumbnailMainThumbBox" align="center">
               		<div class="col-xs-12" >
	    					<div class="row">
	    						<div class="col-md-12 text-right" style=" background: #ededed; border-radius: 23px;">
              					<h4>나의 방 ${resultPage.totalCount} 개</h4>
          					</div> 
				       </div>
				       
				       <div class="text-center" style="background: rgba(255, 255, 255, 0.3); margin-top:50px;margin-left:10%;margin-right:10%;min-width:300px;">
			<form id="searchForm" role="form" style="padding:10px;">
				
	    			<div class="row">
	    				<div class="col-sm-2" >
						<div class="form-group">
						    <select class="form-control" id="searchCondition" name="searchCondition" style="text-align-last:center;">
		                        <option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>일정</option>
		                        <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>나라</option>
		                        <option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>도시</option>
							</select>
	  					</div>
	 					</div>
	 					
	  				<div class="col-sm-9">
					  <div class="form-group" >
					    <label class="sr-only" for="searchKeyword" >어떤 친구를 만나게 될까요?</label>
					    <input type="date" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
					    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
					  	</div>
					  </div>
					 
		    			
		    			
	    				<div class="col-sm-1" align="center">
	    					<input type="hidden" id="currentPage" name="currentPage" value=""/>
	    				 	<!-- <button class="col-xs-6 btn btn-outlined btn-theme btn-sm" id="search" >검 &nbsp;색</button> -->
	    				 	<button class="btn-dy2" id="search" align="left" style="padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px;font-family:\'JEJUGOTHIC\';"/>SEARCH</button>
	    				</div>	
				</div><!-- End row -->
			</form>
			<!-- FORM -->
		</div>
   	<div class="row2" style="margin-top:30px;">
   	
   	<c:set var="i" value="0" />
		  <c:forEach var="schedule" items="${schedule}" varStatus="status">
			<%-- <!-- <div class="row"> -->
		    <div class="col-sm-3 " style="padding-top : 2%">
		      <div class="thumbnail" name="getPro" style="height:600px;">
		    		<c:if test="${empty schedule.mapImg }">
		    			<img src="https://i.pinimg.com/236x/90/fa/d5/90fad5ab4057d05ad3f82f4d12aa22da.jpg" alt="..." class="img-rounded">
		    		</c:if>
		    		<c:if test="${!empty schedule.mapImg }">
		    			<img src="${schedule.mapImg }&key=AIzaSyCmTcIdw0uowsiJrs4YNA0lhjLnN8PigjE" class="img-rounded">
		    			<!-- &key=AIzaSyCwwqenPL4wZOiFh9Ljfohh2vadO29GeFM -->
		    		</c:if>
		        
		          <div class="caption" style="text-align: center;">
		            <h3>Title : ${schedule.scheduleTitle} </h3>		            
		            <p>Date : ${schedule.scheduleDate}</p>
		            <p>Address : ${schedule.scheduleAddress}</p>
		            <p>User : ${schedule.userNo }</p>
		            <p>roomKey : ${schedule.roomKey }</p>
		            <p>roomTitle : ${room[status.index].roomName }</p>
		            <p>roomKey : ${room[status.index].roomKey}</p>
		            
		            <p>
		            <c:if test="${user.userNo == room[status.index].userNo }">
		            		<a href="#" class=" btn btn-default" style="position: absolute;bottom:5%; right:40%">일정 수정<input type="hidden" id="roomKey" value="${room[status.index].roomKey}"></a>
		            </c:if>
		            </p>
		            <p>
		            		<a href="#" class="btn btn-outlined btn-light" style="position: absolute;bottom:5%; right:10%">유저 평가<input type="hidden" id="roomKey" value="${room[status.index].roomKey}"></a>
		            </p>
		            
		            
		        </div>
		      </div>
		    </div> --%>
			    <div class="realContents" >
			    		<div class="col-xs-6" align="center">
						<p class="contents">
						<img src="${schedule.mapImg}&key=AIzaSyCmTcIdw0uowsiJrs4YNA0lhjLnN8PigjE" name="mapImg" class="contentsDelete" width="300px" style="border-radius: 99%;"/>
						</p>
					</div>
					
					<div class="col-xs-6"  style="margin-top:30px ;" align="left">
						<p>&nbsp;</p>
						<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">[${schedule.scheduleTitle}]</p>
						<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">날짜 : [${schedule.scheduleDate}]</p>
						<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">약속장소 : [${schedule.scheduleAddress}]</p>
						<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">방제목 : [${room[status.index].roomName }]</p>
						<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">
		            		<c:if test="${user.userNo == room[status.index].userNo }">
		            		<!-- <a href="#" class=" btn btn-default" > --><button class="btn-dy3" style="padding-top:6px;padding-bottom:6px;padding-left:10px;padding-right:10px;font-family:\'JEJUGOTHIC\';">일정 수정<input type="hidden" id="roomKey" value="${room[status.index].roomKey}"></button><!-- </a> -->
		            		</c:if>
		            		</p>
		          	    <p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">
		            		<!-- <a href="#" class="btn btn-outlined btn-light" > --><button class="btn-dy3" style="padding-top:6px;padding-bottom:6px;padding-left:10px;padding-right:10px;font-family:\'JEJUGOTHIC\';">유저 평가<input type="hidden" id="roomKey" value="${room[status.index].roomKey}"></button><!-- </a> -->
		            		</p>
					</div>
					<div class="col-xs-12"  style="height: 30px" align="center"></div>
			    </div>
		    
		    </c:forEach>
		    </div>
	    </div>
 	<!--  화면구성 div End /////////////////////////////////////-->

</body>
<!---------- ShareWithFriend Dialog <START>------------->

		<div class="modal fade" id="shareWithFriend" role="dialog" style="font-family: 'Jeju Gothic', serif;">
			<div class="modal-dialog modal-md">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="background-image: url('/resources/images/dailyPlanContent/friendsShare.jpg');">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" align="center" style="font-family: 'TYPO_JEONGJOL';margin-top:50px; margin-bottom:50px; color:#ffffff;">
							<Strong>나의 플랜 북을 친구들과 공유할까요?</Strong>
						</h4>
					</div>
					<div class="modal-body col-sm-12" align="center" style="padding-top: 10px;">
							<!-- <table class="table table-filter" style="align-content: center;">
								<tbody>
										<tr data-status="pagado">
										<div class="media-body">
										  <td align="left" vailgn="middle"> -->
											  <!-- <div class="row" > -->
											  	<div id="shareWithFriendList"></div>
											  <!-- </div> -->
									<!-- 	 	 </td>
										  </div>
										</tr>
								</tbody>
							</table> -->
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<!---------- ShareWithFriend Dialog <END>------------->
</html>