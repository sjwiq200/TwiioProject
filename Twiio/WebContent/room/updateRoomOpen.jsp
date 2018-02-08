<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


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
    						url : "/room/json/updateRoomOpen/",
    						method : "POST",
    						data : JSON.stringify({
    							roomKey : $("#roomKey").val(),
    							open : $("input:radio[name='open']:checked").val()
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
			$("a[href='#' ]").on("click" , function() {
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
		    <label for="open" class="col-sm-offset-1 col-sm-3 control-label">공개설정여부</label>
		    <div class="col-sm-4">
		      <input type="radio" class="form-control" name="open" value="true" checked="checked">공개 
		      <input type="radio" class="form-control" name="open" value="false">비공개 
		    </div>
		  </div>
		
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >확 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>