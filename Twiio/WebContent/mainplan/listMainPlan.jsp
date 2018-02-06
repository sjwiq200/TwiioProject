<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<!-- ///////////////////////////////////////////////////////////////////////// -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bttn.css/0.2.4/bttn.min.css">


<title>MainPlanList</title>


<style>

body {
    padding-top : 50px;
}

</style>


<script>

	
	function fncAddMainPlanList() {
		$("form").attr("method", "POST").attr("action","/mainplan/addMainPlan.jsp").submit();
	}

	$(function() {
		$("#addMainPlan").bind("click", function() {
			fncAddMainPlanList();
		});
	});
	
	
	 $(function() {
			$("button:contains('수정')").bind("click",function() {
				var index = $("button:contains('수정')").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/mainplan/updateMainPlanView?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			});
	 });
	 
	 $(function() {
			$("button:contains('삭제')").bind("click",function() {
				var index = $("button:contains('삭제')").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/mainplan/deleteMainPlan?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			});
	 })
	 
	 	 $(function() {
			$("button:contains('선택')").bind("click",function() {
				var index = $("button:contains('선택')").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/dailyplan/listDailyPlan?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			});
	 })
	 
	 $(function(){
		 $("#listScrap").bind("click",function(){
			 var url = "/mainplan/listScrap";
			 $(location).attr('href', url);
		 })
	 })
 
	 $(function(){
		 $("#listSharedPlan").bind("click",function(){
			 var url = "/mainplan/listSharedPlan";
			 $(location).attr('href', url);
		 })
	 })

	 /////////////////////////친구와 공유하기 기능///////////////////////////
	$(function() {
	
		$("input[name='shareWithFriendButton']").bind("click",function() {
			var index = $("input[name='shareWithFriendButton']").index(this);
			var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
			
			var friend;
			var result ="";

			 $.ajax({
	    				url:"/dailyplan/json/listFriend?mainPlanNo="+mainPlanNo,
	    				method:"GET",	    					
	    				dataType:"json",
	    				headers : {
								"Accept" : "application/json", 
								"Content-Type" : "application/json"
							},
	    				success:function(JSONData){
	    					friend = JSONData.friendInfo;
		    					for(var i=0;i<friend.length;i++){
		    						result +='<p> [USER NO] : '+friend[i].userNo+ '</p>'
		    								+'<span>  [아이디] : '+friend[i].userId+'</span>'
		    								+'<span>  [이름] : '+friend[i].userName+'</span>'
		    								+'<span>  [성별] : '+friend[i].userGender+'</span>'
		    								+'<span>  [사진] : '+friend[i].userImage+'</span>'
		    								+'<span>&nbsp;</span>'
		    								+'<button type="button" id="sharePlan'+i+'" class="btn btn-success btn-sm" onclick="sharePlan('+friend[i].userNo+','+i+','+mainPlanNo+')">공유하기</button><p>&nbsp;</p>';
		    					}
		    				 $('#shareWithFriendList').html(result);
		    				 $('#shareWithFriend').modal('show');  
	    					}
			    });
		});
	 });
	 
	function sharePlan(userNo,i,mainPlanNo) {
			$.ajax({
	            url:'/dailyplan/json/sharePlan?userNo='+userNo+"&mainPlanNo="+mainPlanNo,
	            type:'get'
	         });
	   var a = "#sharePlan" + i;
	    $("#sharePlan"+i).remove(); 
	}
	
	
	 
</script>

</head>
<body>
		<jsp:include page="/layout/toolbar.jsp" />

	<form>
		
		<div class="container">
			
			
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			<div align="center">
			<button type="button" class="btn" id="listScrap" ><Strong>Scrap</Strong></button> 
			<button type="button" class="btn" id="addMainPlan" ><Strong>ADD</Strong></button>
			<button type="button" class="btn" id="listSharedPlan" ><Strong>친구와 공유하고 있는 플랜 보기</Strong></button>
			</div>
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			
			<button class="bttn-bordered bttn-md">
  			<i class="icon-menu"></i>
			</button>
			
			

			<c:set var="i" value="0" />
				  	<c:forEach var="mainPlan" items="${list}">
				  		<c:set var="i" value="${ i+1 }" />

				<div class="col">
					<div class="col-md-6">
						<div class="thumbnail">
						
							<input type="button" id="shareWithFriendButton" name="shareWithFriendButton" class="btn btn-success" value="친구와 공유하기" />
							<img
								src="/resources/images/thumbnail_plan/main_thumbnail4.jpg"
								style="width: 300px; " />
							
							
							<div class="caption">

								<input type="hidden" name="mainPlanNo"
									value="${mainPlan.mainPlanNo}" />
								
								<div>[${ i }]</div>
								<div>플랜번호 : ${mainPlan.mainPlanNo}</div>
								<div>유저번호 : ${mainPlan.user.userNo}</div>
								<div>출발일 : ${mainPlan.departureDate }</div>
								<div>도착일 : ${mainPlan.arrivalDate}</div>
								<div>국가명 : ${mainPlan.country}</div>
								<div>도시명 : ${mainPlan.city}</div>
								<div>플랜제목 : ${mainPlan.planTitle}</div>
								<div>섬네일이미지 : ${mainPlan.mainThumbnail}</div>


								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-ok" aria-hidden="true"
										id="update"></span>수정
								</button>

								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-ok" aria-hidden="true"
										id="delete"></span>삭제
								</button>

								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-ok" aria-hidden="true"
										id="submit"></span>선택
								</button>

							</div>
						</div>
					</div>
				</div>

			</c:forEach>
			
			
    		<!---------- ShareWithFriend Dialog <START>------------->

		<div class="modal fade" id="shareWithFriend" role="dialog">
			<div class="modal-dialog modal-md">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<Strong>나의 플랜 북을 친구들과 공유할까요?</Strong>
						</h4>
						<h7 class="modal-title">TWIIO</h7>
					</div>

					<div class="modal-body" align="center">
						
						<div id="shareWithFriendList" > </div>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<!---------- ShareWithFriend Dialog <END>------------->
    
    
    
    
    
    
    
    
      <div class="box-animate animated fadeInUp" style={{ 'animation-delay': 0.4 + i * 0.07 + 's'}}>
                <div class="box"key={size} style={{color: color,background: background}}>
                    <div class="title-wrapper">
                        <div class="title">{bttn.displayName}</div>
                        <a href={"https://raw.githubusercontent.com/ganapativs/bttn.css/master/dist/standalone/" + bttn.name + ".css"}
                           download={bttn.name + ".css"}>
                            <div class="download-standalone hidden-xs hint--bottom-left hint--rounded hint--bounce"
                                 aria-label={"Download standalone " + bttn.name + ".css"}>
                                <i class="icon-cloud-download"/>
                            </div>
                        </a>
                    </div>
                    <hr/>
                    <div class="button-wrapper animated fadeIn">
                        <button class={{
                            ["bttn-" + bttn.name]: true,
                            ["bttn-" + size]: true,
                            ["bttn-" + activeColor]: true,
                            "bttn-block": block,
                            "bttn-no-outline": !outline
                        }} dangerouslySetInnerHTML={{__html: bttn.texts[activeSize]}}>
                        </button>
                    </div>
                    <div class="classname"
                         style={{
                             color: color,
                             background: codeBackground
                         }}>
                        .bttn-{bttn.name}.bttn-{size}
                    </div>
                   
                    <div class={"code-copy code-copy" + i}>{textCopied ? 'Copied' : 'Copy code'}</div>
                </div>
            </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	
			
		</div>
	</form>
</body>
</html>