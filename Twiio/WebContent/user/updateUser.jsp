<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<!-- Material Design Theming -->
	  <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.orange-indigo.min.css">
	  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	  <script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
	  
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	 <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
	
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
            background-color: #f4f4f4;
			color: #666666;
			font-family: "Source Sans Pro", Helvetica, sans-serif;
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
		.btn-sm{
				font-size:12px;
				line-height:16px;
				border: 2px solid;
				padding:8px 15px;
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
				font-size:14px;
				line-height:20px;
				font-weight:700;
				text-transform:uppercase;
				border: 3px solid;
				padding:8px 20px;
			}
			
			.btn-outlined.btn-theme:hover,
			.btn-outlined.btn-theme:active {
			    color: #f4f4f4;
			    background: #08708A;
			    border-color: #08708A;
			}
			
			.btn-outlined.btn-theme {
			    background: #f4f4f4;
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
			    background: #f4f4f4;
			    color: #D73A31;
				border-color: #D73A31;
			}
			
			.btn-xs{
				font-size:11px;
				line-height:14px;
				border: 1px solid;
				padding:5px 10px;
			}

	        
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
	
	//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#cancel").on("click" , function() {
				$("form")[0].reset();
			});
		});
	
	
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 /* $( "#updateUser" ).on("click" , function() {
					//self.location = "/user/updateUser?userId=${user.userId}"
				 $("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();		
					
				}); */
			
			
				
				 
		 		$("#password2").on("keyup",function(){
	            	checkPwd();
	            });           
	            
	            $("#userName").on("click" , function() {
	            	$("#userName").css("background-color", "#fff");					 
				});
	            
	            $("#email").on("click" , function() {
	            	$("#email").css("background-color", "#fff");
				});
	            
	            $("#password").on("click" , function() {
	            	$("#password").css("background-color", "#fff");
				});
			
			
			
			
		});
		
		
		//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
			function checkPwd() {
				var inputed = $("#password").val();
				var reinputed = $("#password2").val();
				if (reinputed == ""
						&& (inputed != reinputed || inputed == reinputed)) {
					//$("button.btn.btn-primary").prop("disabled", true);
					//$("button.btn.btn-primary").css("background-color", "#aaaaaa");
					$("#password2").css("background-color", "#FFCECE");
				} else if (inputed == reinputed) {
					$("#password2").css("background-color", "#B0F6AC");
					$("#helpBlock").hide();
					//pwdCheck = 1;
					//if (idCheck == 1 && pwdCheck == 1) {
						//$("button.btn.btn-primary").prop("disabled", false);
						//$("button.btn.btn-primary").css("background-color", "#4CAF50");
						//signupCheck();
					//}
				} else if (inputed != reinputed) {
					//pwdCheck = 0;
					//$("button.btn.btn-primary").prop("disabled", true);
					//$("button.btn.btn-primary").css("background-color", "#aaaaaa");
					$("#password2").css("background-color", "#FFCECE");

				}
			}
		
		
		///////////////////호스트 등록////////////////////////////
			$(function() {
				 $("#addHost").on("click" , function() {
					alert("호스트");
			    	$("#addHostModal").modal("show");
					 
				  });
			 });
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<input type="hidden"  id="emailAuth" name="emailAuth" />
		<input type="hidden"  id="tempNum" name="tempNum" />
	
		<div class="page-header">
	       <h3 class=" text-info">회원 정보 수정</h3>
	    </div>
	    
	<form id="updateUserForm">		
		<div class="col-sm-12">
			
			<div class="profile-userpic ">
						<c:if test="${empty user.userImage}"><img style="width:150px; height:150px; alt="" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" class="img-responsive"></c:if>
						<c:if test="${!empty user.userImage}"><img style="width:150px; height:150px; alt="" src="/resources/images/userThumbnail/${user.userImage}" class="img-responsive"></c:if>
				<label class="file_input">
			        <input type="file" onchange="javascript:document.getElementById('file_route').value=this.value">
			    </label>
			</div>
			
			
			<div class="col-sm-12">
					
					<br/><br/><br/>
					
				
					<div class="row">
						<div class="form-group">
					  		<label for="userName" class="col-sm-2 col-sm-offset-4 control-label">이름</label>
					  			<div class="col-sm-3">
									<input type="text" class="form-control" id="userName" name="userName" value="${user.userName}">
								</div>
						</div>
					</div>
					
					<br/>
					
					<div class="row">
						<div class="form-group">
					  		<label for="userPhone" class="col-sm-2 col-sm-offset-4 control-label">휴대전화번호</label>
					  			<div class="col-sm-3">
									<input type="text" class="form-control" id="userPhone" name="userPhone" value="${user.userPhone}">
								</div>
						</div>
					</div>
					
					<br/>
					
					<div class="row">	
						<div class="form-group">
					  		<label for="userEmail" class="col-sm-2 col-sm-offset-4 control-label">이 메 일</label>
					  			<div class="col-sm-3">
									<input type="text" class="form-control" id="userEmail" name="userEmail" value="${user.userEmail}" readonly="readonly">
								</div>
						</div>
					</div>
					
					<br/>
					
					<div class="row">	
						<div class="form-group">
							 <label for="password"  class="col-sm-2 col-sm-offset-4 control-label">*비밀번호</label>
								<div class="col-sm-3">
									 <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
								</div>
						 </div>
					</div>
					
					<br/>
					
					<div class="row">						  
						<div class="form-group">
							 <label for="password2" class="col-sm-2 col-sm-offset-4 control-label">*비밀번호 확인</label>
								<div class="col-sm-3">
								 <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
										<span id="helpBlock" class="help-block" type="hidden">
											 <strong  id="text2" class="text-danger" style="color: #f9d431;">비밀번호가 일치하지 않습니다.</strong>
										</span>
								</div>
						 </div>
					</div>
					
					<br/>
						 
					<div class="row">
						<div class="form-group">
					  		<label for="userAccount"class="col-sm-2 col-sm-offset-4 control-label">계좌번호</label>
					  			<div class="col-sm-3">
									<input type="text" class="form-control" id="userAccount" name="userAccount" value="${user.userAccount}">
								</div>
						</div>
					</div>
					
					<br/>
						
					<div class="row">
						<div class="form-group">
					  		<label for="userType" class="col-sm-2 col-sm-offset-4 control-label">HOST등록여부</label>
					  			<div class="col-sm-3">
									<input type="text" class="form-control" id="userType" name="userType" value="${user.userType}" readonly="readonly">
									<button class="btn btn-outlined btn-light btn-xs" id="addHost">HOST 등록</button>
								</div>
						</div>
					</div>
					
					<br/>	
					
					<div class="row">
						<div class="form-group">
					  		<label for="userGender" class="col-sm-2 col-sm-offset-4 control-label">성별</label>
					  			<div class="col-sm-3">
						  			<c:if test = "${user.userGender=='W'}"> 
										<label for="female" class="chk_radio on"><input type="radio" name="userGender"   checked="checked" value="W" />여자</label>
										<label for="male" class="chk_radio "><input type="radio" name="userGender"  value="M" />남자</label>
									 </c:if> 
									
									&nbsp;&nbsp;
									 <c:if test = "${user.userGender=='M'}">
										<label for="female" class="chk_radio on"><input type="radio" name="userGender"   value="W" />여자</label>
										<label for="male" class="chk_radio "><input type="radio" name="userGender"   value="M" checked="checked"/>남자</label>
									</c:if> 
								</div>
						</div>
					</div>
					
					<br/>
					
					
				</div>
			</div>
			
			 <br/>
			 <br/>
										  
				 <div class="form-group">
					 <div class="col-sm-offset-2 col-sm-8 text-center">
							 <button type="button" class="btn btn-outlined btn-light btn-sm"  id="updateUser">수 &nbsp;정</button> &nbsp; &nbsp;
							 <button class="btn btn-outlined btn-theme btn-sm" type="button" id="cancel">취&nbsp;소</button>
					</div>
					
				 </div>
				 <br/><br/>
		<br/><br/>
		<br/>  
				 
		</form>	
 		</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
 	
 	
 	
 	
		<!---------- Image Dialog ------------->

		
			<div class="modal fade" id="addHostModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">
								<Strong>호스트 등록</Strong>
							</h4>
						</div>
	
						<div class="modal-body col-sm-12">
							<div class="col-sm-4 col-sm-offset-3">				
								<form name="form" enctype="multipart/form-data" >
											<input type="text" class="form-control"id="inputNum" placeholder="인증번호를 입력해주세요." />
								</form>
							</div>
							<div class="col-sm-5">
								<button name="authNum" type="button" id="goAuth" class="btn btn-outlined btn-light btn-sm" >인증하기</button>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outlined btn-theme btn-xs" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		<!-- ---------------------------------------------------------------- -->
 	
</body>

</html>