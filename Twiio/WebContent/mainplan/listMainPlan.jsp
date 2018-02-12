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
<link rel="stylesheet" href="/resources/css/plan-listMainPlan.css" />

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
 
  <!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="/resources/css/font.css" />

<title>MainPlanList</title>


<style>
html, body {
	width: 100%;
	height: 100%;
	background: #f4f4f4;
}

#header .inner {
	margin-top: 150px;
	text-align: center;
	width: 100%;
	height: 100%;
}

#floating-button{
	opacity: 0.8;
}


#thumbnailMainBox {
	min-height: 1500px;
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
	min-height: 1500px;
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

#buttonBox {
	margin-top: 40px;
	margin-top: 40px;
}

.mainBackImage {
	background-image: url("/resources/images/dailyPlanContent/daum_gallery_photo_20160913155706.jpg");
	opacity: 0.3;
}

/* //////////////////eunae_modal////////////////////////// */
		.content h1 {
			text-align: center;
		}
		.panel {
			border: 1px solid #ddd;
			background-color: #fcfcfc;
		}
		.table-filter {
			background-color: #fff;
			font-size: 15px;
		}
		.table-filter tbody tr:hover {
			cursor: pointer;
		}
		.table-filter tbody tr td {
			padding: 10px;
			vertical-align: middle;
			border-top-color: #FFF;
		}
		.table-filter tbody tr.selected td {
			background-color: #eee;
		}
		.table-filter tr td:first-child {
			width: 60px;
		}
		.media-photo{
		  float: none;
		  margin: 0 auto;
		  -webkit-border-radius: 50% !important;
		  -moz-border-radius: 50% !important;
		  border-radius: 50% !important;
		  border: 1px solid;
		}
		

</style>


<script>


	$(function() {
		$("#addMainPlan").bind("click", function() {
			$("form").attr("method", "POST").attr("action","/mainplan/addMainPlan.jsp").submit();
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
			$("button:contains('선택')").bind("click",function() {
				var index = $("button:contains('선택')").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/dailyplan/getDailyPlanFromMain?mainPlanNo="+mainPlanNo;
				/* var url = "/dailyplan/getDailyPlan?mainPlanNo="+mainPlanNo+"&dailyPlanNo="+dailyPlanNo; */
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

	 /////////////////////////친구와 공유하기 기능///////////////////////////
	$(function() {
	
		$("button:contains('공유')").bind("click",function() {
			var index = $("button:contains('공유')").index(this);
			var mainPlanNo = $($("input[name='mainPlanNo']")[index-1]).val();
			
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
			    					/* for(var i=0;i<friend.length;i++){
			    						result +='<p> [USER NO] : '+friend[i].userNo+ '</p>'
			    								+'<span>  [아이디] : '+friend[i].userId+'</span>'
			    								+'<span>  [이름] : '+friend[i].userName+'</span>'
			    								+'<span>  [성별] : '+friend[i].userGender+'</span>'
			    								+'<span>  [사진] : '+friend[i].userImage+'</span>'
			    								+'<span>&nbsp;</span>'
			    								+'<button type="button" id="sharePlan'+i+'" class="btn btn-success btn-sm" onclick="sharePlan('+friend[i].userNo+','+i+','+mainPlanNo+')">공유하기</button><p>&nbsp;</p>';
			    					} */
			    					
			    					for(var i=0;i<friend.length;i++){
			    						
			    						result +='<div class="col-sm-3 col-sm-offset-1" ><img src="'+friend[i].userImage+'"style="width: 32px; height: 32px;" class="media-photo"></div>'+
			    									'<div class="col-sm-5 "  style="padding-top: 8px;" >'+friend[i].userName+'</div>'+
			    									'<button type="button" id="sharePlan'+i+'" class="btn btn-primary btn-sm" onclick="sharePlan('+friend[i].userNo+','+i+','+mainPlanNo+')">공유하기</button><p>&nbsp;</p>';
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
						<p style="font-family:Pacifico;" align="center">TWIIBOOK,</p>
					</div>
				</div>
					<p style="font-family:TYPO_JEONGJOL;font-size: 1.5em;	margin-bottom: 70px;" align="center">여행을 맞이하는, 설렘부터  </p>
			</header>
			
				<!-- <h4 style="font-family:NANUMSQUAREROUNDB;" align="right">여행을 맞이하는, 설렘부터  </h4> -->
				<div class="row" style="font-family:'TYPO_JEONGJOL';">
							<div  class="col-xs-offset-8 col-xs-4" align="left">
								<!-- 	<button type="button" class="btn" id="listScrap" ><Strong>Scrap</Strong></button>  -->
								<button type="button" class="btn" id="listSharedPlan">
									<Strong>친구와 공유하고 있는 트위북보기</Strong>
								</button>
							</div>
				</div>
					
			<div class="row" style="font-family:'TYPO_JEONGJOL';">
				<div  class="col-xs-12 inner" id="thumbnailMainBox">
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
											   <div class="col-md-5 thumbnailClass">
										<%-- 	   ${mainPlan.mainThumbnail} --%>
												<img src="/resources/images/thumbnail_plan/main_thumbnail2.jpg" style="margin-left:80px;width: 300px; height:250px;border-radius: 2%;" class="img-responsive" alt="Responsive image" style="border-radius: 70%;"/> 
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
														<button type="button" class="btn btn-default">공유</button><br/>
														<button type="button" class="btn btn-default">수정</button><br/>
														<button type="button" class="btn btn-default">삭제</button>
													</div>
												</div>
											
												<div class="col-md-1" id="buttonBox" align="right">
												</div>
											</div> <!--  row 끝 -->
											
										</div>
									</div>
								</div>
							</div>

						</c:forEach>
					</div>
					<div align="right" class="col-xs-1">&nbsp;</div>
				</div><!-- 섬네일 전체 박스 부분 -->
		</div>

		
		<!--  Floating Button <START> -->
		<div id="container-floating">
			<div id="floating-button" data-toggle="tooltip" data-placement="center" data-original-title="Create">
				<p class="letter" id="addMainPlan">+</p>
			</div>
		</div>
		<!--  Floating Button <END> -->


	</form>



</body>

<!---------- ShareWithFriend Dialog <START>------------->

		<div class="modal fade" id="shareWithFriend" role="dialog" style="font-family: 'Jeju Gothic', serif;">
			<div class="modal-dialog modal-md">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"align="center" >
							<Strong>나의 플랜 북을 친구들과 공유할까요?</Strong>
						</h4>
					</div>
					<div class="modal-body col-sm-12" align="center" style="padding-top: 10px;">
							<table class="table table-filter" style="align-content: center;">
								<tbody>
										<tr data-status="pagado">
										<div class="media-body">
										  <td align="left" vailgn="middle">
											  <div class="row" >
											  	<div id="shareWithFriendList"></div>
											  </div>
										 	 </td>
										  </div>
										</tr>
								</tbody>
							</table>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<!---------- ShareWithFriend Dialog <END>------------->
		
</html>