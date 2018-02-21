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
        
        <!-- ##### -->
         .ct_list_pop {margin-left: 80px;color: blue; float: center;}

        td { cursor: default;}

        span {color: gray; }
       <!-- ##### -->
       
       .red{
    	color:red;
   	   }
   	   
	
	#viewReport {
  		overflow: auto;
	}

            
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
   <script type="text/javascript">
   
   
 
     
    
      //=============    검색 / page 두가지 경우 모두  Event  처리 =============   
      function fncGetUserList(currentPage) {
    	  if(${resultPage.maxPage}>=currentPage){
         $("#currentPage").val(currentPage);
         $("form").attr("method" , "POST").attr("action" , "/common/listReport").submit();
      }
      }
   
      $(function() {
  		$(  "button.btn.btn-default" ).on("click" , function() {
  			//Debug..
  			//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
  			fncGetUserList(1);
  		});
  	});
     
     $(function(){
      $('td:nth-child(3)').on('click',function(){
    		
    	  var reportinfo = $($('input[name=reportNo]')[$('td:nth-child(3)').index(this)]).val();
    	  var reportState = $($('input[name=reportState]')[$('td:nth-child(3)').index(this)]).val();
    	  
    	  if(reportState == 'Y'){
    		  alert('신고처리완료');
    	  }else{
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
    	  					$('#delete').val(JSONData.targetUserNo);
    	  					$('#deleteReportNo').val(JSONData.reportNo);
    	  					$('#reportUsername').val(JSONData.userName);
    	  					$('#reporttargetuser').val(JSONData.targetUserName);
    	  					$('#detailreporttitle').val(JSONData.reportTitle);
    	  					$('#detailreportcontent').val(JSONData.reportContent);
    	  					$('#targetUserName').val(JSONData.targetUserName);
    	  					$('#targetUserNo').val(JSONData.targetUserNo);
    	  	    			$('#viewReport').modal('show');	
    	  	    			
    	  			 }
    	  		});
    	     }
      	 });
     });
     

     

       
      $(function() {
	  		$("#btnSubmit" ).on("click" , function() {
	 		 //$(document).on("click","#btnSubmit" , function(){	
		    	  	   	  			var userNo = $("#delete").val();
		    	  	   	  			var reportNo = $("#deleteReportNo").val();
		    	  	   	  		$.ajax({
		    	  	   	  			url : "/user/json/deleteUser",
		    	  	   	  			method : "POST" ,
		    	  	   	  			dataType : "json" ,
		    	  	   	  			contentType:"application/json;charset=UTF-8",
		    	  	   	  			data : JSON.stringify({
		    	  	   	  				"userNo":userNo
		    	  	   	  			}),
		    	  	   	  			success : function(JSONData, state) {
		    	  	   	  				
										if(JSONData==false){
												alert("이미 탈퇴된 회원입니다.");
										}
		    	  	   	  					 $.ajax({
		    	  	   	  		                url: "/common/json/updateReport",
		    	  	   	  		       			 method : "POST" ,
				    	  	   	  				dataType : "json" ,
				    	  	   	  				contentType:"application/json;charset=UTF-8",
				    	  	   	  				data : JSON.stringify({
				    	  	   	  					"reportNo":reportNo
				    	  	   	  				}),
		    	  	   	  		                success: function (JSONData) {
		    	  	   	  		                	alert(JSON.stringify(JSONData));		    	  	   	  		                	
		    	  	   	  		                	if(JSONData.resign == '1'){
		    	  	   	  		                		alert("신고 처리가 완료되었습니다.");
		    	  	   	  		                	}else{
		    	  	   	  		                		alert("이미 신고 처리가 완료된 신고입니다.");
		    	  	   	  		                	}
		    	  	   	  		                	location.reload();
		
		    	  	   	  		                },error : function(request,status,error) {
													alert('에러다.');
													location.reload();
		    		    	  	   	  	    	}
		    	  	   	  		            });
		    	  	   	  	    	}
		    	  	   	  		});
    	  	   	  	});
	  	});
////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////쪽지보내기/////////////////////////////
/* $(document).on('click','#messageWrite',function(){
	/* var toUserName = $($('input[name=targetUserName]')[$('button[id=messageWrite]').index(this)]).val();
	var fromUserNo = $($('input[name=targetUserNo]')[$('button[id=messageWrite]').index(this)]).val();
	targetNo
	$('#targetNo').val(fromUserNo);
	$('#toUsern').val(toUserName); 
	$("#modalwrite").modal('show');
}); */

