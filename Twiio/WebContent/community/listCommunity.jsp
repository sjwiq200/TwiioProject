<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
<head>
<title>Community</title>

<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    

	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/resources/css/animate.min.css" rel="stylesheet">
   <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
		<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>

<script type="text/javascript">
	var page = 1;
	var flag = 0;
	var flag2 = 0;
	var communityNo = ${resultPage.totalCount};
	
	 if (self.name != 'reload') {
         self.name = 'reload';
         self.location.reload(true);
     }
     else self.name = ''; 
	
	$(document).ready(function(){
		$(window).scroll(function(){
			
			var scrollHeight=$(window).scrollTop() + $(window).height();
			var documentHeight=$(document).height();
			
			console.log('$(window).scrollTop() :: '+($(window).scrollTop()));
			console.log('$(document).height() - $(window).height() :: '+($(document).height() - $(window).height()));
			
			if(($(window).scrollTop()) != $(document).height() - $(window).height()&flag2==1){
				flag2 = 0;
				console.log('flag :: '+flag2);
			}
		
			if(($(window).scrollTop()+0.8) >= $(document).height() - $(window).height()&flag2==0){
				flag2 = 1;
				console.log('$(window).scrollTop() :: '+$(window).scrollTop());
				console.log('$(document).height() - $(window).height() :: '+($(document).height() - $(window).height()));
				page = page + 1;
				var sc=$('#searchKeword').val();
				if($('#searchKeword').val()==null)
					sc=null;
				 
				 $.ajax( 
						{
						url : "/community/json/listCommunity",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : {
							"currentPage":page,
							"targetType":"${communityType}",
							"searchCondition":$('#searchCondition').val(),
							"searchKeyword": sc
						},
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
							success : function(JSONData , status) {
								if(flag==0){
									communityNo=communityNo-JSONData.length;
									flag=1;
								}
								
							for(var i=0; i<JSONData.length;i++){								
							var displayValue = 
						    '<div class="col-md-3">'+
						      '<div class="thumbnail" style="height:400px">'+
						      '<input type="hidden" name="communityNo" value="'+JSONData[i].communityNo+'"/>'+
							  '<input type="hidden" name="userNo" value="'+JSONData[i].userNo+'"/>'+
						        '<img src="https://lh4.googleusercontent.com/-1wzlVdxiW14/USSFZnhNqxI/AAAAAAAABGw/YpdANqaoGh4/s1600-w400/Google%2BSydney" style="width:300px; height:150px;"/>'+
						         ' <div class="caption">'+
						          	'[ 게판번호 :'+communityNo+' ]'+
						          	'<p>[ 제   목 :'+JSONData[i].communityTitle+' ]</p>'+ 
						            '<p>[ 작성자 :'+JSONData[i].userName+' ]</p>'+
						            '<p>[ 등록일 :'+JSONData[i].regDate+' ]</p>'+
						            '<p>[ 조회수 :'+JSONData[i].viewCount+' ]</p>'+
						            '<p>[ 커뮤니티번호 :'+JSONData[i].communityNo+' ]</p>'+
						            '<p><a class="btn btn-primary" id="getButton">상세보기</a>'+ 
						            '<a class="btn btn-default" id="reprtButton">신고하기</a></p>'+
						        '</div>'+
						      '</div>'+
						 	'</div>';
						 
								communityNo=communityNo-1;
									$('.row2').append(displayValue);
								}
							}
					}); 
			}	
		});
	});
	
	

	
	 $(function() {	
		$("#write").on("click" , function() {
			//alert("ㅁㄴㅇㄻㄴㅇㄻ");
			//alert($($('input[name=TranCode]')[$('.ct_list_pop td:nth-child(3)').index(this)]).val());
			//if($($('input[name=TranCode]')[$('.ct_list_pop td:nth-child(3)').index(this)]).val() == '0'){
			self.location="/community/addCommunity?communityType="+${communityType};
			//}
		});	
	});
	 
	 

	$(document).on('click' ,'#getButton', function() {
		self.location="/community/getCommunity?communityNo="+$($('input[name=communityNo]')[$('a[id=getButton]').index(this)]).val();
	});	

	
	function fncGetCommunityList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
	   //	document.detailForm.submit();
	   $("#currentPage").val(currentPage)
	   $("form").attr("method" , "POST").attr("action" , "/community/listCommunity?communityType=${communityType}").submit();
	}
	
	$(function() {	
	$("#searchButton").on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
		fncGetCommunityList(1);
	})
	});

	
	/*
	$(function() {
		$("td:nth-child(1)").on("click" , function() {
			//if($($('input[name=TranCode]')[$('.ct_list_pop td:nth-child(1)').index(this)]).val() == ''){
				self.location="/purchase/getPurchase?tranNo="+$($('input[name=tranbyNo]')[$('td:nth-child(1)').index(this)]).val();
			//self.location="/product/getProduct?prodNo="+$($('input[name=prodbyNo]').index(this)).val()+"&menu=${param.menu}";
			//}
		});	
	}); */
	
</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
 <div class="container"> 
 	<div class="page-header text-info">
		<c:if test="${communityType == '0'}">
			<h1>Question Q&A</h1>
		</c:if>
		<c:if test="${communityType == '1'}">
			<h1>Trip Review</h1>
		</c:if>
	</div>

 
 	<form name="detailForm" action="/community/listCommunity" method="post"></form>
	 
 	<div class="row">
   	<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수
		    	</p>
	</div>
	
	<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    	
			      <button type="button" id="write" class="btn btn-default">글 쓰 기</button>
				  
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" id="searchCondition">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>작성자</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${!empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default" id="searchButton">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>	  
				</form>
	    </div>
	</div>
	
	<div class="col-md-12">
		<hr sytle="border-style:dotted">
	</div>
	
	
	<div class="row2">
	<c:set var="i" value="${resultPage.totalCount }" />
		<c:forEach var="community" items="${list}">
		
    <div class="col-md-3">
      <div class="thumbnail" style="height:400px">
        <input type="hidden" name="communityNo" value="${community.communityNo}"/>
		<input type="hidden" name="userNo" value="${community.userNo}"/>
        <img src="https://lh4.googleusercontent.com/-1wzlVdxiW14/USSFZnhNqxI/AAAAAAAABGw/YpdANqaoGh4/s1600-w400/Google%2BSydney" style="width:300px; height:150px;"/>
          <div class="caption">
          <p>[게시판번호  : ${i}]</p>
    	  <p>[제   목 : ${community.communityTitle }]</p>
          <p>[작성자 : ${community.userName }]</p>
          <p>[등록일 : ${community.regDate }]</p>
          <p>[조회수 : ${community.viewCount }]</p>
          <p>[커뮤니티번호 : ${community.communityNo }]</p>     
            <p><a class="btn btn-primary" id="getButton">상세보기</a>
               <a href="#" class="btn btn-default" id="reportButton">신고하기</a></p>
          </div>
      </div>
    </div>
    <c:set var="i" value="${ i-1 }" /> 
 	</c:forEach>
 	</div>
</div>    
</body>
</html>