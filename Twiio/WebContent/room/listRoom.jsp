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
  <script>
  	$(function() {
		 
		 $( "button.btn.btn-default:contains('방생성')" ).on("click" , function() {
			 $("form").attr("method" , "GET").attr("action" , "/room/addRoom").submit();
		});
		 
		 $("a:contains('참가')").on("click",function(){
			 
			 var roomKey = $(this).html().split('value="')[1].split('"')[0];
			 
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
		
			 /* window.open("http://218.156.17.126:8282/#/"+roomKey+"/${user.userId}/${user.userNo}",'Chat','location=no,menubar=no,resizable=no,status=no,right=0'); */
			  /* window.open("http://192.168.0.29:8282/#/"+roomKey+"/${user.userId}/${user.userNo}",'Chat','location=no,menubar=no,resizable=no,status=no,right=0'); */
			   window.open("http://localhost:8282/#/"+roomKey+"/${user.userId}/${user.userNo}",'Chat','location=no,menubar=no,resizable=no,status=no,right=0'); 
		 })
		 
	 });
  </script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	
	
</head>
<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>메신저 방목록 조회 </h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
				  <button type="button" class="btn btn-default">방생성</button>
				</form>
	    		</div>
	    	
		</div>
          
          <c:set var="i" value="0" />
		  <c:forEach var="room" items="${list}">
			<!-- <div class="row"> -->
		    <div class="col-sm-3 " >
		      <div class="thumbnail" name="getPro" style="height:500px;">
		    
		        <img src="https://i.pinimg.com/236x/90/fa/d5/90fad5ab4057d05ad3f82f4d12aa22da.jpg" alt="..." class="img-rounded">
		          <div class="caption">
		            <h3>${room.roomName} </h3>		            
		            <p>Date : ${room.date}</p>
		            <p>country : ${room.country}</p>
		            <p>city : ${room.city}</p>
		            <p>${room.headCount}명</p>
		            <c:if test="${!empty user}">
			            <a href="#">
			            참가
			            <input type="hidden" id="roomKey" value="${room.roomKey}">
			            </a>
		            </c:if>
		            
		        </div>
		      </div>
		    </div>
		    </c:forEach>
        
        
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>