<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품등록</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/resources/css/animate.min.css" rel="stylesheet">
   <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!-- datePicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  			
  	<!-- ---------font ------------ -->
  	<link href="/resources/css/plan.css" rel="stylesheet" type="text/css" />  
  	
  	<!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
  			
  	<!-- summernote -->
  	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  	<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->
  	<!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> -->
  	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>   	
  	   

<style>
       body > div.container{
        	/* border: 3px solid #D6CDB7; */
             margin-top: 80px;
        }
        body{
        	background: rgba(208, 211, 197, 0.3);
        }
        h1{
        	color: rgba(215, 58, 49, 0.7);
        }
         span.input-group-addon{
        	/* background: #08708A; #56B1BF; 
        	color: #D0D3C5; */
        	/* background: rgba(215, 58, 49, 0.7); */
        }
        a.btn.btn-primary.btn{
        	background:rgba(215, 58, 49, 0.8);
        	border:none;       
        }
        button.btn.btn-primary.btn{
        	background:rgba(215, 58, 49, 0.8);
        	border:none; 
        }
        strong{
        	color:rgba(215, 58, 49, 0.8);
        }
        h1{
        	font-family: 'Pacifico', 'cursive';
        	font-size: 45px;
        }
       
        
</style>

<script type="text/javascript">

function fncAddProduct(){
	
	var name=$("input[name='productName']").val();
	var description=$("textarea[name='description']").val();
	var tripDate=$("input[name='tripDate']").val();
	var price=$("input[name='productPrice']").val();
	var city=$("input[name='city']").val();
	var country=$("input[name='country']").val();
	var tourHeadCount=$("input[name='tourHeadCount']").val();

	if(name == null || name.length<1){
		//alert("상품명은 반드시 입력하여야 합니다.");
		swal("투어명은 반드시 입력하여야 합니다.",{
			  icon: "warning",
			});
		return;
	}
	if(country == null || country.length<1){
		//alert("가격은 반드시 입력하셔야 합니다.");
		swal("국가는 반드시 입력하셔야 합니다.",{
			  icon: "warning",
			});
		return;
	}
	if(city == null || city.length<1){
		//alert("가격은 반드시 입력하셔야 합니다.");
		swal("도시는 반드시 입력하셔야 합니다.",{
			  icon: "warning",
			});
		return;
	}
	if(tripDate == null || tripDate.length<1){
		//alert("제조일자는 반드시 입력하셔야 합니다.");
		swal("투어일자는 반드시 입력하셔야 합니다.",{
			  icon: "warning",
			});
		return;
	}
	if(tourHeadCount == null || tourHeadCount.length<1){
		//alert("가격은 반드시 입력하셔야 합니다.");
		swal("1일투어인원은 반드시 입력하셔야 합니다.",{
			  icon: "warning",
			});
		return;
	}
	if(price == null || price.length<1){
		//alert("가격은 반드시 입력하셔야 합니다.");
		swal("가격은 반드시 입력하셔야 합니다.",{
			  icon: "warning",
			});
		return;
	}
	if(description == null || description.length<1){
		//alert("상품상세정보는 반드시 입력하여야 합니다.");
		swal("상품상세정보는 반드시 입력하여야 합니다.",{
			  icon: "warning",
			});
		return;
	}
		
	swal("Daily Tour가 등록되었습니다.",{
		  icon: "success",
		}).then((value) => {
			$("form").attr("method" , "POST").attr("action" , "/product/addProduct").attr("enctype", "multipart/form-data").submit();
		});
	
}

$(function() {
	
	 $( "button.btn.btn-primary" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
		fncAddProduct();
	});
	
});


$(function() {
	
	 $( "#reset" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			$("form")[0].reset();
	});
});

