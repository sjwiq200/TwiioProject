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
	
	<!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<link rel="stylesheet" href="/resources/css/imformation.css" />
	
	<style>
       body {
            
            padding-top : 30px;
            background-color: #f4f4f4;
			color: #666666;
			font-family: "Source Sans Pro", Helvetica, sans-serif;
			
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
			$( "button#go" ).on("click" , function() {
				if($("#reportContent").val() ==''){
					swal("내용을 기입해주세요!","","warning");
				}else{
					swal("신고가 완료되었습니다!","","success").then((next) => {
						if(next){
							$.ajax({
								url : "/room/json/addReport/",
								method : "POST",
								data : JSON.stringify({
									targetUserNo : $("#targetUserNo option:selected").val(),
									targetRoomKey : $("#roomKey").val(),
									reportTitle : $("#reportTitle").val(),
									reportContent : $("#reportContent").val()
								}),
								dataType : "json",
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData, status){
									if(status == 'success'){
										window.close();
									}
								}
								
							});//end ajax
						}
					});//end swal
					
				}
				
				
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			$("#cancel").on("click" , function() {
				window.close();
			});
		});	
		

	</script>		
    
</head>

<body>


	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<div class="jumbotron" id="mainJum" style="font-family: 'Noto Sans KR', sans-serif !important; color :#000000; ">	
		
				
					<h2 class="text-center" id="titleRoom">채팅방 신고하기 </h2>
					
					<!-- form Start /////////////////////////////////////-->
					<form class="form-horizontal"  style="padding-top: 20px;">
					
					<div class="col-xs-18">	
						<div class="form-group" >
							<label for="roomname" class="col-xs-offset-1 col-xs-3 control-label">신고 유형</label>
							<div class="col-xs-6">
								<select  class="form-control" id="targetUserNo">
									<c:forEach var="user" items="${list}">
										<option value="${user.userNo }">${user.userName }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
					  <input type="hidden" id="roomKey" name="roomKey" value="${roomKey }">
					  
					  <div class="form-group">
					    <label for="reportTitle" class="col-xs-offset-1 col-xs-3 control-label">신고 제목</label>
					    <div class="col-xs-6">
					      <input type="text" class="form-control" id="reportTitle" name="reportTitle" placeholder="채팅방 이름 ">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="reportContent" class="col-xs-offset-1 col-xs-3 control-label"> 신고 내용</label>
					    <div class="col-xs-6">
					      <!-- <input type="" class="form-control" id="country" name="country" value=""> -->
					      <textarea class="form-control" id="reportContent" name="reportContent" rows="3"></textarea>
					    </div>
					  </div>
					 
					 <br/>
					  <div class="form-group">
					    <div class="col-xs-offset-3  col-xs-6 text-center">
					      <button type="button" class="btn btn-outlined btn-light btn-sm" id="go">보&nbsp;내&nbsp;기</button>
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