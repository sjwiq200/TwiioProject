<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">


<head>

<% String dailyPlanNo = (String) request.getParameter("data");  %>

  <meta charset="UTF-8">
  <title>addText</title>
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
  
  <link href="summernote.css" rel="stylesheet">
  <script src="summernote.min.js"></script>
  
  <script>
    $(function() {
    	
        $('#summernote').summernote({
        	 toolbar: [
        		    ['style', [ 'bold', 'underline']],
        		  ],
        	lang: 'ko-KR', 
        	height: 400,                
        	width: 400,
        	minHeight: null,             
        	maxHeight: null,             
        	focus: true,                 
        	placeholder: '여행지에서 필요한 물품/비행기 번호/여권번호/숙소전화번호/맛집전화번호 등의 정보를 적어보세요!'
        });
        
        $("button[name=save]").on("click",function(){
        	$("textarea").val($("#summernote").summernote("code"));
        	$("form").attr("method" , "POST").attr("action" , "/dailyplan/addText").submit();
        });
    });
 
  </script>
  
</head>

<body>

  	
    <form name="form">
    <textarea id="summernote" name="content"></textarea>
    <!--  jsp include parameter를 통해 전달받은 값을 사용하기 위해 아래와 같이 선언했습니다. -->
    <input type="hidden" name="dailyPlanNo" value="<%=dailyPlanNo%>" />
    <button name="save" type="button">ADD</button>
    </form>  
</body>


</html>