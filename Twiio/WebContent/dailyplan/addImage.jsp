<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">

<head>

<%
	String dailyPlanNo = (String) request.getParameter("data");
%>

<meta charset="UTF-8">
<title>addText</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<script>
	$(function() {
		$("#uploadFile").on('change', function() {
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
			alert(e.target.result);
		}
	}

	$(function() {

		$("button[name=add]").on(
				"click",
				function() {
					$("form").attr("method", "POST").attr("action",
							"/dailyplan/addImage").submit();
				});

		$("button[name=add]").on(
				"click",
				function() {
					$("form").attr("method", "POST").attr("action",
							"/dailyplan/addImage").submit();
				});
	});
</script>

</head>

<body>


	<form name="form" enctype="multipart/form-data">

		<div class="form-group">
			<label for="uploadFile" class="col-sm-2 control-label">상품이미지
			</label>
			<div class="col-sm-6">
				<input type="file" name="uploadFile" class="ct_input_g"
					style="width: 200px; height: 19px" maxLength="13" id="uploadFile" />
				<img id="blah" />
			</div>
		</div>

		<input type="hidden" name="dailyPlanNo" value="<%=dailyPlanNo%>" />
		<button name="add" type="button">ADD</button>

	</form>

</body>







</html>
