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
				$("form").attr("method" , "POST").attr("action" , "/room/addRoom").submit();
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

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/main.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">채팅방 생성 </h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="roomname" class="col-sm-offset-1 col-sm-3 control-label">채팅방 이름 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="roomName" name="roomName" placeholder="채팅방 이름 ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="country" class="col-sm-offset-1 col-sm-3 control-label"> 국가명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="country" name="country" value="">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="city" class="col-sm-offset-1 col-sm-3 control-label"> 도시명 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="city" name="city" value="">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="type" class="col-sm-offset-1 col-sm-3 control-label"> 말머리 </label>
		    <div class="col-sm-4" id="type">
		      <select>
		      	<option value="식사" select="selected">식사</option>
		      	<option value="체험 ">체험</option>
		      	<option value="관람 ">관람</option>
		      	<option value="미정 ">미정</option>
		      	
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
		      <input type="date" class="form-control" id="date" name="date" val="">
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