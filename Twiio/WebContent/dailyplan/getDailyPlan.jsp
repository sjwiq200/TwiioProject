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

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- Hover Jquery -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<!--  구글  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 내 CSS -->
<link rel="stylesheet" href="/resources/css/plan-getDailyPlan.css" />


<title>getDailyPlan</title>

<style type="text/css">
#wrapper {
width: 60em ;margin: 0 auto;
} 
#wrapper .container {max-width: 100%; display: block;}

#mainBody {
	padding-top: 70px;
	font-family:'JEJUGOTHIC';
}

#innerMain {
	font-size: 6em;
	margin-top: 1.5em;
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
.btn {
	font-family:'JEJUGOTHIC';
}


/* 사이드바 <START> */

.sidenav {
	margin-top: 53px;
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #56B1BF;
    overflow-x: hidden;
    transition: 0.3s;
    padding-top: 60px;
    background-color: #ffffff;
    background-color: rgba( 255, 255, 255, 0.5 );
    border-right: solid 0.8px #303030;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

#main {
    transition: margin-left .5s;
    padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

#contentsBox {
	height: 5em;
	border-bottom: solid 0.8px #303030;
}
/* 사이드바 <END> */


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
			
			
			 
	 $(function() {
			$(".dayClick:contains('DAY')").bind("click",function() {
				var index = $(".dayClick:contains('DAY')").index(this);
				var dailyPlanNo = $($("input[name='dailyPlanNo']")[index]).val();
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/dailyplan/getDailyPlan?dailyPlanNo="+dailyPlanNo+"&mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
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
			var url = "/dailyplan/addRouteBefore?dailyPlanNo="+${dailyPlan.dailyPlanNo}+"&mainPlanNo="+${dailyPlan.mainPlan.mainPlanNo};
			$(location).attr('href', url);
				});
	});
	/////////////////////////맞춤 여행 정보 기능 구현///////////////////////////
	$(function() {
		$("#customizedPlanInfo").on("click",function() {
			
			var dailyPlanNo = $("#idDailyPlanNo").val();
			var dailyCity=$("#idDailyCity").val();
			var dailyDate=$("#idDailyDate").val();
			dailyCity = encodeURI(encodeURIComponent(dailyCity));
			var url = "/dailyplan/customizedPlanInfo?dailyPlanNo="+dailyPlanNo+"&dailyCity="+dailyCity
			 												+"&dailyDate="+dailyDate+"&mainPlanNo="+${dailyPlan.mainPlan.mainPlanNo};
			$(location).attr('href', url); 
		});
	});
	
	
	/////////////////////////글씨 크기 조절 기능 구현///////////////////////////
/* 	$(function() {
		$(".contentsTxt").hover(function() {
			var index = $(".contentsTxt").index(this);
			alert(index);
			$("#txtSize").append('<input type="button" value="크게">');
		});
	}); */
	
	/*  $(function() {
			$("button:contains('선택')").bind("click",function() {
				var index = $("button:contains('선택')").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/dailyplan/listDailyPlan?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			}); */
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

<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "280px";
			document.getElementById("main").style.marginLeft = "280px";
			document.body.style.backgroundColor = "white";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("main").style.marginLeft = "0";
			document.body.style.backgroundColor = "white";
		}
		
		$(function() {
			$("div[name=contentsBox]").hover(function() {
				var index = $("div[name=contentsBox]").index(this);
 				$($("div[name=contentsBox]")[index]).attr("style","background-color:black;");
 					}, function(){
 						var index = $("div[name=contentsBox]").index(this);
 						$($("div[name=contentsBox]")[index]).attr("style","background-color:white;");
 					
 			});
 		});
		
		
</script>

