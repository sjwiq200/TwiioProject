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


<style>
body {
    padding-top : 50px;
}
</style>


<script>
	

	 $(function() {
			$("button:contains('삭제')").bind("click",function() {
				var index = $("button:contains('삭제')").index(this);
				var scrapNo = $($("input[name='scrapNo']")[index]).val();
				alert(scrapNo);
				/* $("form").attr("method", "GET").attr("action","/mainPlan/deleteScrap?scrapNo="+scrapNo).submit(); */
				var url = "/mainplan/deleteScrap?scrapNo="+scrapNo;
				$(location).attr('href', url); 
			});
	 })
	 
	 	 $(function() {
			$("button:contains('선택')").bind("click",function() {
				var index = $("button:contains('선택')").index(this);
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
								<li>스크랩번호 : ${scrap.scrapNo}</li>
								<li>유저번호 : ${scrap.user.userNo}</li>
								<li>메인플랜번호 : ${scrap.mainPlan.mainPlanNo }</li>
								<li>커뮤니티번호 : ${scrap.community.communityNo}</li>
								<li>스크랩제목 : ${scrap.scrapTitle}</li>
								<li>스크랩내용 : ${scrap.scrapContent}</li>
								<li>스크랩유형 : ${scrap.scrapType}</li>
								<li> </li>
								
								<button type="button" class="btn btn-default" aria-label="Right Align">
									<span class="glyphicon glyphicon-ok" aria-hidden="true" id="delete"></span>삭제
								</button>
								 
								<button type="button" class="btn btn-default" aria-label="Right Align">
									<span class="glyphicon glyphicon-ok" aria-hidden="true"	id="submit"></span>선택
								</button>
	
						
	
						</ul>
				  	 </c:forEach>
				
					</div>
	
			</div>
		</div>
	</form>
</body>
</html>