var i = 1;
$(function() {
	
	 $( "#addTripDate" ).on("click" , function() {
		 i++;
		 if(i==2){
			 $( "#removeTripDate" ).attr("disabled", false);
		 }
		 if(i>4){
			 $( "#addTripDate" ).attr("disabled", true);
		 }
		 
		 $( "div[name=addDate]" ).append( $( '<input type="text" class="form-control" id="datepicker'+i+'" name="tripDate" readonly="readonly" placeholder="투어날짜'+i+'" >' ) );
		 $(document).find("input[name=tripDate]").removeClass('hasDatepicker').datepicker({minDate: 0, dateFormat: "yy-mm-dd"});		 
	});
});
$(function() {
	
	 $( "#removeTripDate" ).on("click" , function() {
		 if(i>2){
			 $( "#addTripDate" ).attr("disabled", false);
			 $( '#datepicker'+i ).remove();
			 i--;
		 }else if(i==2){
			 $( "#removeTripDate" ).attr("disabled", true);
			 $( '#datepicker'+i ).remove();
			 i--;
		 }		 
		 // $( "#datepicker[3]" ).remove();
		 //$( "input[name=tripDate]" ).remove();		 
	});
});

$(function() {
	
	 $( "img" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			$("form")[0].reset();
	});
});



$( function() {
	$( "input[name=tripDate]" ).datepicker({
		 minDate: 0,
		 dateFormat: "yy-mm-dd"		 
	});
  } );
  
  ///////////////////summernote///////////////////////////////////['insert', ['table', 'picture', 'video', 'link']],
  function sendFile(file, editor) {              
    // 파일 전송을 위한 폼생성
		data = new FormData();
	    data.append("file", file);
	    //alert('파일업로드 들어오니??');
	    $.ajax({ // ajax를 통해 파일 업로드 처리
	        data : data,
	        dataType : "json",
	        type : "POST",
	        url : "/product/json/uploadProContentImages",
	        cache : false,
	        contentType : false,
	        processData : false,
	        success : function(data) { // 처리가 성공할 경우
            // 에디터에 이미지 출력
     
	        	$(editor).summernote('editor.insertImage',data.relativeUrl);
	        },
	        error : function() {
			alert("파일 업로드에 실패했습니다.")
		}
	    });
	}
  
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
     		   ['insert', ['table', 'picture']],
     		   ['misc', ['undo', 'redo', 'codeview', 'help']]
     		 ],       	
        	lang: 'ko-KR', // default: 'en-US'
        	height: 300,                 // set editor height
        	minHeight: null,             // set minimum height of editor
        	maxHeight: null,             // set maximum height of editor
        	focus: false,                  // set focus to editable area after initializing summernote
        	placeholder: '투어 내용을 입력해 주세요~',
        	//backColor:  'red'
        	callbacks: {
        		onImageUpload: function(files, editor, welEditable) {
    		    	for(i=0;i<files.length;i++){
    		    		sendFile(files[i], this);
    		    	}
        		}
        	} 
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
			alert($('#file').val());
			alert(e.target.result);
		}
	}

