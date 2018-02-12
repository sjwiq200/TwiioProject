
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


<link rel="stylesheet" href="/resources/css/plan.css" />
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap-dropdownhover.min.css"
	rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



<title>MainPlanList</title>


<style>
html, body {
	width: auto;
	height: auto;
	min-height: 1300px;
	background: linear-gradient(-45deg, #56B1BF, transparent),
		linear-gradient(45deg, #D73A31, transparent);
}

body {
	color: #fff;
	text-align: center;
}

.inner {
}


site-wrapper>.site-wrapper {
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
	margin-right: 400px;
	margin-left: 400px;
}

.addMianPlanTitle {
	margin-right: 400px;
	margin-left: 400px;
}

.contents {
	border: none;
	padding: 10px 0 10px 0;
	background-color: rgba(255, 255, 255, 0) !important;
	background: rgba(255, 255, 255, 0);
	color: #fff;
	font-size: 15px;
	border-bottom: 1px dotted #fff;
	border-radius: 0;
	box-shadow: none !important;
	height: auto;
}

.contentsList {
	font-family: 'TYPO_JEONGJOL';
	width: 500px;
}

</style>


<script>
	function fncAddMainPlan() {
		var planTitle = $("#planTitle").val();
		var mainThumbnail = $("#mainThumbnail").val();
		var datepicker1 = $("#datepicker1").val();
		var datepicker2 = $("#datepicker2").val();
		//alert(mainThumbnail);
		var flag = true;

		if (planTitle == "") {
			flag = false;
		}
		if (mainThumbnail == "") {
			flag = false;
		}
		if (datepicker1 == "") {
			flag = false;
		}
		if (datepicker2 == "") {
			flag = false;
		}

		var addPlan = "";

		$("input[name='countryList']")
				.each(
						function(index) {

							if ($($("input[name='countryList']")[index]).val() == "") {
								flag = false;
							} else {
								addPlan += '<input type="hidden" name="countryList" value="'
										+ $(
												$("input[name='countryList']")[index])
												.val() + '">';
							}
						});

		if (flag) {

			$("div[name='planer']").remove();
			$("div[name='addThumbnail']").remove();
			$("input[name='file']").attr("style", "display:none");

			addPlan += '<input type="hidden" name="planTitle" value="'+planTitle+'">'
					+ '<input type="hidden" name="departureDate" value="'+datepicker1+'">'
					+ '<input type="hidden" name="arrivalDate" value="'+datepicker2+'">';
			//alert(addPlan);
			$(".form-group.center-block.contentsList").append(addPlan);

			$(".btn-1").attr('value', '여행을 시작해 볼까요?').attr('style','font-size: 2.8em; font-family: "JEJUMYEONGJO";background-color:transparent;margin-top:120px;');

		}
	}

	$(function() {
		$("#submit").on(
				"click",
				function() {
					$("form").attr("method", "POST").attr("action",
							"/mainplan/addMainPlan").attr("enctype",
							"multipart/form-data").submit();
				});
	});

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

	$(document)
			.ready(
					function() {
						$("input[name='countryList']")
								.each(
										function(index) {
											//alert(index);
											$(
													$("input[name='countryList']")[index])
													.autocomplete(
															{
																source : function(
																		request,
																		response) {

																	$
																			.ajax({
																				url : "/information/json/countryAutoComplete/",
																				method : "POST",
																				data : {
																					keyword : $(
																							$("input[name='countryList']")[index])
																							.val()
																				},
																				dataType : "json",
																				success : function(
																						JSONData) {

																					response($
																							.map(
																									JSONData,
																									function(
																											item) {

																										return item;
																									}));
																				}
																			});
																}
															});
										});

					});

	/////////////////////////////////

	$(function() {
		$("#datepicker1").flatpickr({
			altInput : true,
			altFormat : "F j, Y",
			dateFormat : "Y-m-d",
		});
	});

	$(function() {
		$("#datepicker2").flatpickr({
			altInput : true,
			altFormat : "F j, Y",
			dateFormat : "Y-m-d",
		});

	});

	$(function() {
		$("#planTitle").on("change", function() {
			fncAddMainPlan();
		});

		$("input[name='countryList']").on("change", function() {
			fncAddMainPlan();
		});

		$("#mainThumbnail").on("change", function() {
			fncAddMainPlan();
		});

		$("#datepicker1").on("change", function() {
			fncAddMainPlan();
		});

		$("#datepicker2").change(function() {
			var start = $("#datepicker1").val();
			var end = $("#datepicker2").val();
			if (start > end) {
				swal("도착일이 출발일보다 빠를 수 없습니다. \n재입력 부탁드립니다.");
			} else {
				fncAddMainPlan();
			}
		});
	});

	////////////////////////////////////////////addcountry////
	var i = 1;
	$(function() {

		$("#addCountry")
				.on("click",function() {
							i++;
							if (i == 2) {$("#removeCountry").attr("disabled", false);}
							if (i > 19) {$("#addCountry").attr("disabled", true);}

							$("div[name=addCountry]").append($('<input  type="text" id="country'+i+'" name="countryList" style="position: absoloute" placeholder="아직 정하지 못했어요."class="form-control input-md contents" >'));
							$(document).find("input[name='countryList']").removeClass('ui-autocomplete-input')
									.each(function(index) {
										$($("input[name='countryList']")[index]).autocomplete(	{source : function(request,response) {
																					$.ajax({
																					url : "/information/json/countryAutoComplete/",
																					method : "POST",
																					data : {keyword : $($("input[name='countryList']")[index]).val()
																					},
																					dataType : "json",
																					success : function(JSONData) {

																						response(
																								$.map(JSONData,function(item) {

																											return item;
																										}));
																					}
																				});
																	}
																});
											});
						});

		$(function() {

			$("#removeCountry").on("click", function() {
				if (i > 2) {
					$("#addTripDate").attr("disabled", false);
					$('#country' + i).remove();
					i--;
				} else if (i == 2) {
					$("#removeCountry").attr("disabled", true);
					$('#country' + i).remove();
					i--;
				}

			});
		});
	});

	$(function() {
		$("#mainThumbnail").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result).attr('width', '50px');
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	$(function(){
		$("#fileUpload").on("click",function(){
			$('#mainThumbnail').click();
		});
	});
</script>

</head>


<jsp:include page="/layout/toolbar.jsp" />

<body>

	<div class="container">

		<header id="header" class="alt">
		<div class="inner">
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<h1>Design Your TwiiBook</h1>
		</div>
		</header>
		<div class="form-group">
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<form>
				
				<div class="form-group center-block contentsList"
					style="font-family: 'TYPO_JEONGJOL';">
					<div name="addThumbnail">
						<label for="mainThumbnail" class="col-sm-12 control-label">썸네일을 등록해주세요</label> <img id="blah" />
						 <input type="button" class="form-control contents" style="position: absoloute" id="fileUpload" name="fileUpload">
						<p>&nbsp;</p>
					</div>
					
					<input type="file" class="form-control contents" id="mainThumbnail" name="file" style="display:none;">
					
					
					<div name="planer">
						<label for="planTitle" class="col-md-12 control-label">당신의 플랜북 이름을 정해주세요</label>
						 <input type="text" class="form-control contents" style="position: absoloute" id="planTitle" name="planTitle"
							placeholder="Your book title">
						<p>&nbsp;</p>
						
						
						<div name="addCountry">
							<label class="control-label" for="textinput">여행하고 싶은 국가를 입력해주세요</label> 
							<input type="text" id="country1" name="countryList" style="position: absoloute" placeholder="아직 정하지 못했어요." class="form-control input-md contents">
							
							
						<div class="btn-group"></div>
							<a class="btn btn-default btn" href="#" role="button" id="addCountry" name="addCountry">
							<span class="glyphicon glyphicon-plus" aria-hidden="true" style="color:#A6A0A5;"></span></a> 
							<a class="btn btn-default btn" href="#" role="button" id="removeCountry" name="removeCountry" disabled="true">
							<span class="glyphicon glyphicon-minus" aria-hidden="true" style="color:#A6A0A5;"></span></a>
						</div>
						<p>&nbsp;</p>
						<label for="departureDate" class="col-sm-12 control-label ">출발일을 입력해주세요</label> 
						<input type="text" class="form-control contents" id="datepicker1" name="departureDate" placeholder="Your departure date">
						<p>&nbsp;</p>

						<label for="arrivalDate" class="col-sm-12 control-label">도착일을입력해주세요</label> 
						<input type="text" class="form-control contents" id="datepicker2" name="arrivalDate" placeholder="Your arrival date">
						<p>&nbsp;</p>

					</div>
				</div>
				<input type="submit" class="btn-1" style="background-color: transparent; " id="submit" value="">
			</form>
		</div>


	</div>
</body>

</html>