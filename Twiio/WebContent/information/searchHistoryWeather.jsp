<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">


<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
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

<!-- jQuery UI toolTip ��� CSS-->

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- jQuery UI toolTip ��� JS-->
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
											var history = JSONData.historyWeather;
										
											 
											/* displayValue = "<a class=\"blockquote-reverse\">"
													+	"���ܳ���Ȯ�� : <h5>&nbsp;</h5>"+ quickWeatehrInfo+ "��<br/>"+
													"<h5>&nbsp;</h5><h5>&nbsp;</h5><h5>&nbsp;</h5>"+
													"1�� - 12�� ���� ���� : <h5>&nbsp;</h5>"	+ history+ "��<br/>"
													+ "</a>"
											$("#result").html(displayValue)
													.css("background-color",
															"white")
													.css("color", "#003366	"); */
													
											$("#info").html(simple);	
										/* 	$("#pressure").html(JSONData.pressure);	
											$("#humidity").html(JSONData.humidity);	
											$("#temp_min").html(celsiusMin);	
											$("#temp_max").html(celsiusMax); */
										}
									});
						});
		
		
		$( "#keyword" ).autocomplete({
			
		      source: function( request, response ) {
		    	  //alert("���߿�");
		    	  //alert($("#searchCondition").val());
		    	  //alert($("#searchKeyword").val());
		    	  $.ajax(
		    				{
		    					url:"/information/json/autoComplete/",
		    					method:"POST",	    					
		    					data:{	    						
		    						keyword:$("#keyword").val()		    						
		    						},
		    					dataType:"json",
		    					success:function(JSONData){
		    						//alert("����ajax");	    											
		    						//alert("JSONData: \n"+JSONData);
		    							    							    						
		    						response($.map(JSONData, function (item) {
		    				           
		    							return item;
		    				        }));
		    					}
		    				}
		    			);
		    	  
		    	  //alert("���߿�");
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
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

	<div class="container">
		<h5>&nbsp;</h5>

		<div class="page-header">
			<h3 class=" text-info"> ���� �����ϰ� ���� ������ ���� ������ Ȯ���غ����� :D ��</h3>
			<h5 class="text-muted">���ϴ� ���ø��� �������ֽñ� �ٶ��ϴ�.</h5>
		</div>


		<div class="form-group">
			<label for="paymentOption" class="col-sm-2 control-label">
				���ø� </label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="keyword" name="keyword"  >
			</div>
		</div>
		<div class="pageButton-group" align="center">

			<button type="button" class="btn btn-default" id="search"
				aria-label="Right Align">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"
					id="submit">�˻�</span> 
			</button>
			
			
			<table class="table table-hover table-striped" >
			 	<thead>
		          <tr>
		            <th align="center">Quick Climate Info</th>
		          </tr>
		        </thead>
		       
				<tbody>
				  <c:set var="i" value="0" />
				  <c:forEach var="list" items="${list}">
					<tr>
					  <td align="center" id="info">${list}</td>
					</tr>
		          </c:forEach>
		        </tbody>
		      </table>
							
			<table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="left">��</th>
            <th align="left">�ְ���</th>
            <th align="left">�������</th>
            <th align="left">������</th>
            
          </tr>
        </thead>
       
		<tbody>
		 <%--  <c:forEach var="abc" items="${abc}">
			<tr>
			<c:forEach var="abc" items="${abc}">
			 <td align="center">${abc}</td>
			 </c:forEach>
			
			 <td align="center">${abc[status.index].min}</td>
			 <td align="center">${abc[status.index].max}</td>
			 <td align="center">${abc[status.index].rain}</td>
			</tr>	
		</c:forEach> --%>
		
		
		
		<c:forEach items="${month}" varStatus="status">
			<tr>
			 <td align="center">${month[status.index]}</td>
			 <td align="center">${min[status.index]}</td>
			 <td align="center">${max[status.index]}</td>
			 <td align="center">${rain[status.index]}</td>
			 
			</tr>	
		</c:forEach>
        </tbody>
      
      </table>


		</div>
	</div>
</body>
</html>