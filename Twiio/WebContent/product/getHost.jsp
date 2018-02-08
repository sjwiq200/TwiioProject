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
			background:  #f4f4f4;
		}
		
		textarea {
			width: 100%;
			height: 100px;
			resize: none;
		}
		
		/* Profile container */
.profile {
  margin: 20px 0;
}

.profile-userpic img {
  float: none;
  margin: 0 auto;
  width: 50%;
  height: 50%;
  -webkit-border-radius: 50% !important;
  -moz-border-radius: 50% !important;
  border-radius: 50% !important;
}

.profile-usertitle {
  text-align: center;
  margin-top: 20px;
}

.profile-usertitle-name {
  color: #5a7391;
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 7px;
}

.profile-usertitle-job {
  text-transform: uppercase;
  color: #5b9bd1;
  font-size: 12px;
  font-weight: 600;
  margin-bottom: 15px;
}

.profile-userbuttons {
  text-align: center;
  margin-top: 10px;
}

.profile-userbuttons .btn {
  text-transform: uppercase;
  font-size: 11px;
  font-weight: 600;
  padding: 6px 15px;
  margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
  margin-right: 0px;
}
    
.profile-usermenu {
  margin-top: 30px;
}

.profile-usermenu ul li {
  border-bottom: 1px solid #f0f4f7;
  color: #5b9bd1;
  font-size: 20px;
  font-weight: 400;
  margin-right: 8px;    
  margin-left: -2px;
  
}

.profile-usermenu ul li:last-child {
  border-bottom: none;
}

/* .profile-usermenu ul li a {
  color: #93a3b5;
  font-size: 14px;
  font-weight: 400;
} */

/* .profile-usermenu ul li a i {
  margin-right: 8px;
  font-size: 14px;
} */

/* .profile-usermenu ul li a:hover {
  background-color: #fafcfd;
  color: #5b9bd1;
} */

.profile-usermenu ul li.active {
  border-bottom: none;
}

.profile-usermenu ul li.active a {
  color: #5b9bd1;
  background-color: #f6f9fb;
  border-left: 2px solid #5b9bd1;
  margin-left: -2px;
}

/* Profile Content */
.profile-content {
  padding: 20px;
  background: #fff;
  min-height: 460px;
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
	<div class="container">
    <div class="row profile">
		<div class="col-md-12">
			<!-- <div class="profile-sidebar"> -->
			<input type="hidden" name="hostNo" value="${host.userNo }"/>
				<!-- SIDEBAR USERPIC -->
				<div class="profile-userpic">
					<c:if test="${empty host.userImage}"><img style="width:80px; height:80px; alt="" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" class="img-responsive"></c:if>
					<c:if test="${!empty host.userImage}"><img style="width:80px; height:80px; alt="" src="/resources/images/userThumbnail/${host.userImage}" class="img-responsive"></c:if>
					<!-- <img src="http://keenthemes.com/preview/metronic/theme/assets/admin/pages/media/profile/profile_user.jpg" class="img-responsive" alt=""> -->
				</div>
				<!-- END SIDEBAR USERPIC -->
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						${host.userName }
					</div>
					<div class="profile-usertitle-job">
						${host.userGender }
					</div>
				</div>
				<!-- END SIDEBAR USER TITLE -->
				<!-- SIDEBAR BUTTONS 
				<div class="profile-userbuttons">
					<button type="button" class="btn btn-success btn-sm">Follow</button>
					<button type="button" class="btn btn-danger btn-sm">Message</button>
				</div>
				 END SIDEBAR BUTTONS -->
				<!-- SIDEBAR MENU -->
				<div class="profile-usermenu">
					<ul class="nav">
						<li class="active">
							<div >
							<i class="glyphicon glyphicon-earphone"></i>
							&nbsp;&nbsp;${host.userPhone }</div>
						</li>
						<li>
							<div>
							<i class="glyphicon glyphicon-envelope"></i>
							&nbsp;&nbsp;${host.userEmail }</div>
						</li>
						<li>
							<div>
							<i class="glyphicon glyphicon-flag"></i>
							&nbsp;&nbsp;${host.userBirthday } </div>
						</li>
						<li>
							<div>
							<i class="glyphicon glyphicon-star"></i>
							&nbsp;&nbsp;${evalHost} </div>
						</li>
					</ul>
				</div>
				<!-- END MENU -->
			<!-- </div> -->
		</div>
		
	</div>
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
	<center><jsp:include page="../common/pageNavigator_review.jsp"/> </center>
	<!-- PageNavigation End... -->
	<hr/>	
	</div>
	
	

</body>
</html>