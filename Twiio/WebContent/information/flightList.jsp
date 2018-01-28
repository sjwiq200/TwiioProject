<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


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
		
		
		$( "td:nth-child(5)" ).on("click" , function(){
			
			var num = $("td:nth-child(5)").index(this);
			var urls = "${currentUrl}";
		    	  $.ajax(
		    				{
		    					url:"/information/json/getFlightList/",
		    					method:"POST",	    					
		    					data:{	    						
		    						"num":num,
		    						"url":urls
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
									var currentUrls = JSONData.currentUrl[0];
									var list = null;
									
									for(var i = 0 ; i<info.length; i++){
										
										list += '<tr><td align="center">'+(i+1)+'</td>'+
										'<td align="center" id="info">'+info[i]+
										'</td>'+'<td align="center" id="type">'+type[i]+
										'</td>'+'<td align="center" id="price">'+price[i]+'</td><td align="center" id="null">?</td>'+
										'<td align="center" id="new"><button type="button" class="btn btn-success" id="newpick">��&nbsp;��</button></td></tr>';
									}
								$("#listTbody").html(list);
								$("h4").text("���� �� ����⸦ ������ �ּ���.");
		    							    							    						
		    					}
		    				}
		    			);
			    });
		
	});
	
$(function() {	
		
		$( "td:nth-child(6)" ).on("click" , function(){
			
			alert("��???????");
			
			    });
		
		$( "#newpick" ).on("click" , function(){
			
			alert("newpick");
			
			    });
		$( "#new" ).on("click" , function(){
			
			alert("new");
			
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
	
	
	<div class="page-header text-info">
	       <h3>����� ���� ��ȸ</h3>
	</div>
		    <h4>���� �� ����⸦ ������ �ּ���.</h4>
		<table class="table table-hover table-striped" >
	      
	        <thead>
	          <tr>
	            <th align="center">No</th>
	            <th align="left">����</th>
	            <th align="left">Ÿ��</th>
	            <th align="left">����</th>
	            <th align="left">����</th>
	          </tr>
	        </thead>
	       
			
			<c:set var="i" value="0" />
			<c:set var="i" value="${ i+1 }" />
			
				<tbody id="listTbody">
				  <c:forEach  items="${info}" varStatus="status">
					<tr>
					 <td align="center">${ i }</td>
					 <td align="center" id="info">${info[status.index]}</td>
					 <td align="center" id="type">${type[status.index]}</td>
					 <td align="center" id="price">${price[status.index]}</td>
					 <td align="center" id="choice"><button type="button" class="btn btn-primary" id="pick">��&nbsp;��</button></td>
					</tr>
		          </c:forEach>
		        </tbody>
	      
	      </table>
	
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>