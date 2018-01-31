<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- ���̾�α�  -->

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>



<!--  ����  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    
<title>MainPlanList</title>

<style>

#mainBody {
    padding-top : 100px;
}


      #map {
        height: 300px;
        width: 500px;

      }
      html, body {
        height: 100%;
        width: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
/*         position: absolute;
        top: 10px;
        left: 50%; */
        z-index: 10;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      
      .pac-container {
    z-index: 100000;
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
	
	</script>
	
	
	<script type = "text/javascript" async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwwqenPL4wZOiFh9Ljfohh2vadO29GeFM&libraries=places&callback=initMap&sensor=true">
	</script>
	
	    <script>
	/////Google Map Script////////
	
	
	
  	var service;
  	 var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 5,
        });
  
        var geocoder = new google.maps.Geocoder;
		var infowindow = new google.maps.InfoWindow;
		var address = document.getElementById('address');
		service = new google.maps.places.PlacesService(map);
		var autocomplete = new google.maps.places.Autocomplete(address);
        document.getElementById('submit').addEventListener('click', function() {
        geocodeAddress(geocoder, map);
        });
      }

      function geocodeAddress(geocoder, resultsMap) {
        var address = document.getElementById('address').value;
 
        geocoder.geocode({'address': address}, function(results, status) {
        	if (status === 'OK') {
        		service.getDetails({
        		    placeId:results[0].place_id
        		}, function(place, status) {
        		    	var log = {
        		    				formatted_address:JSON.stringify(place.formatted_address),
									types:JSON.stringify(place.types),
									url:JSON.stringify(place.url),
									formatted_phone_number:(JSON.stringify(place.formatted_phone_number)==null?0:JSON.stringify(place.formatted_phone_number)),
									international_phone_number:(JSON.stringify(place.international_phone_number)==null?0:JSON.stringify(place.international_phone_number)),
									rating:(JSON.stringify(place.rating)==null?0:JSON.stringify(place.rating)),
									website:(JSON.stringify(place.website)==null?0:JSON.stringify(place.website))
									};
        		    	console.log(log);
        		    
        		    	var address=JSON.stringify(place.formatted_address);
        		    	var types=JSON.stringify(place.types);
        		    	var url = JSON.stringify(place.url);
        		    	
        		    	$("#resultMap")
        		    	.append("<div align=\"center\">"+address+"</div>")
        		    	.append("<div align=\"center\">"+types+"</div>")
        		    	.append("<div align=\"center\">"+url+"</div>");
        		    	
        		    	
        		});
           
          } else {
            alert('ã���ô� ��Ұ� �˻����� �ʳ׿� ���� �ٸ� �˻���� �ѹ� �ٽ� �غ����?' + status);
          }
        });
      }
      
/*       $('#addMap').on('shown', function () {
    	  alert("�ȳ�");
    	  console.log("�ȳ�");
    	  google.maps.event.trigger(map, 'resize');
    	  map.setCenter(new google.maps.LatLng(42.7369792, -84.48386540000001));
    	});
      
      
      $('button[name=addMapIcon]').on('click', function () {
    	  alert("�ȳ�");
    	  console.log("�ȳ�");
    	  //google.maps.event.trigger(map, 'resize');
    	  //map.setCenter(new google.maps.LatLng(42.7369792, -84.48386540000001));
    	}); */
      
      $(function() {
  		$("button:contains('����')").on("click", function() {
  			alert("�ȳ�!");
  		google.maps.event.trigger(map, 'resize');
      	  map.setCenter(new google.maps.LatLng(42.7369792, -84.48386540000001));
  		});
  	});
      
      
    </script>
 


	
</head>
<body id="mainBody">


	<jsp:include page="/layout/toolbar.jsp" />
	<form class="form-horizontal">

		<div class="container">
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
						<h7> �� </h7>
						<div>������ ��ȣ : ${planContent.contentNo}</div>
						<div>���ϸ��÷���ȣ : ${dailyPlan.dailyPlanNo}</div>
						<div>������Ÿ�� : ${planContent.contentType}</div>
						
						<c:if test="${!empty scrap.scrapNo }">
							<div>��ũ����ȣ : ${scrap.scrapNo }</div>
						</c:if>
						
						<c:if test="${!empty planContent.route}">
							<div>��Ʈ : ${planContent.route}</div>
						</c:if>
						
						<c:if test="${!empty planContent.departureLocation}">
							<div>����� : ${planContent.departureLocation}</div>
						</c:if>

						<c:if test="${!empty planContent.arrivalLocation}">
							<div>������ : ${planContent.arrivalLocation}</div>
						</c:if>

						<c:if test="${!empty planContent.estimatedTime}">
							<div>�ҿ�ð� : ${planContent.estimatedTime}</div>
						</c:if>

						<c:if test="${!empty planContent.routeType}">
							<div>�̵���� : ${planContent.routeType}</div>
						</c:if>

						<c:if test="${!empty planContent.routeDescription}">
							<div>��ã���� : ${planContent.routeDescription}</div>
						</c:if>

						<c:if test="${!empty planContent.orderNo}">
							<div>���� : ${planContent.orderNo}</div>
						</c:if>

						<c:if test="${!empty planContent.contentText}">
							<div>�ؽ�Ʈ : ${planContent.contentText}</div>
						</c:if>
						
						<c:if test="${!empty planContent.contentImage}">
							<div>�̹��� : </div>
							<div><img src="/resources/images/dailyPlanContent/${planContent.contentImage}" width="300px" /></div>
						</c:if>

						<div>&nbsp;</div>
						<div>&nbsp;</div>
					</div>

				</c:forEach>

				<img src="/resources/images/icon/plan/daily-plan-content-plus-icon.jpeg" height="40" width="40" id="plus" />
	</form>

	<div>

		
		<span><button type="button" class="btn" data-toggle="modal" data-target="#addText">�۾�����</button></span>
		 <span><button type="button" class="btn" data-toggle="modal" data-target="#addImage">�����߰�</button> </span> 
		<span><button type="button" class="btn" data-toggle="modal" data-target="#addMap" name="addMapIcon">����</button></span>
		<span><button type="button" class="btn" data-toggle="modal" data-target="#addRoute">��ã��</button> </span>

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

					<!-- Google Map  -->
						<div id="floating-panel">
							<input id="address" type="textbox" value=""> <input
								id="submit" type="button" value="�˻�">
							<div id="resultMap" type="textbox" value="">-</div>
						</div>
						<div id="map"></div>
					<!-- Google Map  -->


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
								<label for="uploadFile" class="col-sm-4 control-label">��ǰ�̹���
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



</body>



</html>
