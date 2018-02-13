<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/resources/css/bootstrap-dropdownhover.min.css"
	rel="stylesheet">
<script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
<script src="/resources/chart/Chart.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<link rel="stylesheet" href="/resources/css/font.css" />
<link rel="stylesheet" href="/resources/css/plan-getDailyPlan.css" />


<style type="text/css">
body::-webkit-scrollbar {
	width: 0.7em;
	background: transparent;
}

body::-webkit-scrollbar-thumb {
	background: transparent;
}

body {
	padding-top: 70px;
	font-family: 'JEJUGOTHIC';
	background: #f4f4f4;
}

#innerMain {
	font-size: 6em;
	margin-top: 1.5em;
}

#thumbnailMainBox {
	min-height: 1500px;
	font-family: 'JEJUMYEONGJO';
	background: linear-gradient(-45deg, #08708A, transparent),
		linear-gradient(45deg, #D73A31, transparent);
	border-radius: 8px;
	border-color: #000000;
	border-width: 10px;
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

/* ---------------------------------------------------- */
.top_bar_fix {
	position: fixed;
	top: 50px;
	right: 0;
	width: 100%;
	bottom: 100px;
}


.wrap .top_fix_zone {
}

.wrap .top_con_zone {
	text-align: right;
	padding-top: 10px;
}
button {
  margin: 20px 0;
  line-height: 34px;
  position: relative;
  cursor: pointer;
  user-select: none;
  outline:none !important;
  width:100%;
}

button:active {

  outline:none;
}

button.ribbon {
  
  outline:none;
  outline-color: transparent;
}
button.ribbon:before, button.ribbon:after {
  top: 5px;
  z-index: -10;
}
button.ribbon:before {
  border-color: #53dab6 #53dab6 #53dab6 transparent;
  left: -25px;
  border-width: 17px;
}
button.ribbon:after {
  border-color: #53dab6 transparent #53dab6 #53dab6;
  right: -25px;
  border-width: 17px;
}

button:before, button:after {
  content: '';
  position: absolute;
  height: 0;
  width: 0;
  border-style: solid;
  border-width: 0;
  outline:none;
}
    button.btn-danger:before {
  border-color: #ac2925 #ac2925 #ac2925 transparent;
    }
    button.btn-danger:after {
  border-color: #ac2925 transparent #ac2925 #ac2925;
    }
 
 /* 사이드바 <START> */
.sidenav::-webkit-scrollbar {
	width: 0.7em;
	background: transparent;
}

.sidenav::-webkit-scrollbar-thumb {
	background: transparent;
}

.sidenav {
	margin-top: 53px;
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	overflow-x: hidden;
	transition: 0.6s;
	padding-top: 60px;
	background-color: #ffffff;
	border-right: solid 0.8px #C2C2C2;
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
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

#contentsBox {
	height: 6em;
	border-bottom: dashed 0.5px #C2C2C2;
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
					}

				});

			})
		</script>
		
<script type="text/javascript">
	
