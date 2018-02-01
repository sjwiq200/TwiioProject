<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/resources/css/animate.min.css" rel="stylesheet">
   <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!--  ///////////////////////// �߰� ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(function() {
			
		 $( "#checkIn" ).datepicker({
				dateFormat: "yy.mm.dd" 
		      });
			
		
		 $( "#checkOut" ).datepicker({
			    dateFormat: "yy.mm.dd"
		      });
		 
		 $("button.btn.btn-primary").on("click" , function() {
			// alert("��?")
			//  $("form").attr("method" , "POST").attr("action" , "/information/json/getHotel").submit();
			var city = $("#city").val();
			var checkOut = $("#checkOut").val();
			var checkIn = $("#checkIn").val();
			var headCount = $("#headCount").val();
			
			
			 $.ajax(
	    				{
	    					url:"/information/json/getHotel/",
	    					method:"POST",	    					
	    					data:{	    						
	    						"city":city,
	    						"checkIn":checkIn,
	    						"checkOut":checkOut,
	    						"headCount":headCount
	    						},
	    						headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
	    					dataType:"json",
	    					async:false,
	    					success:function(JSONData){
	    						var con = JSONData.con;
								var price = JSONData.price;
								var loc = JSONData.loc;
								var url = JSONData.url;
								var img = JSONData.image;
								
								var list = null;
								
								for(var i = 0 ; i<con.length; i++){
									
									list += '<tr><td align="center">'+(i+1)+'</td>'+
									'<td align="center" id="img"><img src="'+img[i]+'"  style="width: 200px; height: 150px;"/></td>'+
									'<td align="center" id="con">'+con[i]+'</td>'+
									'<td align="center" id="loc">'+loc[i]+'</td>'+
									'<td align="center" id="price">'+price[i]+'</td>'+
									'<td align="center" id="choice"><button type="button" class="btn btn-success" id="pick"><a href="'+
									url[i]+'" target="_blank" >��&nbsp;��</a></button></td></tr>';
								}
							$("#listTbody").html(list);
			    							    							    						
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
	
	<div class="page-header text-info">
	       <h3>���� ���� ��ȸ</h3>
	</div>
	
	<form class="form-horizontal">
		
		  
		  <div class="form-group">
		    <label for="city" class="col-sm-offset-1 col-sm-3 control-label">������ġ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="city" name="city" placeholder="������ġ">
		    </div>
		    
		    </div>
		  
		  <div class="form-group">
		    <label for="checkIn" class="col-sm-offset-1 col-sm-3 control-label">üũ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="checkIn" name="checkIn">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="checkOut" class="col-sm-offset-1 col-sm-3 control-label">üũ�ƿ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="checkOut" name="checkOut">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="headCount" class="col-sm-offset-1 col-sm-3 control-label">�ο�</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="headCount" id="headCount">
				  	<option value="1" selected="selected" >1��</option>
					<option value="2" >2��</option>
					<option value="3" >3��</option>
					<option value="4" >4��</option>
					<option value="5" >5��</option>
					<option value="6" >6��</option>
					<option value="7" >7��</option>
					<option value="8" >8��</option>
					<option value="9" >9��</option>
					<option value="10" >10��</option>
				</select>
		    </div>
		  </div>
		    
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
		    </div>
		  </div>
		</form>
		
		<table class="table table-hover table-striped" >
		
	        <thead>
	          <tr>
	            <th align="center">No</th>
	            <th align="left">����</th>
	            <th align="left">����</th>
	            <th align="left">��ġ</th>
	            <th align="left">����</th>
	            <th align="left">����</th>
	          </tr>
	        </thead>
	       
			
			
				<tbody id="listTbody">
					<tr>
					 <td align="center"></td>
					 <td align="center" id="img"></td>
					 <td align="center" id="con"></td>
					 <td align="center" id="loc"></td>
					 <td align="center" id="price"></td>
					 <td align="center" id="choice"></td>
					</tr>
		        </tbody>
	      
	      	</table>
	
	    
 		</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
	</body>

</html>