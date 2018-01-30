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

<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI toolTip 사용 CSS-->

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
	function fncSearchNowWeather() {
		$("form").attr("method", "GET").attr("action",
				"/imformation/json/searchNowWeather").submit();
	}

	$(function() {
		
		
		
		/* $("button:contains('검색')")
				.on(
						"click",
						function() {
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
											var fahrenheit = JSONData.weatherMain.temp;
											var celsius = Math
													.round((fahrenheit - 273));
											var celsiusMin = Math
													.round((JSONData.weatherMain.temp_min) - 273);
											var celsiusMax = Math
													.round((JSONData.weatherMain.temp_min) - 273);
											var mainWeather = JSONData.weatherResult;

											displayValue = "<blockquote class=\"blockquote-reverse\">"
													+	"온도 : "+ celsius+ "℃<br/>"+ "최저온도 : "		+ celsiusMin+ "℃<br/>"
													+ "최고온도 : "	+ celsiusMax+ "℃<br/>"
													+ "습도 : "+ JSONData.weatherMain.humidity	+ "<br/>"
													+ "기압 : "+ JSONData.weatherMain.pressure+ "<br/>"
													+ "</blockquote>"

											$("#result").html(displayValue)
													.css("background-color",
															"white")
													.css("color", "#003366	");
										}
									});
						}); */
		
		$( "#keyword" ).autocomplete({
			
		      source: function( request, response ) {
		    	  //alert("제발요");
		    	  //alert($("#searchCondition").val());
		    	  //alert($("#searchKeyword").val());
		    	  $.ajax(
		    				{
		    					url:"/information/json/cityAutoComplete/",
		    					method:"POST",	    					
		    					data:{	    						
		    						keyword:$("#keyword").val()		    						
		    						},
		    					dataType:"json",
		    					success:function(JSONData){
		    						//alert("제발ajax");	    											
		    						//alert("JSONData: \n"+JSONData);
		    							    							    						
		    						response($.map(JSONData, function (item) {
		    				           
		    							return item;
		    				        }));
		    					}
		    				}
		    			);
		    	  
		    	  //alert("제발요");
		      },
		      minLength:3
		    });
		
		
		
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
									
							$("#temp").html(celsius);	
							$("#pressure").html(JSONData.pressure);	
							$("#humidity").html(JSONData.humidity);	
							$("#temp_min").html(celsiusMin);	
							$("#temp_max").html(celsiusMax);	
						}
					});
		
		});
		
		$("button:contains('이전 날씨 검색 하러가기')")
		.on("click",function() {
			self.location = "/information/searchHistoryWeather?cityName="+$("#keyword").val();
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
			<h3 class=" text-info">세계 현재 날씨 확인하기</h3>
			<h5 class="text-muted">원하는 도시명을 선택해주시기 바랍니다.</h5>
		
		</div>
		

		<div class="form-group">
			<label for="paymentOption" class="col-sm-2 control-label">
				도시명 </label>
			<div class="col-sm-6">
				<!-- <select name="cityName" class="ct_input_g" id="cityName"
					style="width: 100px; height: 19px" maxLength="20">
					<option id="Paris" value="Paris" selected="selected">Paris</option>
					<option id="Seoul" value="Seoul">Seoul</option>
					<option id="Jeju" value="Jeju">Jeju</option>
					<option id="London" value="London">London</option>
					<option id="Tokyo" value="Tokyo">Tokyo</option>
					<option id="NewYork" value="NewYork">NewYork</option>
					<option id="Sydney" value="Sydney">Sydney</option>



				</select>
 -->
 
 			<input type="text" class="form-control" id="keyword" name="keyword" value="Seoul"  >
 
			</div>

		</div>

		<div class="pageButton-group" align="center">

			<button type="button" class="btn btn-default"
				aria-label="Right Align">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"
					id="submit"></span> 검색
			</button>

	<table class="table table-hover table-striped" >
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
      
      </table>	
			
			
		<div class="col-sm-10">	
			
			<button type="button" class="btn btn-default"aria-label="Left Align">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>이전 날씨 검색 하러가기
			</button>
		
		</div>


		</div>

	</div>

</body>

</html>