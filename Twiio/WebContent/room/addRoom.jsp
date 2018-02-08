<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
	
	
	<!-- Material Design Theming -->
	  <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.orange-indigo.min.css">
	  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	  <script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
	
	<!--  ///////////////////////// add,updateRoom.css ////////////////////////// -->
	<link href="/resources/css/add,updateRoom.css" rel="stylesheet" type="text/css"/>
	
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			$( "input[type='button']" ).on("click" , function() {
				var roomName = $("#roomName").val();
				var country = $("#country").val();
				var city = $("#city").val();
				if(roomName == '' || country =='' || city ==''){
					alert("필수요소를 입력하세요!!!!");
				}else{
					$("form").attr("method" , "POST").attr("action" , "/room/addRoom").submit();	
				}
				
				
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		//============= autocomplete ========================
			
		$(function() {
			
			$( "#country" ).autocomplete({
			      source: function( request, response ) {
			    	  $.ajax(
			    				{
			    					url:"/information/json/countryAutoComplete/",
			    					method:"POST",	    					
			    					data:{	    						
			    						keyword:$("#country").val()		    						
			    						},
			    					dataType:"json",
			    					success:function(JSONData){
			    						response($.map(JSONData, function (item) {
			    							return item;
			    				        }));
			    					}
			    				}
			    			);
			      },
			      minLength:3
			    });
			
			
			$( "#city" ).autocomplete({
			      source: function( request, response ) {
			    	  $.ajax(
			    				{
			    					url:"/information/json/cityAutoComplete/",
			    					method:"POST",	    					
			    					data:{	    						
			    						keyword:$("#city").val()		    						
			    						},
			    					dataType:"json",
			    					success:function(JSONData){
			    						response($.map(JSONData, function (item) {
			    							return item;
			    				        }));
			    					}
			    				}
			    			);
			      },
			      minLength:3
			    });
	
		})
	</script>		
    
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<div class="jumbotron">	
	
		<!-- <h1 class="bg-primary text-center">채팅방 생성 </h1> -->
		<h2 align="center"><ins><strong>TwiiChat Create</strong></ins></h2>
		<div class="panel-body">
			<div class="row">
				<div class="col-md-12">
					<div class="col-sm-10 col-sm-offset-1">
						<form class="form-horizontal">
						  <div class="form-group">
						    <label for="roomname" class="col-sm-offset-1 col-sm-3 control-label" >*채팅방 이름 </label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="roomName" name="roomName" placeholder="채팅방 이름 ">
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="country" class="col-sm-offset-1 col-sm-3 control-label"> *국가명</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="country" name="country" value="">
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="city" class="col-sm-offset-1 col-sm-3 control-label"> *도시명 </label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="city" name="city" value="">
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="type" class="col-sm-offset-1 col-sm-3 control-label"> 말머리 </label>
						    <div class="col-sm-4" >
						      <select id="type" name="type">
						      	<option value="식사" selected="selected">식사</option>
						      	<option value="체험">체험</option>
						      	<option value="관람">관람</option>
						      	<option value="미정">미정</option>
						      	
						      </select>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="region" class="col-sm-offset-1 col-sm-3 control-label"> 지역 </label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="region" name="region" value="">
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="headCount" class="col-sm-offset-1 col-sm-3 control-label"> 인원 </label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="headCount" name="headCount" value="">
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="date" class="col-sm-offset-1 col-sm-3 control-label"> 날짜 </label>
						    <div class="col-sm-4">
						      <input type="date" class="form-control" id="date" name="date" value="">
						    </div>
						  </div>
						  
						  
						  
						  <div class="form-group">
						    <div class="col-sm-offset-4  col-sm-4 text-center">
						      <input type="button" class="btn btn-outlined btn-light btn-sm"  value="생 성">
							  <a class="btn btn-outlined btn-theme btn-sm" href="#" role="button">취&nbsp;소</a>
						    </div>
						  </div>
						</form>
						<!-- form Start /////////////////////////////////////-->
					</div>
				</div>
			</div>
		</div>
		<!-- form Start /////////////////////////////////////-->
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>