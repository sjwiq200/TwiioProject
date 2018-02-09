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
<link rel="stylesheet" href="/resources/css/plan-listMainPlan.css" />

<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="/resources/css/font.css" />
<link rel="stylesheet" href="/resources/css/plan-getDailyPlan.css" />


<title>getDailyPlan</title>

<style type="text/css">

#mainBody {
	padding-top: 50px;
	font-family:'JEJUGOTHIC';
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
			background-color: #eee;
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
		  border: 3px solid;
		}
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
    background-color: #C2C2C2;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
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
		    					for(var i=0;i<user.length;i++) /* {
		    						result +='<p> [USER NO] : '+user[i].userNo+ '</p>'
		    								+'<span>  [아이디] : '+user[i].userId+'</span>'
		    								+'<span>  [이름] : '+user[i].userName+'</span>'
		    								+'<span>  [성별] : '+user[i].userGender+'</span>'
		    								+'<span>  [사진] : '+user[i].userImage+'</span>'
		    								+'<span>&nbsp;</span>'
		    								+'<button type="button" id="addToMyFriendList'+i+'" class="btn btn-success btn-sm" onclick="addFriend('+user[i].userNo+','+i+')">친구추가</button><p>&nbsp;</p>';
		    					}  */
		    					{
		    						
		    						result +='<div class="col-sm-3 col-sm-offset-1" ><img src="'+user[i].userImage+'"style="width: 32px; height: 32px;" class="media-photo"></div>'+
									'<div class="col-sm-5 "  style="padding-top: 8px;" >'+user[i].userName+'</div>'+
									'<button type="button" id="addToMyFriendList'+i+'" class="btn btn-primary btn-sm" onclick="addFriend('+user[i].userNo+','+i+')">친구추가</button><p>&nbsp;</p>';
									
		    						
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
	    $("#addToMyFriendList"+i).attr("disabled","true");  
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

<script type="text/javascript">
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

</head>
<body id="mainBody">
	
	
	
	<!-- ----------------------------------- -->


	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	<c:set var="i" value="0" />
							<c:forEach var="dailyPlan" items="${listDailyPlan}">
								<c:set var="i" value="${ i+1 }" />
								<input type="hidden"name="dailyPlanNo" value="${dailyPlan.dailyPlanNo}" />
							    <input type="hidden" name="mainPlanNo" value="${dailyPlan.mainPlan.mainPlanNo}" />
							    <div class="col-xs-12 contentsBox" id="contentsBox">
							    	<div class="col-xs-12 contents" name="contents" align="left">
								    <h5>DAY${ i }</h5>
								   <span>
										<h4>${dailyPlan.dailyDate}</h4>
										<h6>${dailyPlan.dailyCity}</h6> 
									</span>
									</div>
									<!--<div class="col-xs-1"><p>국가 </p>
									<div class="col-xs-12" align="left"></div><p>도시 </p> </div> -->
									<%-- <p>${dailyPlan.dailyCountry}</p> --%>
									<%-- <p>데일리플랜번호 : ${dailyPlan.dailyPlanNo}</p>
									<p>메인플랜번호 : ${dailyPlan.mainPlan.mainPlanNo}</p> 
									<p>유저번호 : ${dailyPlan.user.userNo }</p>--%>
									 <%--<div class="col-xs-2" id="contents">
										 <c:if test="${empty dailyPlan.dailyCity}">
											<c:set var="num" value="0" />
											<c:forEach var="cityList" items="${cityList}">
												<c:set var="num" value="${ num+1 }" />
												<div class="btn-group" role="group" id="cityButtonGroup">
													<input type="button" class="button" name="citySelectButton" id="${i}" class="btn btn-default" value="${cityList}" style="font-family:'JEJUGOTHIC';"/>
												</div>
												<button class="button" id="${i}">${cityList}</button>
											</c:forEach>
										</c:if> 
										<p></p>
									</div>--%>
								</div>
								  <!-- <div class="col-xs-2"></div><div class="col-xs-8" id="line"></div> <div class="col-xs-2"></div> -->
							</c:forEach>
	</div>

	<div id="main">
		<h2>&nbsp;</h2>
		<p>&nbsp;</p>
		<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;
			open</span>
	</div>

	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
			document.getElementById("main").style.marginLeft = "250px";
			document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("main").style.marginLeft = "0";
			document.body.style.backgroundColor = "white";
		}
	</script>





	<!-- ----------------------------------- -->

	<div><jsp:include page="/layout/toolbar.jsp" /></div>

	<form class="form-horizontal">
		<div class="container">
			<div class="col-xs-12 inner" id="thumbnailMainBox">
				<div align="center" class="col-xs-1">&nbsp;</div><!-- 그라디언트 보이게 해주려고 한 부분 -->
				<div class="col-xs-12 inner" id="thumbnailMainThumbBox"align="center">


					<div class="row" align="center">
					
								
					<!-- -------------TOP<START>--------------- -->
					
					
						<input type="button" id="customizedPlanInfo" name="customizedPlanInfo" class="btn btn-default" value="나를 위한 맞춤정보" /> 
						<input type="button" id="friendRecButton" name="friendRecButton" class="btn btn-default" value="같이 갈 친구 찾기" />
						<input type="button" id="saveAsPDF" name="saveAsPDF" class="btn btn-default" value="PDF로 저장하기" /></p>
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
									<div class="col-xs-12"  style="margin-top: 30px" align="center">
									<p class="contents">
										<Strong> YOUR MAP </Strong>
									</p>
									</div>
									<div class="col-xs-6" align="right">
									<p class="contents">
										<img src="${planContent.mapImage}" name="mapImg" class="contentsDelete" width="350px" style="border-radius: 99%;"
											onclick="javascript:location.href='${planContent.mapUrl}';" /></p>
									</div>
								</c:if>

								<c:if test="${!empty planContent.mapName}">
									<div class="col-xs-6"  style="margin-top:100px ;" align="left">
									<img src="/resources/images/dailyPlanContent/map.png" width="40px"><p>&nbsp;</p>
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
								</c:if>
								<!-- ---------------------지도정보 <END>-------------------- -->

								<c:if test="${!empty planContent.contentText}">
									<p>
										<div class="col-xs-12" style="margin-top:50px;  margin-right:60px; font-size:1.1em !important;font-color: #C2C2C2 !important;">
											${planContent.contentText}
											<div id="col-xs-12 txtSize" class="txtSize"></div>
										</div>
									</p>
								</c:if>

								<c:if test="${!empty planContent.contentImage}">
									<p class="contentsThis">
										<img
											src="/resources/images/dailyPlanContent/${planContent.contentImage}"
											class="contentsDelete img-responsive" width="400px" alt="Responsive image" style="border-radius: 5%;"/>
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
			
			
			
			<!-- -------Floating Button<START>----------- -->

	<div id="container-floating" style="font-family:'JEJUGOTHIC';">
	
	  <div class="nd5 nds" class="btn" id="addRouteButton" data-placement="left" >
	  <p class="letter">ROUTE</p>
	  </div>
	  <div class="nd4 nds" data-toggle="modal" data-target="#addMap" data-placement="left" >
	    <p class="letter">MAP</p>
	  </div>
	  <div class="nd3 nds" data-toggle="modal" data-target="#addImage" data-placement="left" >
	   <p class="letter">PICS</p>
	  </div>
	  <div class="nd1 nds" data-toggle="modal" data-target="#addText" data-placement="left" >
	    <p class="letter">TEXT</p>
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
						<button name="add" class="btn btn-primary btn-sm" type="button">ADD</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!---------- FriendRec Dialog <START>------------->

	<div class="modal fade" id="friendRec" role="dialog" style="font-family: 'Jeju Gothic', serif;">
		<div class="modal-dialog modal-md">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"align="center" >
						<Strong>나와 같은 장소, <p>날짜에 여행가는 친구들을 찾아볼까요?</Strong>
					</h4>
				</div>
				<div class="modal-body col-sm-12" align="center" style="padding-top: 10px;">
							<table class="table table-filter" style="align-content: center;">
								<tbody>
										<tr data-status="pagado">
										<div class="media-body">
										  <td align="left" vailgn="middle">
											  <div class="row" >
											  	<div id="friendListForRec"></div>
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
	
	

	<!---------- FriendRec Dialog <END>------------->
</body>



</html>
