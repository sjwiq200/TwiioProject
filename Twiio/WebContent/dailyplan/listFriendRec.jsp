<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang ="ko">

<head>

<% 
	String dailyPlanNo = (String) request.getParameter("data"); 
%>


 <title>친구추천</title>
 <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
 <meta charset="UTF-8">
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>

<style type="text/css">

</style>

</head>


<script type = "text/javascript" >

</script>
<body>
		<div>
			<input type="text" id="addr1" name="address" value="" />
			<span> &nbsp; </span>
			<button name="submit" value="okay" onclick='codeAddress(); return false;'>♥</button>
		</div>
		<div> &nbsp; </div>
		<div id="map"></div>
		<div id="resultMap">
				<form>
				  <input type="hidden" name="dailyPlanNo" value="<%=dailyPlanNo%>" />
				  <input type="hidden" name="mapUrl" id="mapUrl" value="기본값" />
				  <input type="hidden" name="mapAddress" id="mapAddress"value="기본값"  />
				  <input type="hidden" name="mapName" id="mapName"  value="기본값" />
				  <input type="hidden" name="mapPhone"  id="mapPhone" value="기본값" />
				  <input type="hidden" name="mapWebsite"  id="mapWebsite" value="기본값"  />
				  <input type="hidden" name="mapType" id="mapType" value=""  />
				 </form>
		</div>
		<div> &nbsp; </div>
		<button type="button" class="btn btn-default" data-dismiss="modal" name="addMapToPlan">내 플랜에 추가하기</button>

</body>
</html>