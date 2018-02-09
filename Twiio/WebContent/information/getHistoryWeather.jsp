<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">


<head>
	<meta charset="EUC-KR">
	<title>TWIIO Weather</title>
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
	<script src="/resources/chart/Chart.min.js"></script>
	
	<!-- pdf Lib -->
   	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
   	<script src="//cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
  	
  	  	<!-- ---------font ------------ -->
  	<link href="/resources/css/imformation.css" rel="stylesheet" type="text/css" />   

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
			  background-color:#FFF;  
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
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->

<script type="text/javascript">
	function fncSearchHistoryWeather() {
		$("form").attr("method", "GET").attr("action",
				"/information/json/searchHistoryWeather").submit();
	}

	$(function() {
		$("#search").on("click",
						function() {
							var cityName = $("#keyword").val();
							event.preventDefault();
								
 						$.ajax( {
										url : "/information/json/searchHistoryWeather?cityName="+ cityName,
										method : "GET",
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},

										success : function(JSONData, status) {
											var list = JSONData.list;
											var data = JSONData.data;
											var monthin = JSONData.month;
											var min = JSONData.min;
											var max = JSONData.max;
											var rain = JSONData.rain;
 
											 var listtr = null;
											
											for(var i = 0 ; i<5; i++){
												listtr += '<tr id = "listtr"><td id="info">'+list[i]+'</td>'+
														'<td id="data"><strong>'+data[i]+'</strong></td></tr>';
											}
															
										$("#listTbody").html(listtr);
										
											var weatherData = {
													  labels: [
														  "1월", "2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"
													  ],
													  datasets: [{
														  	label: "min temperature",
														    data: max,
														    lineTension: 0,
														    fill: false,
														    borderColor: 'blue',
														    backgroundColor: 'transparent',
														    pointBorderColor: 'blue',
														    pointBackgroundColor: 'rgba(41, 94, 209, 0.4)',
														    borderDash: [5, 5],
														    pointRadius: 5,
														    pointHoverRadius: 10,
														    pointHitRadius: 30,
														    pointBorderWidth: 2,
														    pointStyle: 'rectRounded'
														  },{
															label: "max temperature",
														    data: min,
														    lineTension: 0,
														    fill: false,
														    borderColor: 'red',
														    backgroundColor: 'transparent',
														    pointBorderColor: 'red',
														    pointBackgroundColor: 'rgba(239, 11, 11, 0.4)',
														    borderDash: [5, 5],
														    pointRadius: 5,
														    pointHoverRadius: 10,
														    pointHitRadius: 30,
														    pointBorderWidth: 2,
														    pointStyle: 'rectRounded'
														  }
													  ]
													};
													
													var rainData = {
															  labels: [
																  "1월", "2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"
															  ],
															  datasets: [{
																    label: "rain",
																    data: rain,
																    backgroundColor: "rgba(150,200,250,0.5)",
																    borderColor: "rgba(150,200,250,0.8)"
																  }
															  ]
															};
													
													var chartOptions = {
													  legend: {
													    display: true,
													    position: 'top',
													    labels: {
													      boxWidth: 80,
													      fontColor: 'black'
													    }
													  },
													  scales: {
													    xAxes: [{
													      gridLines: {
													        display: false,
													        color: "black"
													      },
													      scaleLabel: {
													        display: true,
													        fontColor: "red"
													      }
													    }],
													    yAxes: [{
													      gridLines: {
													        color: "rgba(0, 0, 0, 0.31)",
													        borderDash: [2, 5],
													      },
													      scaleLabel: {
													        display: true,
													        fontColor: "green"
													      }
													    }]
													  }
													};
													
													var lineChart = new Chart(weatherChart, {
													  type: 'line',
													  data: weatherData,
													  options: chartOptions
													});
													
													var options = {	animation: false };
													
													var myBarChart  = new Chart(rainChart, {
												        type: 'bar',
												        data: rainData,
												        options: options
													 });
										}
									});
						});
		
		
		$( "#keyword" ).autocomplete({
			
		      source: function( request, response ) {
		    	  $.ajax(
		    				{
		    					url:"/information/json/cityAutoComplete/",
		    					method:"POST",	    					
		    					data:{	    						
		    						keyword:$("#keyword").val()		    						
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
		      minLength:3
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
		<h2 align="center"><strong><ins>ABOUT WEATHER</ins></strong></h2>

		<form class="form-horizontal">
		  <div class="form-group">
		    <div class="col-sm-4 col-sm-offset-4 text-center">
		      <input type="text" class="form-control" id="keyword" name="keyword" value="Seoul">
		    </div>
		  </div>
		    
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-outlined btn-theme btn-sm" id="search"  >검 &nbsp;색</button>
		    </div>
		  </div>
		</form>	
		
		<div class="col-sm-offset-10  col-sm-2 text-center">
		      <button class="btn btn-outlined btn-theme btn-xs"  id="htmlToPDF" >PDF저장</button>
		</div>
			
			
			<table class="type10" style="margin-left: auto; margin-right: auto; text-align: center;">
			 	<thead>
		          <tr>
		            <th colspan="2">Quick Climate Info</th>
		          </tr>
		        </thead>
		       
				<tbody id="listTbody">
				  <c:set var="i" value="0" />
				  <c:forEach  items="${list}" varStatus="status">
					<tr id = "listtr">
					  <td id="info">${list[status.index]}</td>
					  <td id="data"><strong>${data[status.index]}</strong></td>
					</tr>
		          </c:forEach>
		        </tbody>
		      </table>
							
	<%-- 	<table class="table table-hover table-striped"  >
      
        <thead>
          <tr>
            <th align="left">달</th>
            <th align="left">최고기온</th>
            <th align="left">최저기온</th>
            <th align="left">강수량</th>
            
          </tr>
        </thead>
       
		<tbody id="dataTbody">
		
		
		<c:forEach items="${month}" varStatus="status">
			<tr id="monthtr">
			 <td align="center" id="month">${month[status.index]}</td>
			 <td align="center" id="min">${min[status.index]}</td>
			 <td align="center" id="max">${max[status.index]}</td>
			 <td align="center" id="rain">${rain[status.index]}</td>
			</tr>	
		</c:forEach>
        </tbody>
      
      </table> --%>
      
		      <div class="chart-container" style="position: relative; width:70vw;  padding-right: 100px;">	
		     	 <canvas id="weatherChart" width="600" height="400"></canvas>
		      </div>
		      
		      <div class="chart-container" style="position: relative; width:70vw;  padding-right: 100px;">	
		     	 <canvas id="rainChart" width="600" height="400"></canvas>
		     </div>
     
    <br/>
	<br/>

		</div>
		<br/>
		<br/>
	
	<script>

	var weatherChart = $("#weatherChart");
	var rainChart = $("#rainChart");
	//var resultDate = "${resultDate}";
	var min = ${min};
	var max = ${max};
	var rain = ${rain}; 

	Chart.defaults.global.defaultFontFamily = "Lato";
	Chart.defaults.global.defaultFontSize = 10;
	
	var weatherData = {
	  labels: [
		  "1월", "2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"
	  ],
	  datasets: [{
		  	label: "min temperature",
		    data: max,
		    lineTension: 0,
		    fill: false,
		    borderColor: 'blue',
		    backgroundColor: 'transparent',
		    pointBorderColor: 'blue',
		    pointBackgroundColor: 'rgba(41, 94, 209, 0.4)',
		    borderDash: [5, 5],
		    pointRadius: 5,
		    pointHoverRadius: 10,
		    pointHitRadius: 30,
		    pointBorderWidth: 2,
		    pointStyle: 'rectRounded'
		  },{
			label: "max temperature",
		    data: min,
		    lineTension: 0,
		    fill: false,
		    borderColor: 'red',
		    backgroundColor: 'transparent',
		    pointBorderColor: 'red',
		    pointBackgroundColor: 'rgba(239, 11, 11, 0.4)',
		    borderDash: [5, 5],
		    pointRadius: 5,
		    pointHoverRadius: 10,
		    pointHitRadius: 30,
		    pointBorderWidth: 2,
		    pointStyle: 'rectRounded'
		  }
	  ]
	};
	
	var rainData = {
			  labels: [
				  "1월", "2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"
			  ],
			  datasets: [{
				    label: "rain",
				    data: rain,
				    backgroundColor: "rgba(150,200,250,0.5)",
				    borderColor: "rgba(150,200,250,0.8)"
				  }
			  ]
			};
	
	var chartOptions = {
	  legend: {
	    display: true,
	    position: 'top',
	    labels: {
	      boxWidth: 80,
	      fontColor: 'black'
	    }
	  },
	  scales: {
	    xAxes: [{
	      gridLines: {
	        display: false,
	        color: "black"
	      },
	      scaleLabel: {
	        display: true,
	        fontColor: "red"
	      }
	    }],
	    yAxes: [{
	      gridLines: {
	        color: "rgba(0, 0, 0, 0.31)",
	        borderDash: [2, 5],
	      },
	      scaleLabel: {
	        display: true,
	        fontColor: "green"
	      }
	    }]
	  }
	};
	
	var lineChart = new Chart(weatherChart, {
	  type: 'line',
	  data: weatherData,
	  options: chartOptions
	});
	
	var options = {	animation: false };
	
	var myBarChart  = new Chart(rainChart, {
        type: 'bar',
        data: rainData,
        options: options
	 });
</script>
</body>
</html>