<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
   <link href="/resources//css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/resources//javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  
  
	<!--  ///////////////////////// CSS ////////////////////////// -->
	
	<link rel="stylesheet" href="/resources/css/font.css" />
  <script>
  	
  </script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 100px ;
            background-color: #f4f4f4;
			color: #666666 ;
			font-family: "Source Sans Pro", Helvetica, sans-serif ;
        }
        .content h1 {
			text-align: center;
		}
		
		/*	--------------------------------------------------
			:: Table Filter
			-------------------------------------------------- */
		.panel {
			border: 1px solid #ddd;
			background-color: #fcfcfc;
		}
		.table-filter {
			background-color: #fff;
			border-bottom: 1px solid #eee;
			font-size: 15px;
		}
		.table-filter tbody tr:hover {
			cursor: pointer;
			background-color: #eee;
		}
		.table-filter tbody tr td {
			padding: 10px;
			vertical-align: middle;
			border-top-color: #eee;
		}
		.table-filter tbody tr.selected td {
			background-color: #eee;
		}
		.table-filter tr td:first-child {
		}
		img{
		  float: none;
		  margin: 0px;
		  -webkit-border-radius: 50% !important;
		  -moz-border-radius: 50% !important;
		  border-radius: 50% !important;
		  border: 3px solid;
		}
		.btn-outlined.btn-light:hover,
		.btn-outlined.btn-light:active {
			    color: #FFF;
			    background: rgba(215, 58, 49, 0.8);
			    border-color: rgba(215, 58, 49, 0.8);
			}
			
			.btn-outlined.btn-light {
			    background: #FFF;
			    color: rgba(215, 58, 49, 0.8);
				border-color: rgba(215, 58, 49, 0.8);
			}
    </style>
    
     <script type="text/javascript">
  		$(document).on("click",'td:nth-child(4) a[name="friendDelete"]', function(){
 			var friendNo = $($('input[name=friendNo]')[$('td:nth-child(4) a[name="friendDelete"]').index(this)]).val();
 			$.ajax({
 				url : "/common/json/deleteFriend/"+friendNo,
 				method:"GET",
 				dataType:"json",
 				headers :{
 					"Accept" : "application/json",
 					"Content-Type" : "application/json"
 				},		
 				success : function(JSONData) {
 						swal("삭제되었습니다..", {
 					      icon: "success",
 					    });
 						alert("삭제 성공");
 						window.location.reload();
 			    } 
 		  }); 
 		});
  		

  		$(document).on("click",'td:nth-child(4) a[name="friendMessage"]', function(){
  			var userNo = $($('input[name=userNo]')[$('td:nth-child(4) a[name="friendMessage"]').index(this)]).val();
  			var userName = $($('input[name=userName]')[$('td:nth-child(4) a[name="friendMessage"]').index(this)]).val();
  			
  			alert(userNo);
  			alert(userName);
  			$('#targetNo').val(userNo);
  			$('#toUsern').val(userName);
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
  		
  		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				var userNo = $($('input[name=userNo]')[$('td:nth-child(2)').index(this)] ).val();
				window.open("/user/getProfile2?userNo="+userNo,"getProfile2","width=500, height=650,status=no, scrollbars=no, location=no");
				//self.location ="/user/getProfile2?userNo="+userNo; 
			});
		});
     
     </script>
</head>
<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="row">

		<section class="content">
			<h1 style="font-family: 'Jeju Gothic', serif; ">친구 목록</h1>
			<hr/>
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="table-container">
							<table class="table table-filter" style="align-content: center;">
							<thead>
					          		<tr data-status="pagado">
					          			<th align="center" class="col-md-1">No</th>
					          			<th align="center" class="col-md-2">사진</th>
					            		<th align="center" class="col-md-3">Friend</th>
					            		<th align="right" class="col-md-3"></th>
					          		</tr>
					       		    </thead>					
									<tbody>
									<c:set var="i" value="0" />
									<c:forEach var="friend" items="${list}">								    
									<c:set var="i" value="${ i+1 }"/>
									<input type="hidden" id="friendNo" name="friendNo" value="${friend.profilePublic}"/>
									<input type="hidden" id="userNo" name="userNo" value="${friend.userNo}"/>
									<input type="hidden" id="userName" name="userName" value="${friend.userName}"/>
									<tr data-status="pagado">
									<div class="media-body">
									<td align="pull-right">${ i }</td>
									<td align="left">
									<c:if test="${empty friend.userImage}">
										<img src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" style="width: 40px; height: 40px;" class="img-responsive">
									</c:if>
									<c:if test="${!empty friend.userImage}">
										<img src="/resources/images/userimages/${friend.userImage}" class="img-responsive" style="width: 40px; height: 40px;">										  		 	 
									</c:if>
									</td>
									<td align="left">
										${friend.userName}
									</td>
									<td align="right">
									<a class="btn btn-outlined btn-light btn-sm" href="#" role="button" name="friendMessage"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></a>

									<a class="btn btn-outlined btn-light btn-sm" href="#" role="button" name="friendDelete"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
									</td>
									</div>
									</tr>
							   		</c:forEach>
							</tbody>							
							</table>
						</div>
					</div>
				</div>
			</div>
			</section>		
			</div>	  
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
</body>
</html>