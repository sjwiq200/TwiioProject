<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
				alert("구글");
				self.location="https://accounts.google.com/o/oauth2/auth?redirect_uri=http://127.0.0.1:8080/user/googleLogin&response_type=code&"
						+"client_id=733503970005-o1b49h0gsl2ajne6adkbph2ti7a5en3e.apps.googleusercontent.com"
						+"&scope=email profile" 
						+"&approval_prompt=force&access_type=offline";
			});
		});
		/////////////////////////facebookLogin////////////////////////
		function checkLoginState() {
			alert("1");
			    FB.getLoginStatus(function(response) {
			    	alert("2");
			      statusChangeCallback(response);
			      console.log("토큰"+response.authResponse.accessToken);
			    }
				);
			  }

			  window.fbAsyncInit = function() {
				  alert("3");
			  FB.init({
			    appId      : '157517288201485',
			    cookie     : true,  // enable cookies to allow the server to access 
			    xfbml      : true,  // parse social plugins on this page
			    version    : 'v2.11', // use graph api version 2.8
			  });


			  FB.getLoginStatus(function(response) {
				  alert("4");
			    statusChangeCallback(response);
			  });

			  };
			
			
			function statusChangeCallback(response) {
				alert("5");
			
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
				  alert("6");
				  var js, fjs = d.getElementsByTagName(s)[0];
				  if (d.getElementById(id)) return;
				  js = d.createElement(s); js.id = id;
				  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.11&appId=157517288201485';
				  fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));

			  
			  function handleFacebookRegist(response) {
				  alert("7");
				  console.log(response.authResponse.accessToken);
				  var accessToken = response.authResponse.accessToken;
				  var userId, userName, image;
				  
				  FB.api('/me/picture?type=large',function(data){
					  image = data.data.url;
					  console.log('이미지 ' + image);
					  });
				  
				  FB.api('/me', function (user) {
					  alert("8");
					userId = user.id;
					userName = user.name;
					image = image;
					alert(userId);
					alert(userName);
					//alert('이미지 ' + image);
					
					$("input:hidden[name='userfaceId']").val(userId);
					$("input:hidden[name='userName']").val(userName);
					$("input:hidden[name='multi']").val(image);
				
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
			$("a[href='' ]").on("click", function() {
				self.location = "/user/addUser"
			});
		});
		
	</script>  
	

<!---------- login Dialog ------------->
	

		<div class="modal fade" id="logIn" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h2>
							<Strong>LOGIN</Strong>
						</h2>
					</div>

					<div class="modal-body">
						  <div class="panel-body">
						  
								  <div class="row">
								  
								<div class="col-md-5" >
									<a id="custom-login-btn" href="javascript:loginWithKakao()"><img src="/resources/images/kakaosm.png" /></a><br/><br/>
									<a id="google-login-btn"  data-onsuccess="onSignIn" href=""><img src="/resources/images/googlesm.png"/></a><br/><br/>
									<a id="facebook-login-btn" scope="public_profile,email" onlogin="checkLoginState();" data-max-rows="1" data-size="large"  
									data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false">
									<img src="/resources/images/facebooksm.png" /></a>
									<!-- <div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div> -->
								</div>
								
								    <div class="col-md-7" style="border-left:1px solid #ccc;height:160px">
										<form class="form-horizontal">
										
										 <input type="hidden" value="" name="userfaceId"/>
										 <input type="hidden" value="" name="userName"/>
										 <input type="hidden" value="" name="multi"/>
											<fieldset>
											
											  <input type="text" class="form-control" name="userId" id="userId"  placeholder="아이디" ><br/>
											  <input type="password" class="form-control" name="password" id="password" placeholder="패스워드" >
											  <div class="spacing"><a href="#"><small> Forgot Id / Password?</small></a><br/></div>
											 <button type="button" class="btn btn-primary"  >로 &nbsp;그 &nbsp;인</button>
											  <a class="btn btn-primary btn" href="#" role="button">회 &nbsp;원 &nbsp;가 &nbsp;입</a>
											
											</fieldset>
										</form>
									</div>
								</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- ---------------------------------------------------------------- -->

