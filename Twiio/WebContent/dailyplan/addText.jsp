<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html>
<head>
<title>addText</title>
<%
	String dailyPlanNo = (String) request.getParameter("data");
	String mainPlanNo = (String) request.getParameter("mainPlanNo");
%>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="UTF-8">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

<link href="summernote.css" rel="stylesheet">
<script src="summernote.min.js"></script>

<script>
	var content;
	$(function() {

		$('#summernote')
				.summernote(
						{
							 toolbar: [
					    		    ['style', ['bold', 'italic', 'underline']],
					    		    ['fontsize', ['fontsize']],
					    		    ['para', ['ul', 'ol', 'paragraph']],
					    		    ['insert', ['table']],
					    		  ],
							lang : 'ko-KR',
							height : 400,
							width : 400,
							minHeight : null,
							maxHeight : null,
							focus : true,
							placeholder : '여행지에서 필요한 물품/비행기 번호/여권번호/숙소전화번호/맛집전화번호 등의 정보를 적어보세요!'
						});

		$("input[type='submit']").on("click",
				function() {
					content = $("#summernote").val();
					alert(content);
					$("#textContents").val(content);
					$("form").attr("method", "POST").attr("action",
							"/dailyplan/addText").submit();
				});
	});
</script>

</head>

<body>


	<form name="form">
		<textarea id="summernote" name="contentText"></textarea>
		<input type="hidden" name="dailyPlanNo" value="<%=dailyPlanNo%>" />

		<input type="hidden" name="mainPlanNo" value="<%=mainPlanNo%>" />
		<input type="hidden" name="textContents" id="textContents" />

		<input type="hidden" name="textContents" id="textContents" style="padding-top : 50px;" />
		<div align="center" >
		<input type="submit" class="btn btn-primary btn-sm" value="ADD" />
		</div>

	</form>
</body>


</html>