<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<%-- 
<%@ page import="com.model2.mvc.service.domain.*" %>

<%
	Product vo = (Product)request.getAttribute("product2");
	User vo2 = (User)request.getAttribute("userVO");
	String name = request.getParameter("menu");
%>	
--%>

<html lang="ko">
<head>
<title>Insert title here</title>
<meta charset="UTF-8">

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/resources/css/animate.min.css" rel="stylesheet">
   <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
   <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   <!-- jQuery UI toolTip 사용 CSS-->
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	
  <!-- 다이얼로그  -->
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
   <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
  <!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css"> -->




 	
	
<style>
 /*    --------------------------------------------------
	:: General
	-------------------------------------------------- */
body {
		padding-top : 100px;
}
.trash { color:rgb(209, 91, 71); }
.flag { color:rgb(248, 148, 6); }
.panel-body { padding:0px; }
.panel-footer .pagination { margin: 0; }
.panel .glyphicon,.list-group-item .glyphicon { margin-right:5px; }
.panel-body .radio, .checkbox { display:inline-block;margin:0px; }
.panel-body input[type=checkbox]:checked + label { text-decoration: line-through;color: rgb(128, 144, 160); }
.list-group-item:hover, a.list-group-item:focus {text-decoration: none;background-color: rgb(245, 245, 245);}
.list-group { margin-bottom:0px; }    
</style>

<script type="text/javascript">

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $("button.btn.btn-primary").bind("click" , function() {
		 $("form").attr("method" , "POST").attr("action" , "/community/listCommunity").submit();
	});
});	


/*============= jQuery 변경 주석처리 =============
function resetData() {
		document.detailForm.reset();
}========================================	*/
//==> 추가된부분 : "취소"  Event 처리 및  연결
/* $(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $("a[href='#']").on("click" , function() {
		 history.go(-1);
	});
}); */

/* $(document).ready(function(){
	$("#mytable #checkall").click(function () {
	        if ($("#mytable #checkall").is(':checked')) {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", true);
	            });

	        } else {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", false);
	            });
	        }
	    });
	    
	    $("[data-toggle=tooltip]").tooltip();
	}); */
	
</script>
</head>

<body>
	<!-- ToolBar Start ///////////////////////////4//////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<form name="detailForm" class="form-horizontal" enctype="multipart/form-data">
   	<table border="1" summary="">
<caption>주문 상품 정보</caption>
        <thead><tr>
<th scope="col" class="number">주문일자<br>[주문번호]</th>
                <th scope="col" class="thumb">이미지</th>
                <th scope="col" class="product">상품정보</th>
                <th scope="col" class="quantity">수량</th>
                <th scope="col" class="price">상품구매금액</th>
                <th scope="col" class="state">주문처리상태</th>
              
            </tr></thead>
<tbody class="">
<tr class="xans-record-">
<td class="number ">
                    2018-01-01                    <p><a href="detail.html?order_id=20180101-0000801&amp;page=1&amp;history_start_date=2017-11-09&amp;history_end_date=2018-02-07" class="line">[20180101-0000801]</a></p>


                   
                </td>
                <td class="thumb"><a href="/product/detail.html?product_no=3412&amp;cate_no=226"><img src="//boxsensei.com/web/product/medium/201611/3412_shop1_646363.jpg" onerror="this.src='http://img.echosting.cafe24.com/thumb/img_product_small.gif';" alt=""></a></td>
                <td class="product">
                    <a href="/product/detail.html?product_no=3412&amp;cate_no=226"><strong>셀비지 커팅진</strong></a>
                    <div class="option ">[옵션: M]</div>
                    <p class="free displaynone">무이자할부 상품</p>
                </td>
                <td class="quantity">1</td>
                <td class="price">
<strong>38,000원</strong><div class="displaynone"></div>
</td>
                <td class="state">
                    <p>배송완료</p>
                    <p class=""><a href="/common/delivery_trace.php?is12RFront=T&amp;order_id=20180101-0000801&amp;invoice_no=342034408036&amp;product_no=3412&amp;opt_id=000B&amp;is_second_delivery=F" target="_blank">CJ대한통운</a></p>
                    <p class=""><a href="#none" class="line" onclick="window.open('/common/delivery_trace.php?is12RFront=T&amp;order_id=20180101-0000801&amp;invoice_no=342034408036&amp;product_no=3412&amp;opt_id=000B&amp;is_second_delivery=F', '', 'scrollbars=yes, resizeable=0, status=0, directories=0, toolbar=0'); return false;">[342034408036]</a></p>
                    <a href="/board/product/write.html?board_no=4&amp;product_no=3412&amp;order_id=20180101-0000801" class=""><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_comment.gif" alt="구매후기"></a>

                 
                </td>
              
            </tr>
<tr class="xans-record-">
<td class="number ">
                    2017-12-20                    <p><a href="detail.html?order_id=20171220-0000544&amp;page=1&amp;history_start_date=2017-11-09&amp;history_end_date=2018-02-07" class="line">[20171220-0000544]</a></p>


                 
                </td>
                <td class="thumb"><a href="/product/detail.html?product_no=5468&amp;cate_no=226"><img src="//boxsensei.com/web/product/medium/201712/5468_shop1_437432.jpg" onerror="this.src='http://img.echosting.cafe24.com/thumb/img_product_small.gif';" alt=""></a></td>
                <td class="product">
                    <a href="/product/detail.html?product_no=5468&amp;cate_no=226"><strong>5152 인디고진</strong></a>
                    <div class="option ">[옵션: L]</div>
                    <p class="free displaynone">무이자할부 상품</p>
                </td>
                <td class="quantity">1</td>
                <td class="price">
<strong>53,000원</strong><div class="displaynone"></div>
</td>
                <td class="state">
                    <p>배송완료</p>
                    <p class=""><a href="/common/delivery_trace.php?is12RFront=T&amp;order_id=20171220-0000544&amp;invoice_no=342032009895&amp;product_no=5468&amp;opt_id=000D&amp;is_second_delivery=F" target="_blank">CJ대한통운</a></p>
                    <p class=""><a href="#none" class="line" onclick="window.open('/common/delivery_trace.php?is12RFront=T&amp;order_id=20171220-0000544&amp;invoice_no=342032009895&amp;product_no=5468&amp;opt_id=000D&amp;is_second_delivery=F', '', 'scrollbars=yes, resizeable=0, status=0, directories=0, toolbar=0'); return false;">[342032009895]</a></p>
                    <a href="/board/product/write.html?board_no=4&amp;product_no=5468&amp;order_id=20171220-0000544" class=""><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_comment.gif" alt="구매후기"></a>

                  
                </td>
              
            </tr>
</tbody>
<tbody class="displaynone"><tr>
<td colspan="7" class="empty">주문 내역이 없습니다</td>
            </tr></tbody>
</table>

</form>


	
</body>
</html>