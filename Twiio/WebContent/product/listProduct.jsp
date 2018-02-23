
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
	<link rel="stylesheet" type="text/css" href="/resources/listProduct/css/reset.css"/>
	<link rel="stylesheet" type="text/css" href="/resources/listProduct/css/responsive.css"/>
	

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>

body {
	padding-top: 50px;
	font-family:'JEJUGOTHIC';
	background: #f4f4f4;
}

h1 {
	/* color : #dedede; */
	color :#474747;
    font-size: 6vw;
    /* padding: 0 0.5em 0.25em 0.5em; */
    font-weight: 500;
    font-family: "Pacifico", cursive;
    text-transform: none;
    letter-spacing: 10;
    font-style: Pacifico;
    text-shadow: 0 5px 5px rgba(0, 0, 0, .5);
}
/* /////////////////dayoung////////////////// */
/* Button-dy css  */
.btn-dy {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 23px;
  font-family:TYPO_JEONGJOL;
  color: #ffffff;
  font-size: 16px;
  background: #D73A31;
  padding: 6px 20px 6px 20px;
  border: solid #D73A31 2px;
  text-decoration: none;
  margin-top: 3%;
   opacity: 0.9;
}

.btn-dy:hover {
  background: #D73A31;
  text-decoration: none;
  color:#ffffff;
  opacity: 0.7;
}

/* Button-dy css - listFriendRecommendation */
.btn-dy2 {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 23px;
  font-family:TYPO_JEONGJOL;
  color: #D73A31;
  font-size: 16px;
  background: #ffffff;
  padding: 6px 20px 6px 20px;
  border: solid #D73A31 2px;
  text-decoration: none;
  margin-top: 3%;
   opacity: 0.9;
}

