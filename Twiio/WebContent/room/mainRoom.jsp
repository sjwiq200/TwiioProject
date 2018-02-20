<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="UTF-8">

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

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


	<!-- jQuery UI toolTip 사용 CSS-->

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!--  ///////////////////////// add,updateRoom.css ////////////////////////// -->
	<link href="/resources/css/add,updateRoom.css" rel="stylesheet" type="text/css"/>

	<!--  ///////////////////////// CSS ////////////////////////// -->


     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

		//============= "가입"  Event 연결 =============
		 $(function() {
			$( "button" ).on("click" , function() {
				self.location = "/room/listRoom";
			});
		});


		$(function() {
			$("a:contains('참여 방목록')").on("click" , function() {
				$(self.location).attr("href","/room/listMyRoom");
			});
		});

		$(function() {
			$( "a:contains('일정 목록')" ).on("click" , function() {
				$(self.location).attr("href","/schedule/listSchedule");
			});
		});
		
		
		


	</script>

</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

	<div class="jumbotron" style="margin-top:15%;">	

		<!-- <h1 class="bg-primary text-center">채팅방 생성 </h1> -->
		<h2 class="text-center" style="color:#08708A; font-size: 5em;"><strong>TwiiChat</strong></h2>
		<div class="panel-body" >
			<div class="row">
				<div class="col-md-12 text-center">
					<button type="button" class="btn btn-outlined btn-light btn-sm" style="width: 50%;" >방 목 록</button>
				</div>
				<c:if test="${!empty user}">
					<div class="col-md-12 text-center">
						<a class="btn btn-outlined btn-theme btn-sm" href="#" role="button" style="width: 50%; margin-top: 5%;">참여 방목록</a>
					</div>
					<div class="col-md-12 text-center">
						<a class="btn btn-outlined btn-theme btn-sm" href="#" role="button" style="width: 50%; margin-top: 5%;">일정 목록</a>
					</div>
				</c:if>
			</div>
		</div>
		<!-- form Start /////////////////////////////////////-->
 	</div>
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>
