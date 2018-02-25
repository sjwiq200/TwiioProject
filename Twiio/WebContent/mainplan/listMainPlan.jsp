<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>listMainPlan</title>

<meta charset="UTF-8">
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/plan-listMainPlan.css" />


<!-- 캘린더 2 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


<!-- ///////////////////////////////////////////////////////////////////////// -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bttn.css/0.2.4/bttn.min.css">
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

<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">

<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



<!-- ---------Floating Button------------ -->
 <link href="/resources/css/floatingButton.css" rel="stylesheet" type="text/css" />
 
  <!--  ///////////////////////// CSS ////////////////////////// -->
<link rel="stylesheet" href="/resources/css/font.css" />

<title>MainPlanList</title>


<style>
html, body {
	width: 100%;
	height: 100%;
	background: #f4f4f4;
}

#header .inner {
	margin-top: 150px;
	text-align: center;
	width: 100%;
	height: 100%;
}

#floating-button{
	opacity: 0.6;
}


#thumbnailMainBox {
	min-height: 1500px;
	background: linear-gradient(-45deg, #56B1BF, transparent),
		linear-gradient(45deg, #D73A31, transparent);
	border-radius: 8px;
	border-color:#000000;
	border-width:10px;
	display: inline-block;
	padding: 1px;
	text-decoration: none;
}

#thumbnailMainThumbBox {
	min-height: 1500px;
	background: #fff;
	display: inline-block;
	border-radius: 6px;
}

.textArea {
	 margin-top: 80px;
	 border-bottom: solid 1px #000000; 
}

.thumbnailClass{
	margin-top: 20px;
	margin-bottom: 20px;
	text-align: center;
}

#buttonBox {
	margin-top: 40px;
	margin-top: 40px;
}

.mainBackImage {
	background-image: url("/resources/images/dailyPlanContent/daum_gallery_photo_20160913155706.jpg");
	opacity: 0.3;
}

/* //////////////////eunae_modal////////////////////////// */
		.content h1 {
			text-align: center;
		}
		.panel {
			border: 1px solid #ddd;
			background-color: #fcfcfc;
		}
		.table-filter {
			background-color: #fff;
			font-size: 15px;
		}
		.table-filter tbody tr:hover {
			cursor: pointer;
		}
		.table-filter tbody tr td {
			padding: 10px;
			vertical-align: middle;
			border-top-color: #FFF;
		}
		.table-filter tbody tr.selected td {
			background-color: #eee;
		}
		.table-filter tr td:first-child {
			width: 60px;
		}
		.media-photo{
		  float: none;
		  margin: 0 auto;
		  -webkit-border-radius: 50% !important;
		  -moz-border-radius: 50% !important;
		  border-radius: 50% !important;
		  border: 1px solid;
		}

#thumbnail:hover {
	background-color:rgba(192,192,192,0.2);
}

#floating-button:hover {
	background-color:#D73A31;
	color: black;
}

/*Modal Autocomplete Function */
.ui-autocomplete {
position: absolute;
z-index: 2150000000 !important;
cursor: default;
border: 2px solid #ccc;
padding: 5px 0;
border-radius: 2px;
}


/* Button-dy css  */
.btn-dy {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 23px;
  font-family:TYPO_JEONGJOL;
  color: #545454;
  font-size: 16px;
  background: #ffffff;
  padding: 12px 25px 12px 25px;
  border: solid #545454 0.5px;
  text-decoration: none;
}

.btn-dy:hover {
  background: #ededed;
  text-decoration: none;
  color:#545454;
}

/* ///////share button//////// */
.btn-dy1 {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 23px;
  font-family:JEJUGOTHIC;
  color: #545454;
  font-size: 12px;
  background: #ffffff;
  padding: 8px 13px 8px 13px;
  border: solid #545454 0.5px;
  text-decoration: none;
}

.btn-dy1:hover {
  background: #D73A31;
  opacity: 0.8;
  border: solid #545454 0px;
  text-decoration: none;
  color:#ffffff;
}

/* ///////mainPlan button//////// */
/* Button-dy css - listFriendRecommendation */
.btn-dy2 {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 23px;
  font-family:JEJUGOTHIC;
  color: #545454;
  font-size: 12px;
  background: #ffffff;
  padding: 8px 13px 8px 13px;
  border: solid #545454 0.5px;
  text-decoration: none;
}

