
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
  
   <!-- ---------Floating Button------------ -->
  <link href="/resources/css/floatingButtonRoom.css" rel="stylesheet" type="text/css" />
  
  <!-- ---------font ------------ -->
  	<link href="/resources/css/plan.css" rel="stylesheet" type="text/css" />
  			
	<!-- listProduct -->
	<link rel="stylesheet" type="text/css" href="/resources/listProduct/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/listProduct/css/responsive.css">
	

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 52px;
	/* background: rgba(208, 211, 197, 0.3); */
	background:  #f4f4f4;
	/* color: #08708A; */
}

/*
	inspired from http://codepen.io/Rowno/pen/Afykb
	& https://jsfiddle.net/q0rgL8ws/
	*/
.carousel-fade .carousel-inner .item {
	opacity: 0;
	transition-property: opacity;
	overflow: hidden;
}

.item.active img {
	transition: transform 5000ms linear 0s;
	/* This should be based on your carousel setting. For bs, it should be 5second*/
	transform: scale(1.05, 1.05);
}

.carousel-fade .carousel-inner .active {
	opacity: 1;
}

.carousel-fade .carousel-inner .active.left, .carousel-fade .carousel-inner .active.right
	{
	left: 0;
	opacity: 0;
	z-index: 1;
}

.carousel-fade .carousel-inner .next.left, .carousel-fade .carousel-inner .prev.right
	{
	opacity: 1;
}

.carousel-fade .carousel-control {
	z-index: 2;
}

/*
	WHAT IS NEW IN 3.3: "Added transforms to improve carousel performance in modern browsers."
	now override the 3.3 new styles for modern browsers & apply opacity
	*/
@media all and (transform-3d) , ( -webkit-transform-3d ) {
	.carousel-fade .carousel-inner>.item.next, .carousel-fade .carousel-inner>.item.active.right
		{
		opacity: 0;
		-webkit-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);
	}
	.carousel-fade .carousel-inner>.item.prev, .carousel-fade .carousel-inner>.item.active.left
		{
		opacity: 0;
		-webkit-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);
	}
	.carousel-fade .carousel-inner>.item.next.left, .carousel-fade .carousel-inner>.item.prev.right,
		.carousel-fade .carousel-inner>.item.active {
		opacity: 1;
		-webkit-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);
	}
}


.btn {
    letter-spacing: 1px;
    text-decoration: none;
    background: none;
    -moz-user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 0;
    cursor: pointer;
    display: inline-block;
    margin-bottom: 0;
    vertical-align: middle;
    white-space: nowrap;
    font-size: 90%;
    line-height: 150%;
    font-weight: 700;
    text-transform: uppercase;
    border: 2px solid;
    padding: 1% 1%;
}
.btn.btn-default:hover, .btn.btn-default:active{
	color: #FFF;
	background: #08708A;
	border-color: #08708A;
}

.btn.btn-default{
	background: #f4f4f4;
	color: #08708A;
	border-color: #08708A;
}

.btn-outlined.btn-theme:hover, .btn-outlined.btn-theme:active {	
	color: #FFF;
	background: #08708A;
	border-color: #08708A;
}

