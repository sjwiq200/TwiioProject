<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>MainPlanList</title>

<style>

	body {
	    padding-top : 50px;
	}

</style>

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
			var dailyPlanNo = $($("input[name='dailyPlanNo']")[index]).val();
			var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
			var url = "/dailyplan/getDailyPlan?dailyPlanNo="+dailyPlanNo+"&mainPlanNo="+mainPlanNo;
			$(location).attr('href', url);
		});
	 })
	 
	 $(function() {
		$("input[name='citySelectButton']").bind("click",function() {
			
			var index = $("input[name='citySelectButton']").index(this);
			var order = $($("input[name='citySelectButton']")[index]).attr("id");
			$($("input[name='citySelectButton']")[index]).attr('class','btn btn-primary');
			var dailyPlanNo4city = $($("input[name='dailyPlanNo']")[order]).val()-1 ;
			var cityName = $($("input[name='citySelectButton']")[index]).val();
			var cityNameEnc = encodeURI(encodeURIComponent(cityName));
			
			  $.ajax({
                  url:'/dailyplan/json/selectCity?dailyPlanNo4city='+dailyPlanNo4city+'&cityName='+cityNameEnc,
                  type:'get'
               });
			  $($("input[name='citySelectButton']")[index]).remove();
			
		});
	 })
 
</script>

</head>
<body>

	<jsp:include page="/layout/toolbar.jsp" />
	
	<form class="form-horizontal">
	
		<div class="container">

			<div class = "mainPlanList" align = "center">
			
				<ul class="list-group">
				
				  <c:set var="i" value="0" />
				  	<c:forEach var="dailyPlan" items="${list}">
				  		<c:set var="i" value="${ i+1 }" />
				  		
				  		<li class="list-group-item">
				  		
				  			  <input type="hidden" name="dailyPlanNo" value="${dailyPlan.dailyPlanNo}" />
				  			  <input type="hidden" name="mainPlanNo" value="${dailyPlan.mainPlan.mainPlanNo}" />
				  			  
								<h3>DAY${ i }</h3>
								<p>데일리플랜번호 : ${dailyPlan.dailyPlanNo}</p>
								<p>메인플랜번호 : ${dailyPlan.mainPlan.mainPlanNo}</p>
								<p>유저번호 : ${dailyPlan.user.userNo }</p>
								<p>데일리날짜 : ${dailyPlan.dailyDate}</p>
								<p>도시명 : ${dailyPlan.dailyCity}</p>
								<p>국가명 : ${dailyPlan.dailyCountry}</p>
								<p></p>
								
								<c:if test="${empty dailyPlan.dailyCity}">
									<c:set var="num" value="0" />
										<c:forEach var="cityList" items="${cityList}">
											<c:set var="num" value="${ num+1 }" />
											<div class="btn-group" role="group" id="cityButtonGroup">
											 	<input type="button" name="citySelectButton" id="${i}" class="btn btn-primary" value="${cityList}"/>
											</div>
										</c:forEach>
								</c:if>
								<p></p>
								
								<button type="button" class="btn btn-default" aria-label="Right Align">
									<span class="glyphicon glyphicon-ok" aria-hidden="true"	id="submit"></span>선택
								</button>
	
						</li>
				  	 </c:forEach>
				</ul>
			</div>
		</div>
	</form>
</body>
</html>