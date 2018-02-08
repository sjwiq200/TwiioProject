<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
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
   
   <!-- scroll -->
   <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
   
   <style>
      a.top {
        position: fixed;
        left: 92%;
        bottom: 50px;
        width: 40px;
		height: 40px;
		background: #D0D3C5;
		color: #08708A;
		text-align: center;
		line-height: 40px;
		border-radius: 5px;
        display: none;
      }
    </style>
    	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
			padding-top: 50px;
			background: rgba(208, 211, 197, 0.3);
		}
		
		textarea {
			width: 100%;
			height: 100px;
			resize: none;
		}
	</style>
	<script type="text/javascript">
	
	 function fncGetUserList(currentPage) {
		//alert("???");
		var hostNo = $("input[name='hostNo']").val();
	   	$("#currentPage").val(currentPage);
	   	$("tr[name='n']").remove();
	   	$("p.text-primary").empty();
		$("div[name='eval']").empty();
	   	$.ajax(
					{
						url:"/user/json/listStarEvalHost/",
						method:"POST",	    					
						data:{	    						
							currentPage : $("#currentPage").val(),	
							hostNo : $("input[name='hostNo']").val()
							},
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},			
						dataType:"json",
						success:function(JSONData){
							//alert("제발ajax");	    											
							//alert("JSONData: \n"+JSONData);
							//alert(JSON.stringify(JSONData));
							
							//alert(JSON.stringify(JSONData.list));
							var list = JSONData.list;
							//alert("list"+JSON.stringify(list));
							//alert(list.length);
							//alert(list[0]);
							//$("#currentPage").val();
							var string;						
							for(var i=0; i<list.length; i++){
								//string += JSON.stringify(list[i].userName);
								string += "<tr name='n'>";
								string += "<td align='left'>"+JSON.stringify(list[i].userName)+"</td>";
								string += "<td align='left'>"+JSON.stringify(list[i].reviewHost)+"</td>";
								string += "<td align='left'>"+JSON.stringify(list[i].starEvalHost)+"</td>";
								string += "</tr>";
							}
							//alert(string);
							//
							$("p.text-primary").append("전체  "+JSON.stringify(JSONData.totalCount)+" 건수, 현재 "+JSON.stringify(JSONData.resultPage.currentPage)+"  페이지");
							$("tbody").append(string);
								//alert("dddd");					
							$.ajax(
									{
										url:"/user/json/getEvalHost/"+hostNo,
										method:"GET",	    					
										/* data:{					
											productNo : $("input[name='productNo']").val()
											}, */
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},			
										dataType:"json",
										success:function(JSONData){
																						
											//alert(JSON.stringify(JSONData));
											$("div[name='eval']").append(JSON.stringify(JSONData));
											
											
									        				
										}
									}
								);
							//var num=JSONData;
							/* response($.map(JSONData, function (item) {
					           
								return item;
					        })); */	
					        				
						}
					}
				);
	   	
	   
		//$("form").attr("method" , "POST").attr("action" , "/transaction/listPurchase").submit();
	}

	
	
	$(function() {
		
		 $( "button.btn.btn-primary:contains('확인')" ).on("click" , function() {
			
			 self.location("/product/listProduct?menu=manage");
		});
	});
	
	

		
	///////////////////////////////////////////top//////////////////
	  $( function() {
		  
	    $( window ).scroll( function() {
	      if ( $( this ).scrollTop() > 100 ) {
	        $( '.top' ).fadeIn();
	      } else {
	        $( '.top' ).fadeOut();
	      }
	    } );
	    
	    $( '.top' ).click( function() {
	      $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	      return false;
	    } );
	    
	  } );
	////////////////////////////////////////////////
	
	  
	
	
	</script>

</head>

<body>

	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container text-center">
		<input type="hidden" name="hostNo" value="${host.userNo }"/>
		<%-- <input type="hidden" name="userName" value="${user.userName }"/> --%>
		<div class="page-header ">	     
		<div class="row " >
	  		<!-- <div class="col-xs-4 col-md-2 "><strong>호스트</strong></div> -->
	  		<div class="col-xs-8 col-md-4">
			<c:if test="${empty host.userImage}"><img style="width:80px; height:80px; alt="" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" class="rounded-circle"></c:if>
			<c:if test="${!empty host.userImage}"><img style="width:80px; height:80px; alt="" src="/resources/images/userThumbnail/${host.userImage}" class="rounded-circle"></c:if>
			</div>			
		</div>		   	      
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>이름</strong></div>
			<div class="col-xs-8 col-md-4">${host.userName }</div>			
		</div>
		
		<hr/>		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>성별</strong></div>
			<div class="col-xs-8 col-md-4">${host.userGender }</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>핸드폰</strong></div>
			<div class="col-xs-8 col-md-4">${host.userPhone }</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>E-mail</strong></div>
			<div class="col-xs-8 col-md-4">${host.userEmail }</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>생년월일</strong></div>
			<div class="col-xs-8 col-md-4">${host.userBirthday }</div>
		</div>
				
		<hr/>		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>평점</strong></div>
			<div class="col-xs-8 col-md-4" name="eval">${evalHost}</div>
		</div>
		
		<hr/>		
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	<div class="container">
 		<div><strong>리뷰/별점</strong></div>
 		<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
 	<!--  table Start /////////////////////////////////////-->
 	<div >
      <table class="table  table-striped" >
      <input type="hidden" id="currentPage" name="currentPage" value=""/>
        <thead>
          <tr>
            <th align="left">이름</th>
            <th align="left" >리뷰</th>                       
            <th align="left">별점</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="transaction" items="${reviewList}">
			<c:set var="i" value="${ i+1 }" /> 
			<tr name="n">
			  <td align="left" >${transaction.userName}</td>			  
			  <td align="left" >${transaction.reviewHost}</td>
			  <td align="left" >${transaction.starEvalHost}</td>			  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
      </div>
	  <!--  table End /////////////////////////////////////-->
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_review.jsp"/> 
	<!-- PageNavigation End... -->
	<hr/>	
	</div>
	
	

</body>
</html>