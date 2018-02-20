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
  <!—  구글  —>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</script>
  <script>
  	$(function() {
  		
  		$("a:contains('일정 수정')").on("click",function(){
			 var roomKey = $(this).html().split('value="')[1].split('"')[0];
			 self.location = "/schedule/updateSchedule/"+roomKey;
		 });
  		
  		$("a:contains('유저 평가')").on("click",function(){
  			var roomKey = $(this).html().split('value="')[1].split('"')[0];
  			self.location = "/schedule/addEvalUser/"+roomKey
		 });
		 
		 
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
												var displayValue = '<div class="col-sm-3 " style="padding-top : 2%" >'
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
														+ '</div>'
														console.log("manner makes man ==>" + displayValue);
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
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	
	
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<div class="container">
	
		<div class="page-header text-info">
	       <h3> 일정 목록 조회 </h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${totalCount } 건수
		    	</p>
		    </div>
		    
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
   	<div class="row2">
   	
   	<c:set var="i" value="0" />
		  <c:forEach var="schedule" items="${schedule}" varStatus="status">
			<!-- <div class="row"> -->
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
		    </div>
		    </c:forEach>
		    </div>
	    </div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	

</body>
</html>