<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>MainPlanList</title>


<style>

body {
    padding-top : 50px;
}

</style>


<script>


	//��ư TEST//

	
	

	////////////
	
	
	function fncAddMainPlanList() {
		$("form").attr("method", "POST").attr("action","/mainplan/addMainPlan.jsp").submit();
	}

	$(function() {
		$("button:contains('�߰�')").on("click", function() {
			fncAddMainPlanList();
		});
	});
	
	
	 $(function() {
			$("button:contains('����')").bind("click",function() {
				var index = $("button:contains('����')").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/mainplan/updateMainPlanView?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			});
	 });
	 
	 $(function() {
			$("button:contains('����')").bind("click",function() {
				var index = $("button:contains('����')").index(this);
				var scrapNo = $($("input[name='scrapNo']")[index]).val();
				alert(scrapNo);
				var url = "/mainplan/deleteScrap?scrapNo="+scrapNo;
				$(location).attr('href', url);
			});
	 })
	 
	 	 $(function() {
			$("button:contains('����')").bind("click",function() {
				var index = $("button:contains('����')").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/dailyplan/listDailyPlan?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			});
	 })
	 
	 $(function(){
		 $("#listScrap").bind("click",function(){
			 alert("�ȳ�");
			 var url = "/mainplan/listScrap";
			 $(location).attr('href', url);
		 })
	 })
 
</script>

</head>
<body>
	
		<jsp:include page="/layout/toolbar.jsp" />
		

	<form class="form-horizontal">
		
		<div class="container">
			
				
			<div class = "mainPlanList" align = "center">
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			<button type="button" class="btn" id="listScrap"><Strong>Scrap</Strong></button> 
			<div> �� </div>
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			
				  <c:set var="i" value="0" />
				  	<c:forEach var="mainPlan" items="${list}">
				  		<c:set var="i" value="${ i+1 }" />
				  		
				  			 <input type="hidden" name="mainPlanNo" value="${mainPlan.mainPlanNo}" />
				  			
								<div>[${ i }]</div>
								<div>�÷���ȣ : ${mainPlan.mainPlanNo}</div>
								<div>������ȣ : ${mainPlan.user.userNo}</div>
								<div>����� : ${mainPlan.departureDate }</div>
								<div>������ : ${mainPlan.arrivalDate}</div>
								<div>������ : ${mainPlan.country}</div>
								<div>���ø� : ${mainPlan.city}</div>
								<div>�÷����� : ${mainPlan.planTitle}</div>
								<div>�������̹��� : ${mainPlan.mainThumbnail}</div>
														
							<div class="pageButton-group" align="center">
								<button type="button" class="btn btn-default" aria-label="Right Align">
									<span class="glyphicon glyphicon-ok" aria-hidden="true"	id="update"></span>����
								</button>
								
								<button type="button" class="btn btn-default" aria-label="Right Align">
									<span class="glyphicon glyphicon-ok" aria-hidden="true" id="delete"></span>����
								</button>
								
								<button type="button" class="btn btn-default" aria-label="Right Align">
									<span class="glyphicon glyphicon-ok" aria-hidden="true"	id="submit"></span>����
								</button>
			
							</div>
	
							<div> �� </div>
				  	 </c:forEach>
			
			
				<div class="pageButton-group" align="center">
					<button type="button" class="btn btn-default" aria-label="Right Align">
						<span class="glyphicon glyphicon-ok" aria-hidden="true" id="submit"></span>�߰�
					</button>
				</div>
	
	
			</div>
		</div>
	</form>
</body>
</html>