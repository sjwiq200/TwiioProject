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
		 
		 $("a:contains('친구초대')").on("click",function(){
			 
			 var userNo = $(this).html().split('value="')[1].split('"')[0];
			 var roomKey = $("#roomKey").val(); 
			 
			 $.ajax({
				 url : "/room/json/addRoomFriend/",
				 method : "POST",
				 data : {
					 userNo : userNo,
					 roomKey : roomKey
				 },
				 dataType : "json",
				 headders : {
					 "Accept" : "application/json",
					"Content-Type" : "application/json"
				 },
				 success : function(JSONData, status){
					if(JSONData == true){
						alert("success");
					}
					 
				 }
			 })
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
	       <h3>친구 목록</h3>
	    </div>
		    
		    <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
          	<th align="center">No</th>
            <th align="left">Friend No</th>
            <th align="left" >Friend Name</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <input id="roomKey" type="hidden" value="${roomKey }">
		  <c:forEach var="friend" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : 회원정보 확인">${friend.userNo}</td>
			  <td align="left">${friend.userName}</td>
			  <td align="left">
			  	<a href="#">
		            친구초대
		            <input type="hidden" id="userNo" value="${friend.userNo}">
	            </a>
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
        
        
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>