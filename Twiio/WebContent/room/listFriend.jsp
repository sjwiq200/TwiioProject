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
  	$(function() {
  		
		 
		 $("button#invite").on("click",function(){
			 swal("친구초대완료! ","","success")
			 .then((next)=>{
				 if(next){
					 var userNo = $(this).html().split('value="')[1].split('"')[0];
					 var roomKey = $("#roomKey").val(); 
					 
					 $.ajax({
						 url : "/room/json/addRoomFriend/",
						 method : "POST",
						 data : {
							 userNo : userNo,
							 roomKey : roomKey
						 },
						 dataType : "json",
						 headders : {
							 "Accept" : "application/json",
							"Content-Type" : "application/json"
						 },
						 success : function(JSONData, status){
							if(JSONData == true){

								window.close();
							}
							 
						 }
					 })//end ajax
				 }
			 })//end swal
			 
		 })
	 });
  </script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
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
			width: 60px;
		}
		img{
		  float: none;
		  margin: 0 auto;
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
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	
	
</head>
<body>
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	
	
		<div class="row">

		<section class="content">
			<h1 style="font-family: 'Jeju Gothic', serif; ">친구 목록</h1>
			<hr/>
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="table-container">
							<table class="table table-filter" style="align-content: center;">
							
							<thead>
					          <tr data-status="pagado">
					          	<th align="center">No</th>
					            <th align="center" style="padding-left: 40px;">Friend</th>
					            <th align="center">FriendName</th>
					            <th align="center"></th>
					          </tr>
					        </thead>
												
								<tbody>
									
									<c:set var="i" value="0" />
									  <input id="roomKey" type="hidden" value="${roomKey}">
									  <c:forEach var="friend" items="${list}">
										<c:set var="i" value="${ i+1 }" />
										<tr data-status="pagado">
										<div class="media-body">
										  <td align="center">${ i }</td>
										  <td align="left" vailgn="middle">
										  
										<div class="col-sm-12">  
										 	 <div class="col-sm-3 col-sm-offset-1" >
										 	 <img src="/resources/images/userimages/${friend.userId }.jpg" onerror="javascript:this.src='/resources/images/room/default.jpeg'" style="width: 32px; height: 32px;" class="media-photo">
										 	 <!-- <img src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" style="width: 32px; height: 32px;" class="media-photo"> -->
										 	 </div>
										 </div> 
										  </td>
										  
										  <td>
										  	<div class="col-sm-5 "  style="padding-top: 8px;" >${friend.userName}</div>
										  </td>
											  <td align="right" style="padding-left: 40px;">
											  <button type="button" class="btn btn-outlined btn-light btn-sm" id="invite" >친구초대 +<input type="hidden" id="userNo" value="${friend.userNo}"/></button>
											  	<%-- <a href="#">친구초대<input type="hidden" id="userNo" value="${friend.userNo}"></a> --%>
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

        
        
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
	
</body>
</html>