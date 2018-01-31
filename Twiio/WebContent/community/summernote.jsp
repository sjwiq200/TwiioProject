<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
  <meta charset="UTF-8">
  <title>Summernote</title>
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
  
  <link href="summernote.css" rel="stylesheet">
  <script src="summernote.min.js"></script>
  <!-- include summernote-ko-KR -->
  <!-- <script src="lang/summernote-ko-KR.js"></script> -->
  
  <script>
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
        
        $("button[name=save]").on("click",function(){
        	$("textarea").val($("#summernote").summernote("code"));
        	$("form").attr("method" , "POST").attr("action" , "/user/summernote").submit();
        });
        
        
    });
   /*  
    function sendFile(file){
    	alert("sendfile");
    	data = new FormData();
 	    data.append("uploadFile", file);
 	    
 	   $.ajax({ // ajax를 통해 파일 업로드 처리
	        data : data,
	        type : "POST",
	        url : "/user/summernoteImage",
	        dataType :'jsonp',
	        cache : false,
	        contentType : false,
	        processData : false,
	        success : function(data) { // 처리가 성공할 경우
               // 에디터에 이미지 출력
	        	//$(editor).summernote('editor.insertImage', data.url);
	        	alert("이미지 업로드 성공");
	        }
	    });
    } */
  </script>
  
</head>
<body>
  <!-- <div id="summernote"></div> -->
  <!-- <button type="button" onclick="showContent();">작성</button>
    <div class="output"></div> -->
    <form name="form">
    <textarea id="summernote" name="content"></textarea>
    <!-- <div id="summernote"></div> -->
    <button name="save" type="button">SAVE</button>
    </form>  
</body>


</html>