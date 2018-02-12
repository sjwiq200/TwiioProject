<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">


<head>
	<meta charset="EUC-KR">
	<title>TWIIO NightLife</title>
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
	
	<link href="/resources/css/animate.min.css" rel="stylesheet">
	<link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	
	<!-- Bootstrap Dropdown Hover JS -->
	<script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!-- jQuery UI toolTip 사용 CSS-->
	
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

		<!-- pdf Lib -->
   	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
   	<script src="//cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
  	
   
    <!-- ---------font ------------ -->
  	<link href="/resources/css/imformation.css" rel="stylesheet" type="text/css" /> 
  	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 80px;
            background-color: #f4f4f4;
			color: #666666;
			font-family: "Source Sans Pro", Helvetica, sans-serif;
			background-image: url("/resources/images/crowd.jpg");
    		background-size: cover;
        }
		 .btn-sm{
				font-size:12px;
				line-height:16px;
				border: 2px solid;
				padding:8px 15px;
			}
			
			.btn {
				letter-spacing: 1px;
				text-decoration: none;
				background: none;
			    -moz-user-select: none;
			    background-image: none;
			    border: 1px solid transparent;
			    border-radius: 0;
			    cursor: pointer;
			    display: inline-block;
			    margin-bottom: 0;
			    vertical-align: middle;
			    white-space: nowrap;
				font-size:14px;
				line-height:20px;
				font-weight:700;
				text-transform:uppercase;
				border: 3px solid;
				padding:8px 20px;
			}
			
			.btn-outlined.btn-theme:hover,
			.btn-outlined.btn-theme:active {
			    color: #FFF;
			    background: #08708A;
			    border-color: #08708A;
			}
			
			.btn-outlined.btn-theme {
			    background: rgba(255, 255, 255, 0.5);;
			    color: #08708A;
				border-color: #08708A;
			}
			.btn-outlined.btn-light:hover,
			.btn-outlined.btn-light:active {
			    color: #FFF;
			    background: #56B1BF;
			    border-color: #56B1BF;
			}
			
			.btn-outlined.btn-light {
			    background: #f4f4f4;
			    color: #56B1BF;
				border-color: #56B1BF;
			}
			
			.btn-xs{
				font-size:11px;
				line-height:14px;
				border: 1px solid;
				padding:5px 10px;
			}
			table.type10 {
			    border-collapse: collapse;
			    text-align: left;
			    line-height: 1.5;
			    border-top: 1px solid rgba(215, 58, 49, 0.8) !important;
			    border-bottom: 1px solid rgba(215, 58, 49, 0.8) !important;
			    margin: 20px 10px;
			}
			table.type10 thead th {
			    width: 150px;
			    padding: 10px;
			    font-weight: bold;
			    vertical-align: top;
			    color: #fff;
			    background: rgba(215, 58, 49, 0.8);
			    margin: 20px 10px;
			    border: 3px solid rgba(215, 58, 49, 0.8);
			}
			table.type10 tbody th {
			    width: 150px;
			    padding: 10px;
			    border: 3px solid rgba(215, 58, 49, 0.8);
			}
			table.type10 td {
			    width: 350px;
			    padding: 10px;
			    vertical-align: top;
			    border: 3px solid rgba(215, 58, 49, 0.8);
			}
			table.type10 .even {
			    background: rgba(215, 58, 49, 0.8);
			}
			table {
		    margin-left: auto;
		    margin-right: auto;
		  }
	        #map {
	        	height: 400px;
	        	width: 100%;
	        	border: 3px solid #FFF;
	        	
	       }
	       .jumbotron {
	        	border: 3px solid #FFF;
	       }
	       
	       
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	function initMap() {
		//var num1 = ${lat};
		//var num2 = ${lng};
		
		//alert(num1);alert(num2);
		
        var uluru = {lat:${lat}, lng:${lng}};
        
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
	
	
	$(function() {
		
		$( "#htmlToPDF" ).on("click" , function() {
			
			var doc = new jsPDF();

			var specialElementHandlers = { 
			
			    "body": function (element, renderer) { 
			
			        return true; 
			
			    }
			
			}	
			
			html2canvas($("body"),{
				
			
			    useCORS: true,
			
			    allowTaint: false,
			
			    onrendered:function(canvas){
			    	
			    	var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
				    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
				    var imgHeight = canvas.height * imgWidth / canvas.width;
				    var heightLeft = imgHeight;
			
			        var imgData = canvas.toDataURL('image/jpeg');
			
			        var doc = new jsPDF("p","mm");
			
					console.log(imgData);
			
			        doc.addImage(imgData,'JPEG', 0, 0, imgWidth, imgHeight);
			        heightLeft -= pageHeight;
			
			        doc.save('test.pdf');
			
			    }
			
			});
			
		});
		
	});
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwwqenPL4wZOiFh9Ljfohh2vadO29GeFM&callback=initMap">
			
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<div class="jumbotron" id="jumbotron" style=" align-content: center; background-color: rgba(255, 255, 255, 0.5); padding-top: 30px;" >	
	
		<div class="row" align="center">
	  		<div class="col-xs-12" id="info1" style="height: 100px;" ><ins><h2 style=" color : #212121;"><strong>${context[0]}</strong></h2></ins></div>
	  		<c:forEach  items="${context}" varStatus="status">
				<div class="col-xs-12" style=" color : #212121; height: 30px;"><h3>${context[status.index+1]}</h3></div>
			</c:forEach>
		</div>
		<hr/>
		
		
		<div class="row">
		<c:if test="${image != null}">
			<c:if test="${image.size()==2}">
				<div class="col-md-12"><a href="${image[0]}" target="_blank"><img src="${image[0]}"  style="width: 700px; height: 450px;"/></a>
				<div class="col-md-3"><img src="/resources/images/no_img3.png" style="width: 300px; height: 150px; padding-left: 70px; "/>
									<img src="/resources/images/no_img3.png" style="width: 300px; height: 150px; padding-left: 70px; "/>
									<img src="/resources/images/no_img3.png" style="width: 300px; height: 150px; padding-left: 70px; "/>
					</div>
				</div>
			</c:if>
			
			<c:if test="${image.size()>2}">
				<div class="col-md-12">
						<div class="col-md-3">
							<c:set var="i" value="0" />
								<c:forEach  items="${image}" varStatus="status" end="2">
									<c:set var="i" value="${ i+1 }" />	
									<a href="${image[i]}" target="_blank"><img src="${image[i]}"  style="width: 300px; height: 150px; padding-left: 70px; "/></a>
								</c:forEach>	
						</div>
					<a href="${image[0]}" target="_blank"><img src="${image[0]}"  style="width: 700px; height: 450px;" /></a>
				</div>
			</c:if>
		</c:if>
		<c:if test="${image == null}">
			<div class="col-md-12"><img src="/resources/images/no_img2.png" style="width: 700px; height: 450px;"/>
				<div class="col-md-3"><img src="/resources/images/no_img3.png" style="width: 300px; height: 150px; padding-left: 70px; "/>
									<img src="/resources/images/no_img3.png" style="width: 300px; height: 150px; padding-left: 70px; "/>
									<img src="/resources/images/no_img3.png" style="width: 300px; height: 150px; padding-left: 70px; "/>
				</div>
			</div>
		</c:if>
		
		<div class="col-md-12">
			<div class="col-md-10 col-md-offset-2">			
				<table class="type10"style="width: 600px;" >
		
			        <thead>
			          <tr>
			            <th align="center" >정보</th>
			          </tr>
			        </thead>
					
					<tbody id="listTbody">
					
						<c:forEach  items="${info}" varStatus="status">	
							<tr>
							 <td align="center" id="info" style=" color : #212121;"><strong>${info[status.index]}</strong></td>
							</tr>
						</c:forEach>
			        </tbody>
	      
	      		</table>			
			</div>
			<%--  <div class="col-xs-8 col-md-4">	
			 	<c:forEach  items="${image}" varStatus="status">
			 		<img src="${image[status.index]}"  style="width: 150px; height: 150px;"/>
			 	</c:forEach>
			 </div>	 --%>
		</div>
	</div>	
		
		
		<br/>
		
		<div></div>
		<div></div>
		
		<div id="map"></div>
		
		<div></div>
		<div></div>
		<br/><br/>
		<div class="col-sm-offset-10  col-sm-2 text-center">
		      <button class="btn btn-outlined btn-theme btn-xs"  id="htmlToPDF" >PDF저장</button>
		</div>
		<hr/>
		<div></div>
		<div></div>
	
 		</div>
 		</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
	</body>

</html>