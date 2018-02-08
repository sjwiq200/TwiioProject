<<<<<<< HEAD
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 다이얼로그  -->

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- Hover Jquery -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<!--  구글  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 내 CSS -->
<link rel="stylesheet" href="/resources/css/plan-listMainPlan.css" />


<title>MainPlanList</title>

<style type="text/css">

#mainBody {
	padding-top: 140px;
}

#innerMain {
	font-size: 6em;
	margin-top: 130px;
	margin-bottom: 10px;
}

#thumbnailMainBox {
	font-family:'JEJUMYEONGJO';
	background: linear-gradient(-45deg, #08708A, transparent),linear-gradient(45deg, #D73A31, transparent);
	border-radius: 8px;
	border-color: #000000;
	border-width: 10px;
	display: inline-block;
	padding: 1px;
	text-decoration: none;
}

#thumbnailMainThumbBox {
	background: #fff;
	display: inline-block;
	border-radius: 6px;
}
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<!-- 스크립트 -->
<script type="text/javascript">
		
			$(document).ready(function(){
				var topBar = $("#topBar").offset();
				$(window).scroll(function(){
					var docScrollY = $(document).scrollTop()
					var barThis = $("#topBar")
					var fixNext = $("#fixNextTag")
					if( docScrollY > 1 ) {
						barThis.addClass("top_bar_fix");
						fixNext.addClass("pd_top_50");
					}else{
						barThis.removeClass("top_bar_fix");
						fixNext.removeClass("pd_top_50");
					}
				});
			})
			
</script>

<script type="text/javascript">

	/////////////////////////이미지 추가 버튼 클릭했을 때 작동///////////////////////////

	$(function() {
		$("button[name=add]").on("click",function() {
					$("form").attr("method", "POST").attr("action",	"/dailyplan/addImage").submit();
			});
	});
	
	/////////////////////////친구 추천 받는 부분///////////////////////////
	$(function() {
	
		$("#friendRecButton").bind("click",function() {
			var dailyPlanNo = "${dailyPlan.dailyPlanNo}";
			var user;
			var result ="";

			 $.ajax({
	    				url:"/dailyplan/json/listFriendRec?dailyPlanNo="+dailyPlanNo,
	    				method:"GET",	    					
	    				dataType:"json",
	    				headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
	    				success:function(JSONData){
	    					user = JSONData.userList;
		    					for(var i=0;i<user.length;i++){
		    						result +='<p> [USER NO] : '+user[i].userNo+ '</p>'
		    								+'<span>  [아이디] : '+user[i].userId+'</span>'
		    								+'<span>  [이름] : '+user[i].userName+'</span>'
		    								+'<span>  [성별] : '+user[i].userGender+'</span>'
		    								+'<span>  [사진] : '+user[i].userImage+'</span>'
		    								+'<span>&nbsp;</span>'
		    								+'<button type="button" id="addToMyFriendList'+i+'" class="btn btn-success btn-sm" onclick="addFriend('+user[i].userNo+','+i+')">친구추가</button><p>&nbsp;</p>';
		    					}
		    				 $('#friendListForRec').html(result);
		    				 $('#friendRec').modal('show'); 
	    					}
			    });
		});
	 });
	 
	function addFriend(userNo,i) {
			$.ajax({
	            url:'/dailyplan/json/addFriend?userNo='+userNo,
	            type:'get'
	         });
	   var a = "#addToMyFriendList" + i;
	    $("#addToMyFriendList"+i).remove(); 
	}
	

	
	
	/////////////////////////수정 및 삭제를 위한 hover기능 구현///////////////////////////
	
	$(function() {
		$("#fixedbtn").on("click",function() {
			if($("#deleteAllAll").val() == 'flag'){
				$(".deleteButtons").remove();
				$(".deleteButtons2").remove();
			}else{
				$("#deleteAllButton").append('<div class="deleteButtons"><a class="btn btn-success" role="button" onclick="deleteAllButton()">전체삭제</a><input id="deleteAllAll" type="hidden" value="flag"></div>');
				var lastIndexNo = $("#lastIndex").val();
				 for(var i=1;i<lastIndexNo+2;i++){
					 var contentNo = $("#contentsNo"+i).val();
					 var result = '<div class="deleteButtons2"><a class="btn btn-primary" role="button" id="deleteButton'+i+'" onclick="deleteContent('+contentNo+','+i+')"> delete </a></div>';
	 			$("#here"+(i-1)).append(result); 
	 			}
			}
		});
	 });
	
	 function deleteContent(contentNo,i) { // db에 콘텐츠 내용 삭제하고 버튼 및 내용 삭제 수정 
		$.ajax({
            url:'/dailyplan/json/deleteContent?contentNo='+contentNo,
            type:'get'
         });
		 $("#here"+(i-1)).remove();  //삭제 버튼 삭제 
		 $("#contentsBoxNo"+i).remove(); //내용전체삭제 
	}
	 
	 
	 function deleteAllButton(){
		 
		 var dailyPlanNo = $("#idDailyPlanNo").val();
		 $.ajax({
	            url:'/dailyplan/json/deleteAllContent?dailyPlanNo='+dailyPlanNo,
	            type:'get'
	         });
		 $("#PlanContentList").remove();
	 }
	 
	 </script>
