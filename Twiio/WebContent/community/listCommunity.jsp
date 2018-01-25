<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
<head>
<title>姥古 鯉系繕噺</title>

<meta charset="EUC-KR">
	
	<!-- 凧繕 : http://getbootstrap.com/css/   凧繕 -->
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

	function fncGetUserList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
   		document.detailForm.submit();		
	}

	
	/* $(function() {	
		$("td:nth-child(2)").on("click" , function() {
			//alert("けいしかいしか");
			//alert($($('input[name=TranCode]')[$('.ct_list_pop td:nth-child(3)').index(this)]).val());
			//if($($('input[name=TranCode]')[$('.ct_list_pop td:nth-child(3)').index(this)]).val() == '0'){
			self.location="/user/getUser?userId=${user.role}";
			//}
		});	
	});
	
	$(function() {	
		$("td:nth-child(6):contains('弘闇亀鐸')").on("click" , function() {
			//alert("けいしかいしか");
			//alert($($('input[name=TranCode]')[$('.ct_list_pop td:nth-child(3)').index(this)]).val());
			//if($($('input[name=TranCode]')[$('.ct_list_pop td:nth-child(3)').index(this)]).val() == '0'){
			self.location="/purchase/updateTranCode?tranNo="+$($('input[name=tranbyNo]')[$('td:nth-child(6)').index(this)]).val()+"&TranCode=2";
			//}
		});	
	});
	
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
		<c:if test="${community.communityType == '0'}">
			Question Q&A
		</c:if>
		
		<c:if test="${community.communityType == '1'}">
			Trip Review
		</c:if>
	</div>
	
 <div class="row">
 <form name="detailForm" action="/purchase/listPurchase" method="post">
   <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		穿端  ${resultPage.totalCount } 闇呪, 薄仙 ${resultPage.currentPage}  凪戚走
		    	</p>
	</div>
	
	<input type="hidden" id="currentPage" name="currentPage" value="">
	</form>
	</div>

	<table class="table table-hover table-striped" >
        <thead>
          <tr>
            <th align="center">惟獣毒 腰硲</th>
            <th align="left" >薦鯉</th>
            <th align="left">拙失切</th>
            <th align="left">去系析</th>
            <th align="left">繕噺呪</th>
          </tr>
        </thead>
        
		<tbody>
		<c:set var="i" value="0" />
		<c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
		
			<tr>
				<td align="center">
				<input type="hidden" name="tranbyNo" value="${purchase.tranNo}">
					${i}
				</td>
			
				<td align="left">
					${community.communityTitle}
				</td>
			
				<td align="left">${community.userNo}</td>
			
				<td align="left">${community.regDate}</td>
			
				<td align="left">${community.viewCount}</td>
			</tr>
		
		</c:forEach>
		</tbody>	
	</table>
	
	</div>
		<jsp:include page="../common/pageNavigator_new.jsp"/>	
</body>
</html>