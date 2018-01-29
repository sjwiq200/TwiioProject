<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


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

    <!-- Bootstrap Dropdown Hover JS -->
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
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

		
		 $("button.btn.btn-primary").on("click" , function() {
			 
			var flightType = $("#flightType").val();
			var departure = $("#departure").val();
			var arrival = $("#arrival").val();
			var departureDate = $("#departureDate").val();
			var arrivalDate = $("#arrivalDate").val();
			var headCount = $("#headCount").val();
			
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
			    					async:false,
			    					success:function(JSONData){
			    						var info = JSONData.info;
										var price = JSONData.price;
										var type = JSONData.type;
											currentUrls = JSONData.currentUrl[0];
										var list = null;
										
										for(var i = 0 ; i<info.length; i++){
											
											list += '<tr><td align="center">'+(i+1)+'</td>'+
											'<td align="center" id="info">'+info[i]+
											'</td>'+'<td align="center" id="type">'+type[i]+
											'</td>'+'<td align="center" id="price">'+price[i]+
											'<td align="center" id="new"><button type="button" class="btn btn-success" id="newpick">선&nbsp;택</button></td></tr>';
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
	       <h3>비행기 정보 조회</h3>
	</div>
	
	
		<form class="form-horizontal">
		<input type="hidden" id="clickNum" name="clickNum" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="returnInfo" name="returnInfo" value=""/>
		<input type="hidden" id="returnType" name="returnType" value=""/>
		<input type="hidden" id="returnPrice" name="returnPrice" value=""/>
		
		
		  <div class="form-group">
		    <label for="flightType" class="col-sm-offset-1 col-sm-3 control-label">비행유형</label>
		    <div class="col-sm-2">
		      <select class="form-control" name="flightType" id="flightType">
				  	<option value="return" selected="selected" >왕복</option>
					<option value="oneway" >편도</option>
				</select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="departure" class="col-sm-offset-1 col-sm-3 control-label">출발지</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="departure" name="departure" placeholder="출발지">
		    </div>
		    
		    </div>
		  
		  <div class="form-group">
		    
		    <label for="arrival" class="col-sm-offset-1 col-sm-3 control-label">도착지</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="arrival" name="arrival" placeholder="도착지">
		    </div>
		    
		  </div>
		  
		  <div class="form-group">
		    <label for="departureDate" class="col-sm-offset-1 col-sm-3 control-label">가는날</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="departureDate" name="departureDate">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="arrivalDate" class="col-sm-offset-1 col-sm-3 control-label">오는날</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="arrivalDate" name="arrivalDate">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="headCount" class="col-sm-offset-1 col-sm-3 control-label">인원</label>
		     <div class="col-sm-2">
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
		    
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >검 &nbsp;색</button>
		    </div>
		  </div>
		</form>
		
		    <h4>가는 편 비행기를 선택해 주세요.</h4>
		    
		<table class="table table-hover table-striped" >
	      
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