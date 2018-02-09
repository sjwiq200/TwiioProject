<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>listDailyPlan</title>

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

<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- ---------Floating Button------------ -->
 <link href="/resources/css/floatingButton.css" rel="stylesheet" type="text/css" />

<style>

html, body {
	padding-top : 70px ;
	width: 100%;
	height: 100%;
	background: #f4f4f4;
}

/* #header .inner {
	margin-top: 70px;
	margin-bottom: 30px;
	text-align: center;
	width: 100%;
	height: 100%;
	
} */

.container {
}

#contentsBox {
	font-family: 'TYPO_JEONGJOL';
	height: 100px;
	margin-top: 20px;
	margin-bottom: 20px;
	overflow: visible;
}

#line {
	border-top: dashed 0.6px #616161; 
	overflow: visible;
}

#contents {
	margin-top: 28px;
	margin-bottom: 20px;
	margin-left: auto;
	margin-right: auto;
	font-size: 2em;
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

#contentsTitle {
	font-size: 2em;
	margin-top: 140px;
	margin-bottom: 70px;
	font-family:'TYPO_JEONGJOM';
}


.dayClick {
	margin-top: 15px;
	cursor: pointer;
}

.dayClick:active {
  transform: translateY(4px);
}

/* 버튼 효과 주기 <START>*/
.button {
  display:inline-block;
  /* padding: 15px 25px; */
  font-size: 15px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #56B1BF;
  border: none;
  border-radius: 15px;
  box-shadow: 0 4px #999;
}

.button:hover {background-color: #D0D3C5}

.button:active {
  background-color: #D0D3C5;
  box-shadow: 0 4px #999;
  transform: translateY(4px);
}
/* 버튼 효과 주기 <END>*/

</style>

<script>

	function fncAddMainPlanList() {
		$("form").attr("method", "POST").attr("action","/mainplan/addMainPlan.jsp").submit();
	}

	$(function() {
		$("button:contains('추가')").on("click", function() {
			fncAddMainPlanList();
		});
	});
	 
	$(function() {
		$("button:contains('선택')").bind("click",function() {
			var index = $("button:contains('선택')").index(this);
			var dailyPlanNo = $($("input[name='dailyPlanNo']")[index]).val();
			var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
			var url = "/dailyplan/getDailyPlan?dailyPlanNo="+dailyPlanNo+"&mainPlanNo="+mainPlanNo;
			$(location).attr('href', url);
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
	 
	 $(function() {
		$("input[name='citySelectButton']").bind("click",function() {
			var index = $("input[name='citySelectButton']").index(this);
			var order = $($("input[name='citySelectButton']")[index]).attr("id");
			$($("input[name='citySelectButton']")[index]).attr('class','btn btn-primary');
			var dailyPlanNo4city = $($("input[name='dailyPlanNo']")[order]).val()-1 ;
			var cityName = $($("input[name='citySelectButton']")[index]).val();
			var cityNameEnc = encodeURI(encodeURIComponent(cityName));
			
			  $.ajax({
                  url:'/dailyplan/json/selectCity?dailyPlanNo4city='+dailyPlanNo4city+'&cityName='+cityNameEnc,
                  type:'get'
               });
			  
			  $($("input[name='citySelectButton']")[index]).remove();
			  $($(".contents")[order-1]).append("<h6>"+" " +cityName+"</h6>");
			  
		});
	 })
 
</script>

</head>
<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<form class="form-horizontal">

		<div class="container">

			<div class="col-xs-12 inner" id="thumbnailMainBox">
				<div align="center" class="col-xs-1">&nbsp;</div> <!-- 그라디언트 보이게 해주려고 한 부분 -->
				<div class="col-xs-12 inner" id="thumbnailMainThumbBox" align="center">
					<div class="col-xs-12 mainBackImage">
						<div class="col-xs-12" id="contentsTitle"><strong><h1>Contents</h1></strong> </div>
					</div>
					<div class="mainPlanList" align="center">
							<c:set var="i" value="0" />
							<c:forEach var="dailyPlan" items="${list}">
								<c:set var="i" value="${ i+1 }" />
								<input type="hidden"name="dailyPlanNo" value="${dailyPlan.dailyPlanNo}" />
							    <input type="hidden" name="mainPlanNo" value="${dailyPlan.mainPlan.mainPlanNo}" />
							    <div class="col-xs-12 contentsBox" id="contentsBox">
							    	<div class="col-xs-2"></div>
								    <div class="col-xs-4 dayClick" align="left" ><strong><h3>DAY${ i }</h3></strong></div>
								    <div class="col-xs-4 contents" name="contents" align="right">
										</br>
										<h4>${dailyPlan.dailyDate}</h4>
										<h6>${dailyPlan.dailyCity}</h6> 
									</div>
									<!--<div class="col-xs-1"><p>국가 </p>
									<div class="col-xs-12" align="left"></div><p>도시 </p> </div> -->
									<%-- <p>${dailyPlan.dailyCountry}</p> --%>
									<%-- <p>데일리플랜번호 : ${dailyPlan.dailyPlanNo}</p>
									<p>메인플랜번호 : ${dailyPlan.mainPlan.mainPlanNo}</p> 
									<p>유저번호 : ${dailyPlan.user.userNo }</p>--%>
									 <div class="col-xs-2" id="contents">
										<c:if test="${empty dailyPlan.dailyCity}">
											<c:set var="num" value="0" />
											<c:forEach var="cityList" items="${cityList}">
												<c:set var="num" value="${ num+1 }" />
												<div class="btn-group" role="group" id="cityButtonGroup">
													<input type="button" class="button" name="citySelectButton" id="${i}" class="btn btn-default" value="${cityList}" />
												</div>
											<%-- 	<button class="button" id="${i}">${cityList}</button> --%>
											</c:forEach>
										</c:if>
										<p></p>
									</div>
								</div>
								  <div class="col-xs-2"></div><div class="col-xs-8" id="line"></div> <div class="col-xs-2"></div>
							</c:forEach>
					</div>



				</div>
				<div align="right" class="col-xs-1">&nbsp;</div>
			</div>
			<!-- 섬네일 전체 박스 부분 -->
		</div>
	</form>
</body>
</html>