.btn-outlined.btn-theme {
    margin-top: 5%;
    margin-right: 2%;
    margin-left: 2%;
    background: #f4f4f4;
    color: #08708A;
    border-color: #08708A;
}
a.thumbnail{
	color: #08708A;
}
.caption{	
	color: #08708A;
	border-color: #08708A;
}
font{
	color: #08708A;
}
div.caption{
	font-family:'NanumGothic';
}
</style>
<script type="text/javascript">
	function fncGetUserList(currentPage, priceCondition, prodSearchType) {
		//alert(prodSearchType);
		$("#currentPage").val(currentPage);
		$("#priceCondition").val(priceCondition);
		$("#prodSearchType").val(prodSearchType);	
		//alert($("#prodSearchType").val());
		$("form").attr("method", "POST").attr("action", "/product/listProduct").submit();
	}

	$(function() {
		
		$("#floating-button").bind("click", function() {
			self.location = "/product/addProduct";
		});

		$("button.btn.btn-default:contains('검색')").bind("click", function() {
			//fncGetUserList(1);
			$("#currentPage").val(1);				
			$("form").attr("method", "POST").attr("action", "/product/listProduct").submit();
		});

		$("#searchKeyword").keydown(function(e) {
			if (e.keyCode == 13) {
				//fncGetUserList(1);
				$("#currentPage").val(1);				
				$("form").attr("method", "POST").attr("action", "/product/listProduct").submit();
			}
		});

	});

	var page = 1;
	var flag = 0;
	var flag2 = 0;
	var productCount = ${resultPage.totalCount};

	if (self.name != 'reload') {
		self.name = 'reload';
		self.location.reload(true);
	} else
		self.name = '';

	$(function() {
		$(window)
				.scroll(
						function() {
							//alert("????");
							//var scrollHeight=$(window).scrollTop() + $(window).height();
							var documentHeight = $(document).height();

							console.log('$(window).scrollTop() :: '
									+ ($(window).scrollTop()));
							console
									.log('$(document).height() - $(window).height() :: '
											+ ($(document).height() - $(window)
													.height()));

							if (($(window).scrollTop()) != $(document).height()
									- $(window).height()
									& flag2 == 1) {
								flag2 = 0;
								console.log('flag :: ' + flag2);
							}

							if (($(window).scrollTop() + 0.8) >= $(document)
									.height()
									- $(window).height()
									& flag2 == 0) {
								flag2 = 1;
								console.log('$(window).scrollTop() :: '
										+ $(window).scrollTop());
								console
										.log('$(document).height() - $(window).height() :: '
												+ ($(document).height() - $(
														window).height()));
								page = page + 1;
								/* var sc=$('#searchKeword').val();
								if($('#searchKeword').val()==null)
									sc=null; */

								$.ajax({
										url : "/product/json/listProduct",
										method : "POST",
										dataType : "json",
										contentType : "application/json;charset=UTF-8",
										data : JSON.stringify({
											"currentPage" : page,
											"searchCondition" : $('#searchCondition').val(),
											"searchKeyword" : $('#searchKeword').val(),
											"priceCondition" : $('#priceCondition').val(),
											"prodSearchType" :  $('#prodSearchType').val()
										}),
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										success : function(JSONData, status) {
											//alert(status);
											//alert(JSON.stringify(JSONData));
											if (flag == 0) {
												productCount = productCount
														- JSONData.length;
												flag = 1;
											}

											for (var i = 0; i < JSONData.length; i++) {
												var displayValue = '<li>'				
														+'<a href="#">'
														+'<input type="hidden" name="productNo" value="'+JSONData[i].productNo+'"/>';
														
												if (JSONData[i].thumbnail != null) {
													displayValue += '<img src="/resources/images/productThumbnail/'+JSONData[i].thumbnail+'" alt="" title="" class="property_img"/>';
												}else{
													displayValue += '<img src="http://www.fada.org/wp-content/themes/fada/img/placeholder.jpg" alt="" title="" class="property_img"/>';
												}
												
												displayValue += '</a>'
													+'<span class="price">&#8361;'+JSONData[i].productPrice+'</span>'
													+'<div class="property_details">'
													+'<h1>'
													+'<a href="#">'+JSONData[i].productName+'</a>'
													+'</h1>'
													+'<h2><p>';
													 
												if(JSONData[i].productType == '1'){
													displayValue += '명소투어';
												}else if(JSONData[i].productType == '2'){
													displayValue += '음식투어';
												}else if(JSONData[i].productType == '3'){
													displayValue += '트래킹';
												}else if(JSONData[i].productType == '4'){
													displayValue += '액티비티';
												}else{
													displayValue += 'night투어';
												}
												
												displayValue += '</p>'
														+'<p>'+JSONData[i].country+' :: '+JSONData[i].city+'</p>'
														+'투어날짜 :: ';
												
												
												 //alert("???");
												var tripdate = JSONData[i].tripDate.split(",");
													//alert(tripdate);
													//alert(tripdate.length);
												for (var j = 0; j < tripdate.length; j++) {
													//alert('???dkjflsjg');
													//alert( tripdate[j].split("=")[0]);
													//alert(displayValue);
													displayValue += tripdate[j].split("=")[0];
													//alert(displayValue);
												}
												
												displayValue += '<span class="property_size"><p>조회수 :: '+JSONData[i].viewCount+'</p></span></h2>'
														+'</div>'
														+'</li>';
												
												$('ul.properties_list').append(
														displayValue);
											}
										}
									});
							}
						});

		$("#searchKeyword").autocomplete({

			source : function(request, response) {
				//alert("제발요");
				//alert($("#searchCondition").val());
				//alert($("#searchKeyword").val());
				$.ajax({
					url : "/product/json/autoComplate/",
					method : "POST",
					data : {
						searchCondition : $("#searchCondition").val(),
						searchKeyword : $("#searchKeyword").val()
					},
					dataType : "json",
					success : function(JSONData) {
						//alert("제발ajax");	    											
						//alert("JSONData: \n"+JSONData);

						response($.map(JSONData, function(item) {

							return item;
						}));
					}
				});

				//alert("제발요");
			}
		});

		$("font[name='up']").bind(
				"click",
				function() {
					//alert($("input[name='prodNo']").val());
					self.location = "/product/updateProduct?prodNo="
							+ $(this).html().split("value=")[1].split("\"")[1]
							+ "&menu=${param.menu}";

				});

		$("font[name='high']").bind("click", function() {
			//alert("???");
			//var prodSearchType = $('#prodSearchType').val();
			fncGetUserList('${resultPage.currentPage }', 'high','${search.prodSearchType}');
		});

		$("font[name='low']").bind("click", function() {
			//var prodSearchType = $('#prodSearchType').val();
			fncGetUserList('${resultPage.currentPage }', 'low','${search.prodSearchType}');
		});

		$("li").bind("click", function() {
			//function(){
			//alert($(this).html().split("value=\"")[1].split("\"")[0]);
			//}
			//alert("dfdfsdf");
			var productNo = $(this).html().split("value=\"")[1].split("\"")[0];
			//alert(productNo);
			self.location = "/product/getProduct?productNo=" + productNo;
		});

	});
	
	$(function() {
		
		$("#best10").bind("click", function() {
			$(self.location).attr("href","/product/listBestProduct");
		});
		
		$("#host10").bind("click", function() {
			$(self.location).attr("href","/product/listBestHost");
		});
		
		$("#attraction").bind("click", function() {
			fncGetUserList('${resultPage.currentPage }','${search.priceCondition}' ,'1');
		});
		
		$("#food").bind("click", function() {
			fncGetUserList('${resultPage.currentPage }','${search.priceCondition}' ,'2');
		});
		
		$("#tracking").bind("click", function() {
			fncGetUserList('${resultPage.currentPage }','${search.priceCondition}' ,'3');
		});
		
		$("#activity").bind("click", function() {
			fncGetUserList('${resultPage.currentPage }','${search.priceCondition}' ,'4');
		});
		
		$("#night").bind("click", function() {
			fncGetUserList('${resultPage.currentPage }','${search.priceCondition}' ,'5');
		});
	});
