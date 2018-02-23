<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Firebase Eamil Auth ////////////////////////// -->
	
	
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
	
	<link rel="stylesheet" href="/resources/css/plan.css" />
	
		<!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
	
	<style>
       body {
            padding-top : 100px;
            background-color: #f4f4f4;
			color: #666666;
			font-family: "Source Sans Pro", Helvetica, sans-serif;
			background-image: url("/resources/images/camp.jpg");
    		background-size: cover;
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
			    color: #dedede;
			    background: #08708A;
			    border-color: #08708A;
			}
			
			.btn-outlined.btn-theme {
			    background: #dedede;
			    color: #08708A;
				border-color: #08708A;
			}
			.btn-outlined.btn-light:hover,
			.btn-outlined.btn-light:active {
			    color: #dedede;
			    background: #D73A31;
			    border-color: #D73A31;
			}
			
			.btn-outlined.btn-light {
			    background: #dedede;
			    color: #D73A31;
				border-color: #D73A31;
			}
			.jumbotron
			{	
				padding-top : 30px;
				padding-bottom : 30px;
				background-color: rgba(0, 0, 0, 0.6);
				padding-left : 30px;
				padding-right : 30px;
			} 
			h2 {
				color : #dedede;
			   font-size: 3.5em;
			   padding: 0 0.5em 0.25em 0.5em;
			   font-weight: 500;
			   font-family: "Pacifico", cursive;
			   text-transform: none;
			   letter-spacing: 10;
			   font-style: Pacifico;
			   text-shadow: 0 5px 5px rgba(0, 0, 0, .5);
			   
			}
			.btn-xs{
				font-size:11px;
				line-height:14px;
				border: 3px solid;
				padding:5px 10px;
			}
			.file_input{
			    cursor:pointer;
			    display:inline-block;
			    vertical-align:middle;
			    overflow:hidden;
			    width:64px;
			    height:64px;
			    background-image:url('/resources/images/picture.png');
			    text-align:center;
			    line-height:30px;
			    left : 525px;
			    top: 120px;
			}
			.file_input input {
			    position:absolute;
			    width:0;
			    height:0;
			    overflow:hidden;
			}
			
        
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button#addUser" ).on("click" , function() {
				fncAddUser();
			});
		});	
		 
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#cancel").on("click" , function() {
				$("form")[0].reset();
			});
		});
	
		
		function fncAddUser() {
						
			var userName = $("#userName").val();
			var userId = $("#userId").val();
			var email = $("#userEmail").val();
			var password = $("#password").val();
			var password2 = $("#password2").val();
			
			var flag = true;
			if (userName == "" ) {
				//$("button.btn.btn-primary").prop("disabled", true);
				$("#userName").css("background-color", "#FFCECE");
				flag = false;
			} 
			if(email == "") {
				$("#email").css("background-color", "#FFCECE");
				flag = false;
			}
			if(password == "") {
				$("#password").css("background-color", "#FFCECE");
				flag = false;
			}
			if(password2 == "") {
				$("#password2").css("background-color", "#FFCECE");
				flag = false;
			}
			if(userId == "") {
				$("#userId").css("background-color", "#FFCECE");
				flag = false;
			}
			if(!($('#emailVer').attr("disabled"))) {
				swal("이메일 인증을 해주세요","","info");
				flag = false;
			}
			
			
			
			if(flag){
				
				$.post( '/user/addUser', $('#addUserForm').serialize())
				  .done(function( data ) {
					  swal("회원가입이 완료되었습니다!","","success");
					  $(location).attr('href', '/user/loginView.jsp');
				  }).fail(function( data ) {
					  swal("회원가입에 실패하셨습니다. 다시 시도 해주세요.","","error");
				  });
			}
			
		}

		//==>"이메일" 유효성Check  Event 처리 및 연결
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
			});
			 
		});
		////////////////////////////////////이메일 인증////////////////////////////////////////////////////////////

		$(function() {
						 $("#emailVer").on("click" , function() {
							
							 $("#addUserForm").submit(function(e) {

								    var url = "/user/json/getEmailVer"; 

								    $.ajax({
								           type: "POST",
								           url: url,
								           data: $("#addUserForm").serialize(), 
								           success: function(data)
								           {
								        	   $("#emailAuth").val(data[1]);
					    						var authNum =  $("#emailAuth").val();
					    						$("#inputEmailAuth").modal("show");
					    						
					    						
								           }
								         });

								    e.preventDefault(); 
								});
							 
							 
							 
								     });
								});
		
 		
 		$(function() {
			 
			 $("button#goAuth").on("click" , function() {
				 
				 var inputNum = $("#inputNum").val();
				 var authNum = $("#emailAuth").val();
				 var email = $("#userEmail").val();
				 
				 if(inputNum==authNum){
					 
					 swal({
							  title: "인증번호가 일치합니다:D",
							  icon: "success",
							  buttons: true,
							})
					 
					 $("button#emailVer").replaceWith('<button class="mdl-button mdl-js-button mdl-button--raised" id="emailVer" disabled="disabled" >이메일 인증</button>');
					 $("input#userEmail").replaceWith('<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="이메일" value='+email+' readOnly="true" >');
					 $("#inputEmailAuth").modal("hide");
				 }else{
					 
					 swal({
						  title: "인증번호가 일치하지 않습니다 :D",
						  icon: "warning",
						  buttons: true,
						  dangerMode: true,
						})
				 }
				 
				 
					     });
					});
			 
	
	  
		 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		 //var idCheck
		//==>"ID중복확인" Event 처리 및 연결		
		$(function() {
			//alert("1111");
			//if($("#userId").val().length>5){
				//alert("제발111");				
	            $("#userId").on("keyup",function(){
	            	//alert("제발");
	                var userId = $('#userId').val();
	                console.log(userId);
	                if(userId.length<6){
	                	$("#userId").css("background-color", "#FFCECE");
                    	$("#text").text("6자 이상 입력하시오.");
	                }
	                $.ajax({
	                	url:"/user/json/checkDuplication/",
						method:"POST",
						dataType : "json", 
						data:{	    						
							userId:$("#userId").val()
							},
	                    success : function(JSONData){
	                        console.log(JSONData);
	                        //alert("JSONData: \n"+JSONData);
	                        if(userId.length>5){
		                        if(JSONData.result==true && $("#userId").val() != ""){
		                        	$("#userId").css("background-color", "#B0F6AC");
		                        	$("#text").text("사용가능한 아이디입니다.");
		                        	//$("button.btn.btn-primary").prop("disabled", false);
		                        	idCheck=1;
		                        	//$("button.btn.btn-primary").css("background-color", "#aaaaaa");
		                        }else if(JSONData.result==false){
		                        	$("#userId").css("background-color", "#FFCECE");
		                        	$("#text").text("이미 사용중인 아이디입니다.");
		                        	//$("button.btn.btn-primary").prop("disabled", true);
		                        	//$("button.btn.btn-primary").css("background-color", "#4CAF50");		                        	
		                        }
	                        }else{
	                        	$("#userId").css("background-color", "#FFCECE");
	                        	$("#text").text("6자 이상 입력하시오.");
	                        	//$("button.btn.btn-primary").prop("disabled", true);
	                        	//$("button.btn.btn-primary").css("background-color", "#4CAF50");
	                        }
	                    }
	                });
	            });
	        //}else{$("strong").append("6자 이상 입력하시오.");}
			
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
	            
	           /*  $("#userName").keyup(function(){
	            	signupCheck();
	            });
	            
	            $("#email").keyup(function(){
	            	signupCheck();
	            }); */
			
		});		
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
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
		//닉네임과 이메일 입력하지 않았을 경우 가입버튼 비활성화
		function signupCheck() {
			var userName = $("#userName").val();
			var email = $("#email").val();
			if (userName == "" ) {
				//$("button.btn.btn-primary").prop("disabled", true);
				$("#userName").css("background-color", "#FFCECE");				
			} 
			if(email == "") {
				$("#userEmail").css("background-color", "#FFCECE");
			}
		}
		
		/* //캔슬버튼 눌렀을 눌렀을시 인풋박스 클리어
		$(".cancelbtn").click(function() {
			$(".id").val(null);
			$(".pass").val('');
			$("button.btn.btn-primary").prop("disabled", true);
			$("button.btn.btn-primary").css("background-color", "#aaaaaa");
		}); */
	</script>		
	
