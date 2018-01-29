<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->

<meta name="viewport" content="width=device-width, initial-scale=1.0" />



<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link
	href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
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

<title>MainPlanList</title>

<style>
body {
	padding-top: 100px;
}
</style>
<script type="text/javascript">
	$(function() {

		$("#uploadFile").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result).attr('width', '300px');
			}
			reader.readAsDataURL(input.files[0]);
			alert(e.target.result);
		}
	}

	$(function() {

		$("button[name=add]").on(
				"click",
				function() {
					$("form").attr("method", "POST").attr("action",
							"/dailyplan/addImage").submit();
				});

	});

    
</script>

</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	<form class="form-horizontal">

		<div class="container">

			<div align="center">

				<h1>
					DAY :<strong>${dailyPlan.day}</strong>
				</h1>

				<h5>
					DailyDate : ${dailyPlan.dailyDate}
					</h4>
					<h5>
						DailyCity : ${dailyPlan.dailyCity}
						</h4>
			</div>



			<div class="PlanContentList" align="center">

				<c:set var="i" value="0" />
				<c:forEach var="planContent" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<input type="hidden" name="planContentNo" value="${planContentNo}" />
					<div>

						<h3>No : ${ i }</h3>
						<div>콘텐츠 번호 : ${planContent.contentNo}</div>
						<div>데일리플랜번호 : ${dailyPlan.dailyPlanNo}</div>
						<div>스크랩번호 : ${scrap.scrapNo }</div>
						<div>콘텐츠타입 : ${planContent.contentType}</div>
						<div>루트 : ${planContent.route}</div>
						<div>출발지 : ${planContent.departureLocation}</div>
						<div>도착지 : ${planContent.arrivalLocation}</div>
						<div>소요시간 : ${planContent.estimatedTime}</div>
						<div>이동방법 : ${planContent.routeType}</div>
						<div>길찾기결과 : ${planContent.routeDescription}</div>
						<div>순서 : ${planContent.orderNo}</div>
						<div>
							텍스트 : <strong>${planContent.contentText}</strong>
						</div>

						<div>

							이미지 : <img
								src="/resources/images/planContentImage/${planContent.contentImage}"
								width="300px" height="300px" />

						</div>
						<div></div>
					</div>

				</c:forEach>

				<img
					src="/resources/images/icon/plan/daily-plan-content-plus-icon.jpeg"
					height="40" width="40" id="plus" />
				<div></div>
	</form>

	<div>

		<button type="button" class="btn" data-toggle="modal"
			data-target="#addText">Text</button>

		<!---------- Text ------------->

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
						<jsp:include page="/dailyplan/addText.jsp">
							<jsp:param name="data" value="${dailyPlan.dailyPlanNo}" />
						</jsp:include>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

	</div>


	<div>

		<button type="button" class="btn" data-toggle="modal"
			data-target="#addImage">Image</button>

		<!---------- Image ------------->

		<div class="modal fade" id="addImage" role="dialog">
			<div class="modal-dialog">
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
								<label for="uploadFile" class="col-sm-2 control-label">상품이미지
								</label>
								<div class="col-sm-6">
									<input type="file" name="uploadFile" class="ct_input_g"
										style="width: 200px; height: 19px" maxLength="13"
										id="uploadFile" /> <img id="blah" />
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

		<!-- ---------------------------------------------------------------- -->

		<!-- ---------------------------------------------------------------- -->

	</div>



</body>



</html>
