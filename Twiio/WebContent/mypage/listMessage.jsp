<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<head>
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
  
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	




 	
	
<style>
 /*    --------------------------------------------------
	:: General
	-------------------------------------------------- */
 body {
            padding-top : 50px;
        }
        
        <!-- ##### -->
         .ct_list_pop {margin-left: 80px;color: blue; float: center;}

        td { cursor: default;}

        
       <!-- ##### -->
       
       .red{
    	color:red;
   	   }

</style>

<script type="text/javascript">

 function fncGetUserList(currentPage) {
	$("#currentPage").val(currentPage);
	$("form").attr("method" , "POST").attr("action" , "/mypage/message/listMessage").submit();
}


//============= "검색"  Event  처리 =============	
 $(function() {
	 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 $("#search").on("click" , function() {
		fncGetUserList(1);
	});
 });


//////////////////////////쪽지보내기/////////////////////////////
$(document).on('click','#writemesg',function(){
	var toUserName = $($('input[name=toUserName]')[$('button[id=writemesg]').index(this)]).val();
	var fromUserNo = $($('input[name=fromUserNo]')[$('button[id=writemesg]').index(this)]).val();
	
	$('#targetNo').val(fromUserNo);
	$('#toUsern').val(toUserName);
	$("#modalwrite").modal('show');
});

$(document).on('click','#addMess',function(){
	var targetNo = $('#targetNo').val();
	var toUsern = $('#toUsern').val();
	var modalMessageTitle = $('#modalMessageTitle').val();
	var modalMessageContent = $('#modalMessageContent').val();
	//modalmessage

	if(modalMessageTitle==''| modalMessageContent==''){
		alert('내용과 제목을 입력하세요.');			 
	}
	else{
	  	$.ajax({
			url : "/mypage/json/addMessage",
			method : "POST" ,
			dataType : "json" ,
			contentType:"application/json;charset=UTF-8",
			data : JSON.stringify({
				"toUserNo":targetNo,
				"fromUserNo":"${user.userNo}",
				"messageContent":modalMessageContent,
				"messageType":"2",
				"messageTitle":modalMessageTitle,
				"targetUserName":toUsern,
				"userName":"${user.userName}"
			}),
			success : function(JSONData) {
				alert("메시지가 보내기 성공.!!");
				$('#modalwrite').modal('toggle');
		    } 
	   });
	}
});
///////////////////////////////////////////////////////////
/////////////////////////삭제//////////////////////////////
$(document).on('click','#deletemesg',function(){
	var messageNo = $($('input[name=messageNo]')[$('button[id=deletemesg]').index(this)]).val();
	$('#mesgNo').val(messageNo);
	$("#modaldelete").modal('show');
});

$(document).on('click','#modalDeleteMessage',function(){
	var mesgNo = $('#mesgNo').val();
	 $.ajax({
		url : "/mypage/json/deleteMessage",
		method : "POST" ,
		dataType : "json" ,
		contentType:"application/json;charset=UTF-8",
		data : JSON.stringify({
			"messageNo":mesgNo
		}),
		success : function(JSONData) {
			alert("메시지가 삭제되었습니다. !!");
			$("#modaldelete").modal('toggle');
			location.reload();
	    } 
   }); 
	
}); 
/////////////////////////////////////////////////////////////////
/////////////////////////////상세보기//////////////////////////////
	
	$(document).on('click','td:nth-child(4)',function(){
	var mesgNo = $($('input:hidden[name="messageNo"]')[$('td:nth-child(4)').index(this)]).val();
	//alert();
	 alert(mesgNo);
	 $.ajax({
		url : "/mypage/json/getMessage",
		method : "POST" ,
		dataType : "json" ,
		contentType:"application/json;charset=UTF-8",
		data : JSON.stringify({
			"messageNo":mesgNo
		}),
		success : function(JSONData) {
			alert(JSON.stringify(JSONData));
			$('#targetNo').val(JSONData.fromUserNo);
			$('#toUsern1').val(JSONData.userName);
			$('#modalmessageRegDate').val(JSONData.messageRegDate);
			$('#modalMessageTitle2').val(JSONData.messageTitle);
			$('#modaldetailMessageContent').text(JSONData.messageContent);
			$("#modaldetail").modal('show');
	    } 
  }); 
});
</script>
</head>

