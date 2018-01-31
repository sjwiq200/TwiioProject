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

<!--  ///////////////////////// 추가 ////////////////////////// -->
   			
   			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>
			<link rel="stylesheet" href="/resources/assets/css/main.css" />
   
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
	       <h3>숙소 정보 조회</h3>
	</div>
	
		<form class="form-horizontal">
		
		<input type="hidden" id="detailUrl" name="detailUrl" value=""/>
		
		  <div class="form-group">
		    <label for="city" class="col-sm-offset-1 col-sm-3 control-label">도시명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="city" name="city" placeholder="도시명을 입력해 주세요.">
		    </div>
		  </div>
		  
		    
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >검 &nbsp;색</button>
		    </div>
		  </div>
		</form>
		
		<table class="table table-hover table-striped" >
		
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