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
   	   
   	    /* 사이드바 <START> */

	
			.sidenav::-webkit-scrollbar {
  			width: 0.7em;
  			background: transparent;
			}
			
			.sidenav::-webkit-scrollbar-thumb {
 	 		background: transparent;
			}

			.sidenav {
			margin-top: 53px;
    		height: 100%;
		    width: 0;
		    position: fixed;
		    z-index: 1;
		    top: 0;
   		    left: 0;
		    overflow-x: hidden;
		    transition: 0.6s;
		    padding-top: 60px;
		    background-color: #ffffff;
		    border-right: solid 0.8px #C2C2C2;
			}

			.sidenav a {
		    padding: 8px 8px 8px 32px;
		    text-decoration: none;
	    	font-size: 25px;
	  		color: #818181;
		    display: block;
		    transition: 0.3s;
			}

			.sidenav a:hover {
			    color: #f1f1f1;
			}
			
			.sidenav .closebtn {
			    position: absolute;
			    top: 0;
			    right: 25px;
			    font-size: 36px;
			    margin-left: 50px;
			}
			
			#main {
			    transition: margin-left .5s;
			    padding: 5px;
			}
			
			@media screen and (max-height: 450px) {
			  .sidenav {padding-top: 15px;}
			  .sidenav a {font-size: 18px;}
			}
			
			#contentsBox {
				height: 6em;
				border-bottom: dashed 0.5px #C2C2C2;
			}
			
			img[name="ffriend"] {
		  	float: none;
		  	margin: 0 auto;
		  	width: 80%;
		  	height: 80%;
		  	-webkit-border-radius: 50% !important;
		  	-moz-border-radius: 50% !important;
			  border-radius: 50% !important;
			  border: 3px solid;
			}
			
			#back{
         	 border-radius: 23px;
          	 border: dashed rgba(85, 176, 190, 1) 2px;
         	}
         	
         	.table-filter tr td:first-child {
			}
			.sideBarIcon{
				cursor : pointer;
				margin-left : 10px;
			}
			.sideBarIcon:hover {
			    color: #f1f1f1;
			}
	        
			
			/* 사이드바 <END> */


            
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
      
//////////////////////////////////사이드바///////////////////////////////////////
		function openNav() {
			document.getElementById("mySidenav").style.width = "300px";
			document.getElementById("main").style.marginLeft = "300px";
			document.body.style.backgroundColor = "#f4f4f4";
			
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("main").style.marginLeft = "0";
			document.body.style.backgroundColor = "#f4f4f4";
		}
		
		$(function() {
			$("div[name=contentsBox]").hover(function() {
				var index = $("div[name=contentsBox]").index(this);
				$($("div[name=contentsBox]")[index]).attr("style","background-color:#A6A0A5; color:white;");
					}, function(){
						var index = $("div[name=contentsBox]").index(this);
						$($("div[name=contentsBox]")[index]).attr("style","background-color:#ffffff;");
					
			});
		});
////////////////////////////////////////사이드바////////////////////////////////////
////////////////////////////////////////삭제///////////////////////////////////////
$(document).on("click",'td:nth-child(4) span[name="friendDelete"]', function(){
		var friendNo = $($('input[name=friendNo]')[$('td:nth-child(4) span[name="friendDelete"]').index(this)]).val();
		$.ajax({
			url : "/common/json/deleteFriend/"+friendNo,
			method:"GET",
			dataType:"json",
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},		
			success : function(JSONData) {
					swal("삭제되었습니다.", {
				      icon: "success",
				    });
					alert("삭제 성공");
					window.location.reload();
		    },error : function(request,error){
		    	alert(에러);
		    }
	  }); 
	});
