<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
		function fncUpdateMainPlanList() {
			$("form").attr("method", "POST").attr("action",
					"/mainplan/updateMainPlan").submit();
		}
		
		$(function() {
			$("button:contains('�Ϸ�')").on("click", function() {
				alert("�ȳ�");
				fncUpdateMainPlanList();
			});
		});



</script>

<title>Insert title here</title>
</head>
<body>
<form>
		<div class="container">
				<h5>&nbsp;</h5>
				   <h1 class=" text-info">����   </h1>
					
					
						<label for="mainPlanNo" class="col-sm-2 control-label">�÷���ȣ </label>
						<div class="col-sm-12">
							<input type="text" name="mainPlanNo"
										class="ct_input_g" style="width: 500px; height: 30px"
										maxLength="20" value="${mainPlan.mainPlanNo}">
						</div>
		
					
					 <div class="form-group">
						<label for="planTitle" class="col-sm-2 control-label">�÷����� </label>
					<div class="col-sm-12">
							<input type="text" name="planTitle"
										class="ct_input_g" style="width: 500px; height: 30px"
										maxLength="20" value="${mainPlan.planTitle}">
						</div>
					</div>
					
					<div class="form-group">
						<label for="departureDate" class="col-sm-2 control-label">����� </label>
					<div class="col-sm-12">
							<input type="text" name="departureDate"
										class="ct_input_g" style="width: 500px; height: 30px"
										maxLength="20" value="${mainPlan.departureDate}">
						</div>
					</div>
					
					<div class="form-group">
						<label for="arrivalDate" class="col-sm-2 control-label">������ </label>
					<div class="col-sm-12">
							<input type="text" name="arrivalDate"
										class="ct_input_g" style="width: 500px; height: 30px"
										maxLength="20" value="${mainPlan.arrivalDate}">
						</div>
						
					</div>
					
					 <c:set var="i" value="0" />
			  			<c:forEach var="cityList" items="${cityList}">
					  		<c:set var="i" value="${ i+1 }" />
							<div class="form-group">
								<label for="cityList" class="col-sm-2 control-label">���ø� </label>
									<div class="col-sm-12">
											<input type="text" name="cityList" class="ct_input_g" style="width: 500px; height: 30px"
														maxLength="20" value="${cityList}">
									</div>
							</div>
						 </c:forEach>
					
					<div class="form-group">
						<label for="country" class="col-sm-2 control-label">������ </label>
						<div class="col-sm-12">
							<input type="text" name="country"
										class="ct_input_g" style="width: 500px; height: 30px"
										maxLength="20" value="${mainPlan.country}">
						</div>
					</div>
					
					<div class="form-group">
						<label for="mainThumbnail" class="col-sm-2 control-label">���μ����� </label>
						<div class="col-sm-12">
							<input type="text" name="mainThumbnail"
										class="ct_input_g" style="width: 500px; height: 30px"
										maxLength="20" value="${mainPlan.mainThumbnail}">
						</div>
					</div>
					
							
					<div class="pageButton-group" align="center">
						<button type="button" class="btn btn-default"
							aria-label="Right Align">
							<span class="glyphicon glyphicon-ok" aria-hidden="true" id="submit"></span>�Ϸ�
						</button>
					</div>
					
				
		</div>

</form>
</body>
</html>