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
 
</script>

</head>
<body>
		<jsp:include page="/layout/toolbar.jsp" />

	<form>
		
		<div class="container">
			
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			<button type="button" class="btn" id="listScrap" ><Strong>Scrap</Strong></button> 
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			<button type="button" class="btn" id="addMainPlan" ><Strong>ADD</Strong></button>
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			
			

			<c:set var="i" value="0" />
				  	<c:forEach var="mainPlan" items="${list}">
				  		<c:set var="i" value="${ i+1 }" />

				<div class="col">
					<div class="col-md-6">
						<div class="thumbnail">
							
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
			
			
			
	
	<script src="https://www.paypalobjects.com/api/checkout.js"></script>	
	
	<div id="paypal-button-container"></div>

    <script>
    
    var price = ${product.price};
        paypal.Button.render({

            env: 'sandbox', // sandbox | production

            client: {
                sandbox:  'AZDxjDScFpQtjWTOUtWKbyN_bDt4OgqaF4eYXlewfBP4-8aqX3PiV8e1GWU6liB2CUXlkA59kJXE7M6R'
              //production: 'ATZhLEsWCW78Cnm90yst37XvU4iqSbRDRH4f3Cq730PT3P40m0xXlZ-garJpO3Miw77PXUbpnZmAmvnf'
            },

            // 'Pay Now' button 
            commit: true,

            payment: function(data, actions) {
                return actions.payment.create({
                    payment: {
                        transactions: [
                            {
                                amount: { total: price, currency: 'USD' }
                            }   ]  }
                });
            },

            // 구입 완료되면 실행된다.
            onAuthorize: function(data, actions) {
            		$("#cash").attr("selected",false);
            		$("#paypal").attr("selected",true);
  				
   
            		fncAddPurchase();
   
            },
            
            onCancel: function(data, actions) {
               alert("취소하였습니다. 다시 결제 부탁드립니다. ");
              },
        
              onError: function(err) {
               alert("에러가 발생하였습니다. 다시 결제 부탁드립니다.");
              }
              
        }, '#paypal-button-container');

    </script>
    
    
    
	
			
		</div>
	</form>
</body>
</html>