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
	

	 $(function() {
			$("button:contains('����')").bind("click",function() {
				var index = $("button:contains('����')").index(this);
				var scrapNo = $($("input[name='scrapNo']")[index]).val();
				alert(scrapNo);
				/* $("form").attr("method", "GET").attr("action","/mainPlan/deleteScrap?scrapNo="+scrapNo).submit(); */
				var url = "/mainplan/deleteScrap?scrapNo="+scrapNo;
				$(location).attr('href', url); 
			});
	 })
	 
	 	 $(function() {
			$("button:contains('����')").bind("click",function() {
				var index = $("button:contains('����')").index(this);
				var scrapNo = $($("input[name='scrapNo']")[index]).val();
				var url = "/mainplan/getScrap?scrapNo="+scrapNo;
				$(location).attr('href', url);
			});
	 })
	 
	 $(function(){
		 $("#listScrap").bind("click",function(){
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
			
			<div class = "scrapList" align = "center">
			
				  <c:set var="i" value="0" />
				  	<c:forEach var="scrap" items="${list}">
				  		<c:set var="i" value="${ i+1 }" />
				  		
				  			 <input type="hidden" name="scrapNo" value="${scrap.scrapNo}" />
				  			<ul>
								<li>[${ i }]</li>
								<li>��ũ����ȣ : ${scrap.scrapNo}</li>
								<li>������ȣ : ${scrap.user.userNo}</li>
								<li>�����÷���ȣ : ${scrap.mainPlan.mainPlanNo }</li>
								<li>Ŀ�´�Ƽ��ȣ : ${scrap.community.communityNo}</li>
								<li>��ũ������ : ${scrap.scrapTitle}</li>
								<li>��ũ������ : ${scrap.scrapContent}</li>
								<li>��ũ������ : ${scrap.scrapType}</li>
								<li> </li>
								
								<button type="button" class="btn btn-default" aria-label="Right Align">
									<span class="glyphicon glyphicon-ok" aria-hidden="true" id="delete"></span>����
								</button>
								 
								<button type="button" class="btn btn-default" aria-label="Right Align">
									<span class="glyphicon glyphicon-ok" aria-hidden="true"	id="submit"></span>����
								</button>
	
						
	
						</ul>
				  	 </c:forEach>
				
					</div>
	
			</div>
		</div>
	</form>
</body>
</html>