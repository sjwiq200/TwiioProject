<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
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
<meta charset="EUC-KR">

	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta charset="EUC-KR">
	
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
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $("a[href='#']").on("click" , function() {
		 history.go(-1);
	});
});

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

</script>
</head>

<body>
<!-- ToolBar Start /////////////////////////////////////-->
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
			<div class="col-md-3 col-md-offset-3"><h4><strong>${community.regDate}</strong></h4></div>
		
		</div>
		<div class="col-xs-10 col-xs-offset-1">
		<hr sytle="border-style:dotted">
		</div>
		<div class="form-group">
		    <div class="col-xs-11 col-xs-offset-1"><strong>[${user.userId}]</strong></div>
		</div>
		<div class="form-group">
			<div class="col-xs-11 col-xs-offset-1">
			${community.communityContent}
			</div>
		</div>
		<div class="col-xs-10 col-xs-offset-1">
		<hr sytle="border-style:dotted">
		</div>
		<div class="form-group">
			<div class="col-md-8 col-md-offset-1">
				<textarea  name="comment_content" row="6" col="50"></textarea>
			</div>
			<div class="col-md-1">
				<button type="button" style="" id="write" class="btn btn-default">댓글입력</button>
			</div>
		</div>
		<br>
		<br>
		<br>
		<div class="form-group">
			<div class="col-md-2 col-md-offset-1">
				<strong>댓 글 목 록</strong>		
			</div>
			<div class="col-md-2">
				조회수 : <c:if test="${totalCountReply == null}">0</c:if>
					   <c:if test="${totalCountReply != null}">${totalCountReply}</c:if>				
			</div>
		</div>
		<div class="col-xs-10 col-xs-offset-1">
		<hr sytle="border-style:dotted">
		</div>
		<div class="row">
		<c:forEach var="reply" items="${list}">
			<div class="col-md-10 col-md-offset-1">
    			${reply.userId}
    		</div>
    		<div class="col-md-10 col-md-offset-1">
    			${reply.replyContent}
    		</div>
    		<div class="col-md-10 col-md-offset-1">
    			${reply.replyRegDate}
    		</div>
 		</c:forEach>
 		</div>
		
   <!-- ToolBar End /////////////////////////////////////-->
		</form>
	</div>
</body>
</html>