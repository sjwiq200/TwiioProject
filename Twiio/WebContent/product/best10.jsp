
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
   <link href="/resources/css/animate.min.css" rel="stylesheet">
   <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- autocomplate -->
 <!--  <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <!-- listProduct -->
	<link rel="stylesheet" type="text/css" href="/resources/listProduct/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/listProduct/css/responsive.css">
		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
            background:  #f4f4f4;
        }
    </style>
	<script type="text/javascript">
	$(function () {
		$("li").bind("click",function(){
			
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
		
		<!--  start listing section  -->
	<section class="listings">
		<div class="wrapper">
			<ul class="properties_list">
			<c:set var="i" value="0" />
				<c:forEach var="transaction" items="${list}">
				<c:set var="i" value="${i+1}" />
				<li>				
					<a href="#">
						<input type="hidden" name="productNo" value="${transaction.tranPro.productNo }" />						
						<c:if test="${! empty transaction.tranPro.thumbnail}">
							<img src="/resources/images/productThumbnail/${transaction.tranPro.thumbnail}" alt="" title="" class="property_img"/>							
						</c:if> 
						<c:if test="${empty transaction.tranPro.thumbnail}">
							<img src="http://www.fada.org/wp-content/themes/fada/img/placeholder.jpg" alt="" title="" class="property_img"/>							
						</c:if>
					</a>
					<span class="price">${i}위</span>
					<div class="property_details">
						<h1>
							<a href="#">${transaction.tranPro.productName}</a>
						</h1>
						<h2><p>
								<c:if test="${transaction.tranPro.productType == 1}">명소투어</c:if>
								<c:if test="${transaction.tranPro.productType == 2}">음식투어</c:if>
								<c:if test="${transaction.tranPro.productType == 3}">트래킹</c:if>
								<c:if test="${transaction.tranPro.productType == 4}">액티비티</c:if>
								<c:if test="${transaction.tranPro.productType == 5}">night투어</c:if>
							</p>
							<p>${transaction.tranPro.country} :: ${transaction.tranPro.city}</p>
							평점 :: <!-- <br /> -->
							${transaction.evalProduct}
		           			<%-- <p class="price">&#8361;${transaction.tranPro.productPrice}</p>		           			
		           			<span class="property_size"><p>조회수 :: ${transaction.tranPro.viewCount}</p></span></h2> --%>
					</div>
				</li>
				</c:forEach>
			</ul>
			
		</div>
	</section>	
	<!--  end listing section  -->

	</div>



</body>
</html>

