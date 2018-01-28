<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				
			});
		});	
		
		
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
	    	
	    	//alert("제발");
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
		    	 // alert("어휴");
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
	        
	        
	      }
	      //window.onload = function() {
	    	 /// handleSignUp();
	      //};
	    
	 
		 
	</script>
    
</head>

<body>

	

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">인 증 확 인</h1>
		
		<!-- form Start /////////////////////////////////////-->
		
		
		  
		    
		 
		  
		 <input type="password" class="form-control" id="password" name="password" hidden="hidden">
		 <input type="text" class="form-control" id="email" name="email" hidden="hidden">
		     		 
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    <!-- disabled="disabled"  -->
		      <button type="button" class="btn btn-primary"  >확 &nbsp;인</button>
			  
		    </div>
		  </div>
		
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>