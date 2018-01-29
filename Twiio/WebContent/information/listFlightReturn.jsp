<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	
  	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/resources/css/animate.min.css" rel="stylesheet">
   <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

    <!-- Bootstrap Dropdown Hover JS -->
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
	 $( function() {
		 
		 var currentUrl = "${currentUrl}";
		 
		    $( "#departureDate" ).datepicker({
		    	dateFormat: "yy.mm.dd" 
	        });
		
	
		    $( "#arrivalDate" ).datepicker({
		    	dateFormat: "yy.mm.dd"
	        });

		    $("td:nth-child(5)").on("click" , function() {
		    	
		    	
		    	var clickNum = $("td:nth-child(5)").index(this);
		    	
				    	  $.ajax(
				    				{
				    					url:"/information/json/getFlightListReturn/",
				    					method:"POST",	    					
				    					data:{	    						
				    						"clickNum":clickNum,
				    						"currentUrl":currentUrl
				    						},
				    						headers : {
												"Accept" : "application/json",
												"Content-Type" : "application/json"
											},
				    					dataType:"json",
				    					async:false,
				    					success:function(JSONData){
				    						 window.open(JSONData.list,'_blank');
				    					}
				    				}
				    			);
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
	    
	    
	  <form>  
		<div class="page-header text-center">
			<h4 class=" text-info">선택하신 비행기 내역</h4>
	    </div>
	
		<div class="form-group">
			 <label for="departure" class="col-sm-offset-1 col-sm-3 control-label">출발 도시</label>
			   <div class="col-sm-4">${flight.departure}</div>
		</div>
		
		<div class="form-group">
			 <label for="arrival" class="col-sm-offset-1 col-sm-3 control-label">도착도시</label>
			   <div class="col-sm-4">${flight.arrival}</div>
		</div> 
		
		<div class="form-group">
			 <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">출국일자</label>
			   <div class="col-sm-4">${flight.departureDate}</div>
		</div>	
				
		<div class="form-group">
			 <label for="arrivalDate" class="col-sm-offset-1 col-sm-3 control-label">입국일자</label>
			   <div class="col-sm-4">${flight.arrivalDate}</div>
		</div>
		
		<div class="form-group">
			 <label for="headCount" class="col-sm-offset-1 col-sm-3 control-label">인원</label>
			   <div class="col-sm-4">${flight.headCount}</div>
		</div>
		
		<div class="form-group">
			 <label for="returnInfo" class="col-sm-offset-1 col-sm-3 control-label">비행정보</label>
			   <div class="col-sm-4">${flight.returnInfo}</div>
		</div>	
		
		<div class="form-group">
			 <label for="returnType" class="col-sm-offset-1 col-sm-3 control-label">비행타입</label>
			   <div class="col-sm-4">${flight.returnType}</div>
		</div>	
		
		<div class="form-group">
			 <label for="returnPrice" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
			   <div class="col-sm-4">${flight.returnPrice}</div>
		</div>
		
		</form> 
	
	<h4>오는 편 비행기를 선택해 주세요.</h4>
		    
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
		<c:set var="i" value="0" />
		  <c:forEach  items="${info}" varStatus="status">
		  	<c:set var="i" value="${ i+1 }" />
					<tr>
					 <td align="center">${i}</td>
					 <td align="center" id="info">${info[status.index]}</td>
					 <td align="center" id="type">${type[status.index]}</td>
					 <td align="center" id="price">${price[status.index]}</td>
					 <td align="center" id="choice"><button type="button" class="btn btn-success" id="newpick">선&nbsp;택</button></td>
					</tr>
		   </c:forEach>
	      </tbody> 
	    </table>
	
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>