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
	
	
	<link rel="stylesheet" href="/resources/css/font.css" />
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		input {
		text-align : center
		}
       
        .profile-userpic img {
		  float: none;
		  margin: 0 auto;
		  width: 80%;
		  height: 80%;
		  -webkit-border-radius: 50% !important;
		  -moz-border-radius: 50% !important;
		  border-radius: 50% !important;
		  border: 3px solid;
		}
	    .file_input{
		    position:absolute;
		    cursor:pointer;
		    display:inline-block;
		    vertical-align:middle;
		    overflow:hidden;
		    width:32px;
		    height:32px;
		    background-image:url('/resources/images/icon.png');
		    text-align:center;
		    line-height:30px;
		    left : 625px;
		    top: 120px;
		}
		.file_input input {
		    position:absolute;
		    width:0;
		    height:0;
		    overflow:hidden;
		}
		hr{
			color: #595959;
		}

		 body {
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
	
		//============= Update  Event =============
		 $(function() {
			$( "#go" ).on("click" , function() {
				if(${user.userNo}== $("#userNo").val()){
					alert('자기 자신 입니다.')
				}else{
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
						}//end success
					});//end ajax	
				}//end else
				
			});
			
			$("#cancel").on("click",function(){
				window.close();
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


	<div class="container">
		<div class="jumbotron">
			<div class="jumbotron" id="mainJum" style="font-family: 'Noto Sans KR', sans-serif !important; color :#000000; ">
	
			<h2 class="text-center" id="titleRoom">프로필 보기</h2>
	
			<div class="panel-body">
				<div class="row">
					<div class="col-md-12">
						<div class="col-sm-10 col-sm-offset-1">
							<!-- form Start /////////////////////////////////////-->
							<form class="form-horizontal">
							
							<input type="hidden" id="userNo" name="userNo" value="${profile.userNo }">
							
							<div class="col-sm-12">
								<div class="profile-userpic ">
									<c:if test="${empty profile.userImage}"><img style="width:150px; height:150px; alt="" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" class="img-responsive"></c:if>
									<c:if test="${!empty profile.userImage}"><img style="width:150px; height:150px; alt="" src="/resources/images/userThumbnail/${user.userImage}" class="img-responsive"></c:if>
								</div>
							</div>
							</br>
							
							<div class="form-group">
							    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름  </label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="userName" name="userName" value="${profile.userName }" readonly>
							    </div>
							  </div>
							
							  <div class="form-group">
							    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">이 메 일</label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="email" name="email" value="${profile.email}" readonly>
							    </div>
							  </div>
							  
							  <div class="form-group">
							  	<label for="userBirthday" class="col-sm-offset-1 col-sm-3 control-label">생년월일 </label>
								<div class="col-sm-4">
							      <input type="text" class="form-control" id="userBirthday" name="userBirthday" value="${profile.userBirthday}" readonly>
							    </div>
							  </div>
							  
							  <div class="form-group">
							  	<label for="userType" class="col-sm-offset-1 col-sm-3 control-label">유 형 </label>
								<div class="col-sm-4">
								<c:if test="${profile.userType == 1}">
								<input type="text" class="form-control" id="userType" name="userType" value="회원" readonly>
								</c:if>
								<c:if test="${profile.userType == 2}">
								<input type="text" class="form-control" id="userType" name="userType" value="호스트" readonly>
								</c:if>
								<c:if test="${profile.userType == 3}">
								<input type="text" class="form-control" id="userType" name="userType" value="관리자" readonly>
								</c:if>
							      
							    </div>
							  </div>
							  
							  <div class="form-group">
							  	<label for="userEval" class="col-sm-offset-1 col-sm-3 control-label">평 점(참석/프로필)</label>
								<div class="col-sm-4">
							      <input type="text" class="form-control" id="userEval" name="userEval" value="${empty profile.userEval?0:profile.userEval} | ${empty profile.userEvalCredit?0:profile.userEvalCredit}" readonly>
							    </div>
							  </div>
							  
							  <div class="form-group">
							    <div class="col-sm-offset-4  col-sm-4 text-center">
							    	<c:if test="${!flag }">
							      <button type="button" class="btn btn-outlined btn-light btn-sm" id ="go"  >친구추가</button>
						      	</c:if>
								  <a class="btn btn-outlined btn-light btn-sm" href="#" role="button" id="cancel">취&nbsp;소</a>
							    </div>
							    
							  </div>
							
							</form>
						</div>
					</div>
				</div>
			</div>
 		</div>
	<!--  화면구성 div end /////////////////////////////////////-->


	
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>