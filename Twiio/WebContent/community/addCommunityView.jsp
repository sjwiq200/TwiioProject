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
	
	<!-- <link href="/resources/css/summernote.css" rel="stylesheet">
    <script src="/resources/javascript/summernote.min.js"></script>  -->
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
    <!-- jQuery UI toolTip 사용 CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip 사용 JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
    <link href="/resources/css/font.css" rel="stylesheet" type="text/css"/>
  	<!-- summernote -->
  	
  	<!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  	
    
	<style>
		body{
		 padding-top : 100px;
		 background-color : #F4F4F4;
		
		}
	
	
       body > div.container{
        	border-radius: 23px;
		 	border: dashed rgba(85, 176, 190, 1) 2px;
            margin-top: 10px;
            background-color : #FFF;
            padding : 30px;
        }
        
			.communityButton {
				font-size:12px;
				line-height:16px;
				border: 2px solid;
				padding:8px 15px;
				letter-spacing: 1px;
				text-decoration: none;
				background: none;
			    -moz-user-select: none;
			    background-image: none;
			    border: 1px solid transparent;
			    border-radius: 0;
			    cursor: pointer;
			    display: inline-block;
			    margin-bottom: 0;
			    vertical-align: middle;
			    white-space: nowrap;
				font-size:14px;
				line-height:20px;
				font-weight:700;
				text-transform:uppercase;
				border: 3px solid;
				padding:8px 20px;
			}
			.communityButton.go:hover,
			.communityButton.go:active {
			    color: #FFF !important;
			    background: #08708A !important;
			    border-color: #08708A !important;
			}
			
			.communityButton.go {
			    background: #f4f4f4 !important;
			    color: #08708A !important;
				border-color: #08708A !important;
			}

			.communityButton.cancel:hover,
			.communityButton.cancel:active {
			    color: #FFF;
			    background: #D73A31;
			    border-color: #D73A31;
			}
			
			.communityButton.cancel {
			    background: #f4f4f4;
			    color: #D73A31;
				border-color: #D73A31;
			}
			h2{
				font-family: "Pacifico", cursive;
			}
	</style>

<script type="text/javascript">

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.
	 $("#reviewWrite").on("click",function(){
    	$("textarea").val($("#summernote").summernote("code"));
    	if($("#communityTitle").val() ==''){
    		swal("제목은 필수로 입력해주세요!","","warning");
    		
    	}else{
    		$("form").attr("method" , "POST").attr("action" , "/community/addCommunity").submit();	
    	}
    	
    });
/* 	 $("button.btn.btn-primary").bind("click" , function() {
		 $("form").attr("method" , "POST").attr("action" , "/community/listCommunity").submit();
	}); */
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

function sendFile(file, editor) {              
    // 파일 전송을 위한 폼생성
		data = new FormData();
	    data.append("file", file);
	    //alert('파일업로드 들어오니??');
	    $.ajax({ // ajax를 통해 파일 업로드 처리
	        data : data,
	        dataType : "json",
	        type : "POST",
	        url : "/community/json/uploadImage",
	        cache : false,
	        contentType : false,
	        processData : false,
	        success : function(data) { // 처리가 성공할 경우
            // 에디터에 이미지 출력
     
	        	$(editor).summernote('editor.insertImage',data.relativeUrl);
	        },
	        error : function() {
			alert("파일 업로드에 실패했습니다.")
		}
	    });
	}
function deleteFile(file) {
}

$(document).ready(function() {
    $('#summernote').summernote({
    	toolbar: [
  		   // [groupName, [list of button]]
  		   ['style', ['style', 'bold', 'italic', 'underline', 'clear']],
  		   ['font', ['font family', 'strikethrough', 'superscript', 'subscript']],
  		   ['fontsize', ['fontsize']],
  		   ['color', ['color']],
  		   ['para', ['ul', 'ol', 'paragraph']],
  		   ['height', ['height']],
  		   ['insert', ['table', 'picture']],
  		   ['misc', ['undo', 'redo', 'codeview', 'help']]
  		 ],       	
     	lang: 'ko-KR', // default: 'en-US'
     	height: 500,                 // set editor height
     	minHeight: null,             // set minimum height of editor
     	maxHeight: null,             // set maximum height of editor
     	focus: false,                  // set focus to editable area after initializing summernote
    	callbacks: {
    		onImageUpload: function(files, editor, welEditable) {
		    	for(i=0;i<files.length;i++){
		    		sendFile(files[i], this);
		    	}
    		}
    	} 
   	});
});
    
   
    
    $(function() {
		$("#file").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result).attr('width', '300px');
			}
			reader.readAsDataURL(input.files[0]);
			/* alert(e.target.result); */
		}
	}


</script>
</head>

<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	
   	 <div class="container">
		<div class="page-header text-info" style="margin-bottom : 30px; padding-bottom : 30px;">
			<c:if test="${communityType == '1'}">
				<h2 align="center" style="color:#08708A; font-size : 5em !important;"><strong>BLABLA</strong></h2>
			</c:if>
		</div>
		
		<form name="detailForm" class="form-horizontal" enctype="multipart/form-data">
		<input type="hidden" name = "communityType" id = "communityType" value="${communityType}"/>
	<div class="col-sm-12">	
				
				<div class="form-group">
					<c:if test="${communityType=='1'}">
				    	<div class="col-sm-3">
				      		<select class="form-control" name="communitySubTitle" id="communitySubTitle">
				      			<option value="5">말머리를 선택해 주세요</option>
						  		<option value="0">도시</option>
								<option value="1">루트</option>
								<option value="2">교통</option>
								<option value="3">숙소</option>
								<option value="4">쇼핑</option>  
								<option value="5">기타</option>
							</select>
				    	</div>
				    	
					</c:if>
					<c:if test="${communityType=='1'}">
				    <div class="col-sm-9">
				    	<div class="input-group">
				    		<span class="input-group-addon">제목</span>
				      		<input type="text" class="form-control" id="communityTitle" name="communityTitle" placeholder="제목을 입력 해주세요.">
				    	</div>     
				    </div>
				    <br/>
				    </c:if>
				</div>
				
				
			<div class="form-group">
				<textarea id="summernote" name="communityContent"></textarea>		
			</div>
		<div id="cndThumbnail"></div>
		
		<div class="col-sm-6 col-sm-offset-3 text-center">		
					  	<span class="input-group-addon">썸네일 이미지</span>	    	     	    			    
					    <input  class="col-sm-8 col-sm-offset-2" type="file" id="file" name="file" value="${community.thumbnail }"/>
					     <img id="blah" style="width:300px; height:200px;"/> 
		</div>
	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center"  style="margin-top : 30px;">
		      <button type="button" name="save" class="communityButton go" id="reviewWrite">작 성</button>
			  <a class="communityButton cancel" href="#" role="button">취&nbsp;소</a>
		    </div>
	</div>
   <!-- ToolBar End /////////////////////////////////////-->
   </div>
</form>
</div>
</body>
</html>