$(function() {
	
	var standardCountry;
	var compareCountry;
	var inputPrice;
	
	 $("#addCurrencyToMyPlan").on("click",function(){
		
		var resultCurrency= $( "#compare" ).val();
		var dailyPlanNo = $("#dailyPlanNo").val();
		
		var standardCountryEnc= encodeURI(encodeURIComponent(standardCountry));
		var compareCountryEnc= encodeURI(encodeURIComponent(compareCountry));
			
		 $.ajax({
	            url:'/dailyplan/json/addTextContent?standardCountryEnc='+standardCountryEnc+'&compareCountryEnc='+compareCountryEnc+"&inputPrice="+inputPrice+"&resultCurrency="+resultCurrency+"&dailyPlanNo="+dailyPlanNo,
	            type:'get'
	         });
	
		 
		 $("#addCurrencyToMyPlan").remove();
		 
		 
	 });
	 
	 $("#getCurrency").on("click" , function() {

		 	standardCountry = $("#standardCountry").val();
			compareCountry = $("#compareCountryValue").val();
			inputPrice = $("#standard").val();
			
				$.ajax( 
						{
							url : "/information/json/getCurrency/" ,
							method : "POST" ,
							data : {
								"standardCountry" : standardCountry,
								"compareCountry" : compareCountry,
								"inputPrice" : inputPrice
							},
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								$( "#compare" ).val(JSONData);
							}
			});
			
				$("#getCurrency").append('<input type="button" class="btn btn-default" id="addCurrencyToMyPlan" value="내 플랜에 저장하기"/>');
		
		}); 

	});		
	
 $(function() {
	$("#searchHistoryWeather").on("click",function() {
 		var cityName = $("#keyword").val();
 		cityName = dailyCity = encodeURI(encodeURIComponent(cityName));
 		
 		 $.ajax( {
			url : "/information/json/searchHistoryWeather?cityName="+ cityName,
			method : "GET",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			}
 		 	/* ,error : function(){  
		          alert('통신실패!!');
	        } */
 		 	,beforeSend: function() {
	            //통신을 시작할때 처리
	            $('#ajax_indicator').show().fadeIn('fast');
	           }
	           ,complete: function() {
	            //통신이 완료된 후 처리
	            $('#ajax_indicator').fadeOut();
	           },
	           success : function(JSONData, status) {
				var simple = JSONData.list;
				var monthin = JSONData.month;
				var min = JSONData.min;
				var max = JSONData.max;
				var rain = JSONData.rain;

				 var listtr = null;
				
				for(var i = 0 ; i<5; i++){
					listtr += '<tr id = "listtr"><td align="center" id="info">'+simple[i]+'</td>';
				}
								
			$("#listTbody").html(listtr);
			
				var weatherData = {
						  labels: [
							  "1월", "2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"
						  ],
						  datasets: [{
							  	label: "최저온도",
							    data: max,
							    lineTension: 0,
							    fill: false,
							    borderColor: 'blue',
							    backgroundColor: 'transparent',
							    pointBorderColor: 'blue',
							    pointBackgroundColor: 'rgba(255,150,0,0.5)',
							    borderDash: [2, 2],
							    pointRadius: 5,
							    pointHoverRadius: 10,
							    pointHitRadius: 30,
							    pointBorderWidth: 2,
							    pointStyle: 'rectRounded'
							  },{
								label: "최고온도",
							    data: min,
							    lineTension: 0,
							    fill: false,
							    borderColor: 'red',
							    backgroundColor: 'transparent',
							    pointBorderColor: 'red',
							    pointBackgroundColor: 'rgba(255,150,0,0.5)',
							    borderDash: [2, 2],
							    pointRadius: 5,
							    pointHoverRadius: 10,
							    pointHitRadius: 30,
							    pointBorderWidth: 2,
							    pointStyle: 'rectRounded'
							  }
						  ]
						};
						
						var rainData = {
								  labels: [
									  "1월", "2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"
								  ],
								  datasets: [{
									    label: "강수량",
									    data: rain,
									    lineTension: 0,
									    fill: true,
									    borderColor: 'green',
									    backgroundColor: 'transparent',
									    pointBorderColor: 'green',
									    pointBackgroundColor: 'rgba(255,150,0,0.5)',
									    borderDash: [5, 5],
									    pointRadius: 5,
									    pointHoverRadius: 10,
									    pointHitRadius: 30,
									    pointBorderWidth: 2,
									    pointStyle: 'rectRounded'
									  }
								  ]
								};
						
						var chartOptions = {
						  legend: {
						    display: true,
						    position: 'top',
						    labels: {
						      boxWidth: 80,
						      fontColor: 'black'
						    }
						  },
						  scales: {
						    xAxes: [{
						      gridLines: {
						        display: false,
						        color: "black"
						      },
						      scaleLabel: {
						        display: true,
						        fontColor: "red"
						      }
						    }],
						    yAxes: [{
						      gridLines: {
						        color: "black",
						        borderDash: [2, 5],
						      },
						      scaleLabel: {
						        display: true,
						        fontColor: "green"
						      }
						    }]
						  }
						};
						
						var lineChart = new Chart(weatherChart, {
						  type: 'line',
						  data: weatherData,
						  options: chartOptions
						});
						
						var lineChart2 = new Chart(rainChart, {
							  type: 'line',
							  data: rainData,
							  options: chartOptions
							});
			}
		}); 
 		
 		
		});
	}); 

	
</script>

<!--  위험지역  -->

<script type="text/javascript">

$(function() {
		 $("input[name='unsafeCityInfo']").on("click" , function() {
			var city = $("#cityDangerCheck").val();
			 $.ajax(
	    				{
	    					url:"/information/json/getUnsafeRegion",
	    					method:"POST",
	    					data:{
	    						"city" : city
	    					},
	    					dataType: "json",
	    					contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	    					headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},

	    					success:function(JSONData){
	    						var img = JSONData.img;
							var info = JSONData.info;
								if(img=='none'){
									img = "/resources/images/no_info.png";
									$("#image").html('<div class="col-xs-12" align="center"><img src="'+img+'" style="width: 500px;"/></div>');
								}else{
									$("#image").html('<div class="col-xs-12" align="center"><img src="'+img+'" style="width: 500px;"/></div>');
								}
							$("#info").html(info);
			    				}
	    						}
			    			);//ajax
			    			
				    });
				 });
		
