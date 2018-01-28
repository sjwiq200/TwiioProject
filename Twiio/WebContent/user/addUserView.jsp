<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Firebase Eamil Auth ////////////////////////// -->
	
	<script src="https://www.gstatic.com/firebasejs/4.9.0/firebase.js"></script>
	
	<!-- Material Design Theming -->
	  <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.orange-indigo.min.css">
	  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	  <script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
	  
	   <link rel="stylesheet" href="main.css">
	  
	  <!-- Import and configure the Firebase SDK -->
	  <!-- These scripts are made available when the app is served or deployed on Firebase Hosting -->
	  <!-- If you do not serve/host your project using Firebase Hosting see https://firebase.google.com/docs/web/setup -->
	  <script src="/__/firebase/4.0.0/firebase-app.js"></script>
	  <script src="/__/firebase/4.0.0/firebase-auth.js"></script>
	  <script src="/__/firebase/init.js"></script>		
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		 
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});
	
		
		function fncAddUser() {
						
			var userName = $("#userName").val();
			var userId = $("#userId").val();
			var email = $("#email").val();
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
			
			
			
			if(flag){
				//$("form").attr("method" , "POST").attr("action" , "/user/addUser").attr("enctype", "multipart/form-data").submit();
				$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
			}
			
		}
		

		//==>"�̸���" ��ȿ��Check  Event ó�� �� ����
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});			
	  
		 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		 //var idCheck
		//==>"ID�ߺ�Ȯ��" Event ó�� �� ����		
		$(function() {
			//alert("1111");
			//if($("#userId").val().length>5){
				//alert("����111");				
	            $("#userId").on("keyup",function(){
	            	//alert("����");
	                var userId = $('#userId').val();
	                console.log(userId);
	                if(userId.length<6){
	                	$("#userId").css("background-color", "#FFCECE");
                    	$("#text").text("6�� �̻� �Է��Ͻÿ�.");
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
		                        	$("#text").text("��밡���� ���̵��Դϴ�.");
		                        	//$("button.btn.btn-primary").prop("disabled", false);
		                        	idCheck=1;
		                        	//$("button.btn.btn-primary").css("background-color", "#aaaaaa");
		                        }else if(JSONData.result==false){
		                        	$("#userId").css("background-color", "#FFCECE");
		                        	$("#text").text("�̹� ������� ���̵��Դϴ�.");
		                        	//$("button.btn.btn-primary").prop("disabled", true);
		                        	//$("button.btn.btn-primary").css("background-color", "#4CAF50");		                        	
		                        }
	                        }else{
	                        	$("#userId").css("background-color", "#FFCECE");
	                        	$("#text").text("6�� �̻� �Է��Ͻÿ�.");
	                        	//$("button.btn.btn-primary").prop("disabled", true);
	                        	//$("button.btn.btn-primary").css("background-color", "#4CAF50");
	                        }
	                    }
	                });
	            });
	        //}else{$("strong").append("6�� �̻� �Է��Ͻÿ�.");}
			
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
	
		//���Է� ��й�ȣ üũ�Ͽ� ���Թ�ư ��Ȱ��ȭ �Ǵ� ���������� �˸�.
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
		//�г��Ӱ� �̸��� �Է����� �ʾ��� ��� ���Թ�ư ��Ȱ��ȭ
		function signupCheck() {
			var userName = $("#userName").val();
			var email = $("#email").val();
			if (userName == "" ) {
				//$("button.btn.btn-primary").prop("disabled", true);
				$("#userName").css("background-color", "#FFCECE");				
			} 
			if(email == "") {
				$("#email").css("background-color", "#FFCECE");
			}
		}
		/* //ĵ����ư ������ �������� ��ǲ�ڽ� Ŭ����
		$(".cancelbtn").click(function() {
			$(".id").val(null);
			$(".pass").val('');
			$("button.btn.btn-primary").prop("disabled", true);
			$("button.btn.btn-primary").css("background-color", "#aaaaaa");
		}); */
	</script>		
	
	<script>
	  // Initialize Firebase
	  /* var config = {
	    apiKey: "AIzaSyAVHGmYXYa7jFoUKmWWH-8M2wSxKo1Co_w",
	    authDomain: "fir-emailauth-98337.firebaseapp.com",
	    databaseURL: "https://fir-emailauth-98337.firebaseio.com",
	    projectId: "fir-emailauth-98337",
	    storageBucket: "",
	    messagingSenderId: "747279716078"
	  };
	  firebase.initializeApp(config); */
	  
	  var windowObj;
	  
	  $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#quickstart-sign-up").on("click" , function() {
				openNew();
			});
		});
	
	  
	  function openNew(){
		// ��â�� ���� ����(�ɼ�)
	        var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=200,width=200,left=0,top=0';
	        // �ڽ�â�� ���� �ڽ�â�� window ��ü�� windowObj ������ ����
	        windowObj = window.open("NewFile.jsp","�ڽ�â",settings);
	        windowObj.$("#password").val()= $("#password").val();
	        windowObj.$("#email").val()= $("#email").val();
	        windowObj.handleSignUp();
	  }
	    /**
	     * Sends an email verification to the user.
	     */
	   /*  function handleSignUp() {
	    	
	    	//alert("����");
	    	var email = $("#email").val();
		      var password = $("#password").val();
		      //alert(email);
		      if (email.length < 4) {
		        alert('Please enter an email address.');
		        return;
		      }
		      if (password.length < 4) {
		        alert('Please enter a password.');
		        return;
		      }
		      // Sign in with email and pass.
		      // [START createwithemail]
		      firebase.auth().createUserWithEmailAndPassword(email, password).then(function(user) {
		    	  var user = firebase.auth().currentUser;
		    	  alert("currentUser::"+JSON.stringify(user));
		    	  //user.sendEmailVerification();		    	  
		    	  
			        // Email Verification sent!
			        // [START_EXCLUDE]
			        //alert('Email Verification Sent!');
			        // [END_EXCLUDE]
		       
		      },function(error) {
		    	  // Handle Errors here.
			        var errorCode = error.code;
			        var errorMessage = error.message;
			        // [START_EXCLUDE]
			        if (errorCode == 'auth/weak-password') {
			          alert('The password is too weak.');
			        } else {
			          alert(errorMessage);
			        }
			        console.log(error);
			        // [END_EXCLUDE]	    	  
		    	 
			      });
		      // [END createwithemail]
	    	//sendEmail();
	      
	    }
	    
	     function sendEmailVerification(){
	    	//alert("sendEmail");
	    	// [START sendemailverification]
		      firebase.auth().currentUser.sendEmailVerification().then(function() {
		    	 // alert("����");
		        // Email Verification sent!
		        // [START_EXCLUDE]
		        alert('Email Verification Sent!');
		        // [END_EXCLUDE]
		      });
		      // [END sendemailverification]
	    } 
	    
	    function initApp() {
	       
	        // [START authstatelistener]
	        firebase.auth().onAuthStateChanged(function(user) {
	        	
	        	//alert(JSON.stringify(user));
	          
	          if (user) {
	            // User is signed in.
	            var displayName = user.displayName;
	            var email = user.email;
	            var emailVerified = user.emailVerified;
	            var photoURL = user.photoURL;
	            var isAnonymous = user.isAnonymous;
	            var uid = user.uid;
	            var providerData = user.providerData;
	            
	          }  
	          
	        });
	        //document.getElementById('quickstart-sign-up').addEventListener('click', openNew, false);
	        //document.getElementById('quickstart-verify-email').addEventListener('click', sendEmailVerification, false);
	        
	      }
	      window.onload = function() {
	        initApp();
	      }; */
	    
	 
		 
	</script>
    
</head>

<body>

	

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">ȸ �� �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">*�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId"  >
		       <span id="helpBlock" class="help-block">
		      	<strong  id="text" class="text-danger"></strong>
		      </span>
		    </div>
		    
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">*�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="ȸ���̸�">
		    </div>
		  </div>	 
		  		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">*��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="��й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">*��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
		      <!-- <span id="helpBlock" class="help-block" type="hidden">
		      	<strong  id="text2" class="text-danger" >��й�ȣ�� ��ġ���� �ʽ��ϴ�.</strong>
		      </span> -->
		    </div>
		  </div>		  
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">*�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="�̸���">
		     
		      <button class="mdl-button mdl-js-button mdl-button--raised" id="quickstart-sign-up" name="signup">Sign Up</button>
		    </div>          
		  </div>
		  
		  <!-- <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">		      
			    <label for="file">���� ���ε�</label>
			    <input type="file" id="file" name="file">
		      <span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">���ε� gogo</strong>
		      </span>
		    </div>
		  </div>
		   -->
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    <!-- disabled="disabled"  -->
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>