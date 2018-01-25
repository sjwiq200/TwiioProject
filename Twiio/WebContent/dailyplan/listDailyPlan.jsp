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

<title>MainPlanList</title>

<script>
	function fncAddMainPlanList() {
		$("form").attr("method", "POST").attr("action","/mainplan/addMainPlan.jsp").submit();
	}

	$(function() {
		$("button:contains('추가')").on("click", function() {
			fncAddMainPlanList();
		});
	});
	 
	 	 $(function() {
			$("button:contains('선택')").bind("click",function() {
				var index = $("button:contains('선택')").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/dailyplan/listDailyPlan?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			});
	 })
 
</script>

</head>
<body>

	<form class="form-horizontal">
	
		<div class="container">

			<div class = "mainPlanList" align = "center">
			
				  <c:set var="i" value="0" />
				  	<c:forEach var="dailyPlan" items="${list}">
				  		<c:set var="i" value="${ i+1 }" />
				  			 <input type="hidden" name="dailyPlanNo" value="${dailyPlan.dailyPlanNo}" />
				  			<ul>
								<h3>DAY${ i }</h3>
								<li>데일리플랜번호 : ${dailyPlan.dailyPlanNo}</li>
								<li>메인플랜번호 : ${dailyPlan.mainPlan.mainPlanNo}</li>
								<li>유저번호 : ${dailyPlan.user.userNo }</li>
								<li>데일리날짜 : ${dailyPlan.dailyDate}</li>
								<li>도시명 : ${dailyPlan.dailyCity}</li>
								<li>국가명 : ${dailyPlan.dailyCountry}</li>
								<li> </li>
							<div class="pageButton-group" align="center">
								<button type="button" class="btn btn-default" aria-label="Right Align">
									<span class="glyphicon glyphicon-ok" aria-hidden="true"	id="submit"></span>선택
								</button>
							</div>
	
						</ul>
				  	 </c:forEach>
			
			
				<div class="pageButton-group" align="center">
					<button type="button" class="btn btn-default" aria-label="Right Align">
						<span class="glyphicon glyphicon-ok" aria-hidden="true" id="submit"></span>추가
					</button>
				</div>
	
	
			</div>
		</div>
	</form>
</body>
</html>