<script>
	$(function() {
		$("#addRouteButton").on("click",function() {
			var url = "/dailyplan/addRouteBefore?dailyPlanNo="+${dailyPlan.dailyPlanNo};
			$(location).attr('href', url);
				});
	});
	</script>
<script type="text/javascript">
	/////////////////////////맞춤 여행 정보 기능 구현///////////////////////////
	$(function() {
		$("#customizedPlanInfo").on("click",function() {
			var dailyPlanNo = $("#idDailyPlanNo").val();
			 var dailyCity=$("#idDailyCity").val();
			 var dailyDate=$("#idDailyDate").val();
			 dailyCity = encodeURI(encodeURIComponent(dailyCity));
			 self.location = "/dailyplan/customizedPlanInfo?dailyPlanNo="+dailyPlanNo+"&dailyCity="+dailyCity+"&dailyDate="+dailyDate;
		});
	});
	
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
<script>
/////////////////////////PDF 기능 구현///////////////////////////
$(function() {
	
	$("#saveAsPDF").on("click" , function() {
		 	 var doc = new jsPDF();
			 var specialElementHandlers = { 
			    ".top_con_zone": function (element, renderer) { 
			        return true; 
			    }
			} 	
	
			html2canvas($(".top_con_zone"),{
				background :'#FFFFFF',
			    useCORS: true,
			    allowTaint: true,
			    page: this,
			    onclone: function(doc){
			    	
                },
			    onrendered:function(canvas){
			    	
			        var imgData = canvas.toDataURL('image/jpeg');
			        var doc = new jsPDF('p', 'mm');
			         doc.text(20, 20, 'Hello world!'); 
			    	doc.text(20, 30, 'This is client-side Javascript, pumping out a PDF.');
			    	doc.addPage();  
					//console.log(imgData);
			    	doc.addImage(imgData, 'JPEG',8, 8, 90, 95);
					 //doc.addImage(imgData, 'JPEG', 8, 8, 90, 95);
			        doc.save('test.pdf');
			    }
			}); 
		
		         
		});
			
	
	});
</script>

</head>
<body id="mainBody">


	<div><jsp:include page="/layout/toolbar.jsp" /></div>

	<form class="form-horizontal">
		<div class="container">
			<div class="col-xs-12 inner" id="thumbnailMainBox">
				<div align="center" class="col-xs-1">&nbsp;</div><!-- 그라디언트 보이게 해주려고 한 부분 -->
				<div class="col-xs-12 inner" id="thumbnailMainThumbBox"align="center">


					<div class="row" align="center">
					
					
						<!-- -------------TOP<START>--------------- -->

