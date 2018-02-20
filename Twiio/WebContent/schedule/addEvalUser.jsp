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
	<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAMEXsdx-RuPFYaZ-ygp2Z_rlq75XG-w1s&libraries=places"></script> -->
	
	<!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	

	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

		$(function() {
			$("#go").on("click",function(){
				for(var i = 0; i< ${totalCount}; i++){
					
					/* alert( $("#userNo"+i).val() );
					alert( $("input[name=attendanceTnF"+i+"]:checked").val() );
					alert( $("input[name=profileTnF"+i+"]:checked").val() ); */
					$.ajax({
						url: "/schedule/json/addEvalUser/${roomKey}",
						method: "POST",
						data : JSON.stringify({
							targetNo : $("#userNo"+i).val(),
							attendanceTnF : $("input[name=attendanceTnF"+i+"]:checked").val(),
							profileTnF : $("input[name=profileTnF"+i+"]:checked").val()
						}),
						async: false,
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status){
							
						}
						
					});
				}
				swal("평가가 완료되었습니다!","","success").then((next) => {
					if(next){
						self.location="/schedule/listSchedule";		
					}
				});//end swal
			});
			
		});
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#cancel").on("click" , function() {
				history.go(-1);
				
			});
		});	

	</script>
		
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
    
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />




	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	

	<div class="jumbotron" id="mainJum" style="font-family: 'Noto Sans KR', sans-serif !important; color :#000000; ">
	
		<h2 class="text-center" id="titleRoom">유저 평가 </h2>
		<%-- <input type="hidden" id="roomKey" value="${roomKey }"> --%>
		

		<!-- form Start /////////////////////////////////////-->

		
		<c:set var="i" value="-1" />
		<c:forEach var="userEval" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		
		<form class="form-horizontal" id="user${i}" style="padding-top: 20px;">
		
		<div class="col-xs-18">	
		
		<div class="form-group">
			<input type="hidden" id="userNo${i}" name = "userNo${i}" value="${userEval.userNo }">		  	
		    <label for="userName" class="col-xs-offset-1 col-xs-3 control-label">*유저 이름 </label>
		    <div class="col-xs-4">
		      <input type="text" class="form-control" id="userName${i}" name="userName${i}" value="${userEval.userName }" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		  	<label for="attendanceTnF${i}" class="col-xs-offset-1 col-xs-3 control-label" >참석 여부 </label>
		  	<div class ="col-xs-4" style="text-align:center">
		        		<label for="attendanceTnF${i}" class="chk_radio on">참석&nbsp;&nbsp;<input type="radio" name="attendanceTnF${i}"    checked="checked" value="1" /></label>
		        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label for="attendanceTnF${i}" class="chk_radio ">불참석&nbsp;&nbsp;<input type="radio" name="attendanceTnF${i}"  value="0" /></label>
		  	</div>
		</div>
		
		<div class="form-group">
		  	<label for="profileTnF${i}" class="col-xs-offset-1 col-xs-3 control-label">프로필 진위 여부 </label>
		  	<div class ="col-xs-4" style="text-align:center">
		        		<label for="profileTnF${i}" class="chk_radio on">일치&nbsp;&nbsp;<input type="radio" name="profileTnF${i}"    checked="checked" value="1" /></label>
		        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label for="profileTnF${i}" class="chk_radio ">불일치&nbsp;&nbsp;<input type="radio" name="profileTnF${i}"  value="0" /></label>
		  	</div>
		</div>
		
		</div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
		</c:forEach>
		
		  <!-- <div class="form-group">
			<input type="hidden" id="userNo" name = "userNo" value="">		  	
		    <label for="userName" class="col-xs-offset-1 col-xs-3 control-label">*유저 이름 </label>
		    <div class="col-xs-4">
		      <input type="text" class="form-control" id="userName" name="userName" value="" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		  	<label for="attendanceTnF" class="col-xs-offset-1 col-xs-3 control-label" >참석 여부 </label>
		  	<div class ="col-xs-4" style="text-align:center">
		        		<label for="attendanceTnF" class="chk_radio on">참석&nbsp;&nbsp;<input type="radio" name="attendanceTnF"    checked="checked" value="true" /></label>
		        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label for="attendanceTnF" class="chk_radio ">불참석&nbsp;&nbsp;<input type="radio" name="attendanceTnF"  value="false" /></label>
		  	</div>
		</div>
		
		<div class="form-group">
		  	<label for="profileTnF" class="col-xs-offset-1 col-xs-3 control-label">프로필 진위 여부 </label>
		  	<div class ="col-xs-4" style="text-align:center">
		        		<label for="profileTnF" class="chk_radio on">일치&nbsp;&nbsp;<input type="radio" name="profileTnF"    checked="checked" value="true" /></label>
		        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label for="profileTnF" class="chk_radio ">불일치&nbsp;&nbsp;<input type="radio" name="profileTnF"  value="false" /></label>
		  	</div>
		</div> -->
	
		  
		  <br/>
		  
		  <div class="form-group">
		    <div class="col-xs-offset-4  col-xs-4 text-center">
		      <button type="button" class="btn btn-outlined btn-light btn-sm" id="go">평 &nbsp;가</button>
			   <button type="button" class="btn btn-outlined btn-theme btn-sm" id="cancel">취&nbsp;소</button>
		    </div>
		  </div>
		  
		  
		  
		
		
		</div>

 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>