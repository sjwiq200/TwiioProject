<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
<head>
<title>Community</title>

<meta charset="EUC-KR">
	
	<!-- 凧繕 : http://getbootstrap.com/css/   凧繕 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    

	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/resources/css/animate.min.css" rel="stylesheet">
   <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 紫遂 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 紫遂 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
		<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>

<script type="text/javascript">
	var page = 1;
	var flag = 0;
	var communityNo = ${resultPage.totalCount};
		$(window).scroll(function(){
			if(($(window).scrollTop()) >= $(document).height() - $(window).height()){
				page = page + 1;
				 $.ajax( 
						{
						url : "/community/json/listCommunity/",
						method : "POST" ,
						dataType : "json" ,
						data : {
							resultpage:page,
    						communitytype:${communityType}
						},
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								if(flag==0){
									communityNo=communityNo-JSONData.length;
									flag=1;
								}
								
							for(var i=0; i<JSONData.length;i++){								
							var displayValue = 
						    '<div class="col-md-3">'+
						      '<div class="thumbnail">'+
						        '<img src="https://lh4.googleusercontent.com/-1wzlVdxiW14/USSFZnhNqxI/AAAAAAAABGw/YpdANqaoGh4/s1600-w400/Google%2BSydney" style="width:300px; height:150px;"/>'+
						         ' <div class="caption">'+
						          	'[ 惟毒腰硲 :'+communityNo+' ]'+
						          	'<p>[ 薦   鯉 :'+JSONData[i].communityTitle+' ]</p>'+ 
						            '<p>[ 拙失切 :'+JSONData[i].userId+' ]</p>'+
						            '<p>[ 去系析 :'+JSONData[i].regDate+' ]</p>'+
						            '<p>[ 繕噺社 :'+JSONData[i].viewCount+' ]</p>'+
						            '<p>[ 朕溝艦銅腰硲 :'+JSONData[i].communityNo+' ]</p>'+
						            '<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>'+
						        '</div>'+
						      '</div>'+
						 	'</div>';
						 
								communityNo=communityNo-1;
									$('.row2').append(displayValue);
								}
							}
					}); 
			}	
		});

	
	

	
	 $(function() {	
		$("#write").on("click" , function() {
			//alert("けいしかいしか");
			//alert($($('input[name=TranCode]')[$('.ct_list_pop td:nth-child(3)').index(this)]).val());
			//if($($('input[name=TranCode]')[$('.ct_list_pop td:nth-child(3)').index(this)]).val() == '0'){
			self.location="/community/addCommunity?communityType="+${communityType};
			//}
		});	
	});
	 
	 
	$(function() {	
		$(".getButton").on("click" , function() {
			//alert("けいしかいしか");
			//alert($($('input[name=TranCode]')[$('.ct_list_pop td:nth-child(3)').index(this)]).val());
			//if($($('input[name=TranCode]')[$('.ct_list_pop td:nth-child(3)').index(this)]).val() == '0'){
			self.location="/purchase/updateTranCode?tranNo="+$($('input[name=tranbyNo]')[$('td:nth-child(6)').index(this)]).val()+"&TranCode=2";
			//}
		});	
	});
	
	/*
	$(function() {
		$("td:nth-child(1)").on("click" , function() {
			//if($($('input[name=TranCode]')[$('.ct_list_pop td:nth-child(1)').index(this)]).val() == ''){
				self.location="/purchase/getPurchase?tranNo="+$($('input[name=tranbyNo]')[$('td:nth-child(1)').index(this)]).val();
			//self.location="/product/getProduct?prodNo="+$($('input[name=prodbyNo]').index(this)).val()+"&menu=${param.menu}";
			//}
		});	
	}); */
	
</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
 <div class="container"> 
 	<div class="page-header text-info">
		<c:if test="${communityType == '0'}">
			<h1>Question Q&A</h1>
		</c:if>
		<c:if test="${communityType == '1'}">
			<h1>Trip Review</h1>
		</c:if>
	</div>

 
 	<form name="detailForm" action="/community/listCommunity" method="post"></form>
	 
 	<div class="row">
   	<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		穿端  ${resultPage.totalCount } 闇呪, 薄仙 ${resultPage.currentPage}  凪戚走
		    	</p>
	</div>
	
	<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    	
			      <button type="button" id="write" class="btn btn-default">越 床 奄</button>
				  
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" id="searchCondition">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>薦鯉</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>拙失切</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">伊事嬢</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="伊事嬢"
				    			 value="${!empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">伊事</button>
				  
				  <!-- PageNavigation 識澱 凪戚走 葵聖 左鎧澗 採歳 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>	  
				</form>
	    </div>
	</div>
	
	
	<div class="row2">
	<c:set var="i" value="${resultPage.totalCount }" />
		<c:forEach var="community" items="${list}">
		
    <div class="col-md-3">
      <div class="thumbnail">
        <img src="https://lh4.googleusercontent.com/-1wzlVdxiW14/USSFZnhNqxI/AAAAAAAABGw/YpdANqaoGh4/s1600-w400/Google%2BSydney" style="width:300px; height:150px;"/>
          <div class="caption">
          <p>[惟獣毒腰硲  : ${i}]</p>
    	  <p>[薦   鯉 : ${community.communityTitle }]</p>
          <p>[拙失切 : ${community.userId }]</p>
          <p>[去系析 : ${community.regDate }]</p>
          <p>[繕噺社 : ${community.viewCount }]</p>
          <p>[朕溝艦銅腰硲 : ${community.communityNo }]</p>     
            <p><a class="btn btn-primary" id="getButton">雌室左奄</a></p>
          </div>
      </div>
    </div>
    <c:set var="i" value="${ i-1 }" /> 
 	</c:forEach>
 	</div>
</div>    
</body>
</html>