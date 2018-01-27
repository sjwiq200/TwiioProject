<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// google sign-in ////////////////////////// -->
	<meta name="google-signin-scope" content="profile email">
	<meta name="google-signin-client_id" content="733503970005-o1b49h0gsl2ajne6adkbph2ti7a5en3e.apps.googleusercontent.com.apps.googleusercontent.com">    
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    
    <!--  ///////////////////////// kakao login ////////////////////////// -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/> 
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
	    </style>
	
	<script type="text/javascript">
	
		///////////////kakaoLogin//////////////////////////////////
		Kakao.init('0c584c091bafd3c968e4fde8ef68152b');
	
		function loginWithKakao() {
			var accessToken = Kakao.Auth.getAccessToken();
			//alert(accessToken);
			if (accessToken != null) {
				//alert("재로그인창 출력");
				Kakao.Auth
						.loginForm({
							//persistAccessToken: false,
							success : function(authObj) {
	
								alert(JSON.stringify(authObj));
								var json_data = JSON.stringify(authObj);
								var accessToken = authObj.access_token;
	
								//fncKakaoLogout();
								self.location = "http://127.0.0.1:8080/user/kakaologin?accessToken="
										+ accessToken;
							},
							fail : function(err) {
								alert(JSON.stringify(err));
							}
						});
			} else {
				//alert("로그인창 출력");
				// 로그인 창을 띄웁니다.
				Kakao.Auth
						.login({
							//persistAccessToken: false,
							success : function(authObj) {
	
								alert(JSON.stringify(authObj));
								var json_data = JSON.stringify(authObj);
								var accessToken = authObj.access_token;
	
								//fncKakaoLogout();
								self.location = "http://127.0.0.1:8080/user/kakaologin?accessToken="
										+ accessToken;
							},
							fail : function(err) {
								alert(JSON.stringify(err));
							}
						});
			}
		};
		////////////////////////////googleLogin///////////////////////////////
		$(function() {
			 
			$("#google-login-btn").on("click",function(){
				self.location="https://accounts.google.com/o/oauth2/auth?redirect_uri=http://127.0.0.1:8080/user/googleLogin&response_type=code&"
						+"client_id=733503970005-o1b49h0gsl2ajne6adkbph2ti7a5en3e.apps.googleusercontent.com"
						+"&scope=email profile" 
						+"&approval_prompt=force&access_type=offline";
			});
		});
		/////////////////////////facebookLogin////////////////////////
		function checkLoginState() {
			    FB.getLoginStatus(function(response) {
			      statusChangeCallback(response);
			      console.log("토큰"+response.authResponse.accessToken);
			    }
				);
			  }

			  window.fbAsyncInit = function() {
			  FB.init({
			    appId      : '157517288201485',
			    cookie     : true,  // enable cookies to allow the server to access 
			    xfbml      : true,  // parse social plugins on this page
			    version    : 'v2.11', // use graph api version 2.8
			  });


			  FB.getLoginStatus(function(response) {
			    statusChangeCallback(response);
			  });

			  };
			
			
			function statusChangeCallback(response) {
			    console.log('statusChangeCallback');
			    console.log(response);
			    
			    if (response.status === 'connected') {
			    	console.log('로그인 연결');
			    	console.log(response.authResponse.accessToken);
			    	handleFacebookRegist(response);
			      
			    } else {
			    	console.log('로그인 하세요');
			    }
			  }

				
			  (function(d, s, id) {
				  var js, fjs = d.getElementsByTagName(s)[0];
				  if (d.getElementById(id)) return;
				  js = d.createElement(s); js.id = id;
				  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.11&appId=157517288201485';
				  fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));

			  
			  function handleFacebookRegist(response) {
				  console.log(response.authResponse.accessToken);
				  var accessToken = response.authResponse.accessToken;
				  var userId, userName, image;
				  
				  FB.api('/me/picture?type=large',function(data){
					  image = data.data.url;
					  console.log('이미지 ' + image);
					  });
				  
				  FB.api('/me', function (user) {
					
					userId = user.id;
					userName = user.name;
					image = image;
					alert(userId);
					alert(userName);
					alert('이미지 ' + image);
					
					$("input:text[name='userId']").val(userId);
					$("input:text[name='userName']").val(userName);
					$("input:file[name='multi']").val(image);
				
				  $("form").attr("method" , "POST").attr("enctype" , "multipart/form-data").attr("action" , "/user/facebookLogin").submit();
				})
			  }
		
		//============= "로그인"  Event 연결 =============
		$(function() {
	
			//$("#userId").focus();
	
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on(
					"click",
					function() {
						var id = $("input:text").val();
						var pw = $("input:password").val();
	
						if (id == null || id.length < 1) {
							alert('ID 를 입력하지 않으셨습니다.');
							$("#userId").focus();
							return;
						}
	
						if (pw == null || pw.length < 1) {
							alert('패스워드를 입력하지 않으셨습니다.');
							$("#password").focus();
							return;
						}
	
						$("form").attr("method", "POST").attr("action",
								"/user/login").attr("target", "_parent").submit();
					});
		});
	
		//============= 회원원가입화면이동 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click", function() {
				self.location = "/user/addUser"
			});
		});
	</script>

</head>
<body>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
			<div class="col-md-3">
					
			</div>
	   	 	
	 	 	<div class="col-md-6">
	 	 	
		 	 	<br/><br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h3 class="text-center">Twiio 로 &nbsp;&nbsp;그 &nbsp;&nbsp;인</h3>

			        <form class="form-horizontal">
			        
			         <div class="form-group">
					    <label for="kakaoLogin" class="col-sm-2 control-label"></label>
					    <div class="col-sm-6">
					      <a id="custom-login-btn" href="javascript:loginWithKakao()">
							<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
						  </a>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="googleLogin" class="col-sm-2 control-label"></label>
					    <div class="col-sm-6">
					    	<p><div id="google-login-btn" class="g-signin2" data-onsuccess="onSignIn"></div></p>
					       <!-- <img src="/images/APIfolder/googleLogin.png" id="google-login-btn" width="220px"/> -->
					    </div>
					  </div>

						<div class="form-group">
							<label for="facabookLogin" class="col-sm-2 control-label"></label>
							<div class="col-sm-6">
								<fb:login-button scope="public_profile,email" class="fb-login-button" data-size="large"
									data-button-type="continue_with" onlogin="checkLoginState();">
								</fb:login-button>
							</div>
						</div>

						<div class="form-group">
					    <label for="userId" class="col-sm-3 control-label"></label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="아이디" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-3 control-label"></label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="패스워드" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-4 text-center">
					      <button type="button" class="btn btn-primary"  >로 &nbsp;그 &nbsp;인</button>
					      
					      <!-- <p><div class="g-signin2" data-onsuccess="onSignIn"></div></p> -->
					      
					    </div>
					    <!-- <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"> -->
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-4 text-center">
					      <a class="btn btn-primary btn" href="#" role="button">회 &nbsp;원 &nbsp;가 &nbsp;입</a>
					      
					      <!-- <p><div class="g-signin2" data-onsuccess="onSignIn"></div></p> -->
					      
					    </div>
					    <!-- <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"> -->
					  </div>
					  
			
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>

</body>
</html>