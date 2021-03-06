<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
    <script src="/resources/lang/summernote-ko-KR.js"></script>
	
    <link href="/resources/css/summernote.css" rel="stylesheet">
  	<script src="/resources/javascript/summernote.min.js"></script> 
	
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
		
		<!-- ---------font ------------ -->
  	<link href="/resources/css/font.css" rel="stylesheet" type="text/css" />   
		<!-- 다이얼로그  -->
  	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
  	<link href="/resources/css/community.css" rel="stylesheet" type="text/css"/>	
  	<link href="/resources/css/floatingButtonRoom.css" rel="stylesheet" type="text/css" />
  	
  	  <!--  ///////////////////////// CSS ////////////////////////// -->
<link rel="stylesheet" href="/resources/css/font.css" />


<style type="text/css">



	 #head{
		  		background-image: url("/resources/images/community.png");
		  		font-family: "Pacifico", cursive;
		  		height : 250px;
		  }
	.thumbnail{
			border-radius: 23px;
		 	border: dashed rgba(102, 102, 102, 1) 1.3px;
		 	font-family:JEJUGOTHIC !important;
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
							var thumbnail ='';
							if(JSONData[i].thumbnail == ''){
								thumbnail='<img src="/resources/images/communitythumbnail/'+JSONData[i].thumbnail+'" style="width:300px; height:150px;" alt="" title="" class="property_img"/>';							
							}else{
								thumbnail='<img src="http://www.fada.org/wp-content/themes/fada/img/placeholder.jpg" style="width:300px; height:150px;" alt="" title="" class="property_img"/>';							
							}
							var report = '';
							/* if(${user.userNo} != JSONData[i].userNo){
								report='<a class="btn btn-outlined btn-light btn-sm" id="reportButton">신고하기</a></p>';
							} */

							
							var title = JSONData[i].communityTitle;
							if(title.length>12){
								title=title.substring(0,11)+"..."
							}
							
							var displayValue = 
						    '<div class="col-md-3" name="getcommunity">'+
						      '<div class="thumbnail" style="height:320px">'+
						      '<input type="hidden" name="communityNo" value="'+JSONData[i].communityNo+'"/>'+
							  '<input type="hidden" name="userNo" value="'+JSONData[i].userNo+'"/>'+
							  thumbnail+
						         ' <div class="caption">'+
						          	'<p>[ 게 판 번 호  :'+communityNo+' ]</p>'+
						          	'<p>[ 제        목  :'+title+' ]</p>'+ 
						            '<p>[ 작   성   자 : '+JSONData[i].userName+' ]</p>'+
						            '<p>[ 등   록   일 : '+JSONData[i].regDate+' ]</p>'+
						            '<p>[ 조   회   수 : '+JSONData[i].viewCount+' ]</p>'+
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
	 
	 

	$(document).on('click' ,'div[name="getcommunity"]', function() {
		self.location="/community/getCommunity?communityNo="+$($('input[name=communityNo]')[$('div[name="getcommunity"]').index(this)]).val();
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
   	
   	<div class="jumbotron" id="head" style="font-family:'JEJUGOTHIC' !important; align-content: center; padding-bottom: 20px; text-shadow: 0 5px 5px rgba(0, 0, 0, .1); ">
      <div class="container" id="container">
      <c:if test="${communityType == '1'}">
     	 <h3 align="center" style="margin-top:3.3vw;font-family:Pacifico;"><strong style="color : #fff;  font-size: 2em !important; margin-bottom : 15px;">BLABLA</strong></h3>
	 	 <h4 align="center" style="font-family:'TYPO_JEONGJOL'; color : #FFF; margin-top : 20px;">여러분들의 이야기를 들려주세요</h4>
	  </c:if>
      </div>
    </div>
  	
 <div class="container" style="font-family:'JEJUGOTHIC' !important;"> 
 
 	<form name="detailForm" action="/community/listCommunity" method="post"></form>
	 
 	
   	<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수
		    	</p>
	</div>
	
	<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    <%-- <c:if test="${empty user.userNo}">
			    </c:if>
			    <c:if test="${!empty user.userNo}">
			      <button type="button" id="write" class="btn btn-outlined btn-light btn-xs" style="border: 3px solid;">글 쓰 기</button>
				</c:if>  --%> 
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
				  
				  <button type="button" class="btn btn-outlined btn-theme btn-xs" id="searchButton">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>	  
				</form>
	</div>
	
	
	<div class="col-md-12">
		<hr sytle="border-style:dotted">
	</div>
	
	
	<div class="row2">
	<c:set var="i" value="${resultPage.totalCount }" />
	<c:forEach var="community" items="${list}">

		
    <div class="col-md-3" name="getcommunity">
      <div class="thumbnail" style="height:320px">
        <input type="hidden" name="communityNo" value="${community.communityNo}"/>
		<input type="hidden" name="communityUserNo" value="${community.userNo}"/>
		<input type="hidden" name="communityUserName" value="${community.userName}"/>
		<c:if test="${! empty community.thumbnail}">
			<img src="/resources/images/communitythumbnail/${community.thumbnail}" style="width:300px; height:150px; border-radius: 23px;" alt="" title="" class="property_img"/>							
		</c:if> 
		<c:if test="${empty community.thumbnail}">
			<img src="http://www.fada.org/wp-content/themes/fada/img/placeholder.jpg" style="width:300px; height:150px; border-radius: 23px;" alt="" title="" class="property_img"/>							
		</c:if>
          <div class="caption" >
          <c:if test="${fn:length(community.communityTitle) > 13}">
          <h4> <c:out value="${fn:substring(community.communityTitle,0,12)}"/>... </h4>
          </c:if>
          <c:if test="${fn:length(community.communityTitle) <= 13}">
          <h4>${community.communityTitle }</h4>
          </c:if>
          <p>[ 작   성   자 : ${community.userName } ]</p>
          <p>[ 등   록   일 : ${community.regDate }]</p>
          <p>[ 조   회   수 : ${community.viewCount } ]</p>     
          </div>
      </div>
    </div>
    <c:set var="i" value="${ i-1 }" />
    	
 	</c:forEach>
 	</div>
</div>

<c:if test="${!empty user.userNo}">
<div id="container-floating">
	<div id="floating-button" data-toggle="tooltip" data-placement="center" data-original-title="write" title="커뮤니티등록">
		<p class="letter" id="write">+</p>
	</div>
</div>
</c:if>
			
</body>
</html>