</head>
<body id="mainBody">
	
	
	
	<!-- ----------------------------------- -->


	<div id="mySidenav" class="sidenav" style="font-family:'JEJUMYEONGJO';">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<div class="col-xs-12" align="center" style="margin-bottom: 1.5em;">
				<img src="/resources/images/dailyPlanContent/seojun.jpg" width="80px" style="border-radius: 10%">
				<c:forEach var="listUser" items="${listForMainPlanShared}">
					<img src="/resources/images/dailyPlanContent/yumi.jpg" width="80px" style="border-radius: 10%">
				</c:forEach>
				<h6> Writer :  ${dailyPlan.user.userName}
				<c:forEach var="listUser" items="${listForMainPlanShared}">
					& ${listUser.userName}
				</c:forEach>
				</h6>
			</div>
		<c:set var="i" value="0" />
		<c:forEach var="dailyPlan" items="${listDailyPlan}">
			<c:set var="i" value="${ i+1 }" />
			<input type="hidden" name="dailyPlanNo" value="${dailyPlan.dailyPlanNo}" />
			<input type="hidden" name="mainPlanNo" value="${dailyPlan.mainPlan.mainPlanNo}" />
			<div class="col-xs-12 contentsBox" id="contentsBox" name="contentsBox">
				
				<div class="col-xs-4 contents dayClick" name="contents" align="left">
					<h4>DAY${ i }</h4>
				</div>
				<div class="col-xs-8 contents dayClick" name="contents" align="left">
					<h6>${dailyPlan.dailyDate}</h6>
					<h6>${dailyPlan.dailyCity}</h6>
				</div>
			</div>
		</c:forEach>
	</div>

	<div id="main" style="position:fixed; z-index:1000;">

		<h2>&nbsp;</h2>
		<p>&nbsp;</p>
		<span style="font-size: 20px; font-family:'JEJUMYEONGJO'; cursor: pointer" onclick="openNav()">&#9776;
		OPEN</span>
	</div>





	<!-- ----------------------------------- -->

	<div><jsp:include page="/layout/toolbar.jsp" /></div>

	<form class="form-horizontal">
	  <div id="wrapper">
		<div class="container">
			<div class="col-xs-12 inner" id="thumbnailMainBox">
				<div align="center" class="col-xs-1">&nbsp;</div><!-- 그라디언트 보이게 해주려고 한 부분 -->
				<div class="col-xs-12 inner" id="thumbnailMainThumbBox" align="center">
					<div class="col-xs-12" >


					<div class="row" align="center">
					
								
					<!-- -------------TOP<START>--------------- -->
					
					
						<input type="button" id="customizedPlanInfo" name="customizedPlanInfo" class="btn btn-default" value="나를 위한 맞춤정보" /> 
						<input type="button" id="friendRecButton" name="friendRecButton" class="btn btn-default" value="같이 갈 친구 찾기" />
						<input type="button" id="saveAsPDF" name="saveAsPDF" class="btn btn-default" value="PDF로 저장하기" /></p>
						<p></p>
						<!-- <img src="/resources/images/icon/plan/editbutton2.png" id="fixedbtn" width="50px"> -->
						<p></p>
						<div class="col-xs-12 innerMain" id="innerMain" align="center">
						<p>DAY ${dailyPlan.day}</p>
						 </div>
						<div class="col-xs-12" style="font-family:'JEJUGOTHIC' !important; font-size:1.1em !important;" align="center">
						<p>${dailyPlan.dailyDate}</p> 
						<p>${dailyPlan.dailyCity}</p>
						</div>
						<div class="col-xs-12" style="margin-top:130px" align="center">
						<input type="hidden" value="${dailyPlan.dailyPlanNo}" id="idDailyPlanNo" />
						<input type="hidden" value="${dailyPlan.dailyDate}" id="idDailyDate" /> 
						<input type="hidden" value="${dailyPlan.dailyCity}" id="idDailyCity" />
						</div>
					</div>

					<!-- -------------TOP<END>--------------- -->




					<!-- ----------CONTENTS<START>----------- -->
					<div class="PlanContentList" id="PlanContentList" align="center" style="font-family:'JEJUGOTHIC' !important; font-size:1.1em !important; font-color: #C2C2C2 !important;">

						<div id="deleteAllButton"></div>

						<c:set var="i" value="0" />
						<c:forEach var="planContent" items="${list}" varStatus="index">
							<!-- <img src="/resources/images/dailyPlanContent/line.png" width="200px" style="opacity: 0.6" height="30px" > -->
							<div id="here${i}"></div>
							<c:if test="${index.last}">
								<input type="hidden" id="lastIndex" value="${i}" />
								<div id="here${i}"></div>
							</c:if>
							<c:set var="i" value="${ i+1 }" />

							<input type="hidden" name="planContentNo" id="contentsNo${i}"
								value="${planContent.contentNo}" />

							<div id="contentsBoxNo${i}" class="realContents">

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
								
								<!-- ---------------------지도정보 <START>-------------------- -->

								<c:if test="${!empty planContent.mapImage}">
									<div class="col-xs-12"  style="margin-top: 20px" align="center">
									<p class="contents">
										<Strong> <img src="/resources/images/dailyPlanContent/map.png" width="40px"> </Strong>
									</p>
									</div>
									<div class="col-xs-6" align="center">
									<p class="contents">
										<img src="${planContent.mapImage}&key=AIzaSyCmTcIdw0uowsiJrs4YNA0lhjLnN8PigjE" name="mapImg" class="contentsDelete" width="250px" style="border-radius: 99%;"
											onclick="javascript:location.href='${planContent.mapUrl}';" /></p>
									</div>
								</c:if>

								<c:if test="${!empty planContent.mapName}">
									<div class="col-xs-6"  style="margin-top:30px ;" align="left">
									<p>&nbsp;</p>
									<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">[${planContent.mapName}]</p>
								</c:if>

								<%-- <c:if test="${!empty planContent.mapUrl}">
									<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">지도 URL : ${planContent.mapUrl}</p>
								</c:if> --%>

								<c:if test="${!empty planContent.mapAddress}">
									<p class="contents" style="font-size:0.9em !important; font-color: #C2C2C2 !important;">ADDRESS : ${planContent.mapAddress}</p>
								</c:if>

								<c:if test="${!empty planContent.mapPhone}">
									<p class="contents" style="font-size:0.9em !important; font-color: #C2C2C2 !important;" >PHONE : ${planContent.mapPhone}</p>
								</c:if>

								<c:if test="${!empty planContent.mapWebsite}">
									<p class="contents" style="font-size:0.9em !important; font-color: #C2C2C2 !important;">WEBSITE: ${planContent.mapWebsite}</p>
								</c:if>

								<c:if test="${!empty planContent.mapType}">
									<p class="contents" style="font-size:0.9em !important; font-color: #C2C2C2 !important;">TYPE : ${planContent.mapType}</p>
									</div>
								<div class="col-xs-12"  style="height: 30px" align="center"></div>
								</c:if>
								<!-- ---------------------지도정보 <END>-------------------- -->
							
								<c:if test="${!empty planContent.contentText}">
									<p>
										<div class="col-xs-12" align="center" style="margin-top:20px;font-size:1.1em !important;font-color: #C2C2C2 !important;">
											${planContent.contentText}
											<div id="col-xs-12 txtSize" class="txtSize"></div>
										</div>
									</p>
								</c:if>

								<c:if test="${!empty planContent.contentImage}">
									<p class="contentsThis">
										<img src="/resources/images/dailyPlanContent/${planContent.contentImage}"
											class="contentsDelete" width="400px" style="border-radius: 5%;"/>
									</p>
								</c:if>

								<div id="buttonForDelete${i}"></div>
								<div id="buttonForEdit${i}"></div>

								<p class="contents">&nbsp;</p>
								<p class="contents">&nbsp;</p>

							</div>

						</c:forEach>
						<div class="col-xs-12" style="margin-top:100px" align="center"></div>
						
						</div>
					</div>
				</div>
				<div align="right" class="col-xs-1">&nbsp;</div>
			</div>
		</div>
			<!-- 섬네일 전체 박스 부분 -->
			
			
			
			<!-- -------Floating Button<START>----------- -->

	<div id="container-floating" style="font-family:'JEJUGOTHIC';">
	
	  <div class="nd6 nds" class="btn" id="fixedbtn"  >
	  <p class="letter">&nbsp;&nbsp;&nbsp;&nbsp;편집</p>
	  </div>
	  
	  <div class="nd5 nds" class="btn" id="addRouteButton" >
	  <p class="letter">길찾기</p>
	  </div>
	  <div class="nd4 nds" data-toggle="modal" data-target="#addMap"  >
	    <p class="letter">지도</p>
	  </div>
	  <div class="nd3 nds" data-toggle="modal" data-target="#addImage" >
	   <p class="letter">사진</p>
	  </div>
	  <div class="nd1 nds" data-toggle="modal" data-target="#addText"  >
	    <p class="letter">글</p>
	  </div>
	
	  <div id="floating-button" data-toggle="tooltip" data-placement="left" data-original-title="Create" onclick="newmail()">
	    <p class="plus">+</p>
	  </div>
	
	</div>

	<!-- <button type="button" class="btn" data-toggle="modal" data-target="#addText">글씨쓰기</button>
	<span><button type="button" class="btn" data-toggle="modal" data-target="#addImage">사진추가</button> </span> 
	<span><button type="button" class="btn" data-toggle="modal" data-target="#addMap">지도</button></span> 
	<span><button type="button" class="btn" id="addRouteButton">길찾기</button> </span>-->

	<!-- -------Floating Button<END>----------- -->
	

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
						<jsp:param name="mainPlanNo" value="${dailyPlan.mainPlan.mainPlanNo}" />
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
								<input type="file" name="uploadFile" class="ct_input_g" style="width: 300px; height: 30px" maxLength="20" id="uploadFile" /> <img id="addImageContent" />
							</div>
						</div>
						<input type="hidden" name="dailyPlanNo" value="${dailyPlan.dailyPlanNo}" />
						<input type="hidden" name="mainPlanNo" value="${dailyPlan.mainPlan.mainPlanNo}" />
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
