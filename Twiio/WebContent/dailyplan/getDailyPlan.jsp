<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 다이얼로그  -->

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>



<!--  구글  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    
<title>MainPlanList</title>

<style>

#mainBody {
    padding-top : 100px;
}


</style>

<script type="text/javascript">

	
	$(function() {
		$("#uploadFile").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#addImageContent"').attr('src', e.target.result).attr('width', '300px');
			}
			reader.readAsDataURL(input.files[0]);
			alert(e.target.result);
		}
	}

	$(function() {
		$("button[name=add]").on("click",function() {
					$("form").attr("method", "POST").attr("action",	"/dailyplan/addImage").submit();
				});
	});
	
	$(function() {
	
		$("#friendRecButton").bind("click",function() {
			var dailyPlanNo = "${dailyPlan.dailyPlanNo}";
			var user;
			var result ="";

			 $.ajax({
	    				url:"/dailyplan/json/listFriendRec?dailyPlanNo="+dailyPlanNo,
	    				method:"GET",	    					
	    				dataType:"json",
	    				headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
	    				success:function(JSONData){
	    					user = JSONData.userList;
		    					for(var i=0;i<user.length;i++){
		    						result +='<p> [USER NO] : '+user[i].userNo+ '</p>'
		    								+'<span>  [아이디] : '+user[i].userId+'</span>'
		    								+'<span>  [이름] : '+user[i].userName+'</span>'
		    								+'<span>  [성별] : '+user[i].userGender+'</span>'
		    								+'<span>  [사진] : '+user[i].userImage+'</span>'
		    								+'<span>&nbsp;</span>'
		    								+'<button type="button" id="addToMyFriendList'+i+'" class="btn btn-success btn-sm" onclick="addFriend('+user[i].userNo+','+i+')">친구추가</button><p>&nbsp;</p>';
		    					}
		    				 $('#friendListForRec').html(result);
		    				 $('#friendRec').modal('show'); 
	    					}
			    });
		});
	 });
	 
	function addFriend(userNo,i) {

		$.ajax({
            url:'/dailyplan/json/addFriend?userNo='+userNo,
            type:'get'
         });
	    
	   var a = "#addToMyFriendList" + i;
	    $("#addToMyFriendList"+i).remove(); 
	    
	}
	
	</script>
	

	
