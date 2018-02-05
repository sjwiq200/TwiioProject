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




 	
	
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        body {
            padding-top : 50px;
        }
        textarea {
	  width: 100%;
	  height: 100px;
	  resize: none;
		}
		
		#container{
 		 width:715px;
 		 height:230px;
		 margin:50px auto;
		}
		.button-2{
  width:140px;
  height:50px;
  border:2px solid #34495e;
  float:left;
  text-align:center;
  cursor:pointer;
  position:relative;
  box-sizing:border-box;
  overflow:hidden;
  margin:0 0 40px 50px;
}
.button-2 a{
  font-family:arial;
  font-size:16px;
  color:#34495e;
  text-decoration:none;
  line-height:50px;
  transition:all .5s ease;
  z-index:2;
  position:relative;
}
.eff-2{
  width:140px;
  height:50px;
  top:-50px;
  background:#34495e;
  position:absolute;
  transition:all .5s ease;
  z-index:1;
}
.button-2:hover .eff-2{
  top:0;
}
.button-2:hover a{
  color:#fff;
}

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

	$(function() {
    $('#summernote').summernote({
    	 toolbar: [
    		    // [groupName, [list of button]]
    		    ['style', ['style', 'bold', 'italic', 'underline', 'clear']],
    		    ['font', ['font family', 'strikethrough', 'superscript', 'subscript']],
    		    ['fontsize', ['fontsize']],
    		    ['color', ['color']],
    		    ['para', ['ul', 'ol', 'paragraph']],
    		    ['height', ['height']],
    		    ['insert', ['table', 'picture', 'video', 'link']],
    		    ['misc', ['undo', 'redo', 'codeview', 'help']]
    		  ],
    	        	
    	lang: 'ko-KR', // default: 'en-US'
    	height: 300,                 // set editor height
    	minHeight: null,             // set minimum height of editor
    	maxHeight: null,             // set maximum height of editor
    	focus: true,                  // set focus to editable area after initializing summernote
    	placeholder: 'write here...',
    	/* callback: {
    		onImageUpload: function(files) {
        		sendFile(files[0]);
        	}
    	} */
    	
    });
});

	var page = 1;
	var page2='';
	 
	
	$(function() {
		 $("#addReply").on("click" , function() {
			 page=page+1;
			 
		  $.ajax( 
						{
						url : "/common/json/listCommunityReply",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify({
							"communityNo":"${community.communityNo}",
							"userNo":"${community.userNo}",
							"userName": "${community.userName}",
							"currentPage" : page
						}),
						success : function(JSONData) {
							var displayValue='';
							//alert(JSONData.length);
							for(var i=0; i<JSONData.list.length;i++){
							
							if(JSONData.list[i]!=1){
							displayValue += '<div class="row2">'+
												'<input type="hidden" name="userNo" value="'+JSONData.list[i].userNo+'"/>'+
												 '<input type="hidden" name="replyNo" value="'+JSONData.list[i].communityNo+'"/>'+
												 '<input type="hidden" name="userName" value="'+JSONData.list[i].userName+'"/>'+
												'<div class="col-md-6 col-md-offset-1">'+
												JSONData.list[i].userName+
						   						'</div>'+
						  						 '<div class="col-md-3 col-md-offset-1">'+
												'<button type="button"  name="addreport" class="btn btn-default">신고하기</button>'+
												'<button type="button"  name="addfriend" class="btn btn-default">친구추가</button>'+
												'<button type="button"  name="addmessage" class="btn btn-default">쪽지보내기</button>'+
						   						'</div>'+
				    						   '<div class="col-md-10 col-md-offset-1">'+
				    						   (JSONData.list[i].replyContent == null?'':JSONData.list[i].replyContent)+
				    						   '</div>'+
				    						   '<div class="col-md-10 col-md-offset-1">'+
				    						   JSONData.list[i].replyRegDate+
				    						   '</div>'+
				    						   '<div class="col-xs-10 col-xs-offset-1">'+
											   '<hr sytle="border-style:dotted">'+
							  				   '</div></div>';
							}
							}
							
							if(JSONData.list[JSONData.list.length-1] == 1){
								 $("#aReply").remove();
							}
							var totalcount=
							'<div class="col-md-2 col-md-offset-1">'+
								'<strong>댓 글 목 록</strong>'+		
							'</div>'+
							'<div class="col-md-2" >'+
								'댓글수  : '+JSONData.totalCount+				
							'</div>';
	
							$('.row').html(displayValue);
							$('#totalCount').html(totalcount); 
						}
			}); 
		});
		 $(document).ready(function(){ page2 = $('.row2').length});
		 console.log('page2 : '+page2);
	});
	
	
	$(function() {
		 $("#write").on("click" , function() {
			
			if(${empty user.userId}){
				 alert('로그인후 사용하여주세요');	 
			 }
			 else{
				// alert('들어오니??');
			 var replycontent = $('#replyContent').val();
			  $.ajax( 
						{
						url : "/common/json/addReply",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify({
							"replyContent":replycontent,
							"communityNo":"${community.communityNo}",
							"userNo":"${user.userNo}",
							"userName": "${user.userName}",
							"currentPage" : page
						}),
						
						success : function(JSONData) {
							//alert(JSON.stringify(JSONData));
							
							var displayValue='';
							
							for(var i=0;i<JSONData.list.length;i++){
							 displayValue += 
											   '<div class="row2">'+
											   '<input type="hidden" name="userNo" value="'+JSONData.list[i].userNo+'"/>'+
											   '<input type="hidden" name="replyNo" value="'+JSONData.list[i].communityNo+'"/>'+
											   '<input type="hidden" name="userName" value="'+JSONData.list[i].userName+'"/>'+
											   '<div class="col-md-6 col-md-offset-1">'+
												JSONData.list[i].userName+
				    						   '</div>'+
				    						   '<div class="col-md-3 col-md-offset-1">'+
												'<button type="button"  name="addreport" class="btn btn-default">신고하기</button>'+
												'<button type="button"  name="addfriend" class="btn btn-default">친구추가</button>'+
												'<button type="button"  name="addmessage" class="btn btn-default">쪽지보내기</button>'+												
											   '</div>'+
				    						   '<div class="col-md-10 col-md-offset-1">'+
				    						   (JSONData.list[i].replyContent == null?'':JSONData.list[i].replyContent)+
				    						   '</div>'+
				    						   '<div class="col-md-10 col-md-offset-1">'+
				    						   JSONData.list[i].replyRegDate+
				    						   '</div>'+
				    						   '<div class="col-xs-10 col-xs-offset-1">'+
											   '<hr sytle="border-style:dotted">'+
							  				   '</div></div>';
							}
							var totalcount=
								'<div class="col-md-2 col-md-offset-1">'+
								'<strong>댓 글 목 록</strong>'+		
							'</div>'+
							'<div class="col-md-2" >'+
								'댓글수  : '+JSONData.totalCount+				
							'</div>';
							
							$('.row').html(displayValue); 				   
							$('#totalCount').html(totalcount);
							
						}
			}); 
			 } 
		});
		 
	});
	
	
	
		 $(document).on("click", '#addfriendcommunity', function(){

			 $('#modalfriend').modal('show');
			 
			 $(document).on('click','#addmodalfriend',function(){
			 if(${empty user.userId}){
				 alert('로그인후 사용하여주세요');
				 $('#modalfriend').modal('toggle');
			 }
			 else{
			 if(${user.userNo eq community.userNo}){
				 alert('자기 자신을 친구 추가할수 없습니다.');
				 $('#modalfriend').modal('toggle');
			 }else{
			  $.ajax( 
						{
						url : "/common/json/addFriend",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify({
							"userNo":"${user.userNo}",
							"friendNo":"${community.userNo}",
						}),
						success : function(JSONData) {
							alert(JSON.stringify(JSONData));
							$('#modalfriend').modal('toggle');
							
						}
				}); 
			 	}
			 }
			 });
		});
	
	
	

	$(document).on('click','.row2 button[name=addreport]', function() {
		 var reportuserno = $($('input[name=userNo]')[$('.row2 button[name=addreport]').index(this)]).val();
		 var reportreplyno = $($('input[name=replyNo]')[$('.row2 button[name=addreport]').index(this)]).val();
		 var reportbody = 
			        '<h3>신고글 작성<h3>'+
					'<input type="text" class="form-control" id="reportuser" row="7" col="50" value="'+reportuserno+'" readonly/>'+
					'<input type="text" class="form-control" id="reporttitle" row="7" col="50" placeholder="신고 제목 작성" value=""/>'+
					'<textarea id="reportcontent"  name="reportcontent" row="7" col="50" value="" placeholder="신고 내용"></textarea>';
		 
		 if(${empty user.userId}){
			 alert('로그인후 사용하여주세요');	 
		 }else if(${user.userNo}== reportuserno){
			 alert('자기자신은 신고 못합니다.');
	 	 }else{
	 		$('#reportbody').html(reportbody);
	 		$('#modalreport').modal('show');
	 	 }
		
		$(document).on('click','#addreportcommunity',function(){
			 	var reportcontent = $('#reportcontent').val();
			 	var reporttitle = $('#reporttitle').val();
			 	if(reportcontent==''| reporttitle==''){
					 alert('내용과 제목을 입력하세요.');			 
				}
				else{
			 	 $.ajax( 
						{
						url : "/common/json/addReport",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify({
							"userNo":"${user.userNo}",
							"reportContent":reportcontent,
							"reportTitle":reporttitle,
							"targetUserNo":reportuserno,
							"targetReplyNo":reportreplyno,
							"targetCommunityNo" :${community.communityNo}
						}),
						
						success : function(JSONData) {
							alert(JSON.stringify(JSONData));
							$('#modalreport').modal('toggle');	
						}
					});
			 	 }
			});
	});
	
	
	$(document).on('click','.row2 button[name=addfriend]', function() {
		 var addfrienduserno = $($('input[name=userNo]')[$('.row2 button[name=addfriend]').index(this)]).val();
		 if(${empty user.userId}){
			 alert('로그인후 사용하여주세요');	 
		 }
		 else if(${user.userNo} ==addfrienduserno){
			 alert('자기 자신을 친구 추가할수 없습니다.');
		 }else{
		 	$('#modalfriend').modal('show');
		 }
		
		$(document).on('click','#addmodalfriend',function(){
			  $.ajax({
						url : "/common/json/addFriend",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify({
							"userNo":"${user.userNo}",
							"friendNo":addfrienduserno,
						}),
						success : function(JSONData) {
							alert(JSON.stringify(JSONData));
							$('#modalfriend').modal('toggle');					
					}
				}); 
			});
		});
	
	$(document).on('click','.row2 button[name=addmessage]', function() {
		 var msguserno = $($('input[name=userNo]')[$('.row2 button[name=addmessage]').index(this)]).val();
		 var msgusername = $($('input[name=userName]')[$('.row2 button[name=addmessage]').index(this)]).val();
		 var inmsg =
			 '<input type="text" class="form-control" id="msgtitle" row="7" col="50" placeholder="제목 작성" value=""/>'+
			'<input type="text" class="form-control" id="msgno" row="7" col="50" placeholder="제목 작성" value="'+msguserno+'"/>'+
			'<textarea id="msgcontent"  name="msgcontent" row="7" col="50" value="" placeholder="내용 작성"></textarea>';
		 
		 if(${empty user.userId}){
			 alert('로그인후 사용하여주세요');	 
		 }else if(${user.userNo}== msguserno){
			 alert('자기 자신에게 쪽지를 보낼수 없습니다.');
		 }else{ 
			$('#msg').html(inmsg);
		 	$('#modalmessage').modal('show');
		 }
		 $(document).on('click','#upmessage',function(){
			var msgcontent = $('#msgcontent').val();
			var msgtitle = $('#msgtitle').val();
			//modalmessage

				if(msgcontent==''| msgtitle==''){
				 alert('내용과 제목을 입력하세요.');			 
				 }
				 else{
				  $.ajax( 
						{
						url : "/mypage/json/addMessage",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify({
							"toUserNo":"${user.userNo}",
							"fromUserNo":msguserno,
							"messageContent":msgcontent,
							"messageType":"2",
							"messageTitle":msgtitle							
						}),
						success : function(JSONData) {
							alert(JSON.stringify(JSONData));
							$('#modalmessage').modal('toggle');
							
						}
				});
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
   	
		<div class="col-xs-10 col-xs-offset-1 page-header text-info">
		<h1>커 뮤 니 티 글 보 기</h1>
		</div>
		<input type="hidden" name = "communityType" id = "communityType" value="${communityType }"/>
		<form name="detailForm" class="form-horizontal" enctype="multipart/form-data">
		<div class="form-group">
		   
		    <div class="col-md-5 col-md-offset-1">
		    <h4><strong><c:if test="${community.communitySubTitle == 0}">
		    	[도시]
		    </c:if>
		    <c:if test="${community.communitySubTitle == 1}">
		   	 	[루트]
		    </c:if>
		    <c:if test="${community.communitySubTitle == 2}">
		   	 	[교통]
		    </c:if>
		    <c:if test="${community.communitySubTitle == 3}">
		    	[숙소]
		    </c:if>
		    <c:if test="${community.communitySubTitle == 4}">
		    	[쇼핑]
		    </c:if>
		    <c:if test="${community.communitySubTitle == 5}">
		    	[기타]
		    </c:if> 
		       |   ${community.communityTitle}
		    
		   </strong></h4>
		   </div>
			<div class="col-md-4 col-md-offset-2"><h4><strong>조회수  :  ${community.viewCount} / 등록일  :  ${community.regDate}</strong></h4></div>
		</div>
		<div class="col-xs-10 col-xs-offset-1">
		<hr sytle="border-style:dotted">
		</div>
		<div class="form-group">
		    <div class="col-xs-7 col-xs-offset-1"><strong>[  작성자  :  ${community.userName} ]</strong></div>
		    <c:if test="${empty user.userId}">
		    </c:if>
		    <c:if test="${!empty user.userId}">
		    <div class="col-md-3">
				<button type="button"  id="addfriendcommunity" class="btn btn-default">친구추가</button>
				<c:if test="${community.userNo == user.userNo}">
				<button type="button"  id="updatecommunity" class="btn btn-default">수정하기</button>
				</c:if>
			</div>
		    </c:if>
		</div>
		<div class="form-group">
			<div class="col-xs-11 col-xs-offset-1">
			${community.communityContent}
			</div>
		</div>
		<div class="col-xs-10 col-xs-offset-1">
		<hr sytle="border-style:dotted">
		</div>
		
		<div class="form-group" id="replyinput">
			<div class="col-md-8 col-md-offset-1">
				<textarea id="replyContent"  name="comment_content" row="6" col="50" value=""></textarea>
			</div>
			<div class="col-md-1">
				<button type="button"  id="write" class="btn btn-default">댓글입력</button>
			</div>
		</div>
		
		<br>
		<br>
		<br>
		<div class="form-group" id = "totalCount">
			<div class="col-md-2 col-md-offset-1">
				<strong>댓 글 목 록</strong>		
			</div>
			<div class="col-md-2" >
				댓글수  : <c:if test="${totalCountReply == null}">0</c:if>
					   <c:if test="${totalCountReply != null}">${totalCountReply}</c:if>				
			</div>
		</div>
		<div class="col-xs-10 col-xs-offset-1">
		<hr sytle="border-style:dotted">
		</div>
		<div class="row">
		<c:forEach var="reply" items="${list}">
		<div class= "row2">
			<input type="hidden" name="userNo" value="${reply.userNo}"/>
			<input type="hidden" name="userName" value="${reply.userName}"/>
			<input type="hidden" name="replyNo" value="${reply.replyNo}"/>
			<div class="col-md-6 col-md-offset-1">
    			${reply.userName}
    		</div>
    		<c:if test="${empty user.userId}">
		    </c:if>
		    <c:if test="${!empty user.userId}">
    		<div class="col-md-3 col-md-offset-1">
				<button type="button"  name="addreport" class="btn btn-default">신고하기</button>
								
				<button type="button"  name="addfriend" class="btn btn-default">친구추가</button>
			
				<button type="button"  name="addmessage" class="btn btn-default">쪽지보내기</button>
			</div>
			</c:if>
    		<div class="col-md-10 col-md-offset-1">
    			${reply.replyContent}
    		</div>
    		<div class="col-md-10 col-md-offset-1">
    			${reply.replyRegDate}
    		</div>
    		<div class="col-xs-10 col-xs-offset-1">
			<hr sytle="border-style:dotted">
			</div>
		</div>
 		</c:forEach>
 		</div>
 		
 		<div class="col-xs-2 col-xs-offset-5" id="aReply">
			<div class="button-2">
    		<div class="eff-2"></div>
    		<a href="#" id="addReply"> 댓글 더보기 </a>
  			</div>
  			<div class="col-xs-10 col-xs-offset-1">
			<hr sytle="border-style:dotted">
			</div>
		</div>
		
		<div class="modal fade" id="modalreport"  role="dialog">
		<div class="modal-dialog modal-lg">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<Strong>REPORT</Strong>
				</h4>
				<h7 class="modal-title">TWIIO</h7>
			</div>
			<div class="modal-body">
			
				<div id="reportbody"></div>
			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="addreportcommunity">신고등록</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
			</div>
		</div>
		</div>
		</div>
		
		
		<div class="modal fade" id="modalfriend"  role="dialog">
		<div class="modal-dialog modal-lg">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3 class="modal-title">
					<Strong>친구추가</Strong>
				</h3>
			</div>
			<div class="modal-body">
				<h4><Strong>친구 추가를 하시겠습니까 ????</Strong></h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="addmodalfriend">예</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
		</div>
		</div>
		
		<div class="modal fade" id="modalmessage"  role="dialog">
			<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3 class="modal-title">
					<Strong>쪽지</Strong>
				</h3>
			</div>
			<div class="modal-body">
				<div id="msg">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="upmessage">보내기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
		</div>
		</div>
		
		
   <!-- ToolBar End /////////////////////////////////////-->
		</form>
	</div>
</body>
</html>