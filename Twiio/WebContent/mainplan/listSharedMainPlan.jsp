<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="/resources/css/plan-listMainPlan.css" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>MainPlanList</title>


<style>
html, body {
	width: 100%;
	height: 100%;
	background-image:url("/resources/images/dailyPlanContent/friendBack.jpg");
	background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: top;  
    background-size: 1168px 380px;
    border-radius: 10%;
}

#header .inner {
	margin-top: 150px;
	text-align: center;
	width: 100%;
	height: 100%;
}

#thumbnailMainBox {
	background: linear-gradient(-45deg, #56B1BF, transparent),
		linear-gradient(45deg, #D73A31, transparent);
	border-radius: 8px;
	border-color:#000000;
	border-width:10px;
	display: inline-block;
	padding: 1px;
	text-decoration: none;
}

#thumbnailMainThumbBox {
	background: #fff;
	display: inline-block;
	border-radius: 6px;
}

.textArea {
	 margin-top: 80px;
	 border-bottom: solid 1px #000000; 
}

.thumbnailClass{
	margin-top: 20px;
	margin-bottom: 20px;
	text-align: right;
}


.mainBackImage {
	background-image: url("/resources/images/dailyPlanContent/daum_gallery_photo_20160913155706.jpg");
	opacity: 0.3;
}


</style>


<script>

	
	function fncAddMainPlanList() {
		$("form").attr("method", "POST").attr("action","/mainplan/addMainPlan.jsp").submit();
	}

	$(function() {
		$("#addMainPlan").bind("click", function() {
			fncAddMainPlanList();
		});
	});
	
	
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
	 
	 	  $(function() {
			$(".select").bind("click",function() {
				var index = $(".select").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/dailyplan/getDailyPlanFromMain?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			});
	 })
	 
	 
	 $(function(){
		 $("#listScrap").bind("click",function(){
			 var url = "/mainplan/listScrap";
			 $(location).attr('href', url);
		 })
	 })
 
	 $(function(){
		 $("#listSharedPlan").bind("click",function(){
			 var url = "/mainplan/listSharedPlan";
			 $(location).attr('href', url);
		 })
	 })
	 
	 $(function(){
		 $("#listMainPlan").bind("click",function(){
			 var url = "/mainplan/listMainPlan";
			 $(location).attr('href', url);
		 })
	 })

	 
	
	 
</script>

</head>
<body>
		<jsp:include page="/layout/toolbar.jsp" />

	<form>

		<div class="container">
			<header id="header" class="alt">
			<div class="row">
				<div class="col-xs-10 inner">
					<p style="font-family: Pacifico; color:white;" align="center">TWIIBOOK with
						your friend,</p>
				</div>
			</div>
			<p
				style="font-family: TYPO_JEONGJOL; color:white; font-size: 1.5em; margin-bottom: 70px;"
				align="center">친구와 함께라면 어디든 좋아</p>
			</header>
			
				<div class="row" style="font-family:'TYPO_JEONGJOL';">
							<div  class="col-md-offset-4 col-md-4" align="center">
								<button type="button" class="btn" id="listMainPlan">
									<Strong>나의 트위북으로 돌아가기</Strong>
								</button>
							</div>
				</div>
				
			<div class="row" style="font-family: 'TYPO_JEONGJOL';">
				<div class="col-xs-12 inner" id="thumbnailMainBox">
					<div align="center" class="col-xs-1">&nbsp;</div><!-- 그라디언트 보이게 해주려고 한 부분 -->
					<div class="col-xs-12 inner" id="thumbnailMainThumbBox">

						<c:set var="i" value="0" />
						<c:forEach var="mainPlan" items="${list}">
							<c:set var="i" value="${ i+1 }" />

							<div class="col">

								<div class="col-md-12">
									<div class="thumbnail">
											<div class="caption" >

										<div class="caption">
										 <div class="row">
										 	<div class="col-md-5 thumbnailClass">
										 	<img
														src="/resources/images/thumbnail_plan/${mainPlan.mainThumbnail}"
														style="width: 300px; height: 250px; display: block; border-radius: 2%;"
														class="img-responsive" alt="Responsive image" />
											</div>
											<input type="hidden" name="mainPlanNo" value="${mainPlan.mainPlanNo}" />
											<div class="col-md-6 textArea">
													<div class="col-md-8 select">
													<h2> ${mainPlan.planTitle}</h2>
													<p> ${mainPlan.departureDate } ~ ${mainPlan.arrivalDate}</p>
													<p><Strong>국가</Strong> ${mainPlan.country}</p>
													<p><Strong>도시</Strong>: ${mainPlan.city}</p>
													</div>
													<div class="col-md-4" align="right" style="margin-top: 35px; font-family:'JEJUGOTHIC'">
														<!-- <button type="button" class="btn btn-default">공유</button><br/>
														<button type="button" class="btn btn-default">수정</button><br/>
														<button type="button" class="btn btn-default">삭제</button> -->
														</div>
												</div>
											<div class="col-md-1" id="buttonBox" align="right">

											</div>
										</div>
									</div>
								</div>
								
							</div>
					</div>
					</c:forEach>

				</div>
				<div align="right" class="col-xs-1">&nbsp;</div>
			</div>
			<!-- 섬네일 전체 박스 부분 -->
		</div>

		<!---------- ShareWithFriend Dialog <START>------------->

		<div class="modal fade" id="shareWithFriend" role="dialog">
			<div class="modal-dialog modal-md">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<Strong>나의 플랜 북을 친구들과 공유할까요?</Strong>
						</h4>
						<h7 class="modal-title">TWIIO</h7>
					</div>

					<div class="modal-body" align="center">
						
						<div id="shareWithFriendList" > </div>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<!---------- ShareWithFriend Dialog <END>------------->
    
    
    
	
			
		</div>
	</form>
</body>
</html>