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

/*	function fncUpdateMainPlanList() {
		$("form").attr("method", "POST").attr("action","/mainplan/updateMainPlanView").submit();
	}

	$(function() {
		$("button:contains('수정')").on("click", function() {
			fncUpdateMainPlanList();
		});
	});
*/	
/*	function fncDeleteMainPlanList() {
		$("form").attr("method", "POST").attr("action","/mainplan/deleteMainPlan").submit();
	}

	$(function() {
		$("button:contains('삭제')").on("click", function() {
			fncDeleteMainPlanList();
		});
	});
*/
	 $(function() {
			$("button:contains('수정')").bind("click",function() {
				var index = $("button:contains('수정')").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/mainplan/updateMainPlanView?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			});
	 });
	 
	 $(function() {
			$("button:contains('삭제')").bind("click",function() {
				var index = $("button:contains('삭제')").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/mainplan/deleteMainPlan?mainPlanNo="+mainPlanNo;
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
				  	<c:forEach var="mainPlan" items="${list}">
				  		<c:set var="i" value="${ i+1 }" />
				  		
				  			 <input type="hidden" name="mainPlanNo" value="${mainPlan.mainPlanNo}" />
				  			<ul>
								<li>[${ i }]</li>
								<li>플랜번호 : ${mainPlan.mainPlanNo}</li>
								<li>유저번호 : ${mainPlan.user.userNo}</li>
								<li>출발일 : ${mainPlan.departureDate }</li>
								<li>도착일 : ${mainPlan.arrivalDate}</li>
								<li>국가명 : ${mainPlan.country}</li>
								<li>도시명 : ${mainPlan.city}</li>
								<li>플랜제목 : ${mainPlan.planTitle}</li>
								<li>섬네일이미지 : ${mainPlan.mainThumbnail}</li>
								<li> </li>
								
						
							<div class="pageButton-group" align="center">
								<button type="button" class="btn btn-default" aria-label="Right Align">
									<span class="glyphicon glyphicon-ok" aria-hidden="true"	id="update"></span>수정
								</button>
								
								<button type="button" class="btn btn-default" aria-label="Right Align">
									<span class="glyphicon glyphicon-ok" aria-hidden="true" id="delete"></span>삭제
								</button>
								
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