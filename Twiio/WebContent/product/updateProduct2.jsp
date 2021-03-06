<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>상품등록</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->
	
	<!-- datePicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  			
  	<!-- summernote -->
  	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  	<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->
  	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 	 
  	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
  
  	<!-- <link href="summernote.css" rel="stylesheet">
  	<script src="summernote.min.js"></script>
  	include summernote-ko-KR
  	<script src="lang/summernote-ko-KR.js"></script> -->
  	
  	 <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"> -->
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script> -->
       

<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
</style>

<script type="text/javascript">

function fncAddProduct(){
		
	var name=$("input[name='productName']").val();
	var description=$("textarea[name='description']").val();
	var tripDate=$("input[name='tripDate']").val();
	var price=$("input[name='productPrice']").val();

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(description == null || description.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(tripDate == null || tripDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	
	$("form").attr("method" , "POST").attr("action" , "/product/updateProduct").attr("enctype", "multipart/form-data").submit();
}

$(function() {
		
	 $( "button.btn.btn-primary" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
		fncAddProduct();
	});
	
});


$(function() {
	
	 $( "#cancel" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			history.go(-1);
	});
});

var i = ${dateNum};
$(function() {
	//alert(i);
	 $( "#addTripDate" ).on("click" , function() {
		 i++
		 if(i==2){
			 $( "#removeTripDate" ).prop("disabled", false);
		 }
		 if(i>4){
			 $( "#addTripDate" ).prop("disabled", true);
		 }
		 //alert(i);
		 $( "div[name=addDate]" ).append( $( '<input type="text" class="form-control" id="datepicker'+i+'" name="tripDate" readonly="readonly" placeholder="투어날짜'+i+'" >' ) );
		 $(document).find("input[name=tripDate]").removeClass('hasDatepicker').datepicker({minDate: 0, dateFormat: "yy-mm-dd"});
		 
	});
});
$(function() {
		
	 $( "#removeTripDate" ).on("click" , function() {
		 if(i>2){
			 $( "#addTripDate" ).prop("disabled", false);
			 $( '#datepicker'+i ).remove();
			 i--;
		 }else if(i==2){
			 $( "#removeTripDate" ).prop("disabled", true);
			 $( '#datepicker'+i ).remove();
			 i--;
		 }		 
		 	 
	});
});