$(document).on('click','#messageWrite',function(){
	

	/* var targetNo = $('#targetNo').val();
	var toUsern = $('#toUsern').val();
	var modalMessageTitle = $('#modalMessageTitle').val();
	var modalMessageContent = $('#modalMessageContent').val(); */
	////////////////////////수정해야할 부분/////////////////////////
	
	var targetNo = $('#targetUserNo').val();
	var toUsern = $('#targetUserName').val();
	var modalMessageTitle = toUsern + "님이름으로 신고가 접수 되었습니다";
	var modalMessageContent = toUsern+"이름으로 신고가 접수되었습니다. 앞으로 주의 하여 주시기 랍니다.";
	//modalmessage

	if(modalMessageTitle==''| modalMessageContent==''){
		alert('내용과 제목을 입력하세요.');			 
	}
	else{
		 alert(targetNo+","+toUsern+","+modalMessageTitle+","+modalMessageContent);
	
	   $.ajax({
			url : "/mypage/json/addMessage",
			method : "POST" ,
			dataType : "json" ,
			contentType:"application/json;charset=UTF-8",
			data : JSON.stringify({
				"toUserNo":targetNo,
				"fromUserNo":"${user.userNo}",
				"messageContent":modalMessageContent,
				"messageType":"4",
				"messageTitle":modalMessageTitle,
				"targetUserName":toUsern,
				"userName":"${user.userName}"
			}),
			success : function(JSONData) {
				alert("메시지가 보내기 성공.!!");
				/* $('#modalwrite').modal('toggle'); */
		    } 
	   });
	}
});
///////////////////////////////////////////////////////////
   
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
          	REPORT
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
      <div class="col-md-12">
      <div class="panel panel-default">
      <table class="table table-hover " style="margin-left: auto; margin-right: auto; text-align: center;">
      
        <thead>       
          <tr>         
            <th class="col-md-1" align="center">작성자</th>
            <th class="col-md-1" align="center">신고대상</th>
            <th class="col-md-3" align="left" >신고제목</th>
            <th class="col-md-2" align="left">신고날짜</th>
            <th class="col-md-1" align="left">신고유형</th>
            <th class="col-md-1" align="left">신고처리유무</th>
          </tr>
        </thead>       
      <tbody>
      
        <c:set var="i" value="0" />
        <c:forEach var="report" items="${list}">
         <c:set var="i" value="${ i+1 }" />
           <input type="hidden" name="reportNo" id="reportNo" value="${report.reportNo}"/>
     	   <input type="hidden" name="reportState" value="${report.reportState}"/>

         <tr class="ct_list_pop">
           <td align="left">${report.userName}</td>
           <td align="left">
           		${report.targetUserName}
           </td>
           <td align="left">${report.reportTitle}</td>
           <td align="left"> 
           ${report.reportRegDate} 
           </td>
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
           <td align="center">
           		<c:if test="${report.reportState == 'Y'}">
           			처리 완료
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
 
			<div id="viewReport" class="modal fade" role="dialog" style="background-color: transparent;" >
			<div class="modal-dialog" align="center" style="background-color: black;">
						<form name="addMainForm">
				
							<div class="col-sm-12 form-group center-block contentsList" style="font-family: 'TYPO_JEONGJOL';
/*  							background: linear-gradient(-45deg, #56B1BF, transparent),linear-gradient(45deg, #D73A31, transparent);
 */ 							background-color: #ffffff;
 							border-radius: 3% !important; 
 							border: 1px dashed #3B3B3B;
 							color: #3B3B3B !important;">
								<div style="font-size:1.5em;font-family:Pacifico; margin-top:50px;margin-bottom:20px;color:#D73A31; opacity:0.8;">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h1 class="modal-title">
									<strong>REPORT DETAIL</strong>
									</h1>
								</div>
								
								<input type="hidden" id="reportuserno" name="reportuserno" value=""/>
					      		<input type="hidden" id="reportreplyno" name="reportreplyno" value=""/>
					      		<input type="hidden" name="targetUserName" id="targetUserName" value=""/>
     	   						<input type="hidden" name="targetUserNo" id="targetUserNo" value=""/>
					      		
								<div class="col-sm-2"></div>
								<div class="col-sm-8">					      

								<div name="planer">
									
									<label for="reportuser" class="col-md-12 control-label">신  고  자</label> 
									<input type="text" class="form-control contents" style="position: absoloute" id="reportUsername" name="reportUsername" value="" readonly>
									<p>&nbsp;</p>
									
									<label for="targetReportUser" class="col-md-12 control-label">신고 대상</label> 
									<input type="text" class="form-control contents" style="position: absoloute" id="reporttargetuser" name="reporttargetuser" value="" readonly>
									<p>&nbsp;</p>
				
									<label for="targetReportTitle" class="col-md-12 control-label">신고 제목</label>
									<input type="text" class="form-control contents" style="position: absoloute" id="detailreporttitle" name="detailreporttitle" value="" readonly >
									<p>&nbsp;</p>
									
									<label for="departureDate" class="col-sm-12 control-label ">신고 내용</label> 
									<textarea  class="form-control contents" id="detailreportcontent"  name="detailreportcontent" style="position: absoloute; row=5; col=50;" value="" readonly></textarea>
									<p>&nbsp;</p>
									<div style="margin-bottom:50px;"  align="center">
										<button type="button" class="btn btn-default" id="messageWrite" name="messageWrite">메시지</button>
										<button type="button" class="btn btn-default" id="btnSubmit" name="btnSubmit">탈퇴시키기</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									</div>
									
								</div>
								</div>
								<div class="col-sm-2"></div>
							</div>
							
						</form>
					</div>
			</div>
		
		<!-------------------------------------------------------------message------------------------------------------------------------------------->	
		<!-- <div class="modal fade" id="modalwrite" role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
    	<div class="modal-dialog">
    		<div class="modal-content">
          		<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        			<h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      			</div>
          	<div class="modal-body">
          			<input class="hidden" name="targetNo" id="targetNo" type="text" value="">
          		<div class="form-group">
       				<input class="form-control" name="toUsern" id="toUsern" type="text" value="" readonly>
        		</div>
        		<div class="form-group"> 
        			<input class="form-control" name="modalMessageTitle" id="modalMessageTitle" type="text" value="" placeholder="제목을 작성하여 주세요.">
        		</div>
        		<div class="form-group">
        			<textarea rows="2" class="form-control" name="modalMessageContent" id="modalMessageContent" value="" placeholder="내용을 작성하여 주세요."></textarea>
        		</div>
        	</div>
         	<div class="modal-footer ">
        		<button type="button" class="btn btn-warning btn-lg" id="addMess" name="addMess" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Send</button>
      		</div>
        	</div>
  	   </div>
	   </div> -->
	
</body>
</html>