<!-- 
			<script>
				$(function() {
					$('a[title]').tooltip();
				});
			</script>

			<section style="background: #efefe9;">
				<div class="container">
					<div class="row">
						<div class="board">
							<h2>Welcome to IGHALO!<sup>™</sup></h2>
							<div class="board-inner">
								<ul class="nav nav-tabs" id="myTab">
									<div class="liner"></div>
									<li class="active"><a href="#home" data-toggle="tab"
										title="welcome"> <span class="round-tabs one"> <i
												class="glyphicon glyphicon-home"></i>
										</span>
									</a></li>

									<li><a href="#profile" data-toggle="tab" title="profile">
											<span class="round-tabs two"> <i
												class="glyphicon glyphicon-user"></i>
										</span>
									</a></li>
									<li><a href="#messages" data-toggle="tab"
										title="bootsnipp goodies"> <span class="round-tabs three">
												<i class="glyphicon glyphicon-gift"></i>
										</span>
									</a></li>

									<li><a href="#settings" data-toggle="tab"
										title="blah blah"> <span class="round-tabs four"> <i
												class="glyphicon glyphicon-comment"></i>
										</span>
									</a></li>

									<li><a href="#doner" data-toggle="tab" title="completed">
											<span class="round-tabs five"> <iclass ="glyphiconglyphicon-ok">
												</i></span>
									</a></li>

								</ul>
							</div>


						</div>
					</div>
				</div>
			</section>
 -->





			<!-- -------------TOP<END>---------------- -->
					
					
					
					
						<input type="button" id="customizedPlanInfo" name="customizedPlanInfo" class="btn btn-default" value="나를 위한 맞춤정보" /> 
						<input type="button" id="friendRecButton" name="friendRecButton" class="btn btn-default" value="같이 갈 친구 찾기" />
						<input type="button" id="saveAsPDF" name="saveAsPDF" class="btn btn-default" value="PDF로 저장하기" /></p>
						<button type="button" class="btn" data-toggle="modal"data-target="#addText">글씨쓰기</button>
						<span><button type="button" class="btn" data-toggle="modal" data-target="#addImage">사진추가</button> </span> 
						<span><button type="button" class="btn" data-toggle="modal" data-target="#addMap">지도</button></span> 
						<span><button type="button" class="btn" id="addRouteButton">길찾기</button> </span>
						<p></p>
						<img src="/resources/images/icon/plan/editbutton2.png" id="fixedbtn" width="50px">
						<p></p>
						<div class="col-xs-12 innerMain" id="innerMain" align="center">
						<p>DAY ${dailyPlan.day}</p>
						 </div>
						<div class="col-xs-12" style="font-family:'JEJUGOTHIC' !important; font-size:1.1em !important;" align="center">
						<p>${dailyPlan.dailyDate}</p> 
						<p>${dailyPlan.dailyCity}</p>
						</div>
						<div class="col-xs-12" style="margin-top:150px" align="center">
						<input type="hidden" value="${dailyPlan.dailyPlanNo}" id="idDailyPlanNo" />
						<input type="hidden" value="${dailyPlan.dailyDate}" id="idDailyDate" /> 
						<input type="hidden" value="${dailyPlan.dailyCity}" id="idDailyCity" />
						<p></p>
						</div>
					</div>

					<!-- -------------TOP<END>--------------- -->




					<!-- ----------CONTENTS<START>----------- -->
					<div class="PlanContentList" id="PlanContentList" align="center" style="font-family:'JEJUGOTHIC' !important; font-size:1.1em !important; font-color: #C2C2C2 !important;">

						<div id="deleteAllButton"></div>

						<c:set var="i" value="0" />
						<c:forEach var="planContent" items="${list}" varStatus="index">
							<div id="here${i}"></div>
							<c:if test="${index.last}">
								<input type="hidden" id="lastIndex" value="${i}" />
								<div id="here${i}"></div>
							</c:if>
							<c:set var="i" value="${ i+1 }" />

							<input type="hidden" name="planContentNo" id="contentsNo${i}"
								value="${planContent.contentNo}" />

							<div id="contentsBoxNo${i}" class="realContents">

								<h7 class="contents"> ㅡ </h7>
								<%-- <p class="contents">콘텐츠 번호 : ${planContent.contentNo}</p>
								<p class="contents">데일리플랜번호 : ${dailyPlan.dailyPlanNo}</p>
								<p class="contents">콘텐츠타입 : ${planContent.contentType}</p> --%>

							<%-- 	<c:if test="${!empty planContent.orderNo}">
									<p class="contents">순서 : ${planContent.orderNo}</p>
								</c:if> --%>