////////////////////////////////////////////////////////////////////////////////////	
////////////////////////////////////////////friendMessage///////////////////////////
	$(document).on("click",'td:nth-child(4) span[name="friendMessage"]', function(){
		var userNo = $($('input[name=userNo]')[$('td:nth-child(4) span[name="friendMessage"]').index(this)]).val();
		var userName = $($('input[name=userName]')[$('td:nth-child(4) span[name="friendMessage"]').index(this)]).val();
		$('#targetNo2').val(userNo);
		$('#toUsern2').val(userName);
		$("#modalwrite2").modal('show');
	});

	$(document).on('click','#addMess2',function(){
		var targetNo = $('#targetNo2').val();
		var toUsern = $('#toUsern2').val();
		var modalMessageTitle = $('#modalMessageTitle2').val();
		var modalMessageContent = $('#modalMessageContent2').val();
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
					$('#modalwrite2').modal('toggle');
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
//////////////////////////////////////////////////////////////////////////////////////////////

   
   </script>
   
</head>

<body>
   
   <!-- ToolBar Start /////////////////////////////////////-->
   <jsp:include page="/layout/toolbar.jsp" />
      <!-- ToolBar End /////////////////////////////////////-->
   
   <!---------------------------------------사이드바--------------------------------------------------------->
	<div id="mySidenav" class="sidenav" style="font-family:'JEJUMYEONGJO';">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			
			<div class="col-xs-12" align="center" style="margin-bottom: 2em; ">
			
				<c:if test="${empty user.userImage}">
					<img name="ffriend" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" width="80px" height="80px" style="border-radius: 5%;">
				</c:if>
				<c:if test="${!empty user.userImage}">
					<img name="ffriend" src="/resources/images/userimages/${user.userImage}" style="width: 100px; height: 100px;">										  		 	 
				</c:if>
								
			</div>
			<div class="col-xs-12" align="center">
				[ 이	   름  :  ${user.userName } ]
			</div>
			
			<div class="col-xs-12" align="center" >
				<c:if test="${user.userType == 1}">
					[  유    형  :  회원  ]
				</c:if>
				<c:if test="${user.userType == 2}">
					[  유    형  :  호스트  ]
				</c:if>
				<c:if test="${user.userType == 3}">
					[  유    형  :  관리자  ]
				</c:if>
			</div>
			<div class="col-xs-12" align="center"style="margin-bottom: 4em; ">
				[ 핸드폰  : ${user.userPhone } ]
			</div>
			<div class="col-xs-12" style="background:transparent;">
			
			<table class="table table-filter" style="align-content: center;">
				<thead>
				<h3 align = "center">친  구</h3>
					<tr data-status="pagado">
					    <th align="center" >No</th>
					    <th align="left" >사진</th>
					    <th align="left" >Friend</th>
					    <th align="left" >쪽지/삭제</th>
					</tr>
					</thead>					
					<tbody>
					<c:set var="i" value="0" />
					<c:forEach var="friend" items="${listFriend}">								    
						<c:set var="i" value="${ i+1 }"/>
						<input type="hidden" id="friendNo" name="friendNo" value="${friend.profilePublic}"/>
						<input type="hidden" id="userNo" name="userNo" value="${friend.userNo}"/>
						<input type="hidden" id="userName" name="userName" value="${friend.userName}"/>
						<tr data-status="pagado">
						<div class="media-body">
						<td align="pull-right">${ i }</td>
						<td align="left">
							<c:if test="${empty friend.userImage}">
								<img name="ffriend" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" style="width: 40px; height: 40px;" class="img-responsive">
							</c:if>
							<c:if test="${!empty friend.userImage}">
								<img name="ffriend" src="/resources/images/userimages/${friend.userImage}" class="img-responsive" style="width: 40px; height: 40px;">										  		 	 
							</c:if>
						</td>
						<td align="left">
							${friend.userName}
						</td>
						<td align="left" class="row">
								<!-- <div href="#" role="button" name="friendMessage" style="max-width : 40%;" ><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></div>
								<div href="#"  role="button" name="friendDelete" style="max-width : 40%;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></div> -->
							<span class="glyphicon glyphicon-envelope sideBarIcon" name="friendMessage" aria-hidden="true"></span>
							<span class="glyphicon glyphicon-remove sideBarIcon" name="friendDelete" aria-hidden="true"></span>
						
						</td>
						</div>
						</tr>
					</c:forEach>
				</tbody>							
				</table>
				
		    </div>
	</div>
	
	<div id="main" style="position:fixed; z-index:1000;">

	
		<span style="font-size: 20px; font-family:'JEJUMYEONGJO'; cursor: pointer" onclick="openNav()" >&#9776;
		OPEN
		</span>
	</div>
   	
	<!---------------------------------------사이드바--------------------------------------------------------->
   
   
   
   
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
    
    <!--  화면구성 div End /////////////////////////////////////-->
    
    
    
    <input type="hidden" id="currentPage" name="currentPage" value="" />
    <%-- <input type="hidden" id="menu" name="menu" value="${menu}" /> --%> 
    <%-- //<input type="hidden" id="priceList" name="priceList" value="${search.priceList}">  --%>
                   
    <!-- PageNavigation Start... -->
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

		<div class="modal fade" id="modalwrite2" role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
    	<div class="modal-dialog">
    		<div class="modal-content">
          		<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        			<h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      			</div>
          	<div class="modal-body">
          			<input class="hidden" name="targetNo2" id="targetNo2" type="text" value="">
          		<div class="form-group">
       				<input class="form-control" name="toUsern2" id="toUsern2" type="text" value="" readonly>
        		</div>
        		<div class="form-group"> 
        			<input class="form-control" name="modalMessageTitle2" id="modalMessageTitle2" type="text" value="" placeholder="제목을 작성하여 주세요.">
        		</div>
        		<div class="form-group">
        			<textarea rows="4" class="form-control" name="modalMessageContent2" id="modalMessageContent2" value="" placeholder="내용을 작성하여 주세요."></textarea>
        		</div>
        	</div>
         	<div class="modal-footer ">
        		<button type="button" class="btn2 btn-warning btn-lg" id="addMess2" name="addMess2" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> SEND</button>
      		</div>
        	</div>
  	   </div>
	   </div>

</body>
</html>