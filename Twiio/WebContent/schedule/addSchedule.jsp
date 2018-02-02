<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		 $(function() {		
			$( "button.btn.btn-primary" ).on("click" , function() {
				
				$.ajax(
    					{
    						url : "/schedule/json/addSchedule/",
    						method : "POST",
    						data : JSON.stringify({
    							roomKey : $("#roomKey").val(),
    							scheduleTitle : $("#scheduleTitle").val(),
    							scheduleDate : $("#scheduleDate").val(),
    							scheduleAddress : $("#scheduleAddress").val()
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
    					}		
    				)
			
			});
			
			
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				/* $("form")[0].reset(); */
				window.close();
			});
		});	
	

	</script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">일정 등록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<div class="form-group">
			<input type="hidden" id="roomKey" name="roomKey" value="${roomKey}">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">일정 제목 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="scheduleTitle" name="scheduleTitle" value="">
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">일정 날짜 </label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="scheduleDate" name="scheduleDate" value="">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">일정 위치 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="scheduleAddress" name="scheduleAddress" value="">
		    </div>
		  </div>
		  
		
		  
		  
		  
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >확 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>