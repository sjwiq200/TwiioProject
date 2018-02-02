<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- autocomplate -->
 <!--  <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
	<script type="text/javascript">
	$(function () {
		$("a[name='getPro']").bind("click",function(){
			
			//function(){
				//alert($(this).html().split("value=\"")[1].split("\"")[0]);
				
			//}
			var productNo = $(this).html().split("value=\"")[1].split("\"")[0];
			self.location = "/product/getProduct?productNo="+productNo;
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

		<div class="page-header text-info"></div>

		<c:set var="i" value="0" />
		<c:forEach var="transaction" items="${list}">
			<div class="row">
				<!-- best10product -->
				<c:set var="i" value="${i+1}" />
				<strong>${ i }위</strong>
				<div class="col-sm-3 ">
					<a href="#" class="thumbnail" name="getPro" style="height: 400px;">
						<input type="hidden" name="productNo"
						value="${transaction.tranPro.productNo }" /> <c:if
							test="${! empty transaction.tranPro.thumbnail}">
							<img
								src="/resources/images/productThumbnail/${transaction.tranPro.thumbnail}"
								style="width: 290px; height: 175px;" alt="..."
								class="img-rounded">
						</c:if> <c:if test="${empty transaction.tranPro.thumbnail}">
							<img
								src="http://www.fada.org/wp-content/themes/fada/img/placeholder.jpg"
								style="width: 290px; height: 175px;" alt="..."
								class="img-rounded">
						</c:if>
						<div class="caption">
							<h3>${transaction.tranPro.productName}</h3>
							<h5>${transaction.evalProduct}</h5>
							<p>${transaction.tranPro.country}|
								${transaction.tranPro.city}</p>

							<!-- <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> -->
						</div>
					</a>
				</div>
			</div>
		</c:forEach>


		<!-- best10host -->
		 <c:set var="j" value="0" />
		  <c:forEach var="transaction" items="${list02}">				
			<c:set var="j" value="${j+1}" />
		   <strong>${ j }위</strong>
		    <div class="col-sm-3 " >
		      <a href="#" class="thumbnail" name="getPro" style="height:400px;">
		      	<input type="hidden" name="hostNo" value="${transaction.tranPro.hostNo }"/>
		      	<c:if test="${! empty transaction.tranPro.hostImage}">
		        <img src="/resources/images/userThumbnail/${transaction.tranPro.hostImage}" style="width:290px; height:175px;" alt="..." class="img-rounded">
		        </c:if>
		        <c:if test="${empty transaction.tranPro.hostImage}">
		        <img src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" style="width:290px; height:175px;" alt="..." class="img-rounded">
		        </c:if>
		          <div class="caption">
		            <h3>${transaction.hostName} </h3>		            
		            <h5>${transaction.evalHost} </h5>		            
		            <!-- <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> -->
		        </div>
		      </a>
		    </div>
		    </c:forEach>

	</div>



</body>
</html>
