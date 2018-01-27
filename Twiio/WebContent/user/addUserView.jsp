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
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
			
			
			if(id == null || id.length <1){
				alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
				$("input:text[name='password2']").focus();
				return;
			}
						
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").attr("enctype", "multipart/form-data").submit();
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
	   //==> �ֹι�ȣ ��ȿ�� check �� ����������....
		function checkSsn() {
			var ssn1, ssn2; 
			var nByear, nTyear; 
			var today; 
	
			ssn = document.detailForm.ssn.value;
			// ��ȿ�� �ֹι�ȣ ������ ��츸 ���� ��� ����, PortalJuminCheck �Լ��� CommonScript.js �� ���� �ֹι�ȣ üũ �Լ��� 
			if(!PortalJuminCheck(ssn)) {
				alert("�߸��� �ֹι�ȣ�Դϴ�.");
				return false;
			}
		}
	
		function PortalJuminCheck(fieldValue){
		    var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
			var num = fieldValue;
		    if (!pattern.test(num)) return false; 
		    num = RegExp.$1 + RegExp.$2;
	
			var sum = 0;
			var last = num.charCodeAt(12) - 0x30;
			var bases = "234567892345";
			for (var i=0; i<12; i++) {
				if (isNaN(num.substring(i,i+1))) return false;
				sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
			}
			var mod = sum % 11;
			return ((11 - mod) % 10 == last) ? true : false;
		}
		 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		 var idCheck
		//==>"ID�ߺ�Ȯ��" Event ó�� �� ����		
		$(function() {
			//alert("1111");
			//if($("#userId").val().length>5){
				//alert("����111");				
	            $("#userId").keyup(function(){
	            	//alert("����");
	                var userId = $('#userId').val();
	                console.log(userId);
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
		                        	$("button.btn.btn-primary").prop("disabled", true);
		                        	//$("button.btn.btn-primary").css("background-color", "#4CAF50");		                        	
		                        }
	                        }else{
	                        	$("#userId").css("background-color", "#FFCECE");
	                        	$("#text").text("6�� �̻� �Է��Ͻÿ�.");
	                        	$("button.btn.btn-primary").prop("disabled", true);
	                        	//$("button.btn.btn-primary").css("background-color", "#4CAF50");
	                        }
	                    }
	                });
	            });
	        //}else{$("strong").append("6�� �̻� �Է��Ͻÿ�.");}
			
	            $("#password2").keyup(function(){
	            	checkPwd();
	            });
	            
	            $("#userName").keyup(function(){
	            	signupCheck();
	            });
	            
	            $("#email").keyup(function(){
	            	signupCheck();
	            });
			
		});
		
		$( function() {
			$( "#datepicker" ).datepicker({
				 dateFormat: "yy-mm-dd"
			});
		  } );
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		//���Է� ��й�ȣ üũ�Ͽ� ���Թ�ư ��Ȱ��ȭ �Ǵ� ���������� �˸�.
		function checkPwd() {
			var inputed = $("#password").val();
			var reinputed = $("#password2").val();
			if (reinputed == ""
					&& (inputed != reinputed || inputed == reinputed)) {
				$("button.btn.btn-primary").prop("disabled", true);
				$("button.btn.btn-primary").css("background-color", "#aaaaaa");
				$("#password2").css("background-color", "#FFCECE");
			} else if (inputed == reinputed) {
				$("#password2").css("background-color", "#B0F6AC");
				pwdCheck = 1;
				if (idCheck == 1 && pwdCheck == 1) {
					$("button.btn.btn-primary").prop("disabled", false);
					$("button.btn.btn-primary").css("background-color", "#4CAF50");
					signupCheck();
				}
			} else if (inputed != reinputed) {
				pwdCheck = 0;
				$("button.btn.btn-primary").prop("disabled", true);
				$("button.btn.btn-primary").css("background-color", "#aaaaaa");
				$("#password2").css("background-color", "#FFCECE");

			}
		}
		//�г��Ӱ� �̸��� �Է����� �ʾ��� ��� ���Թ�ư ��Ȱ��ȭ
		function signupCheck() {
			var nickname = $("#userName").val();
			var email = $("#email").val();
			if (nickname == "" || email == "") {
				$("button.btn.btn-primary").prop("disabled", true);
				$("button.btn.btn-primary").css("background-color", "#aaaaaa");
			} else {
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
	  var config = {
	    apiKey: "AIzaSyAVHGmYXYa7jFoUKmWWH-8M2wSxKo1Co_w",
	    authDomain: "fir-emailauth-98337.firebaseapp.com",
	    databaseURL: "https://fir-emailauth-98337.firebaseio.com",
	    projectId: "fir-emailauth-98337",
	    storageBucket: "",
	    messagingSenderId: "747279716078"
	  };
	  firebase.initializeApp(config);
	  
	  
	    /**
	     * Sends an email verification to the user.
	     */
	    function handleSignUp() {
	    	
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
	        document.getElementById('quickstart-sign-up').addEventListener('click', handleSignUp, false);
	        document.getElementById('quickstart-verify-email').addEventListener('click', sendEmailVerification, false);
	        
	      }
	      window.onload = function() {
	        initApp();
	      };
	    
	 
		 
	</script>
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">ȸ �� �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId"  >
		       <span id="helpBlock" class="help-block">
		      	<strong  id="text" class="text-danger">6�� �̻� �Է��Ͻÿ�.</strong>
		      </span>
		    </div>
		    
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="ȸ���̸�">
		    </div>
		  </div>	 
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="�̸���">
		      <button class="mdl-button mdl-js-button mdl-button--raised" id="quickstart-verify-email" name="verify-email">Send Email Verification</button>
		      <button class="mdl-button mdl-js-button mdl-button--raised" id="quickstart-sign-up" name="signup">Sign Up</button>
		    </div>          
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="��й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
		      <!-- <span id="helpBlock" class="help-block" type="hidden">
		      	<strong  id="text2" class="text-danger" >��й�ȣ�� ��ġ���� �ʽ��ϴ�.</strong>
		      </span> -->
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">		      
			    <label for="file">���� ���ε�</label>
			    <input type="file" id="file" name="file">
		      <span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">���ε� gogo</strong>
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" disabled="disabled"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>