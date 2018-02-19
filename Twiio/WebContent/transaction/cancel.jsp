<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Firebase Eamil Auth ////////////////////////// -->
	
	<script src="https://www.gstatic.com/firebasejs/4.9.0/firebase.js"></script>
	
	<!-- Material Design Theming -->
	  <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.orange-indigo.min.css">
	  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	  <script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
	  
	   <link rel="stylesheet" href="main.css">
	  
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- ---------font ------------ -->
  	<link href="/resources/css/plan.css" rel="stylesheet" type="text/css" /> 
  	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
       
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
         body{
        	background:  #f4f4f4;	
        }
        h1{
        	color: rgba(215, 58, 49, 0.7);
        	font-family: 'Pacifico', 'cursive';
        	font-size: 45px;
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
			margin-top: 10px;
		}		
		.btn.btn-primary:hover, .btn.btn-primary:active {	
			color: #FFF;
			background: #08708A;
			border-color: #08708A;
		}
		
		.btn.btn-primary {			
			background: #f4f4f4;
			color: #08708A;
			border-color: #08708A;
		}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				history.go(-1);
			});
		});	
		
		
	</script>
	
	<script>
	  
	 
		 
	</script>
    
</head>

<body>

	

	<!--  화면구성 div Start /////////////////////////////////////-->
	<!-- <div class="container">
	
		<h1 class="text-center">결제가 취소되었습니다</h1>
		
		form Start /////////////////////////////////////
		
		
		  
		    
		 
		  
		 
		     		 
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    disabled="disabled" 
		      <button type="button" class="btn btn-primary"  >확인</button>
			  
		    </div>
		  </div>
		
		form Start /////////////////////////////////////
		
 	</div> -->
	<!--  화면구성 div end /////////////////////////////////////-->
	<div class="container-fluid">
	
		
		<h1>Daily Tour</h1>
		
		
		
		<div class="jumbotron col-md-8 col-md-offset-2">
		<!-- form Start /////////////////////////////////////-->
		
			
		 <!-- <div class="row">
		 <div class="col-md-12"> -->			  
			  
			  <div class="form-group">
			   <div class="col-sm-offset-4  col-sm-4 text-center">
			    결제가 취소 되었습니다.
			    </div>
			  </div>
			  
			  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    <!-- disabled="disabled"  -->
		      <button type="button" class="btn btn-primary"  >확인</button>
			  
		    </div>
		  </div>

		
		</div>
		<!-- form Start /////////////////////////////////////-->
				   
		    
	
	
</body>

</html>