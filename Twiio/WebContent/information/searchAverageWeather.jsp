<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">


<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->

<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!-- jQuery UI toolTip 사용 CSS-->

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!--  ///////////////////////// CSS ////////////////////////// -->

<style>
body {
	padding-top: 50px;
	font-color: gray;
}

.form-horizontal {
	padding-left: 17%;
}

.pageButton-group {
	aria-label: "Right Align";
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->

<script type="text/javascript">
	function fncSearchHistoryWeather() {
		$("form").attr("method", "GET").attr("action",
				"/information/json/searchHistoryWeather").submit();
	}

	$(function() {
		$("#submit").on("click",
						function() {
							var cityName = $("#cityName").val();
							alert(cityName);
							
 						$.ajax( {
										url : "/information/json/searchHistoryWeather?cityName="+ cityName,
										method : "GET",
										dataType : "json",
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},

										success : function(JSONData, status) {
											alert("진입성공!");
											var quickWeatehrInfo = JSONData.quickInfo;
											var history = JSONData.historyWeather;
										
											 
											displayValue = "<a class=\"blockquote-reverse\">"
													+	"간단날씨확인 : <h5>&nbsp;</h5>"+ quickWeatehrInfo+ "℃<br/>"+
													"<h5>&nbsp;</h5><h5>&nbsp;</h5><h5>&nbsp;</h5>"+
													"1월 - 12월 과거 날씨 : <h5>&nbsp;</h5>"	+ history+ "℃<br/>"
													+ "</a>"

											$("#result").html(displayValue)
													.css("background-color",
															"white")
													.css("color", "#003366	");
										}
									});
						});
	});
</script>
</head>
<body>


	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
 	<!--  화면구성 div Start /////////////////////////////////////-->

	<div class="container">
		<h5>&nbsp;</h5>

		<div class="page-header">
			<h3 class=" text-info"> 내가 여행하고 싶은 도시의 과거 날씨를 확인해보세요 :D ♡</h3>
			<h5 class="text-muted">원하는 도시명을 선택해주시기 바랍니다.</h5>
		</div>


		<div class="form-group">
			<label for="paymentOption" class="col-sm-2 control-label">
				도시명 </label>
			<div class="col-sm-6">
				<select name="cityName" class="ct_input_g" id="cityName"
					style="width: 100px; height: 19px" maxLength="20">
					<option id="Paris" value="Paris" selected="selected">Paris</option>
					<option id="Seoul" value="Seoul">Seoul</option>
					<option id="Jeju" value="Jeju">Jeju</option>
					<option id="London" value="London">London</option>
					<option id="Tokyo" value="Tokyo">Tokyo</option>
					<option id="NewYork" value="NewYork">NewYork</option>
					<option id="Sydney" value="Sydney">Sydney</option>

				</select>
			</div>
		</div>

		<div class="pageButton-group" align="center">

			<button type="button" class="btn btn-default" id="search"
				aria-label="Right Align">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"
					id="submit">검색</span> 
			</button>

			<h5>&nbsp;</h5>
			<h5>&nbsp;</h5>
			<h5 id="result">&nbsp;</h5>

		</div>
	</div>
</body>
</html>