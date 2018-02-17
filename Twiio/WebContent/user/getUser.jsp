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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/resources/css/animate.min.css" rel="stylesheet">
   <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
	
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
			    color: #FFF;
			    background: #08708A;
			    border-color: #08708A;
			}
			
			.btn-outlined.btn-theme {
			    background: #FFF;
			    color: #08708A;
				border-color: #08708A;
			}
			.btn-outlined.btn-light:hover,
			.btn-outlined.btn-light:active {
			    color: #FFF;
			    background: #56B1BF;
			    border-color: #56B1BF;
			}
			
			.btn-outlined.btn-light {
			    background: #f4f4f4;
			    color: #56B1BF;
				border-color: #56B1BF;
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
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#updateuser" ).on("click" , function() {
					self.location = "/user/updateUser?userNo="+${user.userNo};
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
	
		<div class="page-header">
	       <h3 class=" text-info">회원상세정보</h3>
	    </div>
		
	<div class="col-sm-12">
		
		<div class="profile-userpic ">
		<c:if test="${empty user.userImage}"><img style="width:70px; height:70px; alt="" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" class="img-responsive"></c:if>
		<c:if test="${!empty user.userImage}"><img style="width:70px; height:70px; alt="" src="/resources/images/userimages/${user.userImage}" class="img-responsive"></c:if>
		</div>
		
		<div class="col-sm-12">
				
				<br/><br/><br/>
				
			<div class="col-sm-6">
			
				<div class="col-sm-12">
				
				<div class="row">
			  		<div class="col-sm-3 col-sm-offset-4"><strong>이 름</strong></div>
					<div class="col-sm-4">${user.userName}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-3 col-sm-offset-4"><strong>휴대전화번호</strong></div>
					<div class="col-sm-4">${ !empty user.userPhone?user.userPhone :''}	</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-3 col-sm-offset-4"><strong>이 메 일</strong></div>
					<div class="col-sm-4">${user.email}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-3 col-sm-offset-4"><strong>계좌번호</strong></div>
					<div class="col-sm-4">${user.userAccount}</div>
				</div>
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-3 col-sm-offset-4"><strong>은행명</strong></div>
					<div class="col-sm-4">${user.userBank}</div>
				</div>
				
				<br/>
				
				</div>
				
			</div>
				
			<div class="col-sm-6">
			
				<div class="col-sm-12">
				
				<div class="row">
			  		<div class="col-sm-3 col-sm-offset-4"><strong>유 형</strong></div>
					<div class="col-sm-4">
					<c:if test="${user.userType == 1}">
						회원
					</c:if>
					<c:if test="${user.userType == 2}">
						호스트
					</c:if>
					<c:if test="${user.userType == 3}">
						관리자
					</c:if>
					</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-3 col-sm-offset-4"><strong>평 점<br/>(참석/프로필)</strong></div>
					<div class="col-sm-4">${empty user.userEval?0:user.userEval} | ${empty user.userEvalCredit?0:user.userEvalCredit}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-3 col-sm-offset-4"><strong>성별</strong></div>
					<div class="col-sm-4">${user.userGender}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-3 col-sm-offset-4"><strong>생년월일</strong></div>
					<div class="col-sm-4">${user.userBirthday}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-3 col-sm-offset-4"><strong>가입일자</strong></div>
					<div class="col-sm-4">${user.regDate}</div>
				</div>
				
				<br/>
				
					</div>
				
				</div>
		
			</div>
			
			<br/>
			
			<div class="row"></div>
				
				<div class="row">
			  		<div class="col-sm-12 text-center ">
			  			<button type="button" class="btn btn-outlined btn-theme btn-sm" id="updateuser">회원정보수정</button>
			  		</div>
				</div>

		<br/> 
		
		</div>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>