<body>
	<!-- ToolBar Start ///////////////////////////4//////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
 
   	<div class="container">

	<div class="row col-xs-10 col-xs-offset-1">
       <div class="col-xs-12">

        <div class="table-responsive">
       	<h2>Message</h4>	    
			<div class="pull-left">
		  		<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
			</div>
			<form class="form-inline" name="detailForm"> 
			 <input type="hidden" id="currentPage" name="currentPage" value="" />
    		</form>
		</div>
        </div>  
            
       <div class="row col-xs-12">       
             <table class="table table-hover " style="margin-left: auto; margin-right: auto; text-align: center;">
              
                   <thead>   
                   <th align="center"><input type="checkbox" id="checkall"/></th>
                   <th align="left" width="10%">보낸 사람</th>
                   <th align="left" width="10%">쪽지 유형</th>
                   <th align="left" width="40%">작성 제목</th>
                   <th align="left" width="20%">보낸 시간</th>
                   <th align="left" width="10%">작성 하기</th>
                   <th align="left" width="10%">지  우  기</th>
                   </thead>
    		<tbody>
    		  <c:set var="i" value="0" />
		  	  <c:forEach var="message" items="${list}">
			  <c:set var="i" value="${ i+1 }" />
			  <input type="hidden" id="messageNo" name="messageNo" value="${message.messageNo}"/>
    		  <input type="hidden" id="toUserName" name="toUserName" value="${message.userName}"/>
    		  <input type="hidden" id="fromUserNo" name="fromUserNo" value="${message.fromUserNo }"/>   
    		  <tr>	  	 
    		 	<td><input type="checkbox" class="checkthis" /></td>
    		  	<td align="left">${message.userName}</td>
    		 	 <td align="left">
    		 	  <c:if test="${message.messageType == '1'}">상품</c:if>
    			  <c:if test="${message.messageType == '2'}">개인 </c:if>
    			  <c:if test="${message.messageType == '3'}">채팅방</c:if>
    			  </td>
    		  	<td align="left" id="title" name="title">${message.messageTitle}</td>
    		  	<td align="left">${message.messageRegDate}</td>
    		  	<td align="left"><button class="btn btn-primary btn-xs" id="writemesg"><span class="glyphicon glyphicon-pencil"></span></button></td>
    		  	<td align="left"><button class="btn btn-danger btn-xs" id="deletemesg"><span class="glyphicon glyphicon-trash"></span></button></td>
  
    		  </tr>
    		  </c:forEach>
    		</tbody>        
			</table> 
         </div>
        </div>
	
    </div>
    
    <div class="col-md-2 col-md-offset-1">
    <jsp:include page="../common/pageNavigator_new.jsp"/>
    </div>
    
    <div class="modal fade" id="modalwrite" role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
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
        		<button type="button" class="btn btn-warning btn-lg" id="addMess" name="addMess" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
      		</div>
        	</div>
  	   </div>
	</div>
    
    
    
     <div class="modal fade" id="modaldelete" role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    	<div class="modal-content">
          <div class="modal-header">
          <input type="hidden" id="mesgNo" name="mesgNo" val=""/>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      	</div>
          <div class="modal-body">
       	  	<div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div> 
      	  </div>
          <div class="modal-footer ">
            <button type="button" class="btn btn-success" id="modalDeleteMessage" name="modalDeleteMessage"><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      	  </div>
        </div>
  	  </div>
     </div>
     
     		<div class="modal fade" id="modaldetail" role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">	
    			<div class="modal-dialog">
    				<div class="modal-content">
          				<div class="modal-header">
          				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        					<h4 class="modal-title custom_align" id="Heading">Message</h4>
      					</div>
          			<div class="modal-body">
          				<input class="hidden" name="targetNo" id="targetNo" type="text" value="">          			
          				<div class="form-group">
       						 보낸 사람  <input class="form-control" name="toUsern1" id="toUsern1" type="text" value="" readonly>
       					</div>
       					<div class="form-group">
       						 도착 시간  <input class="form-control" name="modalmessageRegDate" id="modalmessageRegDate" type="text" value="" readonly>
        				</div>
        				<div class="form-group">  			 
        					제목  <input class="form-control" name="modalMessageTitle2" id="modalMessageTitle2" type="text" value="" readonly>
        				</div>
        				<div class="form-group">
        					내용
        					<textarea rows="3" class="form-control" name="modaldetailMessageContent" id="modaldetailMessageContent" type="text" readonly></textarea>
        				</div>
        			</div>
         			<div class="modal-footer ">
         				<button type="button" class="btn btn-default" data-dismiss="modal"></span>확인</button>
        				<!-- <button type="button" class="btn btn-warning btn-lg" id="addMess" name="addMess" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button> -->
      				</div>
        			</div>
  	  			</div>
				</div> 
        	
</body>
</html>