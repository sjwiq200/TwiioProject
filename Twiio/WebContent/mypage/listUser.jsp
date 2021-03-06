<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
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
   <script src="/resources//javascript/bootstrap-dropdownhover.min.js"></script>
   <link rel="stylesheet" href="/resources/css/font.css" />
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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
		 	padding-top : 50px;
            background-color: #f4f4f4;
			color: #666666;
			font-family: "Source Sans Pro", Helvetica, sans-serif;
			
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
			
			body::-webkit-scrollbar {
  				width: 0.7em;
  				background: transparent;
			}
			body::-webkit-scrollbar-thumb {
  				background: transparent;
			}
			
			/* 사이드바 <START> */

	
			.sidenav::-webkit-scrollbar {
  			width: 0.7em;
  			background: transparent;
			}
			.sidenav::-webkit-scrollbar-thumb {
 	 		background: transparent;
			}

			.sidenav {
			margin-top: 53px;
    		height: 100%;
		    width: 0;
		    position: fixed;
		    z-index: 1;
		    top: 0;
   		    left: 0;
		    overflow-x: hidden;
		    transition: 0.6s;
		    padding-top: 60px;
		    background-color: #ffffff;
		    border-right: solid 0.8px #C2C2C2;
			}

			.sidenav a {
		    padding: 8px 8px 8px 32px;
		    text-decoration: none;
	    	font-size: 25px;
	  		color: #818181;
		    display: block;
		    transition: 0.3s;
			}

			.sidenav a:hover {
			    color: #f1f1f1;
			}
			
			.sidenav .closebtn {
			    position: absolute;
			    top: 0;
			    right: 25px;
			    font-size: 36px;
			    margin-left: 50px;
			}
			
			#main {
			    transition: margin-left .5s;
			    padding: 16px;
			}
			
			@media screen and (max-height: 450px) {
			  .sidenav {padding-top: 15px;}
			  .sidenav a {font-size: 18px;}
			}
			
			#contentsBox {
				height: 6em;
				border-bottom: dashed 0.5px #C2C2C2;
			}
			/* 사이드바 <END> */
			
		
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetUserList(currentPage) {
			if(${resultPage.maxPage}>=currentPage){
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
		}
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#search" ).on("click" , function() {
				fncGetUserList(1);
			});
		 });
		
		
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(3)" ).on("click" , function() {
				var userNo = $($('input[name=userss]')[$('td:nth-child(3)').index(this)] ).val();
				window.open("/user/getProfile2?userNo="+userNo,"getProfile2","width=500, height=650,status=no, scrollbars=no, location=no");
				//self.location ="/user/getProfile2?userNo="+userNo;
				 
			});
						
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(3)" ).css("color" , "red");
			
		});	
		
		
		//============= userId 에 회원정보보기  Event  처리 (double Click)=============
		/*  $(function() {
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "td:nth-child(5) > i" ).on("click" , function() {

					var userId = $(this).next().val();
					$.ajax( 
							{
								url : "/user/json/getUser/"+userId ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									var displayValue = "<h6>"
																+"아이디 : "+JSONData.userId+"<br/>"
																+"이  름 : "+JSONData.userName+"<br/>"
																+"이메일 : "+JSONData.email+"<br/>"
																+"ROLE : "+JSONData.role+"<br/>"
																+"등록일 : "+JSONData.regDate+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+userId+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			});  */
			$(function() {
			$("td:nth-child(6)").hover(function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				
				//////////////////////////// 추가 , 변경된 부분 ///////////////////////////////////
				//self.location ="/user/getUser?userId="+$(this).text().trim();
				////////////////////////////////////////////////////////////////////////////////////////////
				var userNo = $($('input[name=userss]')[$('td:nth-child(6)').index(this)] ).val(); 
				$.ajax( 
						{
							url : "/user/json/getUser/"+userNo ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								var displayValue = "<h6>"
													+"아이디 : "+JSONData.userId+"<br/>"
													+"이  름 : "+JSONData.userName+"<br/>"
													+"이메일 : "+JSONData.userEmail+"<br/>"
													+"등록일 : "+JSONData.regDate+"<br/>"
													+"</h6>";
								//Debug...									
								//alert(displayValue);
								$("h6").remove();
								//$("#info").html(displayValue);
								$("#"+userNo+"").html(displayValue);
							}
					});
				
				}, function() { 
					//var userId = $(this).next().val();
					$("h6").remove();
					//$( "#"+userId+"" );
					////////////////////////////////////////////////////////////////////////////////////////////
				});  
			
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> 아래와 같이 정의한 이유는 ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
			
			
		
		//////////////////////////////////유저정보보기////////////////////////////////////
		//////////////////////////////////사이드바///////////////////////////////////////function openNav() {
		function openNav() {
			document.getElementById("mySidenav").style.width = "280px";
			document.getElementById("main").style.marginLeft = "280px";
			document.body.style.backgroundColor = "#f4f4f4";
			
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("main").style.marginLeft = "0";
			document.body.style.backgroundColor = "#f4f4f4";
		}
		
		$(function() {
			$("div[name=contentsBox]").hover(function() {
				var index = $("div[name=contentsBox]").index(this);
 				$($("div[name=contentsBox]")[index]).attr("style","background-color:#A6A0A5; color:white;");
 					}, function(){
 						var index = $("div[name=contentsBox]").index(this);
 						$($("div[name=contentsBox]")[index]).attr("style","background-color:#ffffff;");
 					
 			});
 		});
		////////////////////////////////////////사이드바///////////////////////////////////////////////////
		$(document).on("click",'td:nth-child(4) a[name="friendDelete"]', function(){
 			var friendNo = $($('input[name=friendNo]')[$('td:nth-child(4) a[name="friendDelete"]').index(this)]).val();
 			$.ajax({
 				url : "/common/json/deleteFriend/"+friendNo,
 				method:"GET",
 				dataType:"json",
 				headers :{
 					"Accept" : "application/json",
 					"Content-Type" : "application/json"
 				},		
 				success : function(JSONData) {
 						swal("삭제되었습니다..", {
 					      icon: "success",
 					    });
 						window.location.reload();
 			    } 
 		  }); 
 		});
  		

  		$(document).on("click",'td:nth-child(4) a[name="friendMessage"]', function(){
  			var userNo = $($('input[name=userNo]')[$('td:nth-child(4) a[name="friendMessage"]').index(this)]).val();
  			var userName = $($('input[name=userName]')[$('td:nth-child(4) a[name="friendMessage"]').index(this)]).val();
  			
  			alert(userNo);
  			alert(userName);
  			$('#targetNo').val(userNo);
  			$('#toUsern').val(userName);
  			$("#modalwrite").modal('show');
  		});

  		$(document).on('click','#addMess',function(){
  			var targetNo = $('#targetNo').val();
  			var toUsern = $('#toUsern').val();
  			var modalMessageTitle = $('#modalMessageTitle').val();
  			var modalMessageContent = $('#modalMessageContent').val();
  			//modalmessage

  			if(modalMessageTitle==''| modalMessageContent==''){
  				alert('내용과 제목을 입력하세요.');			 
  			}
  			else{
  			  	$.ajax({
  					url : "/mypage/json/addMessage",
  					method : "POST" ,
  					dataType : "json" ,
  					contentType:"application/json;charset=UTF-8",
  					data : JSON.stringify({
  						"toUserNo":targetNo,
  						"fromUserNo":"${user.userNo}",
  						"messageContent":modalMessageContent,
  						"messageType":"2",
  						"messageTitle":modalMessageTitle,
  						"targetUserName":toUsern,
  						"userName":"${user.userName}"
  					}),
  					success : function(JSONData) {
  						alert("메시지가 보내기 성공.!!");
  						$('#modalwrite').modal('toggle');
  				    } 
  			   });
  			}
  		});
		</script>
	