<%-- 
								<c:if test="${!empty scrap.scrapNo }">
									<p class="contents">스크랩번호 : ${scrap.scrapNo }</p>
								</c:if> --%>

								<c:if test="${!empty planContent.route}">
									<p class="contentsDelete">루트 : ${planContent.route}</p>
								</c:if>

								<c:if test="${!empty planContent.departureLocation}">
									<p class="contents">출발지 : ${planContent.departureLocation}</p>
								</c:if>

								<c:if test="${!empty planContent.arrivalLocation}">
									<p class="contents" >도착지 : ${planContent.arrivalLocation}</p>
								</c:if>

								<c:if test="${!empty planContent.estimatedTime}">
									<p class="contents">소요시간 : ${planContent.estimatedTime}</p>
								</c:if>

							<%-- 	<c:if test="${!empty planContent.routeType}">
									<p class="contents">이동방법 : ${planContent.routeType}</p>
								</c:if> --%>

								<c:if test="${!empty planContent.routeDescription}">
									<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;"><!-- 길찾기결과 :  -->${planContent.routeDescription}</p>
								</c:if>

								<c:if test="${!empty planContent.mapImage}">
									<p class="contents">
										<Strong> Your Map Information</Strong>
									</p>
									<p class="contents">
										<img src="${planContent.mapImage}" name="mapImg" class="contentsDelete" width="350px"
											onclick="javascript:location.href='${planContent.mapUrl}';" />
								</c:if>

								<c:if test="${!empty planContent.mapName}">
									<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">${planContent.mapName}</p>
								</c:if>

								<c:if test="${!empty planContent.mapUrl}">
									<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">지도 URL : ${planContent.mapUrl}</p>
								</c:if>

								<c:if test="${!empty planContent.mapAddress}">
									<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">지도 주소 : ${planContent.mapAddress}</p>
								</c:if>

								<c:if test="${!empty planContent.mapPhone}">
									<p class="contents">PHONE : ${planContent.mapPhone}</p>
								</c:if>

								<c:if test="${!empty planContent.mapWebsite}">
									<p class="contents">웹사이트 : ${planContent.mapWebsite}</p>
								</c:if>

								<c:if test="${!empty planContent.mapType}">
									<p class="contents">지도유형 : ${planContent.mapType}</p>
								</c:if>

								<c:if test="${!empty planContent.contentText}">
									<p>
										<div class="contentsTxt" style="margin-left:60px; margin-right:60px; font-size:1.1em !important; font-color: #C2C2C2 !important;">${planContent.contentText}</div>
									</p>
								</c:if>

								<c:if test="${!empty planContent.contentImage}">
									<p class="contentsThis">
										<img
											src="/resources/images/dailyPlanContent/${planContent.contentImage}"
											class="contentsDelete img-responsive" width="400px" alt="Responsive image" style="border-radius: 98%;"/>
									</p>
								</c:if>

								<div id="buttonForDelete${i}"></div>
								<div id="buttonForEdit${i}"></div>

								<p class="contents">&nbsp;</p>
								<p class="contents">&nbsp;</p>

							</div>

						</c:forEach>

					</div>
				</div>
				<div align="right" class="col-xs-1">&nbsp;</div>
			</div>
			<!-- 섬네일 전체 박스 부분 -->
		</div>



















	</form>

	<!-- ----------CONTENTS<END>----------- -->

	<!-- 	</form> -->

	<!---------- Map Dialog ------------->
	<div class="modal fade" id="addMap" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<Strong>M A P</Strong>
					</h4>
					<h7 class="modal-title">TWIIO</h7>
				</div>
				<div class="modal-body">
					<jsp:include page="/dailyplan/addMap.jsp" flush="false">
						<jsp:param name="data" value="${dailyPlan.dailyPlanNo}" />
					</jsp:include>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
				</div>
			</div>
		</div>
	</div>
	<!---------- Text Dialog ------------->
	<div class="modal fade" id="addText" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<Strong>T E X T</Strong>
					</h4>
					<h7 class="modal-title">TWIIO</h7>
				</div>
				<div class="modal-body">
					<jsp:include page="/dailyplan/addText.jsp" flush="true">
						<jsp:param name="data" value="${dailyPlan.dailyPlanNo}" />
					</jsp:include>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<!---------- Image Dialog ------------->


	<div class="modal fade" id="addImage" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<Strong>Image</Strong>
					</h4>
					<h7 class="modal-title">TWIIO</h7>
				</div>

				<div class="modal-body">

					<form name="form" enctype="multipart/form-data">
						<div class="form-group">
							<label for="uploadFile" class="col-sm-4 control-label">상품이미지
							</label>

							<div class="col-sm-6">
								<input type="file" name="uploadFile" class="ct_input_g"
									style="width: 300px; height: 30px" maxLength="20"
									id="uploadFile" /> <img id="addImageContent" />
							</div>
						</div>
						<input type="hidden" name="dailyPlanNo"
							value="${dailyPlan.dailyPlanNo}" />
						<button name="add" type="button">ADD</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!---------- FriendRec Dialog <START>------------->

	<div class="modal fade" id="friendRec" role="dialog">
		<div class="modal-dialog modal-md">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<Strong>나와 같은 장소, 날짜에 여행가는 친구들을 찾아볼까요?</Strong>
					</h4>
					<h7 class="modal-title">TWIIO</h7>
				</div>

				<div class="modal-body" align="center">

					<div id="friendListForRec"></div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!---------- FriendRec Dialog <END>------------->
</body>



</html>
