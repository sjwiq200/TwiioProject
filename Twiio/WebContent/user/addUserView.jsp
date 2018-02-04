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
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		 
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
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
				alert("이메일 인증을 해주세요");
				flag = false;
			}
			
			
			
			if(flag){
				
				$.post( '/user/addUser', $('#addUserForm').serialize())
				  .done(function( data ) {
					  $(location).attr('href', '/user/loginView.jsp');
				  }).fail(function( data ) {
					  alert("회원가입에 실패하셨습니다. 다시 시도 해주세요.");
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
					 
					 alert("인증번호가 확인되었습니다.");
					 
					 $("button#emailVer").replaceWith('<button class="mdl-button mdl-js-button mdl-button--raised" id="emailVer" disabled="disabled" >이메일 인증</button>');
					 $("input#email").replaceWith('<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="이메일" value='+email+' readOnly="true" >');
					 $("#inputEmailAuth").modal("hide");
				 }else{
					 
					 alert("인증번호가 다름니다. 다시입력해주세요.");
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

	

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">회 원 가 입</h1>
		
		<input type="hidden"  id="emailAuth" name="emailAuth" />
		<input type="hidden"  id="tempNum" name="tempNum" />
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" id="addUserForm">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">*아 이 디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId"  >
		       <span id="helpBlock" class="help-block">
		      	<strong  id="text" class="text-danger"></strong>
		      </span>
		    </div>
		    
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">*이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="회원이름">
		    </div>
		  </div>	 
		  		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">*비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">*비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
		      <!-- <span id="helpBlock" class="help-block" type="hidden">
		      	<strong  id="text2" class="text-danger" >비밀번호가 일치하지 않습니다.</strong>
		      </span> -->
		    </div>
		  </div>		  
		  
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">*이메일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="이메일">
		     
		      <button class="mdl-button mdl-js-button mdl-button--raised" id="emailVer"  >이메일 인증</button>
		    </div>          
		  </div>
		  <!-- <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">사진</label>
		    <div class="col-sm-4">		      
			    <label for="file">파일 업로드</label>
			    <input type="file" id="file" name="file">
		      <span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">업로드 gogo</strong>
		      </span>
		    </div>
		  </div>
		   -->
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    <!-- disabled="disabled"  -->
		      <button type="button" class="btn btn-primary"  >가 &nbsp;입</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
	 	</form> 
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
	
	<!---------- Image Dialog ------------->
	

		<div class="modal fade" id="inputEmailAuth" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<Strong>인증번호</Strong>
						</h4>
						<h7 class="modal-title">TWIIO</h7>
					</div>

					<div class="modal-body">
						<form name="form" enctype="multipart/form-data">
							<div class="form-group">
								<input type="text" id="inputNum" placeholder="인증번호를 입력해주세요." />
								<button name="authNum" type="button" id="goAuth">인증하기</button>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- ---------------------------------------------------------------- -->
	
</body>

</html>