</script>

<!-- 화면로드되는 즉시 환율 결과 가져오기 코드  -->
<script src="../js/jquery-1.3.2-vsdoc2.js" type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$('#getCurrency').trigger('click');
		$("input[name='unsafeCityInfo']").trigger('click');
		$('#searchHistoryWeather').trigger('click');
	});
	
	$(function(){
		$("#closeButton").on("click",function(){
			var dailyPlanNo = $("#dailyPlanNo").val();
			var url = "/dailyplan/getDailyPlan?dailyPlanNo="+dailyPlanNo+"&mainPlanNo="+${mainPlanNo};
			$(location).attr('href', url);
			});
	});
	
</script>




<!-- -------------사이드바 ------------------- -->

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
		 
		 	function openNav() {
			document.getElementById("mySidenav").style.width = "280px";
			document.getElementById("main").style.marginLeft = "280px";
			document.body.style.backgroundColor = "#f4f4f4";
			
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("main").style.marginLeft = "0";
			document.body.style.backgroundColor = "#f4f4f4";
		}
		
</script>

	<body>
	
		<!-- ---------------사이드바-------------------- -->


	<div id="mySidenav" class="sidenav"
		style="font-family: 'JEJUMYEONGJO';">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div class="col-xs-12" align="center" style="margin-bottom: 4em;">
			<h2>
				<strong>Contents</strong>
			</h2>
			<br />
			<br /> <img src="/resources/images/userimages/${dailyPlan.user.userImage}"
				width="80px" height="80px" style="border-radius: 5%; overflow:hidden;">
			<c:forEach var="listUser" items="${listForMainPlanShared}">
				<img src="/resources/images/userimages/${listUser.userImage}"
					width="80px" height="80px" style="border-radius: 5%;">
			</c:forEach>
			<h5>
				Writer : ${dailyPlan.user.userName}
				<c:forEach var="listUser" items="${listForMainPlanShared}">
					& ${listUser.userName}
				</c:forEach>
			</h5>

		</div>

		<div class="col-xs-12" style="background: transparent;">
			<c:set var="i" value="0" />
			<h5 align="right" id="contentList">크게보기</h5>
			<c:forEach var="dailyPlan" items="${listDailyPlan}">
				<c:set var="i" value="${ i+1 }" />
				<input type="hidden" name="dailyPlanNo"
					value="${dailyPlan.dailyPlanNo}" />
				<input type="hidden" name="mainPlanNo"
					value="${dailyPlan.mainPlan.mainPlanNo}" />
				<div class="col-xs-12 contentsBox" id="contentsBox"
					name="contentsBox" style="border-radius: 10%;">

					<div class="col-xs-4 contents dayClick" name="contents"
						align="left">
						<h4>DAY${ i }</h4>
					</div>
					<div class="col-xs-8 contents dayClick" name="contents"
						align="center">
						<h6>${dailyPlan.dailyDate}</h6>
						<h6>${dailyPlan.dailyCity}</h6>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div id="main" style="position: fixed; z-index: 1000;" id="openSideBar">

		<h2>&nbsp;</h2>
		<p>&nbsp;</p>
		<span
			style="font-size: 20px; font-family: 'JEJUMYEONGJO'; cursor: pointer"
			onclick="openNav()">&#9776; OPEN</span>
	</div>





	<!-- ----------------------------------- -->
	
	
	
	

	<div class="wrap">
	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container" style="font-family:'JEJUGOTHIC' !important;">
		
	
		<div class="col-xs-12 inner" id="thumbnailMainBox">
				<div align="center" class="col-xs-1">&nbsp;</div>
				<!-- 그라디언트 보이게 해주려고 한 부분 -->
				<div class="col-xs-12 inner" id="thumbnailMainThumbBox"
					align="center">
		
		
		<!-- -------Floating Button<START>----------- -->

		<div id="container-floating" style="font-family: 'JEJUGOTHIC';"  id="closeButton">
			<div id="floating-button"  data-placement="left" id="closeButton">
				<p class="plus"  id="closeButton" style="font-size:15px; 	font-family: 'JEJUMYEONGJO';">
					<strong>BACK</strong>
				</p>
			</div>
		</div>

		<!-- -------Floating Button<END>----------- -->
		
		<div class="top_con_zone" id="fixNextTag">
			
		<div align="center">
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<h3>DAY ${dailyPlan.day}</h3>
			<h1><strong>맞춤여행정보</strong></h1>
		</div>
		
	<!-- -----------------환율<START>------------------- -->
		<form class="form-horizontal">

			<div align="center">
				<p>&nbsp;</p>
				<h3>${dailyCitySelected} 환율 정보 </h3>
				<input type="hidden" id="dailyPlanNo" value="${dailyPlanNo}">
			</div>

			<div class="form-group">
				<div class="col-sm-4 col-sm-offset-4" >
						<!-- <option value="0">나라를 선택해주세요</option> -->
						<c:set var="i" value="0" />
						<c:forEach var="currency" items="${returnList}">
							<c:set var = "theString" value = "${currency.cur_nm}"/>
							<c:set var = "dailyCity" value = "한국 원"/>
							
							<c:if test="${fn:contains(theString,dailyCity)}">
							<input type="text" class="form-control" value="${currency.cur_nm}" id="standardCountry" readonly/>
							</c:if>
						</c:forEach>
				</div>
				<div class="col-sm-4 col-sm-offset-4"></div>
				<div class="col-sm-4 col-sm-offset-4">
					<input type="text" class="form-control" id="standard" name="standard" value="1000"/>
				</div>
			</div>



			<div align="center">
				<p>=</p>
			</div>
			
			

			<div class="form-group">
				<div class="col-sm-4 col-sm-offset-4" id="compareCountry">
				
					<select class="form-control" id="compareCountryValue">
						<!-- <option value="0">나라를 선택해주세요</option> -->
						<c:set var="i" value="0" />
						<c:forEach var="currency" items="${returnList}">
						
							<c:set var = "theString" value = "${currency.cur_nm}"/>
							<c:set var = "dailyCity" value = "${dailyCitySelected}"/>
							<c:if test="${fn:contains(theString,dailyCity)}">
							<option value="${currency.cur_nm}" selected>${currency.cur_nm}</option>
							</c:if>
							
							<c:if test="${! fn:contains(theString,dailyCity)}">
							<option value="${currency.cur_nm}">${currency.cur_nm}</option>
							</c:if>
							
							
						</c:forEach>
					</select>
				</div>
				<div class="col-sm-4 col-sm-offset-4"></div>
				<div class="col-sm-4 col-sm-offset-4">
					<input type="text" class="form-control" id="compare" name="compare"
						readOnly="true">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<input type="button" class="btn btn-success" id="getCurrency" value="환율계산"/>
					<input type="button" class="btn btn-default" id="addCurrencyToMyPlan" value="내 플랜에 저장하기"/>
				</div>
			</div>

		</form>
		
		<!-- -----------------환율<END>------------------- -->
		
		
		
		
		
		<!-- -----------------위험도 <START>------------------- -->
		
		<div align="center">
		
			
				
			<p>&nbsp;</p>
				<h3>${dailyCitySelected} 위험 지역 및 연락처 정보</h3>
			
			<div class="image" id="image">	
		
				<div class="col-xs-12" align="center">
					<img src="/resources/images/img_blue.png"/>
					<img src="/resources/images/img_yellow.png"/>
					<img src="/resources/images/img_red.png"/>
					<img src="/resources/images/img_black.png"/>
					<img src="/resources/images/img_lock_red.png"/>
					<img src="/resources/images/img_lock_black.png"/>
				</div>
			</div>	
			
			<input type="hidden" id="cityDangerCheck" name="unsafeCityInfo"value="${dailyCitySelected}">
			<div class="info" id="info"></div>
		</div>

		<!-- -----------------위험도 <END>------------------- -->

		
		
		
		
		
		<!-- -----------------날씨<START>------------------- -->
		<div align="center">
			<p>&nbsp;</p>
			<h3>${dailyCitySelected}날씨정보</h3>
			
			<div align="center">
				<input type="hidden" id="keyword" name="keyword"
					value="${dailyCitySelected}" readonly> <input type="hidden"
					class="btn btn-default" aria-label="Left Align"
					id="searchHistoryWeather">
			</div>

			
			<h5>${dailyCitySelected} 이전 날씨 요약 </h5>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			
			<div id="ajax_indicator">
				<img src="/resources/images/icon/plan/daily-plan-content-plus-icon.jpeg" width="30px"/>
			</div>
			
			<table>	
				<tbody id="listTbody">
					<c:set var="i" value="0" />
					<c:forEach var="list" items="${list}">
						<tr id="listtr">
							<td align="center" id="info">${list}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			
			<div class="chart-container" style="position: relative; width:50vw">

				<canvas id="weatherChart" ></canvas>
				<canvas id="rainChart" ></canvas>
			
			</div>
			﻿
		</div>
		
		<!-- -----------------날씨<END>------------------- -->


			</div>
					</div>
				</div>
			</div>
			<div align="right" class="col-xs-1">&nbsp;</div>
		</div>
	
	
	

</body>

</html>