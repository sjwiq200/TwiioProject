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
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	
	<div class="page-header text-info">
	       <h3>환율</h3>
	</div>
	    
	
	
	
	<form class="form-horizontal">
	
		<div class="form-group">
		    <label for="standard" class="col-sm-offset-1 col-sm-3 control-label">기준 국가</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="standard" name="standard" value="${exchange.cur_nm == '아랍에미리트'}" >
		    </div>
		 </div>
		 
		 <div class="form-group">
		 	<div class="col-sm-4">
		  <label for="standard" class="col-sm-offset-9 col-sm-5 control-label">=</label>
		 	</div>
		  </div>
		  
		 <div class="form-group">
		    <label for="compare" class="col-sm-offset-1 col-sm-3 control-label">비교 국가</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="compare" name="compare"  value="${exchange.cur_nm == '아랍에미리트'}" >
		    </div>
		 </div>
	
	
	</form>
	
	
	<table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">통화코드</th>
            <th align="left">매매가격율</th>
            <th align="left">국가</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="exchange" items="${returnList}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left" >${exchange.cur_unit}</td>
			  <td align="left">${exchange.deal_bas_r}</td>
			  <td align="left">${exchange.cur_nm}</td>
			  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>