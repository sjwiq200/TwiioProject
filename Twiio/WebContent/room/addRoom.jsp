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
	
	
	<!-- jQuery UI toolTip 사용 CSS-->

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	
	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/chart/Chart.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<link rel="stylesheet" href="/resources/css/imformation.css" />
	
	<style>
        body {
            padding-top : 100px;
            background-color: #f4f4f4;
			color: #666666;
			font-family: "Source Sans Pro", Helvetica, sans-serif;
			background-image: url("/resources/images/main_img.jpg");
    		background-size: cover;
        }
        
        .jumbotron
			{
				background-color: rgba(255, 255, 255, 0.7);
				padding-left : 30px;
				padding-right : 30px;
				padding-top : 20px !important;
			}
		h2{
				color : #FFF; 
				font-family: 'Jeju Gothic', serif !important; 
				font-size: 3em !important; 
				text-shadow: 0 5px 5px rgba(0, 0, 0, .1) !important;
				padding-top : 20px !important; 
				padding-bottom : 10px !important; 
		
		} 
		#titleRoom{
		
			background-color: rgba(215, 58, 49, 0.8);
		}
		 .btn-sm{
				font-size:13px;
				line-height:16px;
				border: 2px solid;
				width: 100px;
				text-align: center;
			}
			
			.btn {
				letter-spacing: 1px;
				text-decoration: none;
				background: none;
			    -moz-user-select: none;
			    background-image: none;
			    border: 1px solid transparent;
			    border-radius: 0;
			    cursor: pointer;
			    display: inline-block;
			    margin-bottom: 0;
			    vertical-align: middle;
			    white-space: nowrap;
				line-height:20px;
				font-weight:700;
				text-transform:uppercase;
				border: 3px solid;
				padding:8px 20px;
			}
			
			.btn-outlined.btn-theme:hover,
			.btn-outlined.btn-theme:active {
			    color: #FFF;
			    background: #08708A;
			    border-color: #08708A;
			}
			
			.btn-outlined.btn-theme {
			    background: rgba(255, 255, 255, 0.5);
			    color: #08708A;
				border-color: #08708A;
			}
			.btn-outlined.btn-light:hover,
			.btn-outlined.btn-light:active {
			    color: #f4f4f4;
			    background: #D73A31;
			    border-color: #D73A31;
			}
			
			.btn-outlined.btn-light {
			    background: rgba(255, 255, 255, 0.5);
			    color: #D73A31;
				border-color: #D73A31;
			}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			$( "button#go"  ).on("click" , function() {
				$("form").attr("method" , "POST").attr("action" , "/room/addRoom").submit();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			$("#cancel").on("click" , function() {
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


	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<div class="jumbotron" id="mainJum" style="font-family: 'Noto Sans KR', sans-serif !important; color :#000000; ">
	
		<h2 class="text-center" id="titleRoom">채팅방 만들기 </h2>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" style="padding-top: 20px;">
		
		<div class="col-xs-18">	
		
		  <div class="form-group">
		    <label for="roomname" class="col-xs-offset-1 col-xs-3 control-label">채팅방 이름 </label>
		    <div class="col-xs-4">
		      <input type="text" class="form-control" id="roomName" name="roomName" placeholder="채팅방 이름 ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="country" class="col-xs-offset-1 col-xs-3 control-label"> 국가명</label>
		    <div class="col-xs-4">
		      <input type="text" class="form-control" id="country" name="country" value="">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="city" class="col-xs-offset-1 col-xs-3 control-label"> 도시명 </label>
		    <div class="col-xs-4">
		      <input type="text" class="form-control" id="city" name="city" value="">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="type" class="col-xs-offset-1 col-xs-3 control-label"> 말머리 </label>
		    <div class="col-xs-4" >
		      <select class="form-control" id="type" name="type">
		      	<option value="식사" selected="selected">식사</option>
		      	<option value="체험">체험</option>
		      	<option value="관람">관람</option>
		      	<option value="미정">미정</option>
		      	
		      </select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="region" class="col-xs-offset-1 col-xs-3 control-label"> 지역 </label>
		    <div class="col-xs-4">
		      <input type="text" class="form-control" id="region" name="region" value="">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="headCount" class="col-xs-offset-1 col-xs-3 control-label"> 인원 </label>
		    <div class="col-xs-4">
		      <input type="text" class="form-control" id="headCount" name="headCount" value="">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="date" class="col-xs-offset-1 col-xs-3 control-label"> 날짜 </label>
		    <div class="col-xs-4">
		      <input type="date" class="form-control" id="date" name="date" value="">
		    </div>
		  </div>
		  
		  <br/>
		  
		  <div class="form-group">
		    <div class="col-xs-offset-4  col-xs-4 text-center">
		      <button type="button" class="btn btn-outlined btn-light btn-sm" id="go">생 &nbsp;성</button>
			   <button type="button" class="btn btn-outlined btn-theme btn-sm" id="cancel">취&nbsp;소</button>
		    </div>
		  </div>
		  
		  
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
		
		</div>
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>