<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<head>
<title>updateMainPlan</title>
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- 캘린더 2 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


<link rel="stylesheet" href="/resources/css/plan.css" />
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
   
   
<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>

 html, body {
	width: auto;
	height: auto;
	background: linear-gradient(-45deg, #56B1BF, transparent),
		linear-gradient(45deg, #D73A31, transparent);
	background-blend-mode: sreen;
}

body {
	color: #fff;
	text-align: center;
} 

.inner {
	text-shadow: 0 5px 5px rgba(0, 0, 0, .5);
}

<site-wrapper>
.site-wrapper {
	display: table;
	width: 100%;
	height: 100%;
	min-height: 100%;
}

.site-wrapper-inner {
	display: table-cell;
	vertical-align: top;
}

.cover-container {
	margin-right: 600px;
	margin-left: 600px;
}

.addMianPlanTitle {
	margin-right: 600px;
	margin-left: 600px;
}

.contents {
	border: none;
	padding: 10px 0 10px 0;
	background-color: rgba(255, 255, 255, 0) !important;
	background: rgba(255, 255, 255, 0);
	color: #fff;
	font-size: 16px;
	border-bottom: 1px dotted #fff;
	border-radius: 0;
	box-shadow: none !important;
	height: auto;
}

.contentsList{
	font-family: 'NANUMSQUAREROUNDB';
	width: 300px;
}

</style>

<script>
		function fncUpdateMainPlanList() {
			var planTitle =  $("#planTitle").val();	
			//var mainThumbnail = $("#mainThumbnail").val();
			var datepicker1 = $("#datepicker1").val();
			var datepicker2 = $("#datepicker2").val();
			
			var flag = true;
			
			if (planTitle == "" ) {			
				flag = false;
			} 		
			/* if (mainThumbnail == "" ) {			
				flag = false;
			} 	 */	
			if (datepicker1 == "" ) {			
				flag = false;
			} 
			if (datepicker2 == "" ) {			
				flag = false;
			}
			
			var addPlan="";
			
			$("input[name='countryList']").each(function (index) {
							
				if($($("input[name='countryList']")[index]).val() == "" ){
					flag = false;
				}else{
					addPlan += '<input type="hidden" name="countryList" value="'+$($("input[name='countryList']")[index]).val()+'">';
				}
			});
					
			
			if(flag){				
				
				$("form").attr("method", "POST").attr("action",
				"/mainplan/updateMainPlan").attr("enctype", "multipart/form-data").submit();
				
			}
						
		}
		

		$(function() {
			$("#submit").on(
					"click",
					function() {
						fncUpdateMainPlanList();
						
					});
		});
/////////////////////////////////////////////AutoComplete///////////////////

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

	$(document).ready(function() {
		$("input[name='countryList']").each(function (index) {
			//alert(index);
			$($("input[name='countryList']")[index]).autocomplete({
				source : function(request, response) {
					
					$.ajax({
						url : "/information/json/countryAutoComplete/",
						method : "POST",
						data : {
							keyword : $($("input[name='countryList']")[index]).val()
						},
						dataType : "json",
						success : function(JSONData) {

							response($.map(JSONData, function(item) {

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
	
	 $( "#addCountry" ).on("click" , function() {
		 i++;
		 if(i==2){
			 $( "#removeCountry" ).attr("disabled", false);
		 }
		 if(i>19){
			 $( "#addCountry" ).attr("disabled", true);
		 }
		 
		 $( "div[name=addCountry]" ).append( $( '<input  type="text" id="country'+i+'" name="countryList" style="position: absoloute" placeholder="아직 정하지 못했어요."class="form-control input-md contents" >' ) );
		 $(document).find("input[name='countryList']").removeClass('ui-autocomplete-input').each(function (index) {
			
				$($("input[name='countryList']")[index]).autocomplete({
					source : function(request, response) {
						
						$.ajax({
							url : "/information/json/countryAutoComplete/",
							method : "POST",
							data : {
								keyword : $($("input[name='countryList']")[index]).val()
							},
							dataType : "json",
							success : function(JSONData) {

								response($.map(JSONData, function(item) {

									return item;
								}));
							}
						});
					}
				});
			});
	});
	 
	 $(function() {
			
		 $( "#removeCountry" ).on("click" , function() {
			 if(i>2){
				 $( "#addTripDate" ).attr("disabled", false);
				 $( '#country'+i ).remove();
				 i--;
			 }else if(i==2){
				 $( "#removeCountry" ).attr("disabled", true);
				 $( '#country'+i ).remove();
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
			$('img').attr('src', e.target.result).attr('width', '300px');
		}
		reader.readAsDataURL(input.files[0]);
		alert($('#mainThumbnail').val());
		alert(e.target.result);
	}
}

</script>

<title>Insert title here</title>
</head>
<body>


 <div class="container">
      
			<header id="header" class="alt">
				<div class="inner">
					<p>&nbsp;</p><p>&nbsp;</p>
					<h1>Design Your TwiiBook</h1>
				</div>
			</header>
				<div class="form-group" >
						<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
			<form>

				<div class="form-group center-block contentsList">
						<input type="hidden" name="mainPlanNo" value="${mainPlan.mainPlanNo}">
						<div name="planer">	
						<label for="mainThumbnail" class="col-sm-12 control-label">썸네일을 등록해주세요</label>
							<img src="/resources/images/thumbnail_plan/${mainPlan.mainThumbnail }" width="300px"/>
							<input type="file" class="form-control contents"  id="mainThumbnail" name="file" ><p>&nbsp;</p>
						<label for="planTitle" class="col-md-12 control-label">당신의 플랜북 이름을 정해주세요</label>
							<input type="text" class="form-control contents"  style="position: absoloute" id="planTitle" name="planTitle" value="${mainPlan.planTitle}" ><p>&nbsp;</p>
						<div name="addCountry">
						<label class="control-label" for="textinput">여행하고 싶은 국가를 입력해주세요</label>
						<c:set var="i" value="0" />
			  			<c:forEach var="country" items="${countryList}">
			  			<c:set var="i" value="${ i+1 }" />
							<input  type="text" id="country"+${i} name="countryList" style="position: absoloute" value="${country}"class="form-control input-md contents" ><p>&nbsp;</p>
						</c:forEach>
							<div class="btn-group"></div>
							<a class="btn btn-primary btn" href="#" role="button" id="addCountry" name="addCountry"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>		    
				    		<a class="btn btn-primary btn" href="#" role="button" id="removeCountry" name="removeCountry"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></a>
				    		</div>							
						
						<label for="departureDate" class="col-sm-12 control-label ">출발일을 입력해주세요</label>
							<input type="text" class="form-control contents" id="datepicker1" name="departureDate"value="${mainPlan.departureDate}"><p>&nbsp;</p>
							
						<label for="arrivalDate" class="col-sm-12 control-label">도착일을 입력해주세요</label>
							<input type="text" class="form-control contents"  id="datepicker2" name="arrivalDate" value="${mainPlan.arrivalDate}"><p>&nbsp;</p>							
						
						 						
						</div>
						</div>
						
						<input type="submit" class="btn-1"  style="background-color:transparent;  border:0px transparent solid; aria-label="Right Align" id="submit" value="UPDATE" >
					</form>
					</div>
					
				</div>		

</body>
</html>