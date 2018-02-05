<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">


<head>
<meta charset="EUC-KR">

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

   
	<!--  ///////////////////////// CSS ////////////////////////// -->
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
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(function() {
			
		 $("button#search").on("click" , function() {
			var city = $("#city").val();
			event.preventDefault();
			 $.ajax(
	    				{
	    					url:"/information/json/listNightLife",
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
	    						
	    						var name = JSONData.name;
								var no = JSONData.no;
								var type = JSONData.type;
								var url = JSONData.url;
								var image = JSONData.image;
								var list = null;
								
								for(var i = 0 ; i<name.length; i++){
									
									/* list += '<tr><td align="center" id="img"><img src="'+image[i]+
									'"  style="width: 200px; height: 150px;"/></td>'+
									'<td align="center" id="con"><a href="'+url[i]+
									'" target="_blank" >'+no[i]+'<br>'+name[i]+'<br>'+type[i]+'</td></a></tr>'; */
									
									list += '<tr><td align="center" id="img"><img src="'+image[i]+
									'"  style="width: 200px; height: 150px;"/></td>'+
									'<td align="center" id="con"><input type="hidden" id="info" value="'+url[i]+
									'" />'+no[i]+'<br>'+name[i]+'<br>'+type[i]+'</td></tr>'; 
									
								}
							$("#listTbody").html(list);
	    						
			    					}
			    				}
			    			);
				    });
		 
		 
		 
		 $(document).on("click","td:nth-child(2)" , function(){
				var url = $($("input#info")[$("td:nth-child(2)").index(this)]).val();  
				
				$("#detailUrl").val(url);
				
				$("form").attr("method" , "POST").attr("action" , "/information/getNightLifeDetail/").submit();
				   
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
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	
	<div class="page-header text-info">
	       <h3>NIGHTLIFE 정보 조회</h3>
	</div>
		
		  <!-- <div class="form-group">
		    <label for="city" class="col-sm-offset-1 col-sm-3 control-label">도시명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="city" name="city" placeholder="도시명을 입력해 주세요.">
		    </div>
		  </div>
		  
		    
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >검 &nbsp;색</button>
		    </div>
		  </div> -->
		  <div  class="col-md-8 col-md-offset-2">
             <form>
             <input type="hidden" id="detailUrl" name="detailUrl" value=""/>
              <div class="input-group">
                 <input class="form-control" name="city" id="city" type="text" placeholder="도시명을 입력해 주세요." >
                 <button class="btn btn-outlined btn-theme btn-sm" type="submit" id="search">검 &nbsp;색</button>
              </div>
             </form>
    	 </div>
		  
		
		<table class="table table-hover table-striped" style="margin-left: auto; margin-right: auto; text-align: center;">
		
	        <thead>
	          <tr>
	            <th align="left">사진</th>
	            <th align="left">정보</th>
	          </tr>
	        </thead>
	       
			
			
				<tbody id="listTbody">
					<tr>
					 <td align="center" id="img"></td>
					 <td align="center" id="con"></td>
					</tr>
		        </tbody>
	      
	      	</table>
	
	    
 		</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
	</body>

</html>