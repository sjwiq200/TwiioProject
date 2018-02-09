<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title>TWIIO Weather</title>
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
			    background: #D73A31;
			    border-color: #D73A31;
			}
			
			.btn-outlined.btn-light {
			    background: #f4f4f4;
			    color: #D73A31;
				border-color: #D73A31;
			}
			
			.btn-xs{
				font-size:11px;
				line-height:14px;
				border: 1px solid;
				padding:5px 10px;
			}
		
			.form-horizontal {
				padding-left: 17%;
			}
			
			.pageButton-group {
				aria-label: "Right Align";
			}
			.jumbotron {
	        	border: 2px solid rgba(215, 58, 49, 0.8);
	       }
</style>


<!--  ///////////////////////// JavaScript ////////////////////////// -->

<script type="text/javascript">

	function fncSearchNowWeather() {
		$("form").attr("method", "GET").attr("action",
				"/imformation/json/searchNowWeather").submit();
	}

	$(function() {
		
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
		
		
		/* 
		$( "#keyword"  ).on("change" , function() {
			
			var cityName = $("#keyword").val();
			
			alert(cityName);
			
			$.ajax( 
					
					{
						url : "/information/json/searchNowWeather?cityName="
								+ cityName,
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},

						success : function(JSONData, status) {
							var fahrenheit = JSONData.temp;
							var celsius = Math
									.round((fahrenheit - 273));
							var celsiusMin = Math
									.round((JSONData.temp_min) - 273);
							var celsiusMax = Math
									.round((JSONData.temp_max) - 273);
							var mainWeather = JSONData.weatherResult;
							

							/* displayValue = "<blockquote class=\"blockquote-reverse\">"
									+	"온도 : "+ celsius+ "℃<br/>"+ "최저온도 : "		+ celsiusMin+ "℃<br/>"
									+ "최고온도 : "	+ celsiusMax+ "℃<br/>"
									+ "습도 : "+ JSONData.weatherMain.humidity	+ "<br/>"
									+ "기압 : "+ JSONData.weatherMain.pressure+ "<br/>"
									+ "</blockquote>"

							$("#result").html(displayValue)
									.css("background-color",
											"white")
									.css("color", "#003366	"); */
									
						/*	$("#temp").html(celsius);	
							$("#pressure").html(JSONData.pressure);	
							$("#humidity").html(JSONData.humidity);	
							$("#temp_min").html(celsiusMin);	
							$("#temp_max").html(celsiusMax);	
						}
					});
		
		}); */
		

		$( "#search"  ).on("click" , function() {
			
			var cityName = $("#keyword").val();
			$.ajax( 
					{
						url : "/information/json/searchNowWeather?cityName="
								+ cityName,
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},

						success : function(JSONData, status) {
							
							var resultTemp = JSONData.resultTemp;
							var resultDate = JSONData.resultDate;
							
							var weatherData = {
									  labels: [
										   resultDate[0]+" 최저기온", resultDate[1]+" 최고기온", resultDate[2]+" 최저기온", resultDate[3]+" 최고기온", resultDate[4]+" 최저기온", resultDate[5]+" 최고기온", 
										  resultDate[6]+" 최저기온", resultDate[7]+" 최고기온", resultDate[8]+" 최저기온", resultDate[9]+" 최고기온"
									  ],
									  datasets: [{
									    label: "temperature",
									    data: resultTemp,
									    lineTension: 0,
									    fill: true,
									    fillColor: 'rgba(215, 58, 49, 0.8)' ,
									    borderColor: '#D73A31',
									    backgroundColor: 'transparent',
									    pointBorderColor: '#D73A31',
									    pointBackgroundColor: 'rgba(215, 58, 49, 0.8)',
									    borderDash: [5, 5],
									    pointRadius: 5,
									    pointHoverRadius: 10,
									    pointHitRadius: 30,
									    pointBorderWidth: 2,
									    pointStyle: 'rectRounded'
									  }]
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
									    }],
									    scales: { yAxes: [{ ticks: { beginAtZero:true } }] }
									  }
									};
							var lineChart = new Chart(popChart, {
								  type: 'line',
								  data: weatherData,
								  options: chartOptions
								});
							
							
						}
					});
		
		});
		
		$("button:contains('이전 날씨 검색 하러가기')")
		.on("click",function() {
			self.location = "/information/searchHistoryWeather?cityName="+$("#keyword").val();
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
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////
	
</script>

</head>

<body>


	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->

	<div class="container">

		<h2 align="center"><strong><ins>ABOUT WEATHER</ins></strong></h2>
		
	
	<form class="form-horizontal">
		  <div class="form-group">
		    <div class="col-sm-4 col-sm-offset-3 text-center">
		      <input type="text" class="form-control" id="keyword" name="keyword" value="Seoul">
		    </div>
		  </div>
		    
		  <div class="form-group">
		    <div class="col-sm-offset-3  col-sm-4 text-center">
		      <button type="button" class="btn btn-outlined btn-theme btn-sm" id="search"  >검 &nbsp;색</button>
		    </div>
		  </div>
	</form>	

		<div class="jumbotron col-sm-12" id="jumbotron" style="align-content: center; background-color: rgba(247, 243, 243, 0.3);" >		
			<div class="chart-container" style="position: relative; width:70vw; padding-right: 100px;">		
				<canvas id="popChart"></canvas>
			</div>
		</div>

	<%-- <table class="table table-hover table-striped" >
      <thead>
          <tr>
            <th colspan="2" align="center">현재날씨</th>
          </tr>
        </thead>
       
		<tbody>
			<tr>
			  <td align="center">기온</td>
			  <td align="center" id = temp>${result.temp}</td>
			</tr>
			<tr>
			  <td align="center">기압</td>
			  <td align="center" id="pressure">${result.pressure}</td>
			</tr>
			<tr>
			  <td align="center">습도</td>
			  <td align="center" id="humidity">${result.humidity}</td>
			</tr>
			<tr>
			  <td align="center">최저온도</td>
			  <td align="center" id=temp_min>${result.temp_min}</td>
			</tr>
			<tr>
			  <td align="center">최고온도</td>
			  <td align="center" id="temp_max">${result.temp_max}</td>
			</tr>
        </tbody>
      </table>	 --%>
      
      <div class="col-sm-offset-10  col-sm-2 text-center">
		      <button class="btn btn-outlined btn-theme btn-xs"  id="htmlToPDF" >PDF저장</button>
		</div>
			
			
		<div class="col-xs-8 col-xs-offset-5">	
			
			<button type="button" class="btn btn-outlined btn-light btn-sm" aria-label="Left Align">
				이전 날씨 검색 하러가기
			</button>
		
		</div>
		
		<br/>
		<br/>
		<br/>
		
		
	</div>
	<br/>
		<br/>
		<br/>
	
	<script>

	var popChart = $("#popChart")
	//var resultDate = "${resultDate}";
	var resultTemp = ${resultTemp};
	 

	Chart.defaults.global.defaultFontFamily = "Lato";
	Chart.defaults.global.defaultFontSize = 10;
	
	var weatherData = {
	  labels: [
		  "${resultDate[0]} 최고기온", "${resultDate[1]} 최저기온", "${resultDate[2]} 최고기온", "${resultDate[3]} 최저기온", "${resultDate[4]} 최고기온", "${resultDate[5]} 최저기온", 
		  "${resultDate[6]} 최고기온", "${resultDate[7]} 최저기온", "${resultDate[8]} 최고기온", "${resultDate[9]} 최저기온"
	  ],
	  datasets: [{
	    label: "temperature",
	    data: resultTemp,
	    lineTension: 0,
	    fillColor: 'rgba(215, 58, 49, 0.8)' ,
	    borderColor: '#D73A31',
	    backgroundColor: 'transparent',
	    pointBorderColor: '#D73A31',
	    pointBackgroundColor: 'rgba(215, 58, 49, 0.8)',
	    borderDash: [5, 5],
	    pointRadius: 5,
	    pointHoverRadius: 10,
	    pointHitRadius: 30,
	    pointBorderWidth: 2,
	    pointStyle: 'rectRounded'
	  }]
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
	        color: "rgba(0, 0, 0, 0.8)",
	        borderDash: [2, 5],
	      },
	      scaleLabel: {
	        display: true,
	        fontColor: "green"
	      }
	    }],
	    scales: { yAxes: [{ ticks: { beginAtZero:true } }] }
	  }
	};
	
	var lineChart = new Chart(popChart, {
	  type: 'line',
	  data: weatherData,
	  options: chartOptions
	});
</script>



</body>

</html>