</head>

<body>


	<!---------------------------------------사이드바--------------------------------------------------------->
	<div id="mySidenav" class="sidenav" style="font-family:'JEJUMYEONGJO';" align="left">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			
			<div class="col-xs-12" align="center" style="margin-bottom: 2em; ">
			
				<c:if test="${empty user.userImage}">
					<img name="ffriend" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" width="80px" height="80px" style="border-radius: 5%;">
				</c:if>
				<c:if test="${!empty user.userImage}">
					<img name="ffriend" src="/resources/images/userimages/${user.userImage}" style="width: 100px; height: 100px;">										  		 	 
				</c:if>
								
			</div>
			<div class="col-xs-12" align="center">
				[ 이	   름  :  ${user.userName } ]
			</div>
			
			<div class="col-xs-12" align="center" >
				<c:if test="${user.userType == 1}">
					[  유    형  :  회원  ]
				</c:if>
				<c:if test="${user.userType == 2}">
					[  유    형  :  호스트  ]
				</c:if>
				<c:if test="${user.userType == 3}">
					[  유    형  :  관리자  ]
				</c:if>
			</div>
			<div class="col-xs-12" align="center" style="margin-bottom: 4em; ">
				[ 핸드폰  : ${user.userPhone } ]
			</div>
			<div class="col-xs-12" style="background:transparent;margin-left:6vw;">
			<h3>관 리 목 록</h3>
			<hr>
			</div>
			<div class="col-xs-12" style="background:transparent;margin-left:5vw;">
			<a href="#"><h5>MESSAGE</h5></a>
			<!-- <div align="center" id="adminMessage">MESSAGE</div> -->
			<hr>
			</div>
			<div class="col-xs-12" style="background:transparent;margin-left:5vw;">
			<a href="#"><h5>USERLIST</h5></a>
			<hr>
			</div>
			<div class="col-xs-12" style="background:transparent;margin-left:5vw;">
			<a href="#"><h5>REPORT</h5></a>                       	
			<hr>
			</div>
			<div class="col-xs-12" style="background:transparent;margin-left:5vw;">
			<a href="#"><h5>REFUND</h5></a>	    	
		    </div>
		    
		    <div class="col-xs-12" style="background:transparent;">
			<a href="#"><h5>&nbsp;</h5></a>	    	
		    </div>
		    
		    <div class="col-xs-12" style="background:transparent;">
			<a href="#"><h5>&nbsp;</h5></a>	    	
		    </div>
	</div>
	
	<div id="main" style="position:fixed; z-index:1000;">

	
		<span style="font-size: 20px; font-family:'JEJUMYEONGJO'; cursor: pointer" onclick="openNav()" >&#9776;
		OPEN
		</span>
	</div>
   	
	<!---------------------------------------사이드바--------------------------------------------------------->
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="text-info text-center" style="margin-top:10vw;margin-bottom:10vw;">
	       <h3>회원목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>회원ID</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원명</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-outlined btn-light btn-sm" id="search">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <div class="jumbotron">
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="center">회원사진</th>
            <th align="left" >회원 ID</th>
            <th align="left">회원명</th>
            <th align="left">이메일</th>
            <th align="left">간략정보</th>
          </tr>
        </thead>
       
		<tbody>	
		  <c:set var="i" value="0" />
		  <c:forEach var="user" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left">
			  <c:if test="${empty user.userImage}"><img style="width:70px; height:70px; alt="" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" class="img-responsive"></c:if>
			  <c:if test="${!empty user.userImage}"><img style="width:70px; height:70px; alt="" src="/resources/images/userimages/${user.userImage}" class="img-responsive"></c:if>
			  </td>
			  <td align="left"  title="Click : 회원정보 확인">${user.userId}</td>
			  <td align="left">${user.userName}</td>
			  <td align="left">${user.userEmail}</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id="${user.userNo}"></i>
			  	<input type="hidden" name="userss" value="${user.userNo}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	</div>
 	
 	<!--  화면구성 div End /////////////////////////////////////-->
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>