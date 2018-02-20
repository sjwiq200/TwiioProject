
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<head>
<title>refund</title>

<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- ///////////////////////summnernote/////////////////////////// -->
	<link href="/resources/css/summernote.css" rel="stylesheet">
    <script src="/resources/javascript/summernote.min.js"></script> 
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

 
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
    <script src="/resources/lang/summernote-ko-KR.js"></script>
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
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
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
		<!--  ///////////////////////// CSS ////////////////////////// -->
		
		<!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="/resources/css/font.css" />
   <style>
     body {
            padding-top : 100px ;
            background-color: #f4f4f4;
			color: #666666 ;
			font-family: "Source Sans Pro", Helvetica, sans-serif;
        }
        h1 {
			text-align: center;
		}
		.panel {
			border: 1px solid #ddd;
			background-color: #fcfcfc;
		}
        
        <!-- ##### -->
        .ct_list_pop {margin-left: 80px;color: blue; float: center;}

        td { cursor: default;}

        span {color: gray; }
       <!-- ##### -->
       
       .red{
    	color:red;
   	   }      
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
   <script type="text/javascript">
   
   
 
     
    
      //=============    검색 / page 두가지 경우 모두  Event  처리 =============   
      function fncGetUserList(currentPage) {
    	  if(${resultPage.maxPage}>=currentPage){
         $("#currentPage").val(currentPage);
         $("form").attr("method" , "POST").attr("action" , "/transaction/listRefund").submit();
      	}
      }
   
     
      ////////////////////////환불 처리 모달/////////////////////////////////////////////
     $(function(){
      $('td:nth-child(7)').on('click',function(){
    	  
    	  var refundno = $($('input[name=refundNo]')[$('td:nth-child(7)').index(this)]).val();
    	  var tranno = $($('input[name=tranNo]')[$('td:nth-child(7)').index(this)]).val();
    	  var confirmDate = $($('input[name=confirmDate]')[$('td:nth-child(7)').index(this)]).val();
    	  if(confirmDate != ''){
    	  }else{
    	  swal({
			  title: "환불을 해드리겠습니까??",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal("환불 완료되었습니다..", {
			      icon: "success",
			    }).then((next) => {
			    	$.ajax({
						url : "/transaction/json/updateRefund",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify({
							"refundNo":refundno,
							"tranNo":tranno
						}),
						success : function(JSONData) {			
								location.reload();
						 }
			    	 });
			      });
			    }			  
			});
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
   
   <div class="container col-md-8 col-md-offset-2">
   	   <div class="col-md-12">
   	   <div class="table-responsive">
          <h1 style="font-family: 'Jeju Gothic', serif;">
          <%-- ${requestScope.menu == 'search' ? "상품목록조회" : "상품관리"} --%>
          	REFUND
         </h1>
       </div>
       
       <!-- table 위쪽 검색 Start /////////////////////////////////////-->
      
       <div class="pull-left">
          <p class="text-primary">
                         전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
          </p>
       </div>
                  
           <div class="pull-right">
			    <form class="form-inline" name="detailForm"> 
				  <%--<div class="form-group">
				     <select class="form-control" name="searchCondition" id="searchCondition">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>작성자</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품이름</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${!empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default" id="searchButton">검색</button> --%>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>	  
				</form>
	    	</div>
      </div>
      
     
	
      <!-- table 위쪽 검색 Start /////////////////////////////////////-->
      
      
      <!--  table Start /////////////////////////////////////-->
        <div class="col-md-12">
        <div class="panel panel-default">
        <table class="table table-hover " style="margin-left: auto; margin-right: auto; text-align: center;">
      
        <thead>       
          <tr>         
            <th class="col-md-2" align="center">등록일</th>
            <th class="col-md-1" align="center">환불회원이름</th>
            <th class="col-md-1" align="left">환불은행</th>
            <th class="col-md-2" align="left">환불계좌번호</th>
            <th class="col-md-1" align="left">환불가격</th>
            <th class="col-md-2" align="left">환불처리날짜</th>           
            <th class="col-md-1" align="left">환불처리</th>
          </tr>
        </thead>       
      <tbody>
        <c:set var="i" value="0" />
        <c:forEach var="refund" items="${list}">
         <c:set var="i" value="${ i+1 }" />
          <input type="hidden" name="refundNo" value="${refund.refundNo}"/>
     	  <input type="hidden" name="tranNo" value="${refund.tranNo}"/>
     	  <input type="hidden" name="confirmDate" value="${refund.confirmDate}"/>
         <tr class="ct_list_pop">  	   
           <td align="left">${refund.regDate}</td>
           <td align="left">${refund.userName}</td>
           <td align="left">${refund.refundBank}</td>
           <td align="left">${refund.refundAccount}</td>
           <td align="left">${refund.refundPrice}원</td>
           <td align="left">${refund.confirmDate}</td>
           <td align="left">
           <c:if test="${refund.confirmDate == null}">
           	환불처리
           </c:if>
           <c:if test="${refund.confirmDate != null}">
           	환불완료
           </c:if>
		 </td>
         </tr>
          </c:forEach>
        
        <tr>
         
        </tr>
        </tbody>

      </table>
     <!--  table End /////////////////////////////////////-->  
    </div>
	</div>
    <div class="row">
    	<jsp:include page="../common/pageNavigator_new.jsp"/>
    </div>
	</div>

</body>
</html>