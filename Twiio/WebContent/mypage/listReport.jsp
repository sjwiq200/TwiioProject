<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
   <style>
     body {
            padding-top : 50px;
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
         $("#currentPage").val(currentPage)
         $("form").attr("method" , "POST").attr("action" , "/common/listReport").submit();
      }
   
      $(function() {
  		$(  "button.btn.btn-default" ).on("click" , function() {
  			//Debug..
  			//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
  			fncGetUserList(1);
  		});
  	});
     
     $(function(){
      $('td:nth-child(5)').on('click',function(){
    		
    	  var reportinfo = $($('input[name=reportNo]')[$('td:nth-child(5)').index(this)]).val();
    				$.ajax({
    	  			url : "/common/json/getReport",
    	  			method : "POST" ,
    	  			dataType : "json" ,
    	  			contentType:"application/json;charset=UTF-8",
    	  			data : JSON.stringify({
    	  				"reportNo":reportinfo
    	  			}),
    	  			success : function(JSONData) {			
    	  					alert(JSON.stringify(JSONData));
    	  					var info =
    	  	    				'<input type="hidden" id="delete" name="delete" val="'+JSONData.targetUserNo+'"><div class="row">'+
    	  	    				'신 고 자   <input type="text" class="form-control" id="reportUsername" value="'+JSONData.userName+'" readonly/></div>'+
    	  	    				'<br/><div class="row">'+
    	  	    				'신고대상   <input type="text" class="form-control" id="reporttargetuser" value="'+JSONData.targetUserName+'" readonly/>'+
    	  	    				'</div>'+
    	  	    				'<br/><div class="row">'+
								'제  목'+    	  	    				
    	  	    				'</div>'+
    	  	    				'<div class="row">'+
    	  	    				'<input type="text" class="form-control" id="reportuser" value="'+JSONData.reportTitle+'" readonly/>'+
    	  	    				'</div>'+
    	  	    				'<br/><div class="row">'+
								'내  용'+    	  	    				
	  	    					'</div>'+
	  	    					'<div class="row">'+
    	  	    				'<input type="text" class="form-control" id="reportcontent" value="'+JSONData.reportContent+'" readonly/>'+	
    	  	    				'</div>';
    	  	    			$('#reportview').html(info);
    	  	    			$('#viewReport').modal('show');	
    	  			 }
    	  		});
      	   });
     });
     

      $(document).on('click','#eval', function() {
  		var tranno = $($('input[name=tranNo]')[$('.ct_list_pop #eval').index(this)]).val();
  		
  		 
  		
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

      
      $(function() {
	  		$(  "#btnSubmit" ).on("click" , function() {
	  			alert("뀨 시작");
	  			var userNo = $("#delete").val();
	  			var reportNo = $("#reportNo").val();
	  		$.ajax({
	  			url : "user/json/deleteUser",
	  			method : "POST" ,
	  			dataType : "json" ,
	  			contentType:"application/json;charset=UTF-8",
	  			data : JSON.stringify({
	  				"userNo":userNo
	  			}),
	  			success : function(JSONData) {			
	  					alert("뀨 성공");
	  					
	  					$.ajax({
	  		                type: "get",
	  		                url: "common/json/updateReport?reportNo="+reportNo,
	  		                success: function (data) {
	  		                	
	  		                	alert("뀨규 성공");
	  		                	
	  		                	location.reload();

	  		                }
	  		            });
	  					
	  			 }
	  		});
	  			
	  			
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
   
      <div class="page-header text-info">
          <h3>
          <%-- ${requestScope.menu == 'search' ? "상품목록조회" : "상품관리"} --%>
          	신고목록조회
         </h3>
       </div>
       
       <!-- table 위쪽 검색 Start /////////////////////////////////////-->
       <div class="row">
          <div class="pull-left">
             <p class="text-primary">
                전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
             </p>
          </div>
                  
           <div class="pull-right">
			    <form class="form-inline" name="detailForm"> 
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" id="searchCondition">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>작성자</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>신고제목</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${!empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default" id="searchButton">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>	  
				</form>
	    	</div>
      </div>
      
     
	
      <!-- table 위쪽 검색 Start /////////////////////////////////////-->
      
      
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover " style="margin-left: auto; margin-right: auto; text-align: center;">
      
        <thead>       
          <tr>         
            <th align="center" width="120" align="">작성자</th>
            <th align="center" width="140">신고대상</th>
            <th align="left" width="250">신고제목</th>
            <th align="left" width="120">신고날짜</th>
            <th align="left" width="100">신고유형</th>
            <th align="left" width="140">신고처리유무</th>
          </tr>
        </thead>       
      <tbody>
      
        <c:set var="i" value="0" />
        <c:forEach var="report" items="${list}">
         <c:set var="i" value="${ i+1 }" />
         <tr class="ct_list_pop">
         	
     	   <input type="hidden" name="reportNo" id="reportNo" value="${report.reportNo}"/>
     	   <input type="hidden" name="reportlist" value="${report}"/>
           <td align="left">${report.userName}</td>
           <td align="left">
           		${report.targetUserName}
           </td>
           <td align="left">${report.reportTitle}</td>
           <td align="left">${report.reportRegDate}</td>
           <td align="left">
           <c:if test="${!empty report.targetCommunityNo && report.targetReplyNo == 0}">	
           	 커뮤니티
           </c:if>
           <c:if test="${!empty report.targetRoomKey}">
           	 채팅방
           </c:if>
           <c:if test="${report.targetReplyNo != 0 && !empty report.targetCommunityNo}">  
           	 댓글
           </c:if>
           </td>
           <td align="left">${report.reportState}</td>

         </tr>
          </c:forEach>
        
        <tr>
         
        </tr>
        </tbody>
      
      </table>
     <!--  table End /////////////////////////////////////-->
     
     
     
    </div>
    <div class="col-md-2 col-md-offset-1">
    <jsp:include page="../common/pageNavigator_new.jsp"/>
    </div>
    
    <div class="modal fade" id="viewReport"  role="dialog" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-lg">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3 class="modal-title">
					<Strong>REPORT</Strong>
				</h3>
			</div>
			<div class="modal-body">
			
				<div id="reportview">
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="btnSubmit" name="btnSubmit">탈퇴시키기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
		</div>
		</div>
    
    <!--  화면구성 div End /////////////////////////////////////-->
    
    <input type="hidden" id="currentPage" name="currentPage" value="" />
    <%-- <input type="hidden" id="menu" name="menu" value="${menu}" /> --%> 
    <%-- //<input type="hidden" id="priceList" name="priceList" value="${search.priceList}">  --%>
                   
    <!-- PageNavigation Start... -->
   	
   <!-- PageNavigation End... -->
</body>
</html>