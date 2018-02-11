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
		    
		    
	    	
		</div>
   	
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
		            		<a href="#" class=" btn btn-default">일정 수정<input type="hidden" id="roomKey" value="${room[status.index].roomKey}"></a>
		            </c:if>
		            </p>
		            
		            
		        </div>
		      </div>
		    </div>
		    </c:forEach>
		    
		    </div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	

</body>
</html>