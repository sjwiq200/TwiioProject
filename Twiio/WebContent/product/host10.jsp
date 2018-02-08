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
	
	 <!--listHost  -->
	<!-- Fonts -->
<!--   <link href="/resources/listHost/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="/resources/listHost/css/animate.css" rel="stylesheet" />
  Squad theme CSS
  <link href="/resources/listHost/css/style.css" rel="stylesheet">
  <link href="/resources/listHost/color/default.css" rel="stylesheet">  -->
		
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
			
			var hostNo = $(this).html().split("value=\"")[1].split("\"")[0];
			//self.location = "/product/getProduct?hostNo="+hostNo;
			
			if(${user != null}){				
			 	window.open("/user/getHost?hostNo="+hostNo,'HostInfo','location=no,menubar=no,resizable=no,status=no,right=0,width=500,height=500');
			 }else{
				 alert("로그인을 해주세요");
			 }
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
						<input type="hidden" name="hostNo" value="${transaction.tranPro.hostNo }"/>						
						<c:if test="${! empty transaction.tranPro.hostImage}">
							<img src="/resources/images/userThumbnail/${transaction.tranPro.hostImage}" alt="" title="" class="property_img"/>							
						</c:if> 
						<c:if test="${ empty transaction.tranPro.hostImage}">
							<img src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" alt="" title="" class="property_img"/>							
						</c:if>
					</a>
					<span class="price">${i}위</span>
					<div class="property_details">
						<h1>
							<a href="#">${transaction.hostName}</a>
						</h1>						
							평점 :: <!-- <br /> -->
							${transaction.evalHost}
		           			<%-- <p class="price">&#8361;${transaction.tranPro.productPrice}</p>		           			
		           			<span class="property_size"><p>조회수 :: ${transaction.tranPro.viewCount}</p></span></h2> --%>
					</div>
				</li>
				</c:forEach>
			</ul>
			
		</div>
	</section>	
	<!--  end listing section  -->
	
	
	<%-- <div class="container">

      <!-- <div class="row">
        <div class="col-lg-2 col-lg-offset-5">
          <hr class="marginbot-50">
        </div>
      </div> -->
         <section class="listings">
      <div class="row">
      
      <c:set var="i" value="0" />
				<c:forEach var="transaction" items="${list}">
				<c:set var="i" value="${i+1}" />
        <div class="col-md-3">
          <div class="wow bounceInUp" data-wow-delay="0.2s">
            <div class="team boxed-grey">
            <span class="price">${i}위</span>
              <div class="inner">
                <h5>${transaction.hostName}</h5>
                <p class="subtitle">평점 :: ${transaction.evalHost}</p>
                <div class="avatar">
                	<input type="hidden" name="hostNo" value="${transaction.tranPro.hostNo }"/>						
						<c:if test="${! empty transaction.tranPro.hostImage}">
							<img src="/resources/images/userThumbnail/${transaction.tranPro.hostImage}" style="width: 290px; height: 175px;" alt="" class="img-responsive img-circle" />												
						</c:if> 
						<c:if test="${ empty transaction.tranPro.hostImage}">
							<img src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" style="width: 290px; height: 175px;" alt="" class="img-responsive img-circle"/>							
						</c:if>
                </div>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
        
      </div>
      </section>
    </div> --%>
	


	</div>
	
	  



</body>
</html>
