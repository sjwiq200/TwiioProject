<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html>
<head>
<title>addText</title>
<%
	String userNo = (String) request.getParameter("userNo");
	String userBirthday = (String) request.getParameter("userBirthday");
	String userName = (String) request.getParameter("userName");
	String userEmail = (String) request.getParameter("userEmail");
	String userType = (String) request.getParameter("userType");
	String userImage = (String) request.getParameter("userImage");
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

<script>

</script>

</head>

<body>
	<form name="form">
		<div class="col-sm-12">
			<div class="profile-userpic ">
				<c:if test="<%=userImage %>== null"><img style="width:150px; height:150px; alt="" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" class="img-responsive"></c:if>
				<c:if test="<%=userImage %>!= null"><img style="width:150px; height:150px; alt="" src="/resources/images/userThumbnail/<%=userImage%>" class="img-responsive"></c:if>
			</div>
		</div>
		</br>
							
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름  </label>
		    <div class="col-sm-4">
		    <input type="text" class="form-control" id="userName" name="userName" value="$<%=userName%>" readonly>
			</div>
		</div>
							
		<div class="form-group">
			<label for="email" class="col-sm-offset-1 col-sm-3 control-label">이 메 일</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="email" name="email" value="$<%=userEmail%>" readonly>
			</div>
		</div>
							  
		<div class="form-group">
		  	<label for="userBirthday" class="col-sm-offset-1 col-sm-3 control-label">생년월일 </label>
			<div class="col-sm-4">
			      <input type="text" class="form-control" id="userBirthday" name="userBirthday" value="$<%=userBirthday%>" readonly>
		    </div>
		</div>
							  
		<div class="form-group">
		  	<label for="userType" class="col-sm-offset-1 col-sm-3 control-label">유 형 </label>
			<div class="col-sm-4">
			<c:if test="<%=userType%> ==  1">
				<input type="text" class="form-control" id="userType" name="userType" value="회원" readonly>
			</c:if>
			<c:if test="<%=userType%> ==  2">
				<input type="text" class="form-control" id="userType" name="userType" value="호스트" readonly>
			</c:if>
			<c:if test="<%=userType%> ==  3">
				<input type="text" class="form-control" id="userType" name="userType" value="관리자" readonly>
			</c:if>
							      
		</div>
		</div>
	</form>
</body>


</html>