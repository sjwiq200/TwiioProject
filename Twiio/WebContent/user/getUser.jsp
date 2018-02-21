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
	<link rel="stylesheet" href="/resources/css/font.css" />
	<!--  ///////////////////////// CSS ////////////////////////// -->
	
	<style>
 		body {
            padding-top : 100px;
            background-color: #f4f4f4;
			color: #666666;
			font-family: "Source Sans Pro", Helvetica, sans-serif;
        }
        
         h1 {
			text-align: center;
		}        
        .panel {
			border: 1px solid #ddd;
			background-color: #fcfcfc;
		}
         img {
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
			#back{
         	 border-radius: 23px;
          	 border: dashed rgba(85, 176, 190, 1) 2px;
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
			    padding: 5px;
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
			
			.table-filter tr td:first-child {
			}
			.sideBarIcon{
				cursor : pointer;
				margin-left : 10px;
			}
			.sideBarIcon:hover {
			    color: #f1f1f1;
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
		
//////////////////////////////////사이드바///////////////////////////////////////
			function openNav() {
				document.getElementById("mySidenav").style.width = "300px";
				document.getElementById("main").style.marginLeft = "300px";
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
////////////////////////////////////////사이드바////////////////////////////////////
////////////////////////////////////////삭제///////////////////////////////////////
	$(document).on("click",'td:nth-child(4) span[name="friendDelete"]', function(){
 			var friendNo = $($('input[name=friendNo]')[$('td:nth-child(4) span[name="friendDelete"]').index(this)]).val();
 			$.ajax({
 				url : "/common/json/deleteFriend/"+friendNo,
 				method:"GET",
 				dataType:"json",
 				headers :{
 					"Accept" : "application/json",
 					"Content-Type" : "application/json"
 				},		
 				success : function(JSONData) {
 						swal("삭제되었습니다.", {
 					      icon: "success",
 					    });
 						alert("삭제 성공");
 						window.location.reload();
 			    },error : function(request,error){
 			    	alert(에러);
 			    }
 		  }); 
 		});
////////////////////////////////////////////////////////////////////////////////////  		
////////////////////////////////////////////friendMessage///////////////////////////
  		$(document).on("click",'td:nth-child(4) span[name="friendMessage"]', function(){
  			var userNo = $($('input[name=userNo]')[$('td:nth-child(4) span[name="friendMessage"]').index(this)]).val();
  			var userName = $($('input[name=userName]')[$('td:nth-child(4) span[name="friendMessage"]').index(this)]).val();
  			$('#targetNo2').val(userNo);
  			$('#toUsern2').val(userName);
  			$("#modalwrite2").modal('show');
  		});

  		$(document).on('click','#addMess2',function(){
  			var targetNo = $('#targetNo2').val();
  			var toUsern = $('#toUsern2').val();
  			var modalMessageTitle = $('#modalMessageTitle2').val();
  			var modalMessageContent = $('#modalMessageContent2').val();
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
  						$('#modalwrite2').modal('toggle');
  				    } 
  			   });
  			}
  		});
  		
  		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				var userNo = $($('input[name=userNo]')[$('td:nth-child(2)').index(this)] ).val();
				window.open("/user/getProfile2?userNo="+userNo,"getProfile2","width=500, height=650,status=no, scrollbars=no, location=no");
				//self.location ="/user/getProfile2?userNo="+userNo; 
			});
		});
