
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>구매등록</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  	
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
  	
  	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/resources/css/animate.min.css" rel="stylesheet">
   <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
  	
  	<!-- //////////////////////////////////// paypal ///////////////////////////////////////// -->
	<script src="https://www.paypalobjects.com/api/checkout.js"></script>	
	
	 <!-- 다이얼로그  -->   
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	
	<!-- ---------font ------------ -->
  	<link href="/resources/css/plan.css" rel="stylesheet" type="text/css" />
	
	

<style>
	body {
		padding-top: 60px;
		/* background: rgba(208, 211, 197, 0.3); */
		background:  #f4f4f4;		
		/* color: #08708A; */
	}	
	.image {
	  margin: 20px 0;
	  position:relative;
	}
	
	.image img {
	  float: none;
	  margin: 0 auto;
	  width: 50%;
	  height: 50%;
	  -webkit-border-radius: 50% !important;
	  -moz-border-radius: 50% !important;
	  border-radius: 50% !important;
	}
	.image.text {	 
	  position:absolute;
	  
	  
	}
	.btn {	
		letter-spacing: 1px;
		text-decoration: none;
		background: none;
		-moz-user-select: none;
		background-image: none;
		border: 1px solid transparent;
		border-radius: 0;
		cursor: pointer;
		display: inline-block;
		margin-bottom: 0;
		vertical-align: middle;
		white-space: nowrap;
		font-size: 14px;
		line-height: 20px;
		font-weight: 700;
		text-transform: uppercase;
		border: 2px solid;
		padding: 8px 20px;	
	}
	.btn.btn-default:hover, .btn.btn-default:active{
		color: #FFF;
		background: #08708A;
		border-color: #08708A;
	}
	
	.btn.btn-default{
		background: #f4f4f4;
		color: #08708A;
		border-color: #08708A;
	}
	.jumbotron
         {   
            padding-top : 30px;
            padding-bottom : 20px;
            margin-bottom: 10px;
         } 
    a img:hover{
    	opacity:0.75;
		transition-duration: 0.1s;
    }
	
</style>
<script type="text/javascript">

function fncKakaoPay() {
	//alert("??");	
	$("form").attr("method" , "POST").attr("action" , "/transaction/kakaoPayReady").submit();
	
	/* var requirement = $("#requirement").val();
	var window = window.open('','','location=no,menubar=no,resizable=no,status=no,right=0,width=500,height=500'):
		window.
	window.open("http://192.168.0.35:8080/transaction/kakaoPayPopUpReady/${transaction.tripDate}/${transaction.count}/${transaction.totalPrice}/${user.userNo}/requirement/${transaction.tranPro.productNo}",
			'location=no,menubar=no,resizable=no,status=no,right=0,width=500,height=500'); */
	
	 /* var myForm = document.detailForm;
	 var url = "http://192.168.0.35:8080/transaction/kakaoPayReady";
	 window.open("" ,"popForm", 
	       "toolbar=no, width=540, height=467, directories=no, status=no,    scrollorbars=no, resizable=no"); 
	 myForm.action =url; 
	 myForm.method="post";
	 myForm.target="detailForm";	 
	 myForm.submit(); */
	
}

function fncPayPal() {
	//document.addPurchase.submit();
	$("form").attr("method" , "POST").attr("action" , "/transaction/payPal").submit();
}

$(function() {
	$( "a.btn.btn-default.btn" ).bind("click" , function() {
		history.go(-1);
	});
});



$(function() {
	$( "#kakaoPay-btn" ).bind("click" , function() {
		fncKakaoPay();
		//$('#exampleModal').modal('show');
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
        	 label: 'paypal',
             size:  'medium',    // small | medium | large | responsive
             shape: 'pill',     // pill | rect
             color: 'blue',     // gold | blue | silver | black
             tagline: false
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
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container-fluid">
	
		<h1 class="text-center" style="font-family: 'Pacifico', 'cursive';">ready to go?<br/></h1>
		<input type="hidden" name="USDprice" value="" />
		<center>
		<div class="image" style="position:relative;">
		<c:if test="${! empty transaction.tranPro.thumbnail}">
			<img src="/resources/images/productThumbnail/${transaction.tranPro.thumbnail}"
				style="width: 250px; height: 250px;" alt="..."
				class="img-rounded">
			<div class="text"><h1>${transaction.tranPro.productName}</h1></div>
		</c:if> 
		<c:if test="${empty transaction.tranPro.thumbnail}">
			<img src="http://www.fada.org/wp-content/themes/fada/img/placeholder.jpg"
				style="width: 200px; height: 170px;" alt="..."
				class="img-rounded">
			<div class="text"><h1>${transaction.tranPro.productName}</h1></div>
		</c:if>
		</center>
		<br/>
		</div>
		
		<div class="jumbotron col-md-8 col-md-offset-2">
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm">
			<input type="hidden" name="productNo" value="${transaction.tranPro.productNo}" />
		 <!-- <div class="row">
		 <div class="col-md-12"> -->			  
			  
			  <div class="form-group">
			    <label class="col-sm-3 col-sm-offset-2">투어날짜</label>
			    <input type="hidden" name="tripDate" value="${transaction.tripDate}" />
			    <div class="col-sm-6">
			      ${transaction.tripDate}
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-3 col-sm-offset-2">구매갯수</label>
			    <input type="hidden" name="count" value="${transaction.count}" />
			    <div class="col-sm-6">
			      ${transaction.count}
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-3 col-sm-offset-2">1인당 투어 가격</label>
			    <div class="col-sm-6">
			      ${transaction.tranPro.productPrice}
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-3 col-sm-offset-2">합계(KRW)</label>
			    <input type="hidden" name="totalPrice" value="${transaction.totalPrice}" />
			    <div class="col-sm-6">
			      ${transaction.totalPrice}
			    </div>
		 	 </div>		
		  
			  <div class="form-group">
			    <label class="col-sm-3 col-sm-offset-2">호스트</label>
			    <input type="hidden" name="hostNo" value="${transaction.tranPro.hostNo}" />
			    <div class="col-sm-6">
			      ${transaction.tranPro.hostName}
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-3 col-sm-offset-2">구매자</label>
			    <input type="hidden" name="buyerNo" value="${user.userNo}" />
			    <div class="col-sm-6">
			     ${user.userName}		     
			    </div>
			  </div>	
					  		  
			  <div class="form-group">
			  
			    <label for="receiverName" class="col-sm-3 col-sm-offset-2">요청사항</label>
			    <div class="col-sm-5">
			      <input type="text" class="form-control" id="requirement" name="requirement" >
			    </div>
			  </div>
			  
			  <br/>
			  <div class="form-group text-center">
			   <div class="pay col-sm-offset-1  col-sm-5 text-center">	
			  <a id="kakaoPay-btn" role="button"><img src="/resources/images/payment_KakaoTalk.png" style="width: 250px; height: 40px;"/>
			</a>
			</div>
			
			<div class="pay col-sm-2 text-center" >
			  <a id="paypal-button"></a>
		    </div>
		  </div>

		</form>
		</div>
		<!-- form Start /////////////////////////////////////-->
				   
		    <div class="col-sm-12 text-center" align="center">
		     <a class="btn btn-default btn" href="#" role="button">취&nbsp;소</a>   
		    </div> 		  
 	</div>
 	
 	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <!-- <h5 class="modal-title" id="exampleModalLabel">Modal title</h5> -->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
    </div>
  </div>
</div>
 	
	<!--  화면구성 div end /////////////////////////////////////-->
</body>
</html>