</script>
</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
				
		<h1 >DailyTour</h1>
		<br/>
		<br/>
							
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm">
		
		<div class="row">
  <div class="col-sm-12">
  
   <div class="row">
      <div class="col-sm-5">
		 
		  <div class="form-group">		    
		   <!--  <div class="col-sm-5"> -->
		    <div class="input-group">
		    <span class="input-group-addon">투어명</span>
		      <input type="text" class="form-control" id="productName" name="productName" placeholder="여행제목을 입력해 주세요~" >	
		      </div>	       
		    <!-- </div> -->
		   </div> 
		   
		   <div class="form-group">
		    
		    <!-- <div class="col-sm-5"> -->
		     <div class="input-group">
		    <span class="input-group-addon">국가</span>
		      <input type="text" class="form-control" id="country" name="country" placeholder="국가">
		       </div>
		   <!--  </div> -->
		   </div> 
		   
		   <div class="form-group">
		    
		    <!-- <div class="col-sm-5"> -->
		    <div class="input-group">
		    <span class="input-group-addon">도시</span>
		      <input type="text" class="form-control" id="city" name="city" placeholder="도시">
		       </div>
		   <!--  </div> -->
		   </div> 	  
		  
		  <div class="form-group">
			    
			    <!-- <div class="col-sm-8" name="addDate">  -->
			    <!-- <div class="col-sm-9"> -->
			  
			    
			   
			      <div class="input-group" name="addDate">
			    <span class="input-group-addon">투어날짜</span>		      
			      <input type="text" class="form-control" id="datepicker1" name="tripDate" readonly="readonly" placeholder="투어날짜 Click">	
			           
			     </div>
			     
			     <!-- </div> -->
			     
			    <!--  <div class="col-sm-3"> -->
			  
			     
			     <div class="btn-group" role="group" aria-label="...">
				    <a class="btn btn-primary btn" href="#" role="button" id="addTripDate" name="addTripDate"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>		    
				    <a class="btn btn-primary btn" href="#" role="button" id="removeTripDate" name="removeTripDate" disabled="true"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></a>	
			    </div>
			    
		   
		  <!--  </div> -->
		   
		    <!--  </div>     --> 
		  </div>		  
		  
		   <div class="form-group">
		    
		   <!--  <div class="col-sm-5"> -->
		    <div class="input-group">
		    <span class="input-group-addon">투어유형</span>
		      	<select class="form-control" name="productType">
				  <option value="1" selected>명소투어</option>
				  <option value="2">음식투어</option>
				  <option value="3">트레킹</option>
				  <option value="4">액티비티</option>
				  <option value="5">night투어</option>
				</select>
				</div>
		   <!--  </div> -->
		   </div> 
		  
		  <div class="form-group">
		    
		   <!--  <div class="col-sm-5"> -->
		    <div class="input-group">
		    <span class="input-group-addon">1일 투어 인원</span>
		      <input type="text" class="form-control" id="tourHeadCount" name="tourHeadCount" placeholder="1일 투어 인원">
		      </div>
		    <!-- </div> -->
		  </div>
		  
		  
		  <div class="form-group">
		    
		    <!-- <div class="col-sm-5"> -->		        
			  <div class="input-group">		
			  <span class="input-group-addon">가격</span>    
			    <input type="text" class="form-control" id="productPrice" name="productPrice" placeholder="가격" aria-describedby="inputGroupSuccess4Status">
			    <span class="input-group-addon">&#8361;</span>
			  </div>
			  <!-- <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span> -->
			  <!-- <span id="inputGroupSuccess4Status" class="sr-only">(success)</span> -->
			   <!-- <span id="helpBlock" class="help-block">
			      	 <strong class="text-danger">원</strong>
			      </span>	 -->	
		    <!-- </div> -->
		  </div>		   
		  		  		  
		  <div class="form-group">
		    <!-- <label for="files" class="col-sm-offset-1 col-sm-3 control-label">투어 썸네일</label> -->
		    <!-- <div class="col-sm-5"> -->		 
		     <div class="input-group">		
			  <span class="input-group-addon">투어 썸네일</span>	    	     
			    <!-- <label for="files">파일 업로드</label>	 -->		    			    
			    <input type="file" id="file" name="file">
			    <img id="blah" />
			    </div>			   
		      <span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">썸네일을 등록해 주세요</strong>
		      </span>
		    <!-- </div> -->
		  </div>
		  
		  
		  </div>
		  <div class="col-sm-1">
		  </div>
		  <div class="col-sm-5">
		  
		  
		  
		  
		  <div class="form-group">
		   <!--  <label for="description" class="col-sm-offset-1 col-sm-3 control-label">투어 상세 내용</label> -->
		    <!-- <div class="col-sm-5">	 -->
		   	    	
		      <textarea id="summernote" name="description"></textarea>
		      
		   <!--  </div> -->
		  </div>
		  
		  
		  
		  </div>
		  
		  </div>
		  </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" >등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button" id="reset">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
</body>
</html>