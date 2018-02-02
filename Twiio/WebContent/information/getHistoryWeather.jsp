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
<script src="/resources/chart/Chart.min.js"></script>


<!--  ///////////////////////// 추가 ////////////////////////// -->
   			
   			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>
			<link rel="stylesheet" href="/resources/assets/css/main.css" />

<!--  ///////////////////////// CSS ////////////////////////// -->

<style>
	body {
		padding-top: 50px;
		font-color: gray;
	}
	
	.form-horizontal {
		padding-left: 17%;
	}
	
	.pageButton-group {
		aria-label: "Right Align";
	}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->

<script type="text/javascript">
	function fncSearchHistoryWeather() {
		$("form").attr("method", "GET").attr("action",
				"/information/json/searchHistoryWeather").submit();
	}

	$(function() {
		$("#submit").on("click",
						function() {
							var cityName = $("#keyword").val();
							alert(cityName);
							
 						$.ajax( {
										url : "/information/json/searchHistoryWeather?cityName="+ cityName,
										method : "GET",
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},

										success : function(JSONData, status) {
											var simple = JSONData.list;
											var monthin = JSONData.month;
											var min = JSONData.min;
											var max = JSONData.max;
											var rain = JSONData.rain;
 
											 var listtr = null;
											
											for(var i = 0 ; i<5; i++){
												listtr += '<tr id = "listtr"><td align="center" id="info">'+simple[i]+'</td>';
											}
											/* var month = null;
											
											for(var i = 0 ; i<12; i++){
												
												month += '<tr id="monthtr"><td align="center" id="month">'+monthin[i]+
												'</td>'+'<td align="center" id="min">'+min[i]+'</td>'+'<td align="center" id="max">'+max[i]+
												'</td>'+'<td align="center" id="rain">'+rain[i]+'</td></tr>';
											} */
															
										$("#listTbody").html(listtr);
										//$("#dataTbody").html(month);
										
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
														    pointBackgroundColor: 'rgba(255,150,0,0.5)',
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
														    pointBackgroundColor: 'rgba(255,150,0,0.5)',
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
																    lineTension: 0,
																    fill: true,
																    borderColor: 'green',
																    backgroundColor: 'transparent',
																    pointBorderColor: 'green',
																    pointBackgroundColor: 'rgba(255,150,0,0.5)',
																    borderDash: [5, 5],
																    pointRadius: 5,
																    pointHoverRadius: 10,
																    pointHitRadius: 30,
																    pointBorderWidth: 2,
																    pointStyle: 'rectRounded'
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
													        color: "black",
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
													
													var lineChart2 = new Chart(rainChart, {
														  type: 'line',
														  data: rainData,
														  options: chartOptions
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
		
	});
</script>
</head>
<body>


	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
 	<!--  화면구성 div Start /////////////////////////////////////-->

	<div class="container">
		<h5>&nbsp;</h5>

		<div class="page-header">
			<h3 class=" text-info"> 내가 여행하고 싶은 도시의 과거 날씨를 확인해보세요 :D ♡</h3>
			<h5 class="text-muted">원하는 도시명을 선택해주시기 바랍니다.</h5>
		</div>


		<div class="form-group">
			<label for="paymentOption" class="col-sm-2 control-label">
				도시명 </label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="keyword" name="keyword"  >
			</div>
		</div>
		<div class="pageButton-group" align="center">

			<button type="button" class="btn btn-default" id="search"
				aria-label="Right Align">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"
					id="submit">검색</span> 
			</button>
			
			
			<table class="table table-hover table-striped" >
			 	<thead>
		          <tr>
		            <th align="center">Quick Climate Info</th>
		          </tr>
		        </thead>
		       
				<tbody id="listTbody">
				  <c:set var="i" value="0" />
				  <c:forEach var="list" items="${list}">
					<tr id = "listtr">
					  <td align="center" id="info">${list}</td>
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
      
      <canvas id="weatherChart" width="600" height="400"></canvas>
      
      <canvas id="rainChart" width="600" height="400"></canvas>


		</div>
	</div>
	
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
		    pointBackgroundColor: 'rgba(255,150,0,0.5)',
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
		    pointBackgroundColor: 'rgba(255,150,0,0.5)',
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
				    lineTension: 0,
				    fill: true,
				    borderColor: 'green',
				    backgroundColor: 'transparent',
				    pointBorderColor: 'green',
				    pointBackgroundColor: 'rgba(255,150,0,0.5)',
				    borderDash: [5, 5],
				    pointRadius: 5,
				    pointHoverRadius: 10,
				    pointHitRadius: 30,
				    pointBorderWidth: 2,
				    pointStyle: 'rectRounded'
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
	        color: "black",
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
	
	var lineChart2 = new Chart(rainChart, {
		  type: 'line',
		  data: rainData,
		  options: chartOptions
		});
</script>
</body>
</html>