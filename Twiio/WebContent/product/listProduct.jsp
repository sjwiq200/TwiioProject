<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

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
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- autocomplate -->
 <!--  <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
<script type="text/javascript">
function fncGetUserList(currentPage,condition) {
	//document.getElementById("currentPage").value = currentPage;
	//document.getElementById("condition").value = condition;
    //document.detailForm.submit();		
   $("#currentPage").val(currentPage);
   $("#condition").val(condition);
   $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
}

$(function() {
	$("button.btn.btn-default:contains('�˻�')").bind("click", function(){
		fncGetUserList(1);
	});

	$("#searchKeyword").keydown(function(e){
		if(e.keyCode == 13){
			fncGetUserList(1);
		}
	});
	
	$( "font[name='get']" ).bind("click" , function() {
		//alert($($("input[name='prodNo']")[$(".ct_list_pop td:nth-child(1)").text()]).val());
		alert($(this).html().split("value=")[1].split("\"")[1]);
		self.location="/product/getProduct?prodNo="+$(this).html().split("value=")[1].split("\"")[1]+"&menu=${param.menu}";
		
	});
	
	//'<img src = "/images/uploadFiles/'+$(this).html().split("value=")[2].split("\"")[1].split(",")[0]+'"/>'
	$( "td[name='img']" ).hover(
					
			function() {
				var prodNo=$(this).html().split("value=")[1].split("\"")[1];
				//console.log($(this).html().split("value=")[1].split("\"")[1]);
				//alert($(this).html().split("value=")[1].split("\"")[1]);
				$.ajax( 
						
						{
							url : "/product/json/getProduct/"+prodNo ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								displayValue = JSONData.fileName;
								if(displayValue != null){
									displayValue = displayValue.split(",")[0].trim();
									$( "#"+prodNo ).append( $( "<p>"+'<img src = "/images/uploadFiles/'+displayValue+'" width="200" height="200"/>'+"</p>" ) );
								}else{
									$( "#"+prodNo ).append("<p>***��������</p>");
								}
								
								
							}							
						})
				
				
			},
			function() {
				$( this ).find( "br" ).remove();
				$( this ).find( "p" ).remove();				
			}
	);
	
	
	$( "#searchKeyword" ).autocomplete({
		
	      source: function( request, response ) {
	    	  //alert("���߿�");
	    	  //alert($("#searchCondition").val());
	    	  //alert($("#searchKeyword").val());
	    	  $.ajax(
	    				{
	    					url:"/product/json/autoComplate/",
	    					method:"POST",	    					
	    					data:{	    						
	    						searchCondition:$("#searchCondition").val(),
	    						searchKeyword:$("#searchKeyword").val()
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
	      }
	    });
	 
	
	$( "font[name='up']" ).bind("click" , function() {
		//alert($("input[name='prodNo']").val());
		self.location="/product/updateProduct?prodNo="+$(this).html().split("value=")[1].split("\"")[1]+"&menu=${param.menu}";
				
	});

	
	$("font[name='high']").bind("click",function(){
		fncGetUserList('${resultPage.currentPage }','high');
	});
	
	$("font[name='low']").bind("click",function(){
		fncGetUserList('${resultPage.currentPage }','low');
	});
	
	$( "td:nth-child(5):contains('����ϱ�')" ).bind("click" , function() {
		//Debug..
		//alert( $(this).html().split("value=")[1].split("\"")[1]);
		//"/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=2"
				//alert("/purchase/updateTranCodeByProd?prodNo="+$(this).html().split("value=")[1].split("\"")[1]+"&tranCode=2");
		self.location ="/purchase/updateTranCodeByProd?prodNo="+$(this).html().split("value=")[1].split("\"")[1]+"&tranCode=2";
	});
	$( "td:nth-child(5):contains('����ϱ�')" ).css("color" , "red");
	$("h7").css("color" , "blue");
	
	$("div[name='getPro']").bind("click",function(){
		//function(){
			//alert($(this).html().split("value=\"")[1].split("\"")[0]);
		//}
		var productNo = $(this).html().split("value=\"")[1].split("\"")[0];
		self.location = "/product/getProduct?productNo="+productNo;
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
	       <h3>${param.menu=='manage' ? "��ǰ ����" : "��ǰ �����ȸ"}</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${totalCount } �Ǽ�
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" id="searchCondition">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>����</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>����</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>�����</option>
						<option value="3"  ${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>ȣ��Ʈ</option>
						
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  <input type="hidden" id="condition" name="condition" value=""/>
					<p><font color="blue" name="high">���ݳ�����</font>
						<font color="blue" name="low">���ݳ�����</font></p>
				</form>
					
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		<c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<!-- <div class="row"> -->
		    <div class="col-sm-3 " >
		      <div class="thumbnail" name="getPro">
		      	<input type="hidden" name="productNo" value="${product.productNo }"/>
		        <img src="http://i.huffpost.com/gen/5177890/thumbs/o-APPLE-570.jpg?3" alt="..." class="img-rounded">
		          <div class="caption">
		            <h3>${product.productName} </h3>		            
		            <p>${product.productType}</p>
		            <p>${product.country} | ${product.city}</p>
		            <c:set var="date" value="${product.tripDate}"></c:set>
		            <c:set var="date_array" value="${fn:split(date,'[=,]')}"></c:set>              
		            <c:forEach var="tdate" items="${date_array}" begin="0" step="2">
		            ${tdate}
		            </c:forEach>		                    
		            <p>${product.productPrice}��</p>
		            <!-- <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> -->
		        </div>
		      </div>
		    </div>
		    <!-- </div> -->
		  </c:forEach>
	    
	    
	  

	<!-- PageNavigation End... -->
</body>
</html>
