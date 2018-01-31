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

	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        body {
            padding-top : 50px;
        }
	</style>

<script type="text/javascript">

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $("button.btn.btn-primary").bind("click" , function() {
		 $("form").attr("method" , "POST").attr("action" , "/community/listCommunity").submit();
	});
});	


/*============= jQuery ���� �ּ�ó�� =============
function resetData() {
		document.detailForm.reset();
}========================================	*/
//==> �߰��Ⱥκ� : "���"  Event ó�� ��  ����
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
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
    
    $("button.btn.btn-primary").on("click",function(){
    	$("textarea").val($("#summernote").summernote("code"));
    	$("form").attr("method" , "POST").attr("action" , "/community/addCommunity").submit();
    });
    
    
});

</script>
</head>

<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	
   	 <div class="container">
		<div class="page-header text-info">
		<h1 >Ŀ �� �� Ƽ �� �� ��</h1>
		</div>
		
		<form name="detailForm" class="form-horizontal" enctype="multipart/form-data">
		<input type="hidden" name = "communityType" id = "communityType" value="${communityType }"/>
		
		<div class="form-group">
		    <div class="col-xs-6 col-sm-4">
		      <select class="form-control" name="communitySubTitle" id="communitySubTitle">
		      		<option value="">���Ӹ��� ������ �ּ���</option>
				  	<option value="0">����</option>
					<option value="1">��Ʈ</option>
					<option value="2">����</option>
					<option value="3">����</option>
					<option value="4">����</option>  
					<option value="5">��Ÿ</option>
				</select>
		    </div>
		
		    <div class="col-xs-8">
		      <input type="text" class="form-control" id="communityTitle" name="communityTitle" placeholder="������ �Է� ���ּ���.">
		    </div>
		</div>
		
		<div class="form-group">
			<textarea id="summernote" name="communityContent"></textarea>
		</div>

	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" name="save" class="btn btn-primary">�� ��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
	</div>
   <!-- ToolBar End /////////////////////////////////////-->
</form>
</div>
</body>
</html>