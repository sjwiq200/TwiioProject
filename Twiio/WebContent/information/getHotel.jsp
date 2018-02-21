<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	<title>TWIIO Hotels</title>
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/resources/css/animate.min.css" rel="stylesheet">
   <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <!-- pdf Lib -->
   	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
   	<script src="//cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
	
   
   <!-- ---------font ------------ -->
  	<link href="/resources/css/font.css" rel="stylesheet" type="text/css" /> 
   <!--  ///////////////////////// 추가 ////////////////////////// -->
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
		 #img {
       			 max-width:200px;
				 max-height:150px;
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
				max-width:100%; 
				max-height:100%;
			}
			
			.btn-outlined.btn-theme:hover,
			.btn-outlined.btn-theme:active {
			    background: #f4f4f4 !important;
			    color: #08708A !important;
				border-color: #08708A !important;
			}
			
			.btn-outlined.btn-theme {
				color: #FFF !important;
			    background: #08708A !important;
			    border-color: #08708A !important;
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
			    padding: 10px;
			    font-weight: bold;
			    vertical-align: top;
			    color: #fff;
			    background: rgba(8, 112, 138, 0.6);
			    margin: 20px 10px;
			    border: 1px solid #60b6c3;
			}
			table.type10 tbody th {
			    padding: 10px;
			    border: 1px solid #9fc7d1;
			}
			table.type10 td {
			    padding: 10px;
			    vertical-align: top;
			    border: 1px solid #9fc7d1;
			}
			table.type10 .even {
			    background: #9fc7d1;
			}
			table {
		    margin-left: auto;
		    margin-right: auto;
		  }
		  #head{
		  		background-image: url("/resources/images/hotel.png");
		  		font-family: "Pacifico", cursive;
		  		height : 250px;
		 	 }
		  a {
			    color: #FFF;
			    text-decoration: none;
			}
		a:hover,
		a:active {
			    color: #D73A31;
			    text-decoration: none;
			}
		.panel{
		  	border-radius: 23px;
		 	border: dashed rgba(85, 176, 190, 1) 2px;
		  }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(function() {
			
		 $( "#checkIn" ).datepicker({
				dateFormat: "yy.mm.dd" 
		      });
			
		
		 $( "#checkOut" ).datepicker({
			    dateFormat: "yy.mm.dd"
		      });
		 
		 $("button#search").on("click" , function() {
			// alert("뀨?")
			//  $("form").attr("method" , "POST").attr("action" , "/information/json/getHotel").submit();
			var city = $("#city").val();
			var checkOut = $("#checkOut").val();
			var checkIn = $("#checkIn").val();
			var headCount = $("#headCount").val();
			
			event.preventDefault();
			 $.ajax(
	    				{
	    					url:"/information/json/getHotel/",
	    					method:"POST",	    					
	    					data:{	    						
	    						"city":city,
	    						"checkIn":checkIn,
	    						"checkOut":checkOut,
	    						"headCount":headCount
	    						},
	    						headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
	    					dataType:"json",
	    					success:function(JSONData){
	    						var con = JSONData.con;
								var price = JSONData.price;
								var loc = JSONData.loc;
								var url = JSONData.url;
								var img = JSONData.image;
								
								var list = null;
								
								for(var i = 0 ; i<con.length; i++){
									
									list += '<tr><td align="center" valign="middle" style="width:50px; padding-top : 50px;">'+(i+1)+'</td>'+
									'<td align="center" id="img" style="max-width: 100%; max-height : 100%; width: 300px;"><img src="'+img[i]+'" style="max-width : 100%; max-height : 100%;"/></td>'+
									'<td align="center" valign="middle" id="con" style="padding-top : 50px; max-width : 70%; width: 300px;">'+con[i]+'</td>'+
									'<td align="center" valign="middle" id="loc" style="padding-top : 50px; max-width : 70%; ">'+loc[i]+'</td>'+
									'<td align="center" valign="middle" id="price" style="padding-top : 50px; max-width : 70%; ">'+price[i]+'</td>'+
									'<td align="center" valign="middle"  id="choice" style="max-width : 70%; max-height : 100%;"><button type="button"' +
									'class="btn btn-outlined btn-light btn-sm" id="pick" style="margin-top : 30px;  max-width : 100%; "><a href="'+
									url[i]+'" target="_blank" >선&nbsp;택</a></button></td></tr>';
								}
							$("#listTbody").html(list);
			    							    							    						
			    					},
			    					error:function(JSONData){
			    					
			    						alert("에러");
					    							    							    						
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
      <h2 align="center"  style=" margin-top : 50px;" ><strong style="color : #fff;  font-size: 1.5em; margin-bottom : 15px;"><ins>ABOUT HOTELS</ins></strong></h2>
      <h4 align="center" style="font-family:'TYPO_JEONGJOM'; color : #FFF; margin-top : 20px;">나만의 딱 맞는 호텔을 찾아보세요 :D</h4>
      </div>
    </div>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<form role="form">
				
			<div class="row centered-form">
				 <div class="mainbox col-md-12">
					<div class="panel">
		        		<div class="panel-heading" >
					    		<h3 class="panel-title"></h3>
					 		</div>
					 			<div class="panel-body">
					    			<div class="row">
					    				<div class="col-sm-3">
					    					<div class="form-group">
					    						 <div class="input-group">
						    						<span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>
						    						 <input type="text" class="form-control" id="city" name="city" placeholder="숙소위치">
						    					</div>
					    					</div>
					    				</div>
					    				<div class="col-sm-3">
					    					<div class="form-group">
					    						 <div class="input-group">
						    						<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						    						<input type="text" class="form-control" id="checkIn" name="checkIn" placeholder="체크인">
						    					</div>
					    					</div>
					    				</div>
					    				<div class="col-sm-3">
					    					<div class="form-group">
					    						 <div class="input-group">
						    						<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						    						<input type="text" class="form-control" id="checkOut" name="checkOut" placeholder="체크아웃">
						    					</div>
					    					</div>
					    				</div>
					    				<div class="col-sm-3">
					    					<div class="form-group">
					    						 <div class="input-group">
						    						<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						    						<select class="form-control" name="headCount" id="headCount">
													  	<option value="1" selected="selected" >1명</option>
														<option value="2" >2명</option>
														<option value="3" >3명</option>
														<option value="4" >4명</option>
														<option value="5" >5명</option>
														<option value="6" >6명</option>
														<option value="7" >7명</option>
														<option value="8" >8명</option>
														<option value="9" >9명</option>
														<option value="10" >10명</option>
													</select>
						    					</div>
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
				
		</form>
	
		
		<div class="col-sm-offset-10  col-sm-2 text-center">
		      <button class="btn btn-outlined btn-theme btn-xs"  id="htmlToPDF" >PDF저장</button>
		</div>
		<br/>
		<br/>
		
		<table class="type10" style="margin-left: auto; margin-right: auto; text-align: center;  valign: middle;" >
		
	        <thead>
	          <tr>
	            <th>No</th>
	            <th>사진</th>
	            <th>정보</th>
	            <th>위치</th>
	            <th>가격</th>
	            <th>선택</th>
	          </tr>
	        </thead>
	       
			
			
				<tbody id="listTbody">
					<tr>
					 <td valign="middle" style="width:100px;"></td>
					 <td id="img" style="width:450px;"></td>
					 <td valign="middle" id="con" style=" width:400px;"></td>
					 <td valign="middle" id="loc" style=" width:400px;"></td>
					 <td valign="middle" id="price" style="width:400px;"></td>
					 <td valign="middle" id="choice" style="width:400px;"></td>
					</tr>
		        </tbody>
	      
	      	</table>
	
	    
 		</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
	</body>

</html>