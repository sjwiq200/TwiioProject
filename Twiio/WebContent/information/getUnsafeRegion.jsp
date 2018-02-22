<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">


<head>
	<meta charset="EUC-KR">
	<title>TWIIO UnsafeRegion</title>
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
  	
  	<!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
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
			 #info
			{	
				  border-radius: 23px;
				  border: 3px solid #FFF;
				  background: rgba(255, 255, 255, 0.5);
			} 
			
			 h3 {
				font-size: 1em;
				font-family: "Source Sans Pro", Helvetica, sans-serif !important;
			}
			.ui-autocomplete { max-height: 200px; overflow-y: scroll; overflow-x: hidden;}
			
			 #jumbotron{
				 	border-radius: 23px;
				 	border: dashed rgba(85, 176, 190, 1) 2px;
				 	
				  }
			
			 #head{
		  		background-image: url("/resources/images/unsafeRe.png");
		  		font-family: "Pacifico", cursive;
		  		height : 250px;
		  		margin-bottom : 20px;
		  }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(function() {
			
		 $("button#search").on("click" , function() {
			var city = $("#city").val();
			if(city.match(/[0-9]|[a-z]|[A-Z]/)){
				swal({
					  title: "한글 국가명만 입력 가능합니다 :D",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
			
					$("#city").val("");
			}else{
			
				event.preventDefault();
			 $.ajax(
	    				{
	    					url:"/information/json/getUnsafeRegion",
	    					method:"POST",
	    					data:{
	    						"city" : city
	    					},
	    					dataType: "json",
	    					contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	    					headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},

	    					success:function(JSONData){
	    						
	    						if(JSONData.noCountry=='noCountry'){
	    							swal({
	    								  title: "일치하는 국가정보가 없습니다. 다시 입력해 주세요:D",
	    								  icon: "warning",
	    								  buttons: true,
	    								  dangerMode: true,
	    								})
	    								
	    								$("#city").val("");
	    						}else{
	    						
						    						var img = JSONData.img;
													var info = JSONData.info;
													
													if(img=='none'){
														
														img = "/resources/images/no_info2.png";
														
														$("#image").html('<div class="col-sm-12" align="center"><img src="'+img+'" style="width: 600px; height: 400px; max-width:100%; max-height:100%;"/></div>');
														$("#jumbotron").attr("style","wheight: 500px; max-width:100%; max-height:100%; align-content: center; background-color: #f4f4f4; border: dashed #f4f4f4 2px;");
														$("#jumbotron").attr("class","jumbotron col-sm-10 col-sm-offset-1");
														$("#dangerIcon").hide();
													}else{
														$("#image").html('<div class="col-sm-12" align="center"><img src="'+img+'" style="width: 600px; height: 500px; max-width:100%; max-height:100%;"/></div>');
														$("#dangerIcon").show();
														$("#jumbotron").attr("style","height: 700px; max-width:100%; max-height:100%; align-content: center; background-color: rgba(86, 177, 191, 0.5);");
														$("#jumbotron").attr("class","jumbotron col-sm-10 col-sm-offset-1");
														
													}
													
												$("#info").html(info+"<br/><br/><br/><br/>");
	    								}	
			    					}
			    				}
			    			);
		 				}	
				    });
		 
		 
		 
		 $( "#city" ).autocomplete({
				
		      source: function( request, response ) {
		    	  $.ajax(
		    				{
		    					url:"/information/json/countryAutoComplete/",
		    					method:"POST",	    					
		    					data:{	    						
		    						keyword:$("#city").val()		    						
		    						},
		    					dataType:"json",
		    					success:function(JSONData){
		    							    							    						
		    						response($.map(JSONData, function (item) {
		    				           
		    							return item;
		    				        }));
		    					}
		    				}
		    			);
		     	 },
		     
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
				
				        doc.save('file.pdf');
				
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
		
	
	$(function(){
		$("#city").keydown(function(e) {
			if (e.keyCode == 13) {
				
				$("#search").click();
			}
		});			

	});
			
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	<div id="mask"></div>
	
	<div class="jumbotron"  id="head" style="align-content: center; padding-bottom: 20px; text-shadow: 0 5px 5px rgba(0, 0, 0, .1); ">
      <div class="container" id="container">
      
      <h2 align="center"  style=" margin-top : 50px;" ><strong style="color : #fff;  font-size: 1.5em; margin-bottom : 15px;"><ins>ABOUT UNSAFEREGION</ins></strong></h2>
	  <h4 align="center" style="font-family:'TYPO_JEONGJOM'; color : #FFF; margin-top : 20px;">전세계 안전 정보를 확인해 보세요 :D</h4>
      
      </div>
    </div>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<form class="form-horizontal">
		  <div class="form-group" align="center">
		    <div class="col-sm-4 col-sm-offset-4">
		      <input type="text" class="form-control" id="city" name="city" placeholder="나라명을 입력해 주세요.">
		    </div>
		  </div>
		  
		    
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-outlined btn-theme btn-sm" id="search">검 &nbsp;색</button>
		    </div>
		  </div>
	</form>
	
		<div class="col-sm-12">
			<div class="jumbotron col-sm-10 col-sm-offset-1" id="jumbotron" style="height: 500px; max-height:100%; align-content: center; background-color: rgba(86, 177, 191, 0.6);" >	
				<div class="image" id="image">	
				<br/> 
					<div class="col-sm-12" align="center">
						<img src="http://www.0404.go.kr/images/main/img_map.png"  style="width: 700px; max-width:100%; height: 300px; max-height:100%;"/>
					</div>
			</div>
					
				<div align="center" id="dangerIcon" style="max-width:100%; max-height:100%;">
					<br/> 
					<img src="/resources/images/img_blue.png" style="max-width:100%; max-height:100%;"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="/resources/images/img_yellow.png" style="max-width:100%;  max-height:100%;"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="/resources/images/img_red.png" style="max-width:100%;  max-height:100%;"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="/resources/images/img_black.png" style="max-width:100%; max-height:100%;"/>&nbsp;&nbsp;
					<img src="/resources/images/img_lock_red.png" style="max-width:100%; max-height:100%;"/>&nbsp;&nbsp;
					<img src="/resources/images/img_lock_black.png" style="max-width:100%; max-height:100%;"/>
				</div>
			</div>	
			
			
			
			<div class="col-sm-offset-10  col-sm-2 text-center">
				      <button class="btn btn-outlined btn-theme btn-xs"  id="htmlToPDF" >PDF저장</button>
			</div>	
			
			<br/><br/>
			<br/><br/>
			<br/>
			
			
			<div class="col-sm-12" id="info" style="padding : 50px; margin-top : 10px; font-family:'TYPO_JEONGJOM'; "></div>
				<br/>    
		 		</div>
		 
		 </div>
		 		
			<!--  화면구성 div Start /////////////////////////////////////-->
		 		<br/><br/>
				<br/><br/>
				<br/> 
	</body>

</html>