</head>

<body>

	
	<jsp:include page="/layout/toolbar.jsp" />
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<div class="jumbotron">	
	
		<input type="hidden"  id="emailAuth" name="emailAuth" />
		<input type="hidden"  id="tempNum" name="tempNum" />
		
		<!-- form Start /////////////////////////////////////-->
		
		<h2 align="center"><ins><strong>TWIIO SIGNUP</strong></ins></h2>
		
			        <div class="panel-body">
						  
						<div class="row">
									  
							<div class="col-md-12">
								<div class="col-sm-10 col-sm-offset-1">
									
									
										<form class="form-horizontal" id="addUserForm">
		
										  <div class="form-group">
										    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label" style="color: #dedede;">*아 이 디</label>
										    <div class="col-sm-4">
										      <input type="text" class="form-control" id="userId" name="userId"  placeholder="아이디">
										       <span id="helpBlock" class="help-block">
										      	<strong  id="text" class="text-danger" style="color: #f9d431;"></strong>
										      </span>
										    </div>
										    
										  </div>
										  
										  <div class="form-group">
										    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label" style="color: #dedede;">*이름</label>
										    <div class="col-sm-4">
										      <input type="text" class="form-control" id="userName" name="userName" placeholder="회원이름">
										    </div>
										  </div>	 
										  		  
										  <div class="form-group">
										    <label for="password" class="col-sm-offset-1 col-sm-3 control-label" style="color: #dedede;">*비밀번호</label>
										    <div class="col-sm-4">
										      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
										    </div>
										  </div>
										  
										  <div class="form-group">
										    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label" style="color: #dedede;">*비밀번호 확인</label>
										    <div class="col-sm-4">
										      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
										      <span id="helpBlock" class="help-block" type="hidden">
										      	<strong  id="text2" class="text-danger" style="color: #f9d431;">비밀번호가 일치하지 않습니다.</strong>
										      </span>
										    </div>
										  </div>		  
										  
										  
										   <div class="form-group">
										    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label" style="color: #dedede;">*이메일</label>
										    <div class="col-sm-4">
										      <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="이메일">
										      <button class="btn btn-outlined btn-light btn-xs" id="emailVer" >이메일 인증</button>
										    </div>          
										  </div>
										 <!--  <div class="form-group">
										    <label for="file" class="col-sm-offset-1 col-sm-3 control-label" style="color: #dedede;">사진</label>
										    <div class="col-sm-4">
										    		<label class="file_input">
												        <input type="file" id="file" name="file" onchange="javascript:document.getElementById('file_route').value=this.value">
												    </label>     
										    </div>
										  </div> -->
										  
										  <br/>
										  <br/>
										  
										  <div class="form-group">
										    <div class="col-sm-offset-2 col-sm-8 text-center">
										      <button type="button" class="btn btn-outlined btn-light btn-sm"  id="addUser">가 &nbsp;입</button> &nbsp; &nbsp;
											  <button class="btn btn-outlined btn-theme btn-sm" type="button" id="cancel">취&nbsp;소</button>
										    </div>
										  </div>
									 	</form>
																
																
								
								
								</div>
							</div>
			       		 </div>
			        </div>
		
		
		
		
		
		
		
		
		
 	</div>
 	
 </div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
	
		<!---------- Image Dialog ------------->

		
			<div class="modal fade" id="inputEmailAuth" role="dialog">
				<div class="modal-dialog modal-lg">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">
								<Strong>이메일 인증</Strong>
							</h4>
							<h7 class="modal-title">작성하신 이메일로 전달된 인증번호를 잘 입력해주세요:D</h7>
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