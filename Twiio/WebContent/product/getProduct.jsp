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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
<script type="text/javascript">
$(function() {
	
	 $( "button.btn.btn-primary:contains('����')" ).on("click" , function() {
		if($( "#tripDate" ).val()==0 || $("select[name='count']").val()==0){
			alert("��¥�� ������ �������ּ��� :: ");	
			return
		}
		
		 $("form").attr("method" , "POST").attr("action" , "/transaction/addTransaction").submit();
	});
});

$(function() {
	
	 $( "button.btn.btn-primary:contains('����')" ).on("click" , function() {
		
		 history.go(-1);
	});
});

/* $(function() {
	
	 $( "button.btn.btn-primary:contains('��ٱ��� ���')" ).on("click" , function() {
		
		 self.location("/cart/addCart?prod_no=");
	});
}); */

$(function() {
	
	 $( "button.btn.btn-primary:contains('Ȯ��')" ).on("click" , function() {
		
		 self.location("/product/listProduct?menu=manage");
	});
});

$(function() {
	
	 $( "#tripDate" ).on("change" , function() {
		//alert("�ȴ�");
		$("option.num").remove();
		 $.ajax(
 				{
 					url:"/product/json/findCount/",
 					method:"POST",	    					
 					data:{	    						
 						tripDate:$("#tripDate").val(),
 						productNo:$("input[name='productNo']").val()
 						},
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},			
 					dataType:"json",
 					success:function(JSONData){
 						//alert("����ajax");	    											
 						//alert("JSONData: \n"+JSONData);
 						//alert(JSONData);
 						//var num=JSONData;
 						/* response($.map(JSONData, function (item) {
 				           
 							return item;
 				        })); */
 				        var string;
 				        for(var i=1; i<JSONData+1; i++){
 				        	string+="<option class='num' value='"+i+"'>"+i+"</option>";
 				        }
 						$("select[name='count']").append(string);
 						
						
					
 					}
 				}
 			);
	});
	 
	 $("select[name='count']").on("click",function(){
		if($( "#tripDate" ).val()==0){
			alert("��¥�� �������ּ��� :: ");
		} 
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
	
		<div class="page-header">
	       <h3 class=" text-info">��ǰ����ȸ</h3>
	       <h5 class="text-muted">��ǰ�� <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${product.productNo }</div>			
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.productName }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�з�</strong></div>
			<div class="col-xs-8 col-md-4">${product.productType }</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${product.country }</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${product.city }</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ȸ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.viewCount }</div>
		</div>
				
		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.tripDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${product.productPrice}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
		
		<hr/>
		<form>
			<div class="row">
				<input type="hidden" name="productNo" value="${product.productNo }"/>
				<select class="form-control" name="tripDate" id="tripDate">
					<option value="0" >��¥����</option>
					<c:set var="date" value="${product.tripDate}"></c:set>
					<c:set var="date_array" value="${fn:split(date,',')}"></c:set>
					<c:forEach var="tdate" items="${date_array}" begin="0" step="1">
						<option value="${fn:split(tdate,'=')[0]}">${fn:split(tdate,'=')[0]}</option>
						
					</c:forEach>
				</select> 
				<select class="form-control" name="count" id="count">
					<%-- <c:set var="i" value="1"></c:set> --%>
					<option value="0" >��������</option>
					<%-- <c:set var="date_array" value="${fn:split(date,'[=,]')}"></c:set> --%>
					<%-- <c:if test="==${fn:split(tdate,'=')[0]}"> --%>
					<%-- <c:forEach var="num" items="${date_array}" begin="0" step="1">
					
						<c:forEach var="i" begin="1" end="${fn:split(num,'=')[1]}" step="1" >
							<option value="${i}">${i}</option>
						</c:forEach>
					</c:forEach> --%>
					<%-- </c:if> --%>
				</select>
			</div>

			<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<%-- <c:if test="${param.menu=='search'}"> --%>
	  				<button type="button" class="btn btn-primary">����</button>
	  				<button type="button" class="btn btn-primary">����</button>
	  				
	  			<%-- </c:if>
				<c:if test="${param.menu!='search'}">
					<button type="button" class="btn btn-primary">Ȯ��</button>
				</c:if> --%>
	  		</div>
		</div>
		</form>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>ȣ��Ʈ</strong></div>
			<div class="col-xs-8 col-md-4">${product.hostName}	</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${product.description}	</div>
		</div>
		
		<br/>	
		
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
</html>