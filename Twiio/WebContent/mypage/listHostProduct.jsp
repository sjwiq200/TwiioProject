<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>

<html lang="ko">
<head>
<title>판매목록조회</title>

<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- ///////////////////////summnernote/////////////////////////// -->
	<link href="/resources/css/summernote.css" rel="stylesheet">
    <script src="/resources/javascript/summernote.min.js"></script> 
 
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
	<link rel="stylesheet" href="/resources/css/font.css" />
		<!--  ///////////////////////// CSS ////////////////////////// -->
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
        span {color: gray; }
       <!-- ##### -->
       
       .red{
    	color:red;
   	   }
   	   


            
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
   <script type="text/javascript">
   
   ////////////////////////별점주기////////////////////////////////
 
     
    
      //=============    검색 / page 두가지 경우 모두  Event  처리 =============   
      function fncGetUserList(currentPage) {
    	 if(${resultPage.maxPage}>=currentPage){   	
         $("#currentPage").val(currentPage)
         $("form").attr("method" , "POST").attr("action" , "/product/listHostProduct").submit();
      
    	 }
   }
   
     
      $(document).ready(function(){ 
    	    $('#characterLeft').text('60 characters left');
    	    $('#message').keyup(function () {
    	        var max = 60;
    	        var len = $(this).val().length;
    	        if (len >= max) {
    	            $('#characterLeft').text('You have reached the limit');
    	            $('#characterLeft').addClass('red');
    	            $('#btnSubmit').addClass('disabled');            
    	        } 
    	        else {
    	            var ch = max - len;
    	            $('#characterLeft').text(ch + ' characters left');
    	            $('#btnSubmit').removeClass('disabled');
    	            $('#characterLeft').removeClass('red');            
    	        }
    	    });    
    	});
      
      $(document).ready(function(){ 
  	    $('#characterLeft2').text('60 characters left');
  	    $('#message2').keyup(function () {
  	        var max = 60;
  	        var len = $(this).val().length;
  	        if (len >= max) {
  	            $('#characterLeft2').text('You have reached the limit');
  	            $('#characterLeft2').addClass('red');
  	            $('#btnSubmit').addClass('disabled');            
  	        } 
  	        else {
  	            var ch = max - len;
  	            $('#characterLeft2').text(ch + ' characters left');
  	            $('#btnSubmit').removeClass('disabled');
  	            $('#characterLeft2').removeClass('red');            
  	        }
  	    });    
  	});
      
     $(function(){
      $('td:nth-child(3)').on('click',function(){
    	  var productno = $($('input[name=productNo]')[$('td:nth-child(3)').index(this)]).val();
    	  self.location = "/product/getProduct?productNo="+productno;
      });
     });
     $(function(){
         $('td:nth-child(4)').on('click',function(){
       	  var productno = $($('input[name=productNo]')[$('td:nth-child(4)').index(this)]).val();
       	  self.location = "/product/getProduct?productNo="+productno;
       });
     });

      $(document).on('click','#eval', function() {
  		var tranno = $($('input[name=tranNo]')[$('.ct_list_pop #eval').index(this)]).val();
  		alert()
  		$('#addReivew').modal('show');
  		 
  		
  		/* $(document).on('click','#updatereplym',function(){
  			 $.ajax({
  					url : "/common/json/updateReply",
  					method : "POST" ,
  					dataType : "json" ,
  					contentType:"application/json;charset=UTF-8",
  					data : JSON.stringify({
  						"replyNo":updatereplyno,
  						"replyContent":$('#updatecontent').val()
  					}),
  						success : function(JSONData) {
  							alert(JSON.stringify(JSONData));
  							 $('#updatemodalreply').modal('toggle');		
  							window.location.reload();
  					}
  			}); 
  		}); */
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
           	나의 판매 목록 :D
       </h1>
       <!-- table 위쪽 검색 Start /////////////////////////////////////-->
       
          <div class="pull-left">
             <p class="text-primary">
                전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
             </p>
          </div>
          
          <div class="col-md-6 text-right">
             <form class="form-inline" name="detailForm">
                          
              <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
              <input type="hidden" id="currentPage" name="currentPage" value=""/>
              
            </form>
          </div>
      </div>
   </div>
      <!-- table 위쪽 검색 Start /////////////////////////////////////-->
      
      <div class="col-md-12">
      <div class="panel panel-default">
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover " style="margin-left: auto; margin-right: auto; text-align: center;">
      
        <thead>       
          <tr>         
            <th align="center">등록일자</th>
            <th align="center">상품사진</th>
            <th align="left">상품이름</th>
            <th align="left">투어일자/판매량</th>
            <th align="left">상품판매금액</th>
            <th align="left">도시</th>
      		<th aligh="legt">국가</th>    
          </tr>
        </thead>       
      <tbody>
      
        <c:set var="i" value="0" />
        <c:forEach var="product" items="${list}">
         <c:set var="i" value="${ i+1 }" />
         <tr class="ct_list_pop">
         	
     	   <input type="hidden" name="productNo" value="${product.productNo}"/>
           <td align="left">${product.regDate}</td>
           <td align="left">
           <c:if test="${empty product.thumbnail}">
                        <img src="http://www.fada.org/wp-content/themes/fada/img/placeholder.jpg" height="80" width="80" />
                     </c:if> 
                     <c:if test="${!empty product.thumbnail}">
                        <img src="/resources/images/productThumbnail/${product.thumbnail}" height="80" width="80" />
                     </c:if>
           </td>
           <td align="left">${product.productName}</td>
           <td align="left">

		   <c:set var="date" value="${product.tripDate}"></c:set>
		   <c:set var="date_array" value="${fn:split(date,'[,]')}"></c:set>
		   <c:forEach var="tdate" items="${date_array}">
		   ${tdate}
		   <br/>
		   </c:forEach>                  
           
           </td>
           <td align="left">${product.productPrice}</td>
           <td align="left">${product.city}</td>
           <td align="left">${product.country}</td>
         </tr>
          </c:forEach>
        
        <tr>
        </tr>
        </tbody>
      </table>
     <!--  table End /////////////////////////////////////-->
     </div>
     </div>
    <jsp:include page="../common/pageNavigator_new.jsp"/>
    </div>

</body>
</html>