<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>��ǰ���</title>

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
  	
  	<!-- summernote -->
  	<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  -->
  	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
  
  	<link href="summernote.css" rel="stylesheet">
  	<script src="summernote.min.js"></script>
  	<!-- include summernote-ko-KR -->
  	<script src="lang/summernote-ko-KR.js"></script>



<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
</style>

<script type="text/javascript">

function fncAddProduct(){
	//Form ��ȿ�� ����
 	//var name = document.detailForm.prodName.value;
	//var detail = document.detailForm.prodDetail.value;
	//var manuDate = document.detailForm.manuDate.value;
	//var price = document.detailForm.price.value;
	
	var name=$("input[name='productName']").val();
	var description=$("textarea[name='description']").val();
	var tripDate=$("input[name='tripDate']").val();
	var price=$("input[name='productPrice']").val();

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(description == null || description.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(tripDate == null || tripDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}

	//document.detailForm.action='/product/addProduct';
	//document.detailForm.submit();
	$("form").attr("method" , "POST").attr("action" , "/product/addProduct").attr("enctype", "multipart/form-data").submit();
}

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "button.btn.btn-primary" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('���')" ).html() );
		fncAddProduct();
	});
});

//function resetData(){
//	document.detailForm.reset();
//}
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "#reset" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('���')" ).html() );
			$("form")[0].reset();
	});
});

var i = 0;
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "#addTripDate" ).on("click" , function() {
		 i++;
		 $( "div[name=addDate]" ).append( $( '<input type="text" class="form-control" id="datepicker'+i+'" name="tripDate" readonly="readonly" >' ) );
		 $(document).find("input[name=tripDate]").removeClass('hasDatepicker').datepicker({dateFormat: "yy-mm-dd"});		 
	});
});
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "#removeTripDate" ).on("click" , function() {
		 $( '#datepicker'+i ).remove();
		 // $( "#datepicker[3]" ).remove();
		 //$( "input[name=tripDate]" ).remove();
		 i--;
	});
});

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "img" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('���')" ).html() );
			$("form")[0].reset();
	});
});

/* $(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "button.btn.btn-info" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('���')" ).html() );
			//$( "button.btn.btn-info" )."show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"
	});
}); */

$( function() {
	$( "input[name=tripDate]" ).datepicker({
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
        	focus: true,                  // set focus to editable area after initializing summernote
        	placeholder: '���� ������ �Է��� �ּ���~'
        });
        
        /* $("button[name=save]").on("click",function(){
        	$("textarea").val($("#summernote").summernote("code"));
        	$("form").attr("method" , "POST").attr("action" , "/user/summernote").submit();
        }); */
        
        
    });

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

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">�� �� �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm">
		
		  <div class="form-group">
		    <label for="productName" class="col-sm-offset-1 col-sm-3 control-label">�����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="productName" name="productName" placeholder="��ǰ�Է� gogo">
		       
		    </div>
		   </div> 
		   
		   <div class="form-group">
		    <label for="country" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="country" name="country" placeholder="����">
		       
		    </div>
		   </div> 
		   
		   <div class="form-group">
		    <label for="city" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="city" name="city" placeholder="����">
		       
		    </div>
		   </div> 	  
		  
		  <div class="form-group">
		    <label for="tripDate" class="col-sm-offset-1 col-sm-3 control-label">���¥</label>
		    <div class="col-sm-4" name="addDate">
		      <a class="btn btn-primary btn" href="#" role="button" id="addTripDate" name="addTripDate">+</a>
		      <a class="btn btn-primary btn" href="#" role="button" id="removeTripDate" name="removeTripDate">-</a>
		      <input type="text" class="form-control" id="datepicker0" name="tripDate" readonly="readonly" >		      
		    </div>
		    <!--<div class="col-sm-3">  -->
		     <!-- <img src="../images/ct_icon_date.gif" width="15" height="15" 
				onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/>-->
		    <!--</div>  -->
		  </div>
		  
		   <div class="form-group">
		    <label for="productType" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      	<select name="productType">
				  <option value="1" selected>�������</option>
				  <option value="2">��������</option>
				  <option value="3">Ʈ��ŷ</option>
				  <option value="4">��Ƽ��Ƽ</option>
				  <option value="5">night����</option>
				</select>
		    </div>
		   </div> 
		  
		  <div class="form-group">
		    <label for="tourHeadCount" class="col-sm-offset-1 col-sm-3 control-label">1�� ���� �ο�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="tourHeadCount" name="tourHeadCount" placeholder="1�� ���� �ο�">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="productPrice" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="productPrice" name="productPrice" placeholder="����">
		      <span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">��</strong>
		      </span>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="description" class="col-sm-offset-1 col-sm-3 control-label">���� �� ����</label>
		    <div class="col-sm-4">
		      <textarea id="summernote" name="description"></textarea>
		    </div>
		  </div>
		  		  		  
		  <div class="form-group">
		    <label for="files" class="col-sm-offset-1 col-sm-3 control-label">���� ������</label>
		    <div class="col-sm-4">		      
			    <label for="files">���� ���ε�</label>
			    <input type="file" id="file" name="file">			   
		      <span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">���ε� gogo</strong>
		      </span>
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button" id="reset">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
</body>
</html>