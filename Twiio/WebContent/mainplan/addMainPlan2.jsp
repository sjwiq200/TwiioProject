<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<head>
<title>addMainPlan</title>
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- 캘린더 2 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


<link rel="stylesheet" href="/resources/css/plan.css" />
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

<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<title>MainPlanList</title>


<style>

 html, body {
	width: auto;
	height: auto;
	background: linear-gradient(-45deg, #56B1BF, transparent),
		linear-gradient(45deg, #D73A31, transparent);
	background-blend-mode: sreen;
}

body {
	color: #fff;
	text-align: center;
} 

.inner {
	text-shadow: 0 5px 5px rgba(0, 0, 0, .5);
}

<site-wrapper>
.site-wrapper {
	display: table;
	width: 100%;
	height: 100%;
	min-height: 100%;
}

.site-wrapper-inner {
	display: table-cell;
	vertical-align: top;
}

.cover-container {
	margin-right: 600px;
	margin-left: 600px;
}

.addMianPlanTitle {
	margin-right: 600px;
	margin-left: 600px;
}

.contents {
	border: none;
	padding: 10px 0 10px 0;
	background-color: rgba(255, 255, 255, 0) !important;
	background: rgba(255, 255, 255, 0);
	color: #fff;
	font-size: 16px;
	border-bottom: 1px dotted #fff;
	border-radius: 0;
	height: auto;
}

.contentsList{
	width: 300px;
	font-family:'TYPO_JEONGJOL';
}

</style>


<script>
	//AutoComplete///////////////////

	$(function() {
		$("#city1").autocomplete({
			source : function(request, response) {
				$.ajax({
					url : "/information/json/cityAutoComplete/",
					method : "POST",
					data : {
						keyword : $("#city1").val()
					},
					dataType : "json",
					success : function(JSONData) {
						response($.map(JSONData, function(item) {
						return item;
						}));
					}
				});
			},
			minLength : 3
		});
	});

	/////////////////////////////////

	$(function() {
		$(".btn-1").on("click", function() {
			$("form").attr("method", "POST").attr("action", "/mainplan/addMainPlan").submit();
		});
	});

	$(function() {
		$("#datepicker1").flatpickr({
		    altInput: true,
		    altFormat: "F j, Y",
		    dateFormat: "Y-m-d",
		});
	});

	$(function() {
		$("#datepicker2").flatpickr({
		    altInput: true,
		    altFormat: "F j, Y",
		    dateFormat: "Y-m-d",
		});

	});
	
	$(function() {
		$("#datepicker2").change( function() {
			var start = $("#datepicker1").val();
			var end = $("#datepicker2").val();
			if(start>end){
				swal("도착일이 출발일보다 빠를 수 없습니다. \n재입력 부탁드립니다.");
			}else{
				$(".btn-1").attr('value','여행을 시작해 볼까요?');
			}
		});
	});

</script>

</head>


<jsp:include page="/layout/toolbar.jsp" />

<body>

    <div class="container">
      
			<header id="header" class="alt">
				<div class="inner">
					<p>&nbsp;</p><p>&nbsp;</p>
					<h1>Design Your TwiiBook</h1>
				</div>
			</header>
				<div class="form-group" >
						<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
			<form>

				<div class="form-group center-block contentsList">
							
						<label for="planTitle" class="col-md-12 control-label">당신의 플랜북 이름을 정해주세요</label>
							<input type="text" class="form-control contents"  style="position: absoloute" id="planTitle" name="planTitle" placeholder="Your book title" ><p>&nbsp;</p>
						
						<label class="control-label" for="textinput">여행하고 싶은 국가를 입력해주세요</label>
							<input  type="text" id="countryList" name="countryList" style="position: absoloute" placeholder="아직 정하지 못했어요."class="form-control input-md contents" ><p>&nbsp;</p>
							
						<label class="control-label" for="textinput">여행하고 싶은 도시를 입력해주세요</label>
							<input  type="text" id="city1" name="cityList" placeholder="아직 정하지 못했어요."class="form-control input-md contents" ><p>&nbsp;</p>
							
						<label for="departureDate" class="col-sm-12 control-label ">출발일을 입력해주세요</label>
							<input type="text" class="form-control contents" id="datepicker1" name="departureDate"placeholder="Your departure date"><p>&nbsp;</p>
							
						<label for="arrivalDate" class="col-sm-12 control-label">도착일을 입력해주세요</label>
							<input type="text" class="form-control contents"  id="datepicker2" name="arrivalDate" placeholder="Your arrival date"><p>&nbsp;</p>
							
						<input type="submit" class="btn-1"  style="background-color:transparent;  border:0px transparent solid; aria-label="Right Align" id="submit" value="" >
				</div>
			</form>

	</div>
</body>
</html>