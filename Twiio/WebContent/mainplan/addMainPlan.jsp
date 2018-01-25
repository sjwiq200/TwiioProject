<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<head>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- Ķ���� -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Ķ���� -->

<title>MainPlanList</title>

<script>

	function fncAddMainPlan() {
		$("form").attr("method" , "POST").attr("action" , "/mainplan/addMainPlan").submit();
	}
	
	$(function() {
		 $( "button:contains('Ȯ��')" ).on("click", function() {
			 alert("�ȳ�");
			 fncAddMainPlan();
		});
	});	
	
	
	$( function() {
	    $( "#datepicker1" ).datepicker({
	    	dateFormat: "yy-mm-dd"
	    });
	  } );
	
	$( function() {
	    $( "#datepicker2" ).datepicker({
	    	dateFormat: "yy-mm-dd"
	    });
	  } );
	
	
</script>

</head>
<body>

<div class="container">

<form>

		<div class="form-group">
				<label for="city1" class="col-sm-2 control-label">city</label>
					<div class="col-sm-12">
						<input type="text" id="city1" name="cityList" >
					</div>
				
				<label for="city2" class="col-sm-2 control-label">city</label>
					<div class="col-sm-12">
						<input type="text" id="city2" name="cityList" >
					</div>
					
				<label for="city3" class="col-sm-2 control-label">city</label>
					<div class="col-sm-12">
						<input type="text" id="city3" name="cityList" >
					</div>
		</div>
		
		<div class="form-group">
				<label for="departureDate" class="col-sm-2 control-label">�����</label>
					<div class="col-sm-12">
						<input type="text" id="datepicker1" name="departureDate" ></p>
					</div>
				
				<label for="arrivalDate" class="col-sm-2 control-label">������</label>
					<div class="col-sm-12">
						<input type="text" id="datepicker2" name="arrivalDate" ></p>
					</div>
		</div>
		
		<div class="form-group">
				<label for="planTitle" class="col-sm-2 control-label">planTitle</label>
					<div class="col-sm-12">
						<input type="text" id="planTitle" name="planTitle" ></p>
					</div>
		</div>
		
			
			<div class="pageButton-group" align="center">
				<button type="button" class="btn btn-default" aria-label="Right Align">
					<span class="glyphicon glyphicon-ok" aria-hidden="true" id="submit"></span>Ȯ��
				</button>
			</div>
			
		</form>
</div>
			
</body>
</html>