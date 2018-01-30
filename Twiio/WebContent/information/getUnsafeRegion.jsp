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
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(function() {
			
		 $("button.btn.btn-primary").on("click" , function() {
			var city = $("#city").val();
			
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
	    						
	    						var img = JSONData.img;
								var info = JSONData.info;
								
								if(img=='none'){
									
									img = "/resources/images/no_info.png";
									
									$("#image").html('<div class="col-xs-12" align="center"><img src="'+img+'" style="width: 600px; height: 500px;"/></div>');
									
								}else{
									$("#image").html('<div class="col-xs-12" align="center"><img src="'+img+'" style="width: 600px; height: 500px;"/></div>');
								}
								
							$("#info").html(info);
	    						
			    					}
			    				}
			    			);
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
	       <h3>안전 지역 정보 조회</h3>
	</div>
	
	<form class="form-horizontal">
		
		  <div class="form-group" align="center">
		    <div class="col-xs-4 col-xs-offset-4">
		      <input type="text" class="form-control" id="city" name="city" placeholder="도시명을 입력해 주세요.">
		    </div>
		  </div>
		  
		    
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >검 &nbsp;색</button>
		    </div>
		  </div>
		</form>
		
	<div class="image" id="image">	
		<div class="col-xs-12" align="center">
			<img src="http://www.0404.go.kr/images/main/img_map.png"  style="width: 700px; height: 300px;"/>
		</div>
		
		<div class="col-xs-12" align="center">
			<img src="/resources/images/img_blue.png"/>
			<img src="/resources/images/img_yellow.png"/>
			<img src="/resources/images/img_red.png"/>
			<img src="/resources/images/img_black.png"/>
			<img src="/resources/images/img_lock_red.png"/>
			<img src="/resources/images/img_lock_black.png"/>
		</div>
	</div>		
	
	
	<div class="info" id="info"></div>
	    
 		</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
	</body>

</html>