
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	<title>TWIIO Currency</title>
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
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px ;
            background-color: #f4f4f4;
			color: #666666 ;
			font-family: "Source Sans Pro", Helvetica, sans-serif ;
        }
        
        .btn-sm{
				font-size:12px !important;
				line-height:16px !important;
				border: 2px solid !important;
				padding:8px 15px !important;
			}
			
			.btn {
				letter-spacing: 1px !important;
				text-decoration: none !important;
				background: none !important;
			    -moz-user-select: none !important;
			    background-image: none !important;
			    border: 1px solid transparent !important;
			    border-radius: 0 !important;
			    cursor: pointer !important;
			    display: inline-block !important;
			    margin-bottom: 0 !important;
			    vertical-align: middle !important;
			    white-space: nowrap !important;
				font-size:14px !important;
				line-height:20px !important;
				font-weight:700 !important;
				text-transform:uppercase !important;
				border: 3px solid !important;
				padding:8px 20px !important;
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

			.btn-xs{
				font-size:11px !important;
				line-height:14px !important;
				border: 1px solid !important;
				padding:5px 10px !important;
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
			    background: #56B1BF;
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
		  #jumbotron{
		 	border-radius: 23px;
		 	border: dashed rgba(85, 176, 190, 1) 2px;
		 	
		  }
		  #head{
		  		background-image: url("/resources/images/currency2.png");
		  		font-family: "Pacifico", cursive;
		  		height : 200px;
		  }
						
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(function() {
				/* 
				$("#standardCountry" ).on("change" , function() {
						
					//self.location = "/information/json/getCurrency?country="+$("select[name='standard']").val();
					var country = $("#standardCountryValue").val();
					
					alert(country);
					
						$.ajax( 
								{
									url : "/information/json/getCurrency/" ,
									method : "POST" ,
									data : {
										"country" : country
									},
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
		
										alert(status);
										alert("JSONData : \n"+JSONData.deal_bas_r);
										//Debug...									
										//alert(displayValue);
										$( "#standard" ).val(JSONData.deal_bas_r);
									}
						});
				});
			
				 $( "#compareCountry"  ).on("change" , function() {
					
					var country = $("#compareCountryValue").val();
					
					alert(country);
					
						$.ajax( 
								{
									url : "/information/json/getCurrency/" ,
									method : "POST" ,
									data : {
										"country" : country
									},
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
		
										alert(status);
										alert("JSONData : \n"+JSONData.deal_bas_r);
										//Debug...									
										//alert(displayValue);
										$( "#compare" ).val(JSONData.deal_bas_r);
									}
					});
				
				}); */
				
				
		 $("#search").on("click" , function() {
				
				var standardCountry = $("#standardCountryValue").val();
				var compareCountry = $("#compareCountryValue").val();
				var inputPrice = $("#standard").val();
				event.preventDefault();
				
					$.ajax( 
							{
								url : "/information/json/getCurrency/" ,
								method : "POST" ,
								data : {
									"standardCountry" : standardCountry,
									"compareCountry" : compareCountry,
									"inputPrice" : inputPrice
								},
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
	
									//alert(status);
									//alert("JSONData : \n"+JSONData);
									$( "#compare" ).val(JSONData);
								},
								error : function(JSONData , status) {
	
									alert("에러?"+status);
								}
				});
			
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
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	<div class="jumbotron" id="head" style="align-content: center; padding-bottom: 20px; text-shadow: 0 5px 5px rgba(0, 0, 0, .1); ">
      <div class="container" id="container">
      
      <h2 align="center"><strong style="color : #fff;  font-size: 1.5em; margin-bottom : 15px;"><ins>ABOUT CURRENCY</ins></strong></h2>
	  <h4 align="center" style="font-family:'TYPO_JEONGJOM'; color : #FFF; margin-top : 20px;">원하시는 국가의 환율을 계산해 보세요 :D</h4>
      
      </div>
    </div>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	
		<div class="col-sm-12">
			<div class="jumbotron col-sm-6 col-sm-offset-3 " id="jumbotron" style="align-content: center; background-color: rgba(85, 176, 190, 0.2); padding-bottom: 20px;" >		
				<form class="form-horizontal">
				<div class="col-sm-12">
					<div class="form-group">
						<div class="col-sm-8 col-sm-offset-2" id="standardCountry">
							    <select class="form-control" id="standardCountryValue" >
							     <option value="0">나라를 선택해주세요 :D</option>
									<c:set var="i" value="0" />
					 				 <c:forEach var="currency" items="${returnList}">
					 				 <option value="${currency.cur_nm}" >
					 				 ${currency.cur_nm}
					 				  </option>
					 				 </c:forEach>
								</select>
							</div>
							<div class="col-sm-4 col-sm-offset-4">
					    	</div>
					    <div class="col-sm-8 col-sm-offset-2">
					      <input type="text" class="form-control" id="standard" name="standard" placeholder="금액을 입력해 주세요." >
					    </div>
					 </div>
					 
					 <div class="form-group">
					 	<div class="col-sm-offset-4  col-sm-4 text-center">
					 	<img src="/resources/images/equal-sign.png"/>
					 	</div>
					  </div>
					  
					 <div class="form-group">
					    <div class="col-sm-8 col-sm-offset-2" id="compareCountry">
							    <select class="form-control"  id="compareCountryValue" >
							    <option value="0">나라를 선택해주세요 :D</option>
									<c:set var="i" value="0" />
					 				 <c:forEach var="currency" items="${returnList}">
					 				 <option value="${currency.cur_nm}">
					 				 ${currency.cur_nm}
					 				  </option>
					 				 </c:forEach>
								</select>
							</div>
							<div class="col-sm-4 col-sm-offset-4">
					    	</div>
					    <div class="col-sm-8 col-sm-offset-2">
					      <input type="text" class="form-control" id="compare" name="compare" readOnly="true">
					    </div>
					 </div>
					
						<div class="form-group">
							     <div class="col-sm-offset-4  col-sm-4 text-center">
							      <button class="btn btn-outlined btn-theme btn-sm" id="search" >계 &nbsp;산</button>
							  	</div>
						</div>
					</div>
				</form>
				
			</div>
		</div>		
		<div class="col-sm-offset-10  col-sm-2 text-center">
		      <button class="btn btn-outlined btn-theme btn-xs"  id="htmlToPDF" >PDF저장</button>
			<br/>
		<br/>
		<br/>
		</div>
		
	<table class="type10" style="margin-left: auto; margin-right: auto; text-align: center;" >
      
        <thead>
          <tr>
          	<th scope="row">국가</th>
            <th scope="row" >통화코드</th>
            <th scope="row">매매가격율(원)</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="currency" items="${returnList}">
			<tr>
			  <td scope="row"><strong>${currency.cur_nm}</strong></td>
			  <td scope="row">${currency.cur_unit}</td>
			  <td scope="row">${currency.deal_bas_r}</td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>