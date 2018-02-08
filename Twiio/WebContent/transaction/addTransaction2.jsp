<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>구매등록</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	
  	<!-- //////////////////////////////////// paypal ///////////////////////////////////////// -->
	<script src="https://www.paypalobjects.com/api/checkout.js"></script>	
	

<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
</style>
<script type="text/javascript">

function fncKakaoPay() {
	//document.addPurchase.submit();
	$("form").attr("method" , "POST").attr("action" , "/transaction/kakaoPayReady").submit();
}

function fncPayPal() {
	//document.addPurchase.submit();
	$("form").attr("method" , "POST").attr("action" , "/transaction/payPal").submit();
}

$(function() {
	$( "a.btn.btn-primary.btn" ).bind("click" , function() {
		history.go(-1);
	});
});



$(function() {
	$( "#kakaoPay-btn" ).bind("click" , function() {
		fncKakaoPay();
	});
});



</script>

  <script>
//////////////////////////////////////////////////////////////PayPal////////////////////////////////////////////////////////
  
  	var USDprice = ${USDprice};
  	var productNo = ${transaction.tranPro.productNo};
    paypal.Button.render({

        env: 'sandbox', // sandbox | production

        client: {
            sandbox:    'AZDxjDScFpQtjWTOUtWKbyN_bDt4OgqaF4eYXlewfBP4-8aqX3PiV8e1GWU6liB2CUXlkA59kJXE7M6R',
            production: productNo
        },
        
        commit: true, // Show a 'Pay Now' button

        style: {
        	label: 'checkout',
            size:  'small',    // small | medium | large | responsive
            shape: 'pill',     // pill | rect
            color: 'gold'      // gold | blue | silver | black
        },

        payment: function(data, actions) {
        	        	
            return actions.payment.create({
                payment: {
                    transactions: [
                        {
                            amount: { total: USDprice, currency: 'USD' }
                        }
                    ]
                }
            });
        },

        // Wait for the payment to be authorized by the customer
        
         onAuthorize: function(data, actions) {
        	 
        	// Execute the payment

             return actions.payment.execute().then(function() {
            	 //alert('Payment Complete!');
            	 fncPayPal();
             });
        	 
	      },
	
	      onCancel: function(data, actions) {
	    	alert("결제 진행이 취소되었습니다. 다시 결제 부탁드립니다. :: ");
	      },
        
        onError: function(err) {
            alert("결제에 실패하였습니다. 다시 결제 부탁드립니다. :: ");
           }

    }, '#paypal-button');

</script>
</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/main.jsp">TWIIO</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">상품상세조회</h1>
		<input type="hidden" name="USDprice" value="" />
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm">
			<input type="hidden" name="productNo" value="${transaction.tranPro.productNo}" />
		 
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">투어명</label>
		    <div class="col-sm-4">
		      ${transaction.tranPro.productName}
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">투어날짜</label>
		    <input type="hidden" name="tripDate" value="${transaction.tripDate}" />
		    <div class="col-sm-4">
		      ${transaction.tripDate}
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">구매갯수</label>
		    <input type="hidden" name="count" value="${transaction.count}" />
		    <div class="col-sm-4">
		      ${transaction.count}
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">1인당 투어 가격</label>
		    <div class="col-sm-4">
		      ${transaction.tranPro.productPrice}
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <input type="hidden" name="totalPrice" value="${transaction.totalPrice}" />
		    <div class="col-sm-4">
		      ${transaction.totalPrice}
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">호스트</label>
		    <input type="hidden" name="hostNo" value="${transaction.tranPro.hostNo}" />
		    <div class="col-sm-4">
		      ${transaction.tranPro.hostName}
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">구매자</label>
		    <input type="hidden" name="buyerNo" value="${user.userNo}" />
		    <div class="col-sm-4">
		     ${user.userName}		     
		    </div>
		  </div>	
				  		  
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="requirement" name="requirement" >
		    </div>
		  </div>
		 
		  		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">		     
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
			  <a id="kakaoPay-btn" href="#" role="button">
				<img src="/resources/images/payment_icon_yellow_medium.png"/>
			  </a>			  
			  <div id="paypal-button"></div>      
		    </div>
		  </div>
		  
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
</body>
</html>