</script>
</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" /> 
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  Carousel Start /////////////////////////////////////-->
	<div class="container">
		<div id="carousel" class="carousel slide carousel-fade"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carousel" data-slide-to="0" class="active"></li>
				<li data-target="#carousel" data-slide-to="1"></li>
				<li data-target="#carousel" data-slide-to="2"></li>
			</ol>
			<!-- Carousel items -->
			<div class="carousel-inner carousel-zoom">
				<div class="active item">
					<img class="img-responsive"
						src="https://images.unsplash.com/photo-1419064642531-e575728395f2?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=1200">
					<div class="carousel-caption">
						<h2>Title</h2>
						<p>Description</p>
					</div>
				</div>
				<div class="item">
					<img class="img-responsive"
						src="https://images.unsplash.com/photo-1445280471656-618bf9abcfe0?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=1200">
					<div class="carousel-caption">
						<h2>Title</h2>
						<p>Description</p>
					</div>
				</div>
				<div class="item">
					<img class="img-responsive"
						src="https://images.unsplash.com/photo-1445462657202-a0893228a1e1?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=1200">
					<div class="carousel-caption">
						<h2>Title</h2>
						<p>Description</p>
					</div>
				</div>
			</div>
			<!-- Carousel nav -->
			<a class="carousel-control left" href="#carousel" data-slide="prev">‹</a>
			<a class="carousel-control right" href="#carousel" data-slide="next">›</a>
		</div>
	</div>
	<!--  Carousel End /////////////////////////////////////-->

	<!--  ButtonGroup Start /////////////////////////////////////-->
	<div class="container">
		<!-- <div class="page-header text-info"></div>	 -->		
		<div class="row col-sm-offset-2 col-sm-10 text-center">
			<button class="row col-xs-2 btn btn-outlined btn-theme btn-xs" id="best10">best10</button>
			<button class="row col-xs-2 btn btn-outlined btn-theme btn-xs" id="host10">host10</button>
			<button class="row col-xs-2 btn btn-outlined btn-theme btn-xs" id="attraction">명소투어</button>
			<button class="row col-xs-2 btn btn-outlined btn-theme btn-xs" id="food">푸드투어</button>
		</div>

		<div class="row col-sm-offset-3 col-sm-10 text-center">
			<button class="row col-xs-2 btn btn-outlined btn-theme btn-xs" id="tracking">트래킹</button>
			<button class="row col-xs-2 btn btn-outlined btn-theme btn-xs" id="activity">액티비티</button>
			<button class="row col-xs-2 btn btn-outlined btn-theme btn-xs" id="night">night투어</button>
		</div>
	</div>
	<!--  ButtonGroup End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header text-info"></div>

		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6 text-left">				
				<p class="text-primary">전체 ${totalCount } 건수</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">				
					<div class="form-group">
						<select class="form-control" name="searchCondition"
							id="searchCondition">
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>국가</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>도시</option>
							<option value="2"
								${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>투어명</option>
							<option value="3"
								${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>호스트</option>

						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="검색어"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<button type="button" class="btn btn-default">검색</button>

					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />
					<input type="hidden" id="priceCondition" name="priceCondition" value="${! empty search.priceCondition ? search.priceCondition : '' }" />
					<input type="hidden" id="prodSearchType" name="prodSearchType" value="${! empty search.prodSearchType ? search.prodSearchType : '' }" />
					<div>
						<font name="high">가격높은순</font>
						<font name="low">가격낮은순</font>
						<!-- <font color="blue" name="star">별점순</font>
						<font color="blue" name="view">조회순</font> -->
					</div>
					<p></p>
				</form>

			</div>

		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
	<!--  start listing section  -->
	<section class="listings">
		<div class="wrapper">
			<ul class="properties_list">
			<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
				<li>				
					<a href="#">
						<input type="hidden" name="productNo" value="${product.productNo }" />						
						<c:if test="${! empty product.thumbnail}">
							<img src="/resources/images/productThumbnail/${product.thumbnail}" alt="" title="" class="property_img"/>							
						</c:if> 
						<c:if test="${empty product.thumbnail}">
							<img src="http://www.fada.org/wp-content/themes/fada/img/placeholder.jpg" alt="" title="" class="property_img"/>							
						</c:if>
					</a>
					<span class="price">&#8361;${product.productPrice}</span>
					<div class="property_details">
						<h1>
							<a href="#">${product.productName}</a>
						</h1>
						<h2><p>
								<c:if test="${product.productType == 1}">명소투어</c:if>
								<c:if test="${product.productType == 2}">음식투어</c:if>
								<c:if test="${product.productType == 3}">트래킹</c:if>
								<c:if test="${product.productType == 4}">액티비티</c:if>
								<c:if test="${product.productType == 5}">night투어</c:if>
							</p>
							<p>${product.country} :: ${product.city}</p>
							투어날짜 :: <!-- <br /> -->
							<c:set var="date" value="${product.tripDate}"></c:set>
							<c:set var="date_array" value="${fn:split(date,'[=,]')}"></c:set>
							<c:forEach var="tdate" items="${date_array}" begin="0" step="2">
		            		${tdate}
		           			</c:forEach>		           			
		           			<span class="property_size"><p>조회수 :: ${product.viewCount}</p></span></h2>
					</div>
				</li>
				</c:forEach>
			</ul>
			
		</div>
	</section>	
	<!--  end listing section  -->
	</div>
	
	
	<!--  Floating Button <START> -->
	<c:if test="${user.userType==2}">
		<div id="container-floating">
			<div id="floating-button" data-toggle="tooltip" data-placement="center" data-original-title="addProduct" title="addProduct">
				<!-- <p class="letter" id="addProduct"><img src="/resources/images/productIcons/edit.png" style="width: 45x; height: 45px;"></p> -->
				<p class="letter" id="addProduct">+</p>
			</div>
		</div>
	</c:if>
	  <!--  Floating Button <END> -->


	<!-- PageNavigation End... -->
</body>
</html>