//////////////////////////////////////////////////////////////////////////////////////////////
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!---------------------------------------사이드바--------------------------------------------------------->
	<div id="mySidenav" class="sidenav" style="font-family:'JEJUMYEONGJO';">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			
			<div class="col-xs-12" align="center" style="margin-bottom: 2em; ">
			
				<c:if test="${empty user.userImage}">
					<img src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" width="80px" height="80px" style="border-radius: 5%;">
				</c:if>
				<c:if test="${!empty user.userImage}">
					<img src="/resources/images/userimages/${user.userImage}" style="width: 100px; height: 100px;">										  		 	 
				</c:if>
								
			</div>
			<div class="col-xs-9 col-xs-offset-2" align="left">
				[ 이	   름  :  ${user.userName } ]
			</div>
			
			<div class="col-xs-9 col-xs-offset-2" align="left" >
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
			<div class="col-xs-9 col-xs-offset-2" align="left"style="margin-bottom: 4em; ">
				[ 핸드폰  :  ${user.userPhone } ]
			</div>
			<div class="col-xs-12" style="background:transparent;">
			
			<table class="table table-filter" style="align-content: center;">
				<thead>
				<h3 align = "center">친  구</h3>
					<tr data-status="pagado">
					    <th align="center" >No</th>
					    <th align="left" >사진</th>
					    <th align="left" >Friend</th>
					    <th align="left" >쪽지/삭제</th>
					</tr>
					</thead>					
					<tbody>
					<c:set var="i" value="0" />
					<c:forEach var="friend" items="${listFriend}">								    
						<c:set var="i" value="${ i+1 }"/>
						<input type="hidden" id="friendNo" name="friendNo" value="${friend.profilePublic}"/>
						<input type="hidden" id="userNo" name="userNo" value="${friend.userNo}"/>
						<input type="hidden" id="userName" name="userName" value="${friend.userName}"/>
						<tr data-status="pagado">
						<div class="media-body">
						<td align="pull-right">${ i }</td>
						<td align="left">
							<c:if test="${empty friend.userImage}">
								<img src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" style="width: 40px; height: 40px;" class="img-responsive">
							</c:if>
							<c:if test="${!empty friend.userImage}">
								<img src="/resources/images/userimages/${friend.userImage}" class="img-responsive" style="width: 40px; height: 40px;">										  		 	 
							</c:if>
						</td>
						<td align="left">
							${friend.userName}
						</td>
						<td align="left" class="row">
								<!-- <div href="#" role="button" name="friendMessage" style="max-width : 40%;" ><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></div>
								<div href="#"  role="button" name="friendDelete" style="max-width : 40%;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></div> -->
							<span class="glyphicon glyphicon-envelope sideBarIcon" name="friendMessage" aria-hidden="true"></span>
							<span class="glyphicon glyphicon-remove sideBarIcon" name="friendDelete" aria-hidden="true"></span>
						
						</td>
						</div>
						</tr>
					</c:forEach>
				</tbody>							
				</table>
				
		    </div>
	</div>
	
	<div id="main" style="position:fixed; z-index:1000;">

	
		<span style="font-size: 20px; font-family:'JEJUMYEONGJO'; cursor: pointer" onclick="openNav()" >&#9776;
		OPEN
		</span>
	</div>
   	
	<!---------------------------------------사이드바--------------------------------------------------------->
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		

		<div class="panel panel-default" id="back">	
		<div class="col-md-10 col-md-offset-1">
		<div class="page-header">
			<div class="row">
	       <h1 style="font-family: 'Jeju Gothic', serif; ">회원상세정보</h1>
	       </div>
	       <div class="row" align="center">
	       <h5 class="text-muted"  style="font-family: 'Jeju Gothic', serif;">내 정보를 <strong class="text-danger"  style="font-family: 'Jeju Gothic', serif;" >최신정보로 관리</strong>해 주세요.</h5>
	    	</div>
	    </div>
		<div class="profile-userpic ">

		<c:if test="${empty user.userImage}"><img style="width:200px; height:200px; alt="" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" class="img-responsive"></c:if>
		<c:if test="${!empty user.userImage}"><img style="width:200px; height:200px; alt="" src="/resources/images/userimages/${user.userImage}" class="img-responsive"></c:if>

		</div>
		
		<div class="col-sm-12">
				
				<br/><br/><br/>
				
			<div class="col-sm-6">
			
				<div class="col-sm-12">
				
				<div class="row">
			  		<div class="col-sm-4 col-sm-offset-2"><strong>이 름</strong></div>
					<div class="col-sm-4">${user.userName}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-4 col-sm-offset-2"><strong>휴대전화번호</strong></div>
					<div class="col-sm-4">${ !empty user.userPhone?user.userPhone :''}	</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-4 col-sm-offset-2"><strong>이 메 일</strong></div>
					<div class="col-sm-4">${user.email}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-4 col-sm-offset-2"><strong>계좌번호</strong></div>
					<div class="col-sm-4">${user.userAccount}</div>
				</div>
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-4 col-sm-offset-2"><strong>은행명</strong></div>
					<div class="col-sm-4">${user.userBank}</div>
				</div>
				
				<br/>
				
				</div>
				
			</div>
				
			<div class="col-sm-6">
			
				<div class="col-sm-12">
				
				<div class="row">
			  		<div class="col-sm-4 col-sm-offset-2"><strong>유 형</strong></div>
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
			  		<div class="col-sm-4 col-sm-offset-2"><strong>평 점<br/>(참석/프로필)</strong></div>
					<div class="col-sm-4">${empty user.userEval?0:user.userEval} | ${empty user.userEvalCredit?0:user.userEvalCredit}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-4 col-sm-offset-2"><strong>성별</strong></div>
					<div class="col-sm-4">${user.userGender}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-4 col-sm-offset-2"><strong>생년월일</strong></div>
					<div class="col-sm-4">${user.userBirthday}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-sm-4 col-sm-offset-2"><strong>가입일자</strong></div>
					<div class="col-sm-4">${user.regDate}</div>
				</div>
				
				<br/>
				
					</div>
				
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
			
			<div class="row">&nbsp;</div>	
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			</div>
				
			
		<br/> 
		
		</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
 	
 	<div class="modal fade" id="modaldelete" role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    	<div class="modal-content">
          <div class="modal-header">
          <input type="hidden" id="mesgNo" name="mesgNo" val=""/>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      	</div>
          <div class="modal-body">
       	  	<div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div> 
      	  </div>
          <div class="modal-footer ">
            <button type="button" class="btn btn-success" id="modalDeleteMessage" name="modalDeleteMessage"><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      	  </div>
        </div>
  	  </div>
     </div>

		<div class="modal fade" id="modalwrite2" role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
    	<div class="modal-dialog">
    		<div class="modal-content">
          		<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        			<h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      			</div>
          	<div class="modal-body">
          			<input class="hidden" name="targetNo2" id="targetNo2" type="text" value="">
          		<div class="form-group">
       				<input class="form-control" name="toUsern2" id="toUsern2" type="text" value="" readonly>
        		</div>
        		<div class="form-group"> 
        			<input class="form-control" name="modalMessageTitle2" id="modalMessageTitle2" type="text" value="" placeholder="제목을 작성하여 주세요.">
        		</div>
        		<div class="form-group">
        			<textarea rows="4" class="form-control" name="modalMessageContent2" id="modalMessageContent2" value="" placeholder="내용을 작성하여 주세요."></textarea>
        		</div>
        	</div>
         	<div class="modal-footer ">
        		<button type="button" class="btn2 btn-warning btn-lg" id="addMess2" name="addMess2" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> SEND</button>
      		</div>
        	</div>
  	   </div>
	   </div>

</body>
</html>