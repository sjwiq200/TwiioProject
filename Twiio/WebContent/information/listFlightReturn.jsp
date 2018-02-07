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
	<style>
		body {
            padding-top : 50px;
            background-color: #f4f4f4;
			color: #666666;
			font-family: "Source Sans Pro", Helvetica, sans-serif;
        }
        
         #mask {  
			  position:absolute;  
			  left:0;
			  top:0;
			  z-index:100;  
			  background-color:#000;  
			  display:none;  
			}
       #loadingImg {
				  position:absolute;
				  left:45%;
				  top:50%;
				  z-index:120;
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
			    background: #f4f4f4;
			    color: #08708A;
				border-color: #08708A;
			}
			.btn-outlined.btn-light:hover,
			.btn-outlined.btn-light:active {
			    color: #FFF;
			    background: #D73A31;
			    border-color: #D73A31;
			}
			
			.btn-outlined.btn-light {
			    background: #FFF;
			    color: #D73A31;
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
				box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
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
				    						 window.open(JSONData.list,'_blank');
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
				    allowTaint: true,
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
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	
	<div class="page-header text-info">
	       <h3>비행기 정보 조회</h3>
	</div>
	    
	
<div class="get-in-touch col-md-12  col-md-offset-2">
	<div class="mainbox">    
	  <form>  
		<div class="page-header text-center">
			<h4 class=" text-info"><strong>선택하신 비행기 내역</strong></h4>
	    </div>
	    
	<div class="row">
		<div class="col-md-4 col-md-offset-2">
			<div class="form-group">
				 <label for="departure">출발 도시</label>&nbsp;&nbsp; ${flight.departure}
			</div>
		</div>
		<div class="col-md-6">
			<div class="form-group">
				 <label for="arrival">도착도시</label>&nbsp;&nbsp;${flight.arrival}
			</div>
		</div> 
	</div>
		
	<div class="row">
		<div class="col-md-4 col-md-offset-2">
			<div class="form-group">
				 <label for="receiverName" >출국일자</label>&nbsp;&nbsp;${flight.departureDate}
			</div>	
		</div>
		<div class="col-md-6">		
			<div class="form-group">
				 <label for="arrivalDate" >입국일자</label>&nbsp;&nbsp;${flight.arrivalDate}
			</div>
		</div>
	</div>
		
		
	<div class="row">
		<div class="col-md-4 col-md-offset-2">
			<div class="form-group">
				 <label for="headCount" >인원</label>&nbsp;&nbsp;${flight.headCount}
			</div>
		</div>
		<div class="col-md-6">
			<div class="form-group">
				 <label for="returnInfo" >비행정보</label>&nbsp;&nbsp;${flight.returnInfo}
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-4 col-md-offset-2">
			<div class="form-group">
				 <label for="returnType">비행타입</label>&nbsp;&nbsp;${flight.returnType}
			</div>	
		</div>
		<div class="col-md-6">	
			<div class="form-group">
				 <label for="returnPrice">가격</label>&nbsp;&nbsp;${flight.returnPrice}
			</div>
		</div>
	</div>
		
		</form>
	</div> 
</div>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		
		<div class="col-sm-offset-10  col-sm-2 text-center">
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
					 <td align="center">${i}</td>
					 <td align="center" id="info">${info[status.index]}</td>
					 <td align="center" id="type">${type[status.index]}</td>
					 <td align="center" id="price">${price[status.index]}</td>
					 <td align="center" id="choice"><button type="button" class="btn btn-outlined btn-light btn-sm" id="newpick">선&nbsp;택</button></td>
					</tr>
		   </c:forEach>
	      </tbody> 
	    </table>
	</div>	
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>