$( function() {
	$( "input[name=tripDate]" ).datepicker({
		 minDate: 0,
		 dateFormat: "yy-mm-dd"		 
	});
  } );
  
  ///////////////////summernote///////////////////////////////////
   $(function() {
        $('#summernote').summernote({
        	
        	toolbar: [
     		   // [groupName, [list of button]]
     		   ['style', ['style', 'bold', 'italic', 'underline', 'clear']],
     		   ['font', ['font family', 'strikethrough', 'superscript', 'subscript']],
     		   ['fontsize', ['fontsize']],
     		   ['color', ['color']],
     		   ['para', ['ul', 'ol', 'paragraph']],
     		   ['height', ['height']],
     		   ['insert', ['table', 'picture', 'video', 'link']],
     		   ['misc', ['undo', 'redo', 'codeview', 'help']]
     		 ],       	
        	lang: 'ko-KR', // default: 'en-US'
        	height: 300,                 // set editor height
        	minHeight: null,             // set minimum height of editor
        	maxHeight: null,             // set maximum height of editor
        	focus: false,                  // set focus to editable area after initializing summernote
        	placeholder: '투어 내용을 입력해 주세요~'
        });
        
       //  $("button[name=save]").on("click",function(){
       // 	$("textarea").val($("#summernote").summernote("code"));
       // 	$("form").attr("method" , "POST").attr("action" , "/user/summernote").submit();
       // }); 
        
        
    }); 
  
  	$(function(){
  		 $( "#country" ).autocomplete({
				
		      source: function( request, response ) {
		    	  $.ajax(
		    				{
		    					url:"/information/json/countryAutoComplete/",
		    					method:"POST",	    					
		    					data:{	    						
		    						keyword:$("#country").val()		    						
		    						},
		    					dataType:"json",
		    					success:function(JSONData){
		    							    							    						
		    						response($.map(JSONData, function (item) {
		    				           
		    							return item;
		    				        }));
		    					}
		    				}
		    			);
		     	 },
		     
		    });
  		 
  		 $( "#city" ).autocomplete({
				
		      source: function( request, response ) {
		    	  $.ajax(
		    				{
		    					url:"/information/json/cityAutoComplete/",
		    					method:"POST",	    					
		    					data:{	    						
		    						keyword:$("#city").val()		    						
		    						},
		    					dataType:"json",
		    					success:function(JSONData){
		    							    							    						
		    						response($.map(JSONData, function (item) {
		    				           
		    							return item;
		    				        }));
		    					}
		    				}
		    			);
		     	 },
		     
		    });
  	});
  	
  	$(function() {
		$("#file").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result).attr('width', '300px');
			}
			reader.readAsDataURL(input.files[0]);
			alert(e.target.result);
		}
	}
  
   

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
	
		<h1 class="bg-primary text-center">투 어 등 록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm">
		
		  <div class="form-group">
		  <input type="hidden" name="productNo" value="${product.productNo }"></input>
		  <input type="hidden" name="hostNo" value="${product.hostNo }"></input>
		    <label for="productName" class="col-sm-offset-1 col-sm-3 control-label">투어명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="productName" name="productName" value="${product.productName}" >
		       
		    </div>
		   </div> 
		   
		   <div class="form-group">
		    <label for="country" class="col-sm-offset-1 col-sm-3 control-label">국가</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="country" name="country" value="${product.country}">
		       
		    </div>
		   </div> 
		   
		   <div class="form-group">
		    <label for="city" class="col-sm-offset-1 col-sm-3 control-label">도시</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="city" name="city" value="${product.city}">
		       
		    </div>
		   </div> 	  
		  
		  <div class="form-group">
		    <label for="tripDate" class="col-sm-offset-1 col-sm-3 control-label">투어날짜</label>
		    <div class="col-sm-4" name="addDate">
		      <a class="btn btn-primary btn" href="#" role="button" id="addTripDate" name="addTripDate">+</a>
		      <a class="btn btn-primary btn" href="#" role="button" id="removeTripDate" name="removeTripDate" disabled="true">-</a>
		      <c:set var="date" value="${product.tripDate}"></c:set>
				<c:set var="date_array" value="${fn:split(date,',')}"></c:set>
				<c:set var="i" value="0"/>		
					<c:forEach var="tdate" items="${date_array}" begin="0" step="1">
					<c:set var="i" value="${i+1}"/>						
						<input type="text" class="form-control" id="datepicker${i}" name="tripDate" readonly="readonly" value="${fn:split(tdate,'=')[0]}">						
					</c:forEach>	      	      
		    </div>
		    <!--<div class="col-sm-3">  -->
		     <!-- <img src="../images/ct_icon_date.gif" width="15" height="15" 
				onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/>-->
		    <!--</div>  -->
		  </div>
		  
		   <div class="form-group">
		    <label for="productType" class="col-sm-offset-1 col-sm-3 control-label">투어유형</label>
		    <div class="col-sm-4">
		      	<select name="productType">
				  <option value="1" ${ product.productType==1 ? "selected" : "" }>명소투어</option>
				  <option value="2" ${ product.productType==2 ? "selected" : "" }>음식투어</option>
				  <option value="3" ${ product.productType==3 ? "selected" : "" }>트레킹</option>
				  <option value="4" ${ product.productType==4 ? "selected" : "" }>액티비티</option>
				  <option value="5" ${ product.productType==5 ? "selected" : "" }>night투어</option>
				</select>
		    </div>
		   </div> 
		  
		  <div class="form-group">
		    <label for="tourHeadCount" class="col-sm-offset-1 col-sm-3 control-label">1일 투어 인원</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="tourHeadCount" name="tourHeadCount" value="${product.tourHeadCount}">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="productPrice" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="productPrice" name="productPrice" value="${product.productPrice}">
		      <span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">원</strong>
		      </span>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="description" class="col-sm-offset-1 col-sm-3 control-label">투어 상세 내용</label>
		    <div class="col-sm-4">		    	
		      <textarea id="summernote" name="description" >${product.description}</textarea>
		    </div>
		  </div>
		  		  		  
		  <div class="form-group">
		    <label for="files" class="col-sm-offset-1 col-sm-3 control-label">투어 섬네일</label>
		    <div class="col-sm-4">		      
			    <label for="files">파일 업로드</label>
			    <input type="file" id="file" name="file" >
			    <img id="blah" />			   
		      <span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">업로드 gogo</strong>
		      </span>
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" >등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button" id="cancel">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
</body>
</html>