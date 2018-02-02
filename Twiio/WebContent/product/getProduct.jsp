<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

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
		var productNo = $("input[name='productNo']").val();
	   	$("#currentPage").val(currentPage);
	   	$("tr[name='n']").remove();
	   	$("p.text-primary").empty();
		$("div[name='eval']").empty();
	   	$.ajax(
					{
						url:"/product/json/listStarEvalProduct/",
						method:"POST",	    					
						data:{	    						
							currentPage : $("#currentPage").val(),	
							productNo : $("input[name='productNo']").val()
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
								string += "<td align='left'>"+JSON.stringify(list[i].reviewProduct)+"</td>";
								string += "<td align='left'>"+JSON.stringify(list[i].starEvalProduct)+"</td>";
								string += "</tr>";
							}
							//alert(string);
							//
							$("p.text-primary").append("전체  "+JSON.stringify(JSONData.totalCount)+" 건수, 현재 "+JSON.stringify(JSONData.resultPage.currentPage)+"  페이지");
							$("tbody").append(string);
								//alert("dddd");					
							$.ajax(
									{
										url:"/product/json/getEvalProduct/"+productNo,
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
		
		 $( "button.btn.btn-primary:contains('구매')" ).on("click" , function() {
			 if(${empty user}){
				 alert("로그인 후 이용해 주세요");
				 return
			 }
			 
			if($( "#tripDate" ).val()==0 || $("select[name='count']").val()==0){
				alert("날짜와 갯수를 선택해주세요 :: ");	
				return
			}
			
			 $("form").attr("method" , "POST").attr("action" , "/transaction/addTransaction").submit();
		});
	});
	
	$(function() {
		
		 $( "button.btn.btn-primary:contains('이전')" ).on("click" , function() {
			
			 history.go(-1);
		});
	});
	
	/* $(function() {
		
		 $( "button.btn.btn-primary:contains('장바구니 담기')" ).on("click" , function() {
			
			 self.location("/cart/addCart?prod_no=");
		});
	}); */
	
	$(function() {
		
		 $( "button.btn.btn-primary:contains('확인')" ).on("click" , function() {
			
			 self.location("/product/listProduct?menu=manage");
		});
	});
	
	$(function() {
		
		 $( "#tripDate" ).on("change" , function() {
			//alert("안뇽");
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
	 						//alert("제발ajax");	    											
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
				alert("날짜를 선택해주세요 :: ");
			} 
		 });
	});
	
	$(function() {
		
		 $( "#write" ).on("click" , function() {
			alert("dkfjlksfjlksd");
			 $.ajax(
		 				{
		 					url:"/common/json/addReply/",
		 					method:"POST",	    					
		 					data:{	    						
		 						targetType : "0",
		 						replyContent : $("textarea").val(),
		 						userNo : $("input[name='userNo']").val(),
		 						userName : $("input[name='userName']").val(),
		 						productNo : $("input[name='productNo']").val(),
		 						replyNo : "",
		 						replyRegDate : "",
		 						communityNo : ""
		 						},
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},			
		 					dataType:"json",
		 					success:function(JSONData){
		 						con.log("댓글등록");							
		 					}
		 				}
		 			);
		});
	});
	
	
	
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
	
	  $(function() {
			
			 $( "#showPro" ).on("click" , function() {
				
				 self.location("/product/listProduct");
			});
		});
	  
	  $(function() {
			
			 $( "button:contains('수정')" ).on("click" , function() {
				 
				 self.location("/product/updateProduct?productNo="+${product.productNo});
			});
		});
	  
	  $(function() {
			
			 $( "button:contains('삭제')" ).on("click" , function() {
				
				 self.location("/product/deleteProduct?productNo="+${product.productNo});
			});
		});
	  
	  $(function() {
			
			 $( "div[name='hostInfo']" ).on("click" , function() {
				
				 window.open("/user/getUser?userNo="+${product.hostNo},'','');
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
		<input type="hidden" name="userNo" value="${user.userNo }"/>
		<input type="hidden" name="userName" value="${user.userName }"/>
		<div class="page-header">
	       <h3 class=" text-info">${product.productName }
	       <button type="button" id="showPro" class="btn btn-default">목록보기</button>
	       <c:if test="${user.userNo == product.hostNo }">
	       <button type="button" class="btn btn-default">수정</button>
	       <button type="button" class="btn btn-default">삭제</button>
	       </c:if>
	       </h3>     
	       <!-- <h5 class="text-muted">상품을 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5> -->
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4">${product.productNo }</div>			
		</div>
		
		<hr/>
		
		<%-- <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.productName }</div>
		</div>
		
		<hr/> --%>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품분류</strong></div>
			<div class="col-xs-8 col-md-4">${product.productType }</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>국가</strong></div>
			<div class="col-xs-8 col-md-4">${product.country }</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>도시</strong></div>
			<div class="col-xs-8 col-md-4">${product.city }</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>조회수</strong></div>
			<div class="col-xs-8 col-md-4">${product.viewCount }</div>
		</div>
				
		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>투어일자</strong></div>
			<div class="col-xs-8 col-md-4">
			<c:set var="date" value="${product.tripDate}"></c:set>
			<c:set var="date_array" value="${fn:split(date,',')}"></c:set>			
				<c:forEach var="tdate" items="${date_array}" begin="0" step="1">
					${fn:split(tdate,'=')[0]}
				</c:forEach>
			</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.productPrice}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
		
		<hr/>
		<form>
			<div class="row">
				<input type="hidden" name="productNo" value="${product.productNo }"/>
				<select class="form-control" name="tripDate" id="tripDate">
					<option value="0" >날짜선택</option>
					<c:set var="date" value="${product.tripDate}"></c:set>
					<c:set var="date_array" value="${fn:split(date,',')}"></c:set>
					<c:forEach var="tdate" items="${date_array}" begin="0" step="1">
						<option value="${fn:split(tdate,'=')[0]}">${fn:split(tdate,'=')[0]}</option>
						
					</c:forEach>
				</select> 
				<select class="form-control" name="count" id="count">
					<%-- <c:set var="i" value="1"></c:set> --%>
					<option value="0" >갯수선택</option>
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
	  				<button type="button" class="btn btn-primary">구매</button>
	  				<button type="button" class="btn btn-primary">이전</button>
	  				
	  			<%-- </c:if>
				<c:if test="${param.menu!='search'}">
					<button type="button" class="btn btn-primary">확인</button>
				</c:if> --%>
	  		</div>
		</div>
		</form>
		<hr/>
		
		<div class="row" name="hostInfo">
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>호스트</strong></div>
	  		<div class="col-xs-8 col-md-4">
			<c:if test="${empty product.hostImage}"><img style="width:80px; height:80px; alt="" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" class="rounded-circle"></c:if>
			<c:if test="${!empty product.hostImage}"><img style="width:80px; height:80px; alt="" src="/resources/images/userThumbnail/${product.hostImage}" class="rounded-circle"></c:if>
			</div>			
		</div>		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "></div>
			<div class="col-xs-8 col-md-4">${product.hostName}	</div>
		</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.description}</div>
			<a href="#" type="button" class="top">Top</a>
		</div>
		
		<hr/>			
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>평점</strong></div>
			<div class="col-xs-8 col-md-4" name="eval">${transaction.evalProduct}</div>
		</div>
		
		<hr/>		
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	<div >
 		<div><strong>리뷰/별점</strong></div>
 		<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
 	<!--  table Start /////////////////////////////////////-->
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
		  <c:forEach var="transaction" items="${list}">
			<c:set var="i" value="${ i+1 }" /> 
			<tr name="n">
			  <td align="left" >${transaction.userName}</td>			  
			  <td align="left" >${transaction.reviewProduct}</td>
			  <td align="left" >${transaction.starEvalProduct}</td>			  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_review.jsp"/> 
	<!-- PageNavigation End... -->	
	</div>
	<hr/>
	<div class="form-group">
		<div class="col-md-8 col-md-offset-1">
			<textarea name="comment_content" row="6" col="50"></textarea>
		</div>
		<div class="col-md-1">
			<button type="button" style="" id="write" class="btn btn-default">댓글입력</button>
		</div>
	</div>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	
	<div class="form-group">
		<div >
			<strong>댓 글 목 록</strong>
		</div>
	</div>
	
	<div class="col-xs-10 col-xs-offset-1">
		<hr sytle="border-style:dotted">
		</div>
		<div class="form-group">
			<div class="col-md-8 col-md-offset-1">
				<textarea id="replyContent"  name="comment_content" row="6" col="50" value=""></textarea>
			</div>
			<div class="col-md-1">
				<button type="button"  id="write" class="btn btn-default">댓글입력</button>
			</div>
		</div>
		<br>
		<br>
		<br>
		<div class="form-group">
			<div class="col-md-2 col-md-offset-1">
				<strong>댓 글 목 록</strong>		
			</div>
			<div class="col-md-2">
				댓글수  : <c:if test="${totalCountReply == null}">0</c:if>
					   <c:if test="${totalCountReply != null}">${totalCountReply}</c:if>				
			</div>
		</div>
		<div class="col-xs-10 col-xs-offset-1">
		<hr sytle="border-style:dotted">
		</div>
		<div class="row">
		<c:forEach var="reply" items="${list}">
		<div class= "row2">
			<div class="col-md-10 col-md-offset-1">
    			${reply.userName}
    		</div>
    		<div class="col-md-10 col-md-offset-1">
    			${reply.replyContent}
    		</div>
    		<div class="col-md-10 col-md-offset-1">
    			${reply.replyRegDate}
    		</div>
    		<div class="col-xs-10 col-xs-offset-1">
			<hr sytle="border-style:dotted">
			</div>
		</div>
 		</c:forEach>
 		</div>
 		
 		<div class="col-xs-2 col-xs-offset-5">
			<div class="button-2">
    		<div class="eff-2"></div>
    		<a href="#"> 댓글 더보기 </a>
  			</div>
		</div>
		
		<div class="col-xs-10 col-xs-offset-1">
			<hr sytle="border-style:dotted">
		</div>

</body>
</html>