<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
  
<title>MainPlanList</title>


<style>
body {
	padding-top: 100px;
}
</style>
<script>
	 
</script>

</head>
<body>

	<jsp:include page="/layout/toolbar.jsp" />
	<form class="form-horizontal">

		<div class="container">

			<div align="center">
				<h1>
					DAY :<strong>${dailyPlan.day}</strong>
				</h1>
				<h5>
					DailyDate : ${dailyPlan.dailyDate}
					</h4>
					<h5>
						DailyCity : ${dailyPlan.dailyCity}
						</h4>
			</div>

			<div class="PlanContentList" align="center">

				<c:set var="i" value="0" />
				<c:forEach var="planContent" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<input type="hidden" name="planContentNo" value="${planContentNo}" />
					<ul>
						<h3>No : ${ i }</h3>
						<li>콘텐츠 번호 : ${contentNo}</li>
						<li>데일리플랜번호 : ${dailyPlan.dailyPlanNo}</li>
						<li>스크랩번호 : ${scrap.scrapNo }</li>
						<li>콘텐츠타입 : ${contentType}</li>
						<li>루트 : ${route}</li>
						<li>출발지 : ${departureLocation}</li>
						<li>도착지 : ${arrivalLocation}</li>
						<li>소요시간 : ${estimatedTime}</li>
						<li>이동방법 : ${routeType}</li>
						<li>길찾기결과 : ${routeDescription}</li>
						<li>순서 : ${orderNo}</li>
						<li>텍스트 : ${contentText}</li>
						<li>이미지 : ${contentImage}</li>
						<li></li>
					</ul>
				</c:forEach>

				<img
					src="/resources/images/icon/plan/daily-plan-content-plus-icon.jpeg"
					height="40" width="40" id="plus" />
				<div></div>
				
			

				<div>
				
						<button type="button" class="btn" data-toggle="modal" data-target="#myModal">Text</button>
		
						<!-- Modal -->
						<div class="modal fade" id="myModal" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title"><Strong>T E X T</Strong></h4>
												<h7 class="modal-title">TWIIO</h7>
										</div>
										<div class="modal-body">
											<jsp:include page="/dailyplan/addText.jsp" >
												<jsp:param name="data" value="${dailyPlan.dailyPlanNo}"/> 
											</jsp:include>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
						</div>
					
					
					
				</div>
			</div>
		</div>
	</form>
</body>
</html>