</head>
<body id="mainBody">


	<jsp:include page="/layout/toolbar.jsp" />
	<form class="form-horizontal">

		<div class="container">
			
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<div align="center">
			<input type="button" id="friendRecButton"  name="friendRecButton" class="btn btn-primary" value="같이 갈 친구가 필요한가요?"/>
			 <!-- data-toggle="modal" data-target="#friendRec"  -->
			</div>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			
			<div align="center">
				<h1>DAY :<strong>${dailyPlan.day}</strong></h1>
				<h4>DailyDate : ${dailyPlan.dailyDate}</h4>
				<h4>DailyCity : ${dailyPlan.dailyCity}	</h4> 
			</div>
			
			<div class="PlanContentList" align="center">

				<c:set var="i" value="0" />
				<c:forEach var="planContent" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<input type="hidden" name="planContentNo" value="${planContentNo}" />
					<div>
						<h7> ㅡ </h7>
						<div>콘텐츠 번호 : ${planContent.contentNo}</div>
						<div>데일리플랜번호 : ${dailyPlan.dailyPlanNo}</div>
						<div>콘텐츠타입 : ${planContent.contentType}</div>
						
						<c:if test="${!empty planContent.orderNo}">
							<div>순서 : ${planContent.orderNo}</div>
						</c:if>
						
						<c:if test="${!empty scrap.scrapNo }">
							<div>스크랩번호 : ${scrap.scrapNo }</div>
						</c:if>
						
						<c:if test="${!empty planContent.route}">
							<div>루트 : ${planContent.route}</div>
						</c:if>
						
						<c:if test="${!empty planContent.departureLocation}">
							<div>출발지 : ${planContent.departureLocation}</div>
						</c:if>

						<c:if test="${!empty planContent.arrivalLocation}">
							<div>도착지 : ${planContent.arrivalLocation}</div>
						</c:if>

						<c:if test="${!empty planContent.estimatedTime}">
							<div>소요시간 : ${planContent.estimatedTime}</div>
						</c:if>

						<c:if test="${!empty planContent.routeType}">
							<div>이동방법 : ${planContent.routeType}</div>
						</c:if>

						<c:if test="${!empty planContent.routeDescription}">
							<div>길찾기결과 : ${planContent.routeDescription}</div>
						</c:if>
						
						
						<c:if test="${!empty planContent.mapImage}">
							<div><Strong> Your Map Information</Strong></div>
							<div> <img src ="${planContent.mapImage}" width="350px" onclick="javascript:location.href='${planContent.mapUrl}';"/></div>
						</c:if>
						
						
						<c:if test="${!empty planContent.mapName}">
							<div>${planContent.mapName} </div>
						</c:if>
						
						<c:if test="${!empty planContent.mapUrl}">
							<div>지도 URL : ${planContent.mapUrl}</div>
						</c:if>
						
						<c:if test="${!empty planContent.mapAddress}">
							<div>지도 주소 : ${planContent.mapAddress}</div>
						</c:if>
						
						<c:if test="${!empty planContent.mapPhone}">
							<div>PHONE : ${planContent.mapPhone}</div>
						</c:if>
						
						<c:if test="${!empty planContent.mapWebsite}">
							<div>웹사이트 : ${planContent.mapWebsite}</div>
						</c:if>
						
						<c:if test="${!empty planContent.mapType}">
							<div>지도유형 : ${planContent.mapType}</div>
						</c:if>
						
						<c:if test="${!empty planContent.contentText}">
							<div>텍스트 : ${planContent.contentText}</div>
						</c:if>
						
						<c:if test="${!empty planContent.contentImage}">
							<div>이미지 : </div>
							<div><img src="/resources/images/dailyPlanContent/${planContent.contentImage}" width="300px" /></div>
						</c:if>

						<div>&nbsp;</div>
						<div>&nbsp;</div>
					</div>

				</c:forEach>

				<img src="/resources/images/icon/plan/daily-plan-content-plus-icon.jpeg" height="40" width="40" id="plus" />
	</form>

	<div>

		
		<span><button type="button" class="btn" data-toggle="modal" data-target="#addText">글씨쓰기</button></span>
		 <span><button type="button" class="btn" data-toggle="modal" data-target="#addImage">사진추가</button> </span> 
		<span><button type="button" class="btn" data-toggle="modal" data-target="#addMap" name="addMapIcon">지도</button></span>
		<span><button type="button" class="btn" data-toggle="modal" data-target="#addRoute">길찾기</button> </span>

		<!---------- Map Dialog ------------->
		<div class="modal fade" id="addMap"  role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<Strong>M A P</Strong>
						</h4>
						<h7 class="modal-title">TWIIO</h7>
					</div>
					<div class="modal-body">
						<jsp:include page="/dailyplan/addMap.jsp" flush="false">
							<jsp:param name="data" value="${dailyPlan.dailyPlanNo}" />
						</jsp:include>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!---------- Text Dialog ------------->
		<div class="modal fade" id="addText" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<Strong>T E X T</Strong>
						</h4>
						<h7 class="modal-title">TWIIO</h7>
					</div>
					<div class="modal-body">
						<jsp:include page="/dailyplan/addText.jsp" flush="true">
							<jsp:param name="data" value="${dailyPlan.dailyPlanNo}" />
						</jsp:include>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!---------- Image Dialog ------------->
	
	<div>

		<div class="modal fade" id="addImage" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<Strong>Image</Strong>
						</h4>
						<h7 class="modal-title">TWIIO</h7>
					</div>

					<div class="modal-body">
					
						<form name="form" enctype="multipart/form-data">
							<div class="form-group">
								<label for="uploadFile" class="col-sm-4 control-label">상품이미지
								</label>
								
								<div class="col-sm-6">
									<input type="file" name="uploadFile" class="ct_input_g"
										style="width: 300px; height: 30px" maxLength="20"
										id="uploadFile" /> <img id="addImageContent" />
								</div>
							</div>
							<input type="hidden" name="dailyPlanNo"
								value="${dailyPlan.dailyPlanNo}" />
							<button name="add" type="button">ADD</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- ---------------------------------------------------------------- -->
		
		<!---------- FriendRec Dialog ------------->
	
	<div>

		<div class="modal fade" id="friendRec" role="dialog">
			<div class="modal-dialog modal-md">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<Strong>나와 같은 곳, 같은 날짜에 가는 여행자</Strong>
						</h4>
						<h7 class="modal-title">TWIIO</h7>
					</div>

					<div class="modal-body" align="center">
						
						<div id="friendListForRec" > </div>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		


</body>



</html>
