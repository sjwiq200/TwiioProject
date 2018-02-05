<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- jQuery UI toolTip 사용 CSS-->

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	
	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/chart/Chart.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			$( "button.btn.btn-primary" ).on("click" , function() {
				$.ajax({
					url : "/room/json/addReport",
					method : "POST",
					dataType : "json",
					 headders : {
						 "Accept" : "application/json",
						"Content-Type" : "application/json"
					 },
					 success : function(JSONData, status){
						 alert(JSONData);
					 }
					
				});
				$("form").attr("method" , "POST").attr("action" , "/room/addRoom").submit();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		

	</script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/main.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">채팅방 신고하기 </h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			
			<div class="form-group">
				<label for="roomname" class="col-sm-offset-1 col-sm-3 control-label">신고 유형</label>
				<div class="col-sm-4">
					<select id="reportType">
						<option value="0" selected="selected">채팅방 신고</option>
						<c:forEach var="user" items="${list}">
							<option value="${user.userNo }">${user.userName }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
		  <input type="hidden" id="roomKey" name="roomKey" value="${roomKey }">
		  
		  <div class="form-group">
		    <label for="reportTitle" class="col-sm-offset-1 col-sm-3 control-label">신고 제목</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="reportTitle" name="reportTitle" placeholder="채팅방 이름 ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="reportContent" class="col-sm-offset-1 col-sm-3 control-label"> 신고 내용</label>
		    <div class="col-sm-4">
		      <!-- <input type="" class="form-control" id="country" name="country" value=""> -->
		      <textarea class="form-control" id="reportContent" name="reportContent" rows="3"></textarea>
		    </div>
		  </div>
		 
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >생 &nbsp;성</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>