.btn-dy2:hover {
  background: #D73A31;
  opacity: 0.8;
  border: solid #545454 0px;
  text-decoration: none;
  color:#ffffff;
}

</style>
<script>

</script>

<script>

	
	 $(function() {
			$("input[name='updateButton']").bind("click",function() {
				var index = $("input[name='updateButton']").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/mainplan/updateMainPlanView?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			});
	 });
	 
	 
	 $(function() {
			$("input[name='deleteButton']").bind("click",function() {
				var index = $("input[name='deleteButton']").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/mainplan/deleteMainPlan?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			});
	 })
	 
	 
	  $(function() {
			$(".select").bind("click",function() {
				var index = $(".select").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/dailyplan/getDailyPlanFromMain?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			});
	 })
	 
 
	 $(function(){
		 $("#listSharedPlan").bind("click",function(){
			 var url = "/mainplan/listSharedPlan";
			 $(location).attr('href', url);
		 })
	 })
	 
	 $(function(){
		 $("#addMain").bind("click",function(){
			 $('#addMainModal').appendTo("body").modal('show');
		 })
	 })
	  
	

	 /////////////////////////친구와 공유하기 기능///////////////////////////
	$(function() {
		
		$("input[name='shareButton']").bind("click",function() {
			var index = $("input[name='shareButton']").index(this);
			var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
			
			var friend;
			var result ="";

			 $.ajax({
	    				url:"/dailyplan/json/listFriend?mainPlanNo="+mainPlanNo,
	    				method:"GET",	    					
	    				dataType:"json",
	    				headers : {
								"Accept" : "application/json", 
								"Content-Type" : "application/json"
							},
							success:function(JSONData){
		    					friend = JSONData.friendInfo;
			    					
			    					for(var i=0;i<friend.length;i++){
			    						
			    						result +='<div class="col-sm-3 col-sm-offset-1" ><img src="/resources/images/userimages/'+friend[i].userImage+'" style="width: 50px; height: 50px;" class="media-photo"></div>'+
			    									'<div class="col-sm-5 "  style="padding-top: 8px;" >'+friend[i].userName+'</div>'+
			    									'<input type="button" id="sharePlan'+i+'" class="btn-dy1" onclick="sharePlan('+friend[i].userNo+','+i+','+mainPlanNo+')" value="공유하기"><p>&nbsp;</p>';
			    					}
			    					
			    					
			    				 $('#shareWithFriendList').html(result);
			    				 $('#shareWithFriend').modal('show');  
		    					}
				    });
			});
		
		
		 });
	 
	function sharePlan(userNo,i,mainPlanNo) {
			$.ajax({
	            url:'/dailyplan/json/sharePlan?userNo='+userNo+"&mainPlanNo="+mainPlanNo,
	            type:'get'
	         });
			swal("친구로 등록되었습니다.");
	   var a = "#sharePlan" + i;
	    $("#sharePlan"+i).attr("disabled","disabled");
	    $("#sharePlan"+i).attr("style","background-color:gray;");
	}
	
	
</script>

<!-- /////////////addMainPaln <START> ////////////// -->