.btn-dy2:hover {
  background: #D73A31;
  text-decoration: none;
  color:#ffffff;
  opacity: 0.7;
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
	font-size: 14px;
	line-height: 20px;
	font-weight: 700;
	text-transform: uppercase;
	border: 2px solid;
	padding: 8px 20px;	
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
	margin-top: 25px;
	margin-right: 35px;
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

		$("#search").bind("click", function() {
			fncGetUserList(1,'${search.priceCondition}','${search.prodSearchType}');
		});

		$("#searchKeyword").keydown(function(e) {
			if (e.keyCode == 13) {
				fncGetUserList(1,'${search.priceCondition}','${search.prodSearchType}');
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
											"searchKeyword" : $('#searchKeyword').val(),
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
													+'<h3>'
													+'<a href="#">'+JSONData[i].productName+'</a>'
													+'</h3>'
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

		/* $("font[name='up']").bind(
				"click",
				function() {
					//alert($("input[name='prodNo']").val());
					self.location = "/product/updateProduct?prodNo="
							+ $(this).html().split("value=")[1].split("\"")[1]
							+ "&menu=${param.menu}";

				}); */

		$("font[name='high']").bind("click", function() {
			//alert("???");
			//var prodSearchType = $('#prodSearchType').val();
			fncGetUserList('${resultPage.currentPage }', 'high','${search.prodSearchType}');
		});

		$("font[name='low']").bind("click", function() {
			//var prodSearchType = $('#prodSearchType').val();
			fncGetUserList('${resultPage.currentPage }', 'low','${search.prodSearchType}');
		});

		/* $("li").on("click", function() {
			//alert("???");
			//function(){
			//alert($(this).html().split("value=\"")[1].split("\"")[0]);
			//}
			//alert("dfdfsdf");
			var productNo = $(this).html().split("value=\"")[1].split("\"")[0];
			//alert(productNo);
			self.location = "/product/getProduct?productNo=" + productNo;
		}); */
		
		$(document).on("click","li", function() {
			//alert("???");
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
		
		$("#totalList").bind("click", function() {
			//$(self.location).attr("href","/product/listBestProduct");
			fncGetUserList('1');
		});
		
		$("#high").bind("click", function() {
			//$(self.location).attr("href","/product/listBestProduct");
			fncGetUserList('${resultPage.currentPage }', 'high','${search.prodSearchType}');
		});
		
		$("#low").bind("click", function() {
			//$(self.location).attr("href","/product/listBestHost");
			fncGetUserList('${resultPage.currentPage }', 'low','${search.prodSearchType}');
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
	<div class="container" style="background: url('/resources/images/productIcons/trolley-tours-of-key-west.jpg') no-repeat center center;background-size:cover; height:500px; width:100%;">
		
		<h1 class="text-center" style="color:#FFF; margin-top:5%;">Daily Tour</h1>
		<h3 class="text-center" style="font-family:'TYPO_JEONGJOL';color:#3B3B3B; margin-top:3%;"><strong>현지인이 제공하는 이색체험을 경험하세요</strong></h3>
		<!-- <!— FORM —> -->
		<div class="text-center" style="background: rgba(255, 255, 255, 0.3); margin-top:40px;margin-left:20%;margin-right:20%;">
			<form role="form" style="padding:10px;" name="detailForm">
				
	    			<div class="row">
	    				<div class="col-sm-offset-1 col-sm-2" >
						<div class="form-group">
						    <select class="form-control" id="searchCondition" name="searchCondition" style="text-align-last:center;">
		                        <option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>국가</option>
								<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>도시</option>
								<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>투어명</option>
								<option value="3" ${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>호스트</option>
							</select>
	  					</div>
	 					</div>
	 					
	  				<div class="col-sm-7">
					  <div class="form-group">					   
					    <label class="sr-only" for="searchKeyword">검색어</label> 
					    	<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					  	</div>
					  </div>
					 
		    			
		    			
	    				<div class="col-sm-1" align="center">
	    					<input type="hidden" id="currentPage" name="currentPage" value="" />
							<input type="hidden" id="priceCondition" name="priceCondition" value="${! empty search.priceCondition ? search.priceCondition : '' }" />
							<input type="hidden" id="prodSearchType" name="prodSearchType" value="${! empty search.prodSearchType ? search.prodSearchType : '' }" />
	    				 	<!-- <!— <button class="col-xs-6 btn btn-outlined btn-theme btn-sm" id="search" >검 &nbsp;색</button> —> -->
	    				 	<button class="btn-dy" id="search" align="left" style="padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;font-family:\'JEJUGOTHIC\';">SEARCH</button>
	    				</div>	
	    				
	    				<div class="col-sm-offset-1"></div>
				</div><!-- <!— End row —> -->
			</form>
			<!-- <!— FORM —> -->
		</div>
		
		<%-- <c:if test="${!empty user }">
		<div class="col-sm-12" align="center" style="margin-top:10px;">
           <button id="listRoom" class="btn-dy3" style="padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px;font-family:\'JEJUGOTHIC\';">모든 방목록</button>
           <button id="scheduleList" class="btn-dy3" style="padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px;font-family:\'JEJUGOTHIC\';">나의 &nbsp;일정</button>
        </div>         
		</c:if> --%>
						
	</div>	

	<!--  ButtonGroup Start /////////////////////////////////////-->
	<div class="container">
		<!-- <div class="page-header text-info"></div>	 -->		
		<div class="row col-sm-offset-2 col-sm-10 text-center">
			<button class="row col-sm-2 btn-dy" id="tracking" style="padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;font-family:'JEJUGOTHIC';">트래킹</button>
			<button class="row col-sm-2 col-xs-offset-1 btn-dy" id="activity" style="padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;font-family:'JEJUGOTHIC';">액티비티</button>
			<button class="row col-sm-2 col-xs-offset-1 btn-dy" id="attraction" style="padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;font-family:'JEJUGOTHIC';">명소투어</button>
			<button class="row col-sm-2 col-xs-offset-1 btn-dy" id="food" style="padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;font-family:'JEJUGOTHIC';">푸드투어</button>
		</div>

		<div class="row col-sm-offset-2 col-sm-10 text-center">
			<button class="row col-sm-2 btn-dy" id="night" style="padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;font-family:'JEJUGOTHIC';">night투어</button>
			<button class="row col-sm-2 col-xs-offset-1 btn-dy" id="high" style="padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;font-family:'JEJUGOTHIC';">가격 ↑</button>
			<button class="row col-sm-2 col-xs-offset-1 btn-dy" id="low" style="padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;font-family:'JEJUGOTHIC';">가격 ↓</button>
			<button class="row col-sm-2 col-xs-offset-1 btn-dy" id="totalList" style="padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;font-family:'JEJUGOTHIC';">전체목록</button>
		
		</div>
	</div>
	<!--  ButtonGroup End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header text-info"></div>

		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6 text-left">				
				<p class="text-primary">상품 ${totalCount }개</p>
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
						<h3>
							<a href="#">${product.productName}</a>
						</h3>
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
			<div id="floating-button" data-toggle="tooltip" data-placement="center" data-original-title="addProduct" title="투어 등록">
				<!-- <p class="letter" id="addProduct"><img src="/resources/images/productIcons/edit.png" style="width: 45x; height: 45px;"></p> -->
				<p class="letter" id="addProduct">+</p>
			</div>
		</div>
	</c:if>
	  <!--  Floating Button <END> -->


	<!-- PageNavigation End... -->
</body>
</html>

