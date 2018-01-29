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
        	placeholder: '���������� �ʿ��� ��ǰ/����� ��ȣ/���ǹ�ȣ/������ȭ��ȣ/������ȭ��ȣ ���� ������ �������!'
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
    <!--  jsp include parameter�� ���� ���޹��� ���� ����ϱ� ���� �Ʒ��� ���� �����߽��ϴ�. -->
    <input type="hidden" name="dailyPlanNo" value="<%=dailyPlanNo%>" />
    <button name="save" type="button">ADD</button>
    </form>  
</body>


</html>