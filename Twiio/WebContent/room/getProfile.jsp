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
	
		//============= Update  Event =============
		 $(function() {
			$( "button.btn.btn-primary" ).on("click" , function() {
				alert("ok");
				$.ajax({
					url : "/common/json/addFriend",
					method:"POST",
					data : JSON.stringify({
						userNo : ${user.userNo},
						friendNo : $("#userNo").val()
					}),
					dataType : "json",
					headers :{
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status){
						
						console.log(status);
						if(status == 'success'){
							window.close();
						}
					}
					
				});
				
			});
		});	
		
		
		//============= Cancel  Event =============
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				console.log("cancel button");
				window.close();
			});
		});
		
	</script>		
    
</head>

<body>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">프로필 보기 </h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
			<input type="hidden" id="userNo" name="userNo" value="${profile.userNo }">
		
		  <div class="form-group">
		    <label for="roomname" class="col-sm-offset-1 col-sm-3 control-label">이름 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" value="${profile.userName }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="roomname" class="col-sm-offset-1 col-sm-3 control-label">아이디 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${profile.userId }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    	<c:if test="${!flag }">
		      <button type="button" class="btn btn-primary"  >친구추가</button>
	      	</c:if>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>