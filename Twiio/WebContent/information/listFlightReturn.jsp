<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	<title>TWIIO Flights</title>
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
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
	
	<style>
		body {
            background-color: #f4f4f4;
			color: #666666;
			font-family: "Source Sans Pro", Helvetica, sans-serif;
        }
        
         #mask {  
			  position:absolute;  
			  left:0;
			  top:0;
			  z-index:100;  
			  background-color:#FFF;  
			  display:none;  
			}
      #loadingImg {
       			  left:40%;
       			  right:40%;
			 	  top:30%;
				  position:absolute;
				  z-index:120;
				  max-width:30%;
				  max-height:30%;
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
			    background: #f4f4f4;
			    color: #08708A;
				border-color: #08708A;
			}
			
			.btn-outlined.btn-theme {
			    color: #FFF;
			    background: #08708A;
			    border-color: #08708A;
			}
			.btn-outlined.btn-light:hover,
			.btn-outlined.btn-light:active {
			    background: #f4f4f4;
			    color: #D73A31;
				border-color: #D73A31;
			}
			
			.btn-outlined.btn-light {
			    color: #FFF;
			    background: #D73A31;
			    border-color: #D73A31;
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
			    border-top: 1px solid #D0D3C5 !important;
			    border-bottom: 1px solid #D0D3C5 !important;
			    margin: 20px 10px;
			}
			table.type10 thead th {
			    width: 150px;
			    padding: 10px;
			    font-weight: bold;
			    vertical-align: top;
			    color: #fff;
			    background: rgba(8, 112, 138, 0.6);
			    margin: 20px 10px;
			    border: 1px solid #60b6c3;
			}
			table.type10 tbody th {
			    width: 150px;
			    padding: 10px;
			    border: 1px solid #60b6c3;
			}
			table.type10 td {
			    width: 350px;
			    padding: 10px;
			    vertical-align: top;
			    border: 1px solid #60b6c3;
			}
			table.type10 .even {
			    background: #56B1BF;
			}
			table {
			    margin-left: auto;
			    margin-right: auto;
			  }
			  
			.get-in-touch {
				position: relative;
				margin: 0 auto;
				padding: 30px;
				border-radius: 2px;
				background: rgb(255, 255, 255) url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAGCAYAAACFIR03AAAAV0lEQVR42tXOMRWAQAwE0RWFDRTg5d47Jeg4Q9gI06RbqlwKil/P6LpXbDCf85AxEBtMGjKG/jyPUHUerfP4nEeoOo/Wedj5pOo8Wudh55Oq82idh51PLxpvled7kLAXAAAAAElFTkSuQmCC) repeat-x;
				box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
				}
			h1 {
				font-family: 'Hanna', serif !important;
				padding-top : 0px !important;
				padding-bottom : 0px !important;
				}
			 h2 {
				text-shadow: 0 5px 5px rgba(0, 0, 0, .1);
				color : #08708A;
				}
			h4 {
				font-size: 1em;
				font-family: "Source Sans Pro", Helvetica, sans-serif !important;
				}
			#head{
		  		background-image: url("/resources/images/airport.png");
		  		font-family: "Pacifico", cursive;
		  		height : 250px;
		 	 }
		  
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
	 $( function() {
		 
		 var currentUrl = "${currentUrl}";
		 
		    $( "#departureDate" ).datepicker({
		    	dateFormat: "yy.mm.dd" 
	        });
		
	
		    $( "#arrivalDate" ).datepicker({
		    	dateFormat: "yy.mm.dd"
	        });

		    $("td:nth-child(5)").on("click" , function() {
		    	var clickNum = $("td:nth-child(5)").index(this);
		    	event.preventDefault();
				    	  $.ajax(
				    				{
				    					url:"/information/json/getFlightListReturn/",
				    					method:"POST",	    					
				    					data:{	    						
				    						"clickNum":clickNum,
				    						"currentUrl":currentUrl
				    						},
				    						headers : {
												"Accept" : "application/json",
												"Content-Type" : "application/json"
											},
				    					dataType:"json",
				    					success:function(JSONData){
				    						 window.open(JSONData.list,'','_blank');
				    					}
				    				}
				    			);
						 });
		    
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
	 
	 
	 
		function wrapWindowByMask(){
			var maskHeight = $(document).height();  
			var maskWidth = $(window).width();  
			
			$('#mask').css({'width':maskWidth,'height':maskHeight});  
			
			$('#mask').fadeTo("slow",0.6);    
		}

		$(function() {
			var loading = $('<img alt="loading" id="loadingImg" src="/resources/images/lg.rotating-balls-spinner.gif">')
			.appendTo(document.body).hide();
				
			$(window).ajaxStart(function(){
				   loading.show();
				   wrapWindowByMask();
				})
				.ajaxStop(function(){
				   loading.hide();
				   $('#mask').hide();
				});
		
		
		});
		

	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	<div id="mask"></div>
	
	<div class="jumbotron" id="head" style="align-content: center; padding-bottom: 20px; text-shadow: 0 5px 5px rgba(0, 0, 0, .3); ">
      <div class="container" id="container">
      <h2 align="center"  style=" margin-top : 50px;" ><strong style="color : #fff;  font-size: 1.5em; margin-bottom : 15px;"><ins>ABOUT FLIGHTS</ins></strong></h2>
      </div>
    </div>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<div class="get-in-touch col-md-12  col-md-offset-2" style="font-family: 'Hanna', serif;">
		<div class="mainbox">    
		  <form>  
			<div class="page-header text-center">
				<h1 style="font-size: 2.5em !important; color : rgba(215, 58, 49, 0.8); height: 30px;"><strong>선&nbsp;택&nbsp;하&nbsp;신&nbsp;&nbsp; 비&nbsp;행&nbsp;기&nbsp;&nbsp; 내&nbsp;역</strong></h1>
		    </div>
	    
	<div class="row">
		<div class="col-md-4 col-md-offset-2">
			<div class="form-group">
				 <label for="departure"><ins>출발 도시 :  </ins></label>&nbsp;&nbsp; ${flight.departure}
			</div>
		</div>
		<div class="col-md-6">
			<div class="form-group">
				 <label for="arrival"><ins>도착도시 :  </ins></label>&nbsp;&nbsp;${flight.arrival}
			</div>
		</div> 
	</div>
		
	<div class="row">
		<div class="col-md-4 col-md-offset-2">
			<div class="form-group">
				 <label for="receiverName" ><ins>출국일자 :  </ins></label>&nbsp;&nbsp;${flight.departureDate}
			</div>	
		</div>
		<div class="col-md-6">		
			<div class="form-group">
				 <label for="arrivalDate" ><ins>입국일자 :  </ins></label>&nbsp;&nbsp;${flight.arrivalDate}
			</div>
		</div>
	</div>
		
		
	<div class="row">
		<div class="col-md-4 col-md-offset-2">
			<div class="form-group">
				 <label for="headCount" ><ins>인원 :  </ins></label>&nbsp;&nbsp;${flight.headCount}
			</div>
		</div>
		<div class="col-md-6">
			<div class="form-group">
				 <label for="returnInfo" ><ins>비행정보 :  </ins></label>&nbsp;&nbsp;${flight.returnInfo}
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-4 col-md-offset-2">
			<div class="form-group">
				 <label for="returnType"><ins>비행타입 :  </ins></label>&nbsp;&nbsp;${flight.returnType}
			</div>	
		</div>
		<div class="col-md-6">	
			<div class="form-group">
				 <label for="returnPrice"><ins>가격 :  </ins></label>&nbsp;&nbsp;${flight.returnPrice}
			</div>
		</div>
	</div>
		
		</form>
	</div> 
</div>
		
		
		<div class="col-sm-offset-10  col-sm-2 text-center" style="padding-top : 20px; padding-bootom : 20px;">
		      <button class="btn btn-outlined btn-theme btn-xs"  id="htmlToPDF" >PDF저장</button>
		</div>
		
		<br/>
		<br/>
	
	<div class="col-md-12">
		<h4>오는 편 비행기를 선택해 주세요.</h4>
		<table class="type10" style="margin-left: auto; margin-right: auto; text-align: center;">
	      
	        <thead>
	          <tr>
	            <th align="center">No</th>
	            <th align="left">정보</th>
	            <th align="left">타입</th>
	            <th align="left">가격</th>
	            <th align="left">선택</th>
	          </tr>
	        </thead>
	        
	   
	   <tbody id="listTbody">
		<c:set var="i" value="0" />
		  <c:forEach  items="${info}" varStatus="status">
		  	<c:set var="i" value="${ i+1 }" />
					<tr>
					 <td align="center" valign="middle" style="padding-top : 30px;">${i}</td>
					 <td align="center"  valign="middle" id="info" style="padding-top : 10px;">${info[status.index]}</td>
					 <td align="center" valign="middle" id="type" style="padding-top : 30px;">${type[status.index]}</td>
					 <td align="center" valign="middle" id="price" style="padding-top : 30px;">${price[status.index]}</td>
					 <td align="center" valign="middle" id="choice"><button type="button" class="btn btn-outlined btn-light btn-sm" id="newpick" style="margin-top : 25px;">선&nbsp;택</button></td>
					</tr>
		   </c:forEach>
	      </tbody> 
	    </table>
	</div>	
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>