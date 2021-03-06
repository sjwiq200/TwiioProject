<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	<title>TWIIO Flights</title>
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
  	<link href="/resources/css/font.css" rel="stylesheet" type="text/css" />        
  	
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
			    background: #FFF;
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
			    background: rgba(8, 112, 138, 0.7);
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
			    background: rgba(8, 112, 138, 0.4);
			}
			table {
		    margin-left: auto;
		    margin-right: auto;
		  }
		  h4 {
				font-family:'TYPO_JEONGJOM';
			}
		 h2 {
			text-shadow: 0 5px 5px rgba(0, 0, 0, .1);
			color : #08708A;
			}
			
		#head{
		  		background-image: url("/resources/images/listFlight.png");
		  		font-family: "Pacifico", cursive;
		  		height : 250px;
		  		
		  }
		  .panel{
		  	border-radius: 23px;
		 	border: dashed rgba(85, 176, 190, 1) 2px;
		  }
		  
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(function() {
		var currentUrls;
			$( "#departureDate" ).datepicker({
		    	dateFormat: "yy.mm.dd" 
	        });
		
	
		    $( "#arrivalDate" ).datepicker({
		    	dateFormat: "yy.mm.dd"
	        });

		
		 $("button#search").on("click" , function() {
			 
			var flightType = $("#flightType").val();
			var departure = $("#departure").val();
			var arrival = $("#arrival").val();
			var departureDate = $("#departureDate").val();
			var arrivalDate = $("#arrivalDate").val();
			var headCount = $("#headCount").val();
			event.preventDefault();
			    	  $.ajax(
			    				{
			    					url:"/information/json/getFlightList/",
			    					method:"POST",	    					
			    					data:{	    						
			    						"flightType":flightType,
			    						"departure":departure,
			    						"arrival":arrival,
			    						"departureDate":departureDate,
			    						"arrivalDate":arrivalDate,
			    						"headCount":headCount
			    						},
			    						headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
			    					dataType:"json",
			    					success:function(JSONData){
			    						var info = JSONData.info;
										var price = JSONData.price;
										var type = JSONData.type;
											currentUrls = JSONData.currentUrl[0];
										var list = null;
										
										for(var i = 0 ; i<info.length; i++){
											
											list += '<tr><td align="center" valign="middle" style="padding-top : 50px;">'+(i+1)+'</td>'+
											'<td align="center" id="info" style="padding-top : 20px;">'+info[i]+
											'</td>'+'<td align="center" valign="middle" id="type" style="padding-top : 50px;">'+type[i]+
											'</td>'+'<td align="center" valign="middle" id="price" style="padding-top : 50px;">'+price[i]+
											'<td align="center"  valign="middle" id="new">'+
											'<button type="button" class="btn btn-outlined btn-theme btn-sm" id="newpick" style="margin-top : 25px;">선&nbsp;택</button></td></tr>';
										}
									$("#listTbody").html(list);
			    							    							    						
			    					}
			    				}
			    			);
					 });
			
		 $(document).on("click","td:nth-child(5)" , function(){
			var clickNum = $("td:nth-child(5)").index(this);
			
			var returnInfo = $($("td#info")[$("td:nth-child(5)").index(this)]).text();
			var returnType = $($("td#type")[$("td:nth-child(5)").index(this)]).text();
			var returnPrice = $($("td#price")[$("td:nth-child(5)").index(this)]).text();
			
			
			$("#clickNum").val(clickNum);
			$("#returnUrl").val(currentUrls);
			$("#returnInfo").val(returnInfo);
			$("#returnType").val(returnType);
			$("#returnPrice").val(returnPrice);
			
			$("form").attr("method" , "POST").attr("action" , "/information/getFlightListReturn/").submit();
		    	 /*  $.ajax(
		    				{
		    					url:"/information/getFlightListReturn/",
		    					method:"POST",	    					
		    					data:{	    						
		    						"clickNum":clickNum,
		    						"returnUrl":currentUrls,
		    						"returnInfo":returnInfo,
		    						"returnType":returnType,
		    						"returnPrice":returnPrice
		    						
		    						},
		    						headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
		    					success:function(JSONData){
		    							    							    						
		    					}
		    				}
		    			); */
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
	  <h4 align="center" style=" color : #FFF; margin-top : 20px;">전세계 모든 비행기를 확인해 보세요 :D</h4>
      
      </div>
    </div>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<form role="form">
		<input type="hidden" id="clickNum" name="clickNum" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="returnInfo" name="returnInfo" value=""/>
		<input type="hidden" id="returnType" name="returnType" value=""/>
		<input type="hidden" id="returnPrice" name="returnPrice" value=""/>
		
		
	<div class="row centered-form">
		 <div class="mainbox col-md-12">
			<div class="panel">
			 			<div class="panel-body">
			    			<div class="row">
			    				<div class="col-sm-2">
			    					<div class="form-group">
			    					 <div class="input-group">
				    					<span class="input-group-addon"><i class="glyphicon glyphicon-plane"></i></span>
				               			 <select class="form-control" name="flightType" id="flightType">
										  	<option value="return" selected="selected" >왕복</option>
											<option value="oneway" >편도</option>
										</select>
									</div>
			    					</div>
			    				</div>
			    				<div class="col-sm-5">
			    					<div class="form-group">
			    						 <div class="input-group">
				    						<span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>
				    						 <input type="text" class="form-control" id="departure" name="departure" placeholder="출발지">
				    					</div>
			    					</div>
			    				</div>
			    				<div class="col-sm-5">
			    					<div class="form-group">
			    						 <div class="input-group">
				    						<span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>
				    						<input type="text" class="form-control" id="arrival" name="arrival" placeholder="도착지">
				    					</div>
			    					</div>
			    				</div>
			    			</div>

			    			<div class="row">
			    				<div class="col-sm-4">
			    					<div class="form-group">
			    						 <div class="input-group">
				    						<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				    						<input type="text" class="form-control" id="departureDate" name="departureDate" placeholder="가는날">
				    					</div>
			    					</div>
			    				</div>
			    				<div class="col-sm-4">
			    					<div class="form-group">
			    						 <div class="input-group">
				    						<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				    						<input type="text" class="form-control" id="arrivalDate" name="arrivalDate" placeholder="오는날">
				    					</div>
			    					</div>
			    				</div>
			    				<div class="col-sm-4">
			    					<div class="form-group">
			    						 <div class="input-group">
				    						<span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
				    						<select class="form-control" name="headCount" id="headCount">
											  	<option value="1" selected="selected" >1명</option>
												<option value="2" >2명</option>
												<option value="3" >3명</option>
												<option value="4" >4명</option>
												<option value="5" >5명</option>
												<option value="6" >6명</option>
											</select>
										</div>
			    					</div>
			    				</div>
			    			
			    			<div class="col-xs-8 col-sm-8 col-md-8">	
			    				 <button class="col-xs-12 col-xs-offset-3 btn btn-outlined btn-theme btn-sm" id="search" >검 &nbsp;색</button>
			    			</div>
			    	</div>
	    		</div>
			</div>
		</div>
	</div>
		
		</form>
		
		<br/>
		
		<div class="col-sm-offset-10  col-sm-2 text-center">
		      <button class="btn btn-outlined btn-theme btn-xs"  id="htmlToPDF" >PDF저장</button>
		</div>
		
		    <h4>가는 편 비행기를 선택해 주세요.</h4>
		    
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
					<tr>
					 <td align="center"></td>
					 <td align="center" id="info"></td>
					 <td align="center" id="type"></td>
					 <td align="center" id="price"></td>
					 <td align="center" id="choice" ></td>
					</tr>
		        </tbody>
	      
	      </table>
	
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>