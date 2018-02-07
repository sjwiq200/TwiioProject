<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>listMainPlan</title>

<meta charset="UTF-8">
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/plan.css" />

<!-- ///////////////////////////////////////////////////////////////////////// -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bttn.css/0.2.4/bttn.min.css">
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    
<!-- Bootstrap Dropdown Hover CSS -->
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">

<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!-- ---------Floating Button------------ -->
 <link href="/resources/css/floatingButton.css" rel="stylesheet" type="text/css" />

<title>MainPlanList</title>


<style>
html, body {
	width: 100%;
	height: 100%;
	background: #f4f4f4;
}

#header .inner {

	margin-top: 150px;
	margin-bottom: 70px;
	text-align: center;
	width: 100%;
	height: 100%;
/* 	background-image: url('/resources/images/dailyPlanContent/ITALY-TRENDS.jpg'); */
	
}

.col {
	background: #08708A;
}

#thumbnailMainBox {
	background: linear-gradient(-45deg, #56B1BF, transparent),
		linear-gradient(45deg, #D73A31, transparent);
	border-radius: 8px;
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
	 margin-top: 20px;
	 border-bottom: solid 1px #000000; 

}

.thumbnailClass{
	margin-top: 20px;
	margin-bottom: 20px;
	text-align: right;
	
}

#buttonBox {
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>


<script>


	$(function() {
		$("#addMainPlan").bind("click", function() {
			$("form").attr("method", "POST").attr("action","/mainplan/addMainPlan.jsp").submit();
		});
	});
	
	
	 $(function() {
			$("#update").bind("click",function() {
				alert("안녕");
				var index = $("#update").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/mainplan/updateMainPlanView?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			});
	 });
	 
	 $(function() {
			$("#delete").bind("click",function() {
				var index = $("#delete").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/mainplan/deleteMainPlan?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			});
	 })
	 
	 	 $(function() {
			$("#select").bind("click",function() {
				var index = $("#select").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/dailyplan/listDailyPlan?mainPlanNo="+mainPlanNo;
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

	 /////////////////////////친구와 공유하기 기능///////////////////////////
	$(function() {
	
		$("#shareWithFriendButton").bind("click",function() {
			var index = $("#shareWithFriendButton").index(this);
			var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
			
			var friend;
			var result ="";

			 $.ajax({
	    				url:"/dailyplan/json/listFriend?mainPlanNo="+mainPlanNo,
	    				method:"GET",	    					
	    				dataType:"json",
	    				headers : {
								"Accept" : "application/json", 
								"Content-Type" : "application/json"
							},
	    				success:function(JSONData){
	    					friend = JSONData.friendInfo;
		    					for(var i=0;i<friend.length;i++){
		    						result +='<p> [USER NO] : '+friend[i].userNo+ '</p>'
		    								+'<span>  [아이디] : '+friend[i].userId+'</span>'
		    								+'<span>  [이름] : '+friend[i].userName+'</span>'
		    								+'<span>  [성별] : '+friend[i].userGender+'</span>'
		    								+'<span>  [사진] : '+friend[i].userImage+'</span>'
		    								+'<span>&nbsp;</span>'
		    								+'<button type="button" id="sharePlan'+i+'" class="btn btn-success btn-sm" onclick="sharePlan('+friend[i].userNo+','+i+','+mainPlanNo+')">공유하기</button><p>&nbsp;</p>';
		    					}
		    				 $('#shareWithFriendList').html(result);
		    				 $('#shareWithFriend').modal('show');  
	    					}
			    });
		});
	 });
	 
	function sharePlan(userNo,i,mainPlanNo) {
			$.ajax({
	            url:'/dailyplan/json/sharePlan?userNo='+userNo+"&mainPlanNo="+mainPlanNo,
	            type:'get'
	         });
	   var a = "#sharePlan" + i;
	    $("#sharePlan"+i).remove(); 
	}
	
	
	 
</script>

</head>
<body>
		<jsp:include page="/layout/toolbar.jsp" />
	<form>
		
		<div class="container">
			
			<header id="header" class="alt">
				<div class="row">
					<div class="col-xs-10 inner">
						<h1>TWIIBOOK,</h1>
					</div>
				</div>
			</header>
			
				<!-- <h4 style="font-family:NANUMSQUAREROUNDB;" align="right">여행을 맞이하는, 설렘부터  </h4> -->

			<div class="row">
				<div  class="col-xs-1"></div>
				<div  class="col-xs-10 inner" id="thumbnailMainBox">
				  <div align="center" class="col-xs-1">&nbsp;</div> <!-- 그라디언트 보이게 해주려고 한 부분 -->
					<div class="col-xs-12 inner" id="thumbnailMainThumbBox">
						<!-- <img src="/resources/images/dailyPlanContent/lineline.png" class="img-responsive" alt="Responsive image" style="border-radius: 70%;"> -->

						<c:set var="i" value="0" />
						<c:forEach var="mainPlan" items="${list}">
							<c:set var="i" value="${ i+1 }" />

							<div class="col" id="check" >
								<div class="col-md-12">
									<div id="thumbnail">
										<div class="caption" >
										
										 <div class="row">
											   <div class="col-md-3 thumbnailClass">
										<%-- 	   ${mainPlan.mainThumbnail} --%>
												<img src="/resources/images/thumbnail_plan/main_thumbnail4.jpg" style="width: 150px; height:176px" /> 
											   </div>
											   
												<input type="hidden" name="mainPlanNo" value="${mainPlan.mainPlanNo}" /> 
												<div class="col-md-7 textArea">
													<h3>제목 : ${mainPlan.planTitle}</h3>
													<p>출발하는 날짜 : ${mainPlan.departureDate }</p>
													<p>도착하는 날짜 : ${mainPlan.arrivalDate}</p>
													<p>국가 : ${mainPlan.country}</p>
													<p>도시 : ${mainPlan.city}</p>
												</div>
											
												<div class="col-md-2" id="buttonBox" align="right">
													수정 <img src="/resources/images/dailyPlanContent/149307.png" id="update" width="25px"></p>
													삭제 <img src="/resources/images/dailyPlanContent/149147.png" id="delete" width="25px"></p>
													선택 <img src="/resources/images/dailyPlanContent/149148.png" id="select" width="25px"></p>
													공유 <img src="/resources/images/dailyPlanContent/149180.png" id="shareWithFriendButton" name="shareWithFriendButton" width="25px">
												</div>
											</div> <!--  row 끝 -->
											
										</div>
									</div>
								</div>
							</div>

						</c:forEach>
					</div>
					<div align="right" class="col-xs-1">&nbsp;</div>
				</div>
				<!-- 섬네일 전체 박스 부분 -->
				<div align="right" class="col-xs-1">&nbsp;</div>

				
					<div class="row">
							<div  class="col-xs-12 inner">
								<!-- 	<button type="button" class="btn" id="listScrap" ><Strong>Scrap</Strong></button>  -->
								<button type="button" class="btn" id="listSharedPlan">
									<Strong>친구와 공유하고 있는 플랜 보기</Strong>
								</button>
							</div>
						</div>
			</div>
			<!-- 메인 섬네일을 감싸는 row 시작부분 -->
		</div>
		
		<!--  Floating Button <START> -->
		<div id="container-floating">
			<div id="floating-button1" data-toggle="tooltip" data-placement="center" data-original-title="Create">
				<p class="letter" id="listSharedPlan">공유플랜</p>
			</div>
		</div>
		<!--  Floating Button <END> -->
		
		
		<!--  Floating Button <START> -->
		<div id="container-floating">
			<div id="floating-button" data-toggle="tooltip" data-placement="center" data-original-title="Create">
				<p class="letter1" id="addMainPlan">+</p>
			</div>
		</div>
		<!--  Floating Button <END> -->


	</form>



</body>

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
		
		
</html>