<script>
	function fncAddMainPlan() {
		var planTitle = $("#planTitle").val();
		var mainThumbnail = $("#mainThumbnail").val();
		var datepicker1 = $("#datepicker1").val();
		var datepicker2 = $("#datepicker2").val();
		//alert(mainThumbnail);
		var flag = true;

		if (planTitle == "") {
			flag = false;
		}
		if (mainThumbnail == "") {
			flag = false;
		}
		if (datepicker1 == "") {
			flag = false;
		}
		if (datepicker2 == "") {
			flag = false;
		}

		var addPlan = "";

		$("input[name='countryList']")
				.each(
						function(index) {

							if ($($("input[name='countryList']")[index]).val() == "") {
								flag = false;
							} else {
								addPlan += '<input type="hidden" name="countryList" value="'
										+ $(
												$("input[name='countryList']")[index])
												.val() + '">';
							}
						});

	
	}

	$(function() {
		$("#submit").on("click",function() {
			
			if( ($("#mainThumbnail").val()!="") && ($("#datepicker2").val()!="") && ($("#datepicker1").val()!="") && ($("#planTitle").val()!="") && ($("#country1").val()!="") ){
				$("form[name='addMainForm']").attr("method", "POST").attr("action","/mainplan/addMainPlan").attr("enctype","multipart/form-data").submit();				
			}else{
				swal("모든 값을 입력해주셔야 합니다.");
			}
				});
	});

	//AutoComplete///////////////////

	$(function() {
		$("#city1").autocomplete({
			source : function(request, response) {
				$.ajax({
					url : "/information/json/cityAutoComplete/",
					method : "POST",
					data : {
						keyword : $("#city1").val()
					},
					dataType : "json",
					success : function(JSONData) {
						response($.map(JSONData, function(item) {
							return item;
						}));
					}
				});
			},
			minLength : 3
		});
	});

	$(document).ready(function() {$("input[name='countryList']").each(function(index) {
											//alert(index);
											$($("input[name='countryList']")[index]).autocomplete(
															{
																source : function(request,response) {

																	$.ajax({
																				url : "/information/json/countryAutoComplete/",
																				method : "POST",
																				data : {
																					keyword : $($("input[name='countryList']")[index]).val()
																				},
																				dataType : "json",
																				success : function(JSONData) {

																					response($.map(JSONData,function(item) {
																										return item;
																									}));
																				}
																			});
																}
															});
										});

					});

	/////////////////////////////////

	$(function() {
		$("#datepicker1").flatpickr({
			altInput : true,
			altFormat : "F j, Y",
			dateFormat : "Y-m-d",
		});
	});

	$(function() {
		$("#datepicker2").flatpickr({
			altInput : true,
			altFormat : "F j, Y",
			dateFormat : "Y-m-d",
		});

	});

	$(function() {
		$("#planTitle").on("change", function() {
			fncAddMainPlan();
		});

		$("input[name='countryList']").on("change", function() {
			fncAddMainPlan();
		});

		$("#mainThumbnail").on("change", function() {
			fncAddMainPlan();
		});

		$("#datepicker1").on("change", function() {
			fncAddMainPlan();
		});

		$("#datepicker2").change(function() {
			var start = $("#datepicker1").val();
			var end = $("#datepicker2").val();
			if (start > end) {
				swal("도착일이 출발일보다 빠를 수 없습니다. \n재입력 부탁드립니다.");
			} else {
				fncAddMainPlan();
			}
		});
	});

	////////////////////////////////////////////addcountry////
	var i = 1;
	$(function() {

		$("#addCountry")
				.on("click",function() {
							i++;
							if (i == 2) {$("#removeCountry").attr("disabled", false);}
							if (i > 19) {$("#addCountry").attr("disabled", true);}

							$("div[name=addCountry]").append($('<input  type="text" id="country'+i+'" name="countryList" style="position: absoloute" class="form-control input-md contents" >'));
							$(document).find("input[name='countryList']").removeClass('ui-autocomplete-input')
									.each(function(index) {
										$($("input[name='countryList']")[index]).autocomplete(	{source : function(request,response) {
																					$.ajax({
																					url : "/information/json/countryAutoComplete/",
																					method : "POST",
																					data : {keyword : $($("input[name='countryList']")[index]).val()
																					},
																					dataType : "json",
																					success : function(JSONData) {

																						response(
																								$.map(JSONData,function(item) {

																											return item;
																										}));
																					}
																				});
																	}
																});
											});
						});

		$(function() {

			$("#removeCountry").on("click", function() {
				if (i > 2) {
					$("#addTripDate").attr("disabled", false);
					$('#country' + i).remove();
					i--;
				} else if (i == 2) {
					$("#removeCountry").attr("disabled", true);
					$('#country' + i).remove();
					i--;
				}

			});
		});
	});

	$(function() {
		$("#mainThumbnail").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result).attr('width', '100px').attr("style","border-radius : 25px").attr('height', '100px');
				$('#photoButton').remove();
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	$(function(){
		$("#fileUpload").on("click",function(){
			$('#mainThumbnail').click();
		});
	});
	
	$(function(){
		$(".form-control").keydown(function(e) {
			if (e.keyCode == 13) {
				 return false;
			}
		});
						
		$("document").on("keydown",".form-control", function(e) {  
			if (e.keyCode == 13) {
				 return false;
			}
		});

	});
</script>


<!-- /////////////addMainPaln <END> ////////////// -->


</head>
<body>
		<jsp:include page="/layout/toolbar.jsp" />
	<form>
		
		<div class="container">
			
			
			
			<header id="header" class="alt">
				<div class="row">
					<div class="col-xs-10 inner">
						<p style="font-family:Pacifico;" align="center">TWIIBOOK,</p>
					</div>
				</div>
					<p style="font-family:TYPO_JEONGJOL;font-size: 1.5em;	margin-bottom: 70px;" align="center">여행을 맞이하는, 설렘부터  </p>
			</header>
			
			
				<div class="row" style="font-family:'TYPO_JEONGJOL';">
							<div  class="col-md-offset-4 col-md-4" align="center">
								<button type="button" class="btn" id="listSharedPlan">
									<Strong>친구와 공유하고 있는 트위북보기</Strong>
								</button>
							</div>
				</div>
					
			<div class="row" style="font-family:'TYPO_JEONGJOL';">
				<div  class="col-xs-12 inner" id="thumbnailMainBox">
				  <div align="center" class="col-xs-1">&nbsp;</div> <!-- 그라디언트 보이게 해주려고 한 부분 -->
					<div class="col-xs-12 inner" id="thumbnailMainThumbBox">

						<c:set var="i" value="0" />
						<c:forEach var="mainPlan" items="${list}">
							<c:set var="i" value="${ i+1 }" />

							<div class="col" id="check" >
								<div class="col-md-12">
									<div id="thumbnail">
										<div class="caption" >
										
										 <div class="row">
										 	<div class="col-md-1" ></div>
											   <div class="col-md-4 thumbnailClass" style="width: 400px; height: 250px; overflow: hidden">
												<img src="/resources/images/thumbnail_plan/${mainPlan.mainThumbnail}" style="width: 300px; height: 250px; display: block;border-radius: 2%;" class="img-responsive" alt="Responsive image"/> 
											   </div>
											   
												<input type="hidden" name="mainPlanNo" value="${mainPlan.mainPlanNo}" /> 
												<div class="col-md-6 textArea">
													<div class="col-md-10 select">
													<h2> ${mainPlan.planTitle}</h2>
													<div style="font-family:'JEJUGOTHIC'">
													<p> ${mainPlan.departureDate } ~ ${mainPlan.arrivalDate}</p>
													<p><Strong>나라</Strong> ${mainPlan.country}</p>
													<p><Strong>도시</Strong> ${mainPlan.city}</p>
													</div>
													</div>
													<div class="col-md-2" align="center" style="margin-top: 35px; font-family:'JEJUGOTHIC'">
													<input type="button" class="btn-dy2" name="shareButton" id="shareButton"  value="공유" style="margin-bottom:5px;font-family:\'JEJUGOTHIC\';"/>
													<input type="button" class="btn-dy2" name="updateButton" id="updateButton" value="수정" style="margin-bottom:5px;font-family:\'JEJUGOTHIC\';"/>
													<input type="button" class="btn-dy2" name="deleteButton" id="deleteButton"  value="삭제" style="margin-bottom:5px; font-family:\'JEJUGOTHIC\';"/>
												
													</div>
												</div>
											
												<div class="col-md-1" id="buttonBox" align="right">
												</div>
											</div> <!--  row 끝 -->
											
										</div>
									</div>
								</div>
							</div>

						</c:forEach>
						
						

						<!--  Floating Button <START> -->
						<div id="container-floating">
							<div id="floating-button" data-toggle="tooltip"
								data-placement="center" data-original-title="Create">
								<p class="letter" id="addMain"
									style="margin-top: 5px; font-family: 'TYPO_JEONGJOL'; font-size: 20px;">Write</p>
							</div>
						</div>
						<!--  Floating Button <END> -->
						
						
					</div>
					<div align="right" class="col-xs-1">&nbsp;</div>
				</div><!-- 섬네일 전체 박스 부분 -->
		</div>




	</form>



</body>

<!---------- ShareWithFriend Dialog <START>------------->

		<div class="modal fade" id="shareWithFriend" role="dialog" style="font-family: 'Jeju Gothic', serif;">
			<div class="modal-dialog modal-md">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="background-image: url('/resources/images/dailyPlanContent/friendsShare.jpg');">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" align="center" style="font-family: 'TYPO_JEONGJOL';margin-top:50px; margin-bottom:50px; color:#ffffff;">
							<Strong>나의 플랜 북을 친구들과 공유할까요?</Strong>
						</h4>
					</div>
					<div class="modal-body col-sm-12" align="center" style="padding-top: 10px;">
							<table class="table table-filter" style="align-content: center;">
								<tbody>
										<tr data-status="pagado">
										<div class="media-body">
										  <td align="left" vailgn="middle">
											  <div class="row" >
											  	<div id="shareWithFriendList"></div>
											  </div>
										 	 </td>
										  </div>
										</tr>
								</tbody>
							</table>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<!---------- ShareWithFriend Dialog <END>------------->


		<!---------------- addMainPlan Dialog <START> -->
		<div id="addMainModal" class="modal fade" role="dialog" style="background-color: transparent;" >
			<div class="modal-dialog" align="center" style="background-color: black;">
				
					
				<!-- Modal content-->
			<!-- 	<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Design your twiiBook</h4>
					</div>
					<div class="modal-body">-->
						<form name="addMainForm">
				
							<div class="col-sm-12 form-group center-block contentsList" style="font-family: 'TYPO_JEONGJOL';
/*  							background: linear-gradient(-45deg, #56B1BF, transparent),linear-gradient(45deg, #D73A31, transparent);
 */ 							background-color: #ffffff;
 							border-radius: 3% !important; 
 							border: 1px dashed #3B3B3B;
 							color: #3B3B3B !important;">
								<div style="font-size:1.5em;font-family:Pacifico; margin-top:50px;margin-bottom:20px;color:#D73A31; opacity:0.8;">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h1 class="modal-title">
									<strong>Design your TwiiBook</strong>
									</h1>
								</div>
								<div style="font-size:1.5em;margin-bottom:50px;font-family:TYPO_JEONGJOL;color:#3B3B3B; opacity:0.8;">당신의 트위북을 만들어보세요</div>
								<div class="col-sm-2"></div>
								<div class="col-sm-8">
								<div name="addThumbnail">
									<label for="mainThumbnail" class="col-sm-12 control-label">표지</label> <div id="fileUpload" name="fileUpload"><img id="blah" /> 
									<img src="/resources/images/icon/plan/imageInput.png" id="photoButton" width="20px" style="position: absoloute">
									</div>
<!-- 									<input type="button" class="form-control contents" style="position: absoloute" id="fileUpload" name="fileUpload">
 -->									<p>&nbsp;</p>
								</div>
				
								<input type="file" class="col-sm-offset-3 form-control contents" id="mainThumbnail" name="file" style="display: none;">
				
				
								<div name="planer">
									<label for="planTitle" class="col-md-12 control-label">제목</label> 
									<input type="text" class="form-control contents" style="position: absoloute" id="planTitle" name="planTitle" placeholder="Your book title">
									<p>&nbsp;</p>
				
									<div name="addCountry">
										<label class="control-label" for="textinput">국가</label> 
										<a class="btn btn-default btn" href="#" role="button" id="addCountry" name="addCountry">
										<span class="glyphicon glyphicon-plus" aria-hidden="true" style="color: #A6A0A5;"></span></a> 
										<a class="btn btn-default btn" href="#" role="button" id="removeCountry" name="removeCountry" disabled="true">
										<span class="glyphicon glyphicon-minus" aria-hidden="true" style="color: #A6A0A5;"></span></a> 
										<input type="text" id="country1" name="countryList"
											style="position: absoloute" placeholder=""
											class="form-control input-md contents">
										<div class="btn-group"></div>
									</div>
									<p>&nbsp;</p>
									<label for="departureDate" class="col-sm-12 control-label ">출발일</label> 
									<input type="text" class="form-control contents" id="datepicker1" name="departureDate" placeholder="Your departure date">
									<p>&nbsp;</p>
				
									<label for="arrivalDate" class="col-sm-12 control-label">도착일</label>
									<input type="text" class="form-control contents" id="datepicker2"
										name="arrivalDate" placeholder="Your arrival date">
									<p>&nbsp;</p>
									
									<!-- <input type="submit" class="btn-1" id="submit" style="margin-bottom:50px;"value="완성"> -->
									<div style="margin-bottom:50px;">
									<a class="btn-dy" style="margin-bottom:50px;" id="submit">여행을 시작할까요?</a>
									</div>
									
								</div>
								</div>
								<div class="col-sm-2"></div>
							</div>
							
						</form>
					</div>
				<!-- 	<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div> -->
		
			</div>

		
		<!------------------- addMainPlan Dialog <END> -->



</html>