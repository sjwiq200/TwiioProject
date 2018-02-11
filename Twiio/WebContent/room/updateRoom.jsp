<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- jQuery UI toolTip 사용 CSS-->

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// add,updateRoom.css ////////////////////////// -->
	<link href="/resources/css/add,updateRoom.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="/resources/css/plan.css" />
	
	<!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= Update  Event =============
		 $(function() {
			$( "button#go" ).on("click" , function() {
				swal(" 채팅방 정보가 수정되었습니다!","","success").then((next) => {
					if(next){
						$("form").attr("method" , "POST").attr("action" , "/room/updateRoom").submit();	
					}
				});// end swal
				
			});
		});	
		
		
		//============= Cancel  Event =============
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});
		
		//============= Delete  Event =============
		$(function(){
			$("a:contains('방 삭제')").on("click",function(){
				
				swal({
					  title: "방을 삭제시키시겠습니까?",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
					    swal(" 방이 삭제 되었습니다.", {
					      icon: "success",
					    }).then((next) => {
					    		$("form").attr("method","POST").attr("action", "/room/deleteRoom").submit();
					    });
					  } 
					});//end swal
				
				
			})
		})
	</script>		
    
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<!--  화면구성 div Start /////////////////////////////////////-->
	
		
		
		<div class="container">
			<div class="jumbotron">
				<h2 align="center"><ins><strong>TwiiChat Update</strong></ins></h2>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-12">
							<div class="col-sm-10 col-sm-offset-1">
								<!-- form Start /////////////////////////////////////-->
								<form class="form-horizontal">
								
									<input type="hidden" name="roomKey" value="${room.roomKey }">
								
								  <div class="form-group">
								    <label for="roomname" class="col-sm-offset-1 col-sm-3 control-label">채팅방 이름 </label>
								    <div class="col-sm-4">
								      <input type="text" class="form-control" id="roomName" name="roomName" value="${room.roomName }">
								    </div>
								  </div>
								  
								  
								  <div class="form-group">
								    <label for="type" class="col-sm-offset-1 col-sm-3 control-label"> 말머리 </label>
								    <div class="col-sm-4" >
								      <select name="type" id="type">
									      <c:if test="${room.type == '식사' }">
									      	<option value="식사" selected="selected">식사</option>
									      	<option value="체험">체험</option>
									      	<option value="관람">관람</option>
									      	<option value="미정">미정</option>
									      </c:if>
									      <c:if test="${ room.type == '체험' }">
									      	<option value="식사">식사</option>
									      	<option value="체험" selected="selected">체험</option>
									      	<option value="관람">관람</option>
									      	<option value="미정">미정</option>
									      </c:if>
									      <c:if test="${room.type == '관람' }">
									      	<option value="식사">식사</option>
									      	<option value="체험">체험</option>
									      	<option value="관람" selected="selected">관람</option>
									      	<option value="미정">미정</option>
									      </c:if>
									      <c:if test="${room.type == '미정' }">
									      	<option value="식사" >식사</option>
									      	<option value="체험">체험</option>
									      	<option value="관람">관람</option>
									      	<option value="미정" selected="selected">미정</option>
									      </c:if>
									      <c:if test="${empty room.type}">
									      	<option value="식사" >식사</option>
									      	<option value="체험">체험</option>
									      	<option value="관람">관람</option>
									      	<option value="미정" selected="selected">미정</option>
									      </c:if>
									      
								      </select>
								    </div>
								  </div>
								  
								  <div class="form-group">
								    <label for="region" class="col-sm-offset-1 col-sm-3 control-label"> 지역 </label>
								    <div class="col-sm-4">
								      <input type="text" class="form-control" id="region" name="region" value="${room.region }">
								    </div>
								  </div>
								  
								  <div class="form-group">
								    <label for="headCount" class="col-sm-offset-1 col-sm-3 control-label"> 인원 </label>
								    <div class="col-sm-4">
								      <input type="text" class="form-control" id="headCount" name="headCount" value="${room.headCount }">
								    </div>
								  </div>
								  
								  <div class="form-group">
								    <label for="date" class="col-sm-offset-1 col-sm-3 control-label"> 날짜 </label>
								    <div class="col-sm-4">
								      <input type="date" class="form-control" id="date" name="date" value="${room.date}">
								    </div>
								  </div>
								  
								  
								  
								  <div class="form-group">
								    <div class="col-sm-offset-4  col-sm-4 text-center">
								      <button type="button" class="btn btn-outlined btn-light btn-sm" id="go" >수 &nbsp;정</button>
									  <a class="btn btn-outlined btn-theme btn-sm" href="#" role="button">취&nbsp;소</a>
									  <a class="btn btn-outlined btn-theme btn-sm" role="button">방 삭제</a>
								    </div>
								  </div>
								</form>
								<!-- form Start /////////////////////////////////////-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>