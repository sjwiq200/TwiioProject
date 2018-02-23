<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Firebase Eamil Auth ////////////////////////// -->
	
	<script src="https://www.gstatic.com/firebasejs/4.9.0/firebase.js"></script>
	
	<!-- Material Design Theming -->
	  <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.orange-indigo.min.css">
	  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	  <script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
	  
	  
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 	
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- ---------font ------------ -->
  	<link href="/resources/css/plan.css" rel="stylesheet" type="text/css" /> 
  	<link href="/resources/listProduct/css/responsive.css" rel="stylesheet" type="text/css" /> 
  	
	
	<script type="text/javascript">
	
	$(function(){
		
		var tripDate=opener.document.getElementsByName("tripDate").value;
		var count=opener.document.getElementsByName("count").value;
		var totalPrice=opener.document.getElementsByName("totalPrice").value;
		var buyerNo=opener.document.getElementsByName("buyerNo").value;
		var requirement=opener.document.getElementsByName("requirement").value;
		var productNo=opener.document.getElementsByName("productNo").value;
		
		alert(opener.document.getElementsByName("tripDate").value);
		
		$("input[name='tripDate']").val(tripDate);
		$("input[name='count']").val(count);
		$("input[name='totalPrice']").val(totalPrice);
		$("input[name='buyerNo']").val(buyerNo);
		$("input[name='requirement']").val(requirement);
		$("input[name='productNo']").val(productNo);
		
		$("form.kakao").attr("method" , "POST").attr("action" , "/transaction/kakaoPayReady").submit();
		});
		
	</script>
	
	
</head>

<body>

	
	<div class="container-fluid">
	
		
		
		
		
		<div class="jumbotron col-md-8 col-md-offset-2">
		<!-- form Start /////////////////////////////////////-->
		
		<form class="kakao">
		<input type="hidden" name="tripDate" value="${transaction.tripDate}" />
		<input type="hidden" name="count" value="${transaction.tripDate}" />
		<input type="hidden" name="totalPrice" value="${transaction.tripDate}" />
		<input type="hidden" name="buyerNo" value="${transaction.tripDate}" />
		<input type="hidden" name="requirement" value="${transaction.tripDate}" />
		<input type="hidden" name="productNo" value="${transaction.tripDate}" />
		</form>

		
		</div>
		<!-- form Start /////////////////////////////////////-->
				   
		    
	
	
</body>

</html>