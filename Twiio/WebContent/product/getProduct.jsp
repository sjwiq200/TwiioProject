
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
     
   <!-- scroll -->
   <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
   
   <!-- 다이얼로그  -->   
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	
	 <!-- ---------Floating Button------------ -->
  	<link href="/resources/css/floatingButtonPro.css" rel="stylesheet" type="text/css" />
  	
  	<!--reply  -->
  	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  	 	
	<!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>   

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
			padding-top: 55px;
			background:  #f4f4f4;
		}
		
		textarea {
			width: 100%;
			height: 100px;
			resize: none;
		}
		
		hr {
			//color: #08708A;
			display: block;
		    height: 1px;
		    border: 0;
		    border-top: 1px solid #08708A;
		    margin: 1em 0;
		    padding: 0;
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
	<script type="text/javascript">
	
	 function fncGetUserList(currentPage) {
		//alert("???");
		var productNo = $("input[name='productNo']").val();
	   	$("#currentPage").val(currentPage);
	   	$("tr[name='n']").remove();
	   	$("p.text-primary").empty();
		$("div[name='eval']").empty();
	   	$.ajax(
					{
						url:"/product/json/listStarEvalProduct/",
						method:"POST",	    					
						data:{	    						
							currentPage : $("#currentPage").val(),	
							productNo : $("input[name='productNo']").val()
							},
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},			
						dataType:"json",
						success:function(JSONData){
							//alert("제발ajax");	    											
							//alert("JSONData: \n"+JSONData);
							//alert(JSON.stringify(JSONData));
							
							//alert(JSON.stringify(JSONData.list));
							var list = JSONData.list;
							//alert("list"+JSON.stringify(list));
							//alert(list.length);
							//alert(list[0]);
							//$("#currentPage").val();
							var string;						
							for(var i=0; i<list.length; i++){
								//string += JSON.stringify(list[i].userName);
								string += "<tr name='n'>";
								string += "<td align='left'>"+JSON.stringify(list[i].userName)+"</td>";
								string += "<td align='left'>"+JSON.stringify(list[i].reviewProduct)+"</td>";
								string += "<td align='left'>"+JSON.stringify(list[i].starEvalProduct)+"</td>";
								string += "</tr>";
							}
							//alert(string);
							//
							$("p.text-primary").append("전체  "+JSON.stringify(JSONData.totalCount)+" 건수, 현재 "+JSON.stringify(JSONData.resultPage.currentPage)+"  페이지");
							$("tbody").append(string);
								//alert("dddd");					
							$.ajax(
									{
										url:"/product/json/getEvalProduct/"+productNo,
										method:"GET",	    					
										/* data:{					
											productNo : $("input[name='productNo']").val()
											}, */
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},			
										dataType:"json",
										success:function(JSONData){
																						
											//alert(JSON.stringify(JSONData));
											$("div[name='eval']").append(JSON.stringify(JSONData));
   				
										}
									}
								);
							//var num=JSONData;
							/* response($.map(JSONData, function (item) {
					           
								return item;
					        })); */	
					        				
						}
					}
				);
	   	
	   
		//$("form").attr("method" , "POST").attr("action" , "/transaction/listPurchase").submit();
	}
	
	$(function() {
		
		 $( "button.btn.btn-primary:contains('구매')" ).on("click" , function() {
			 if(${empty user}){
				 alert("로그인 후 이용해 주세요");
				 return
			 }
			 
			if($( "#tripDate" ).val()==0 || $("select[name='count']").val()==0){
				alert("날짜와 갯수를 선택해주세요 :: ");	
				return
			}
			
			 $("form").attr("method" , "POST").attr("action" , "/transaction/addTransaction").submit();
		});
	});
	
	$(function() {
		
		 $( "button.btn.btn-primary:contains('이전')" ).on("click" , function() {
			
			 history.go(-1);
		});
	});
	
	/* $(function() {
		
		 $( "button.btn.btn-primary:contains('장바구니 담기')" ).on("click" , function() {
			
			 self.location("/cart/addCart?prod_no=");
		});
	}); */
	
	$(function() {
		
		 $( "button.btn.btn-primary:contains('확인')" ).on("click" , function() {
			
			 self.location("/product/listProduct?menu=manage");
		});
	});
	
	$(function() {
		
		 $( "#tripDate" ).on("change" , function() {
			//alert("안뇽");
			$("option.num").remove();
			 $.ajax(
	 				{
	 					url:"/product/json/findCount/",
	 					method:"POST",	    					
	 					data:{	    						
	 						tripDate:$("#tripDate").val(),
	 						productNo:$("input[name='productNo']").val()
	 						},
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},			
	 					dataType:"json",
	 					success:function(JSONData){
	 						//alert("제발ajax");	    											
	 						//alert("JSONData: \n"+JSONData);
	 						//alert(JSONData);
	 						//var num=JSONData;
	 						/* response($.map(JSONData, function (item) {
	 				           
	 							return item;
	 				        })); */
	 				        var string;
	 				        for(var i=1; i<JSONData+1; i++){
	 				        	string+="<option class='num' value='"+i+"'>"+i+"</option>";
	 				        }
	 						$("select[name='count']").append(string);
	 						
							
						
	 					}
	 				}
	 			);
		});
		 
		 $("select[name='count']").on("click",function(){
			if($( "#tripDate" ).val()==0){
				alert("날짜를 선택해주세요 :: ");
			} 
		 });
	});
	
	
	
	/////////////////////////////////////////reply////////////////////////////
	var page = 1;
	var page2='';
	 
	
	$(function() {
		 $("#addReply").on("click" , function() {
			 page=page+1;
			 
		  $.ajax( 
						{
						url : "/common/json/listProductReply",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify({
							"productNo":"${product.productNo}",
							"userNo":"${user.userNo}",
							"userName": "${user.userName}",
							"currentPage" : page
						}),
						success : function(JSONData) {
							var displayValue='';
							
							for(var i=0;i<JSONData.list.length;i++){
								var tool="";
								if(${empty user.userId}){
									tool='';
								}else{
									tool='<div class="btn-group pull-right">'+
									'<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown" style="margin-right: 50px;">'+
									' <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>'+
									'</button>'+
									'<ul class="dropdown-menu slidedown">'+
									'<li><a href="#" name="addmessage"><span class="glyphicon glyphicon-pencil"></span>&nbsp;Message</a></li>'+
									'<li><a href="#" name="addreport"><span class="glyphicon glyphicon-alert"></span>&nbsp;Report</a></li>'+
									'<li><a href="#" name="addfriend"><span class="glyphicon glyphicon-user"></span>&nbsp;AddFriend</a></li>'+
									' <li><a href="#" name="deletereply"><span class="glyphicon glyphicon-trash"></span>&nbsp;Delete</a></li>'+
									' <li><a href="#" name="updatereply"><span class="glyphicon glyphicon-scissors"></span>&nbsp;Update</a></li>'+
									'</ul>'+
								   '</div>';	
								}
								
							//alert(JSONData.length);							
							
							if(JSONData.list[i]!=1){
								 displayValue += '<div class="row2">'+
												 '<input type="hidden" name="userReplyNo"	 value="'+JSONData.list[i].userNo+'"/>'+
												 '<input type="hidden" name="userName" 	 value="'+JSONData.list[i].userName+'"/>'+
												 '<input type="hidden" name="replyNo" 	 value="'+JSONData.list[i].replyNo+'"/>'+
												 '<input type="hidden" name="replyContent" value="'+JSONData.list[i].replyContent+'"/>'+		   
												   
													'<div class="col-sm-2 col-sm-offset-1"  style="padding-top: 10px;">'+
													'<strong>'+JSONData.list[i].userName+'</strong>'+
					    						   '</div>'+
					    						   tool+
					    						   '</div>'+
					    						   '<div class ="row" name="upcontent" style="padding-top: 10px;">'+
										    		'<div class="col-sm-3">'+
										    		(JSONData.list[i].replyContent == null?'':JSONData.list[i].replyContent)+
										    		'</div>'+
						    						'<div class="pull-right" style="padding-right: 100px;">'+
						    						JSONData.list[i].replyRegDate+
					    						   '</div></div>'+
					    						   
					    						   '<div class ="row">'+
										    		'<div class="col-xs-12">'+
													'<hr sytle="border-style:dotted">'+
													'</div>'+
													'</div>';
							}
							}
							
							if(JSONData.list[JSONData.list.length-1] == 1){
								 $("#aReply").remove();
							}
							var totalcount=
							'<div class="col-md-2">'+
								'<strong>댓 글 목 록</strong>'+		
							'</div>'+
							'<div class="col-md-2" >'+
								'댓글수  : '+JSONData.totalCount+				
							'</div>';
	
							$('div[name="row"]').html(displayValue);
							$('#totalCount').html(totalcount); 
						}
			}); 
		});
		 $(document).ready(function(){ page2 = $('.row2').length});
		 console.log('page2 : '+page2);
	});
	
	
	$(function() {
		 $("#write").on("click" , function() {
			//alert("?????");
			if(${user.userId==null}){
				 alert('로그인후 사용하여주세요');	 
			 }
			 else{
				 //alert('들어오니??');
			 var replycontent = $('#replyContent').val();
			  $.ajax( 
						{
						url : "/common/json/addReply",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify({
							"replyContent":replycontent,
							"productNo":"${product.productNo}",
							"userNo":"${user.userNo}",
							"userName": "${user.userName}",
							"currentPage" : page
						}),
						
						success : function(JSONData) {
							//alert(JSON.stringify(JSONData));
							
							var displayValue='';
							
							for(var i=0;i<JSONData.list.length;i++){
								var tool="";
								if(${empty user.userId}){
									tool='';
								}else{
									tool='<div class="btn-group pull-right">'+
									'<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown" style="margin-right: 50px;">'+
									' <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>'+
									'</button>'+
									'<ul class="dropdown-menu slidedown">'+
									'<li><a href="#" name="addmessage"><span class="glyphicon glyphicon-pencil"></span>&nbsp;Message</a></li>'+
									'<li><a href="#" name="addreport"><span class="glyphicon glyphicon-alert"></span>&nbsp;Report</a></li>'+
									'<li><a href="#" name="addfriend"><span class="glyphicon glyphicon-user"></span>&nbsp;AddFriend</a></li>'+
									' <li><a href="#" name="deletereply"><span class="glyphicon glyphicon-trash"></span>&nbsp;Delete</a></li>'+
									' <li><a href="#" name="updatereply"><span class="glyphicon glyphicon-scissors"></span>&nbsp;Update</a></li>'+
									'</ul>'+
								   '</div>';	
								}
								
							 displayValue += '<div class="row2">'+
											 '<input type="hidden" name="userReplyNo"	 value="'+JSONData.list[i].userNo+'"/>'+
											 '<input type="hidden" name="userName" 	 value="'+JSONData.list[i].userName+'"/>'+
											 '<input type="hidden" name="replyNo" 	 value="'+JSONData.list[i].replyNo+'"/>'+
											 '<input type="hidden" name="replyContent" value="'+JSONData.list[i].replyContent+'"/>'+		   
											   
												'<div class="col-sm-2 col-sm-offset-1"  style="padding-top: 10px;">'+
												'<strong>'+JSONData.list[i].userName+'</strong>'+
				    						   '</div>'+
				    						   tool+
				    						   '</div>'+
				    						   '<div class ="row" name="upcontent" style="padding-top: 10px;">'+
									    		'<div class="col-sm-3">'+
									    		(JSONData.list[i].replyContent == null?'':JSONData.list[i].replyContent)+
									    		'</div>'+
					    						'<div class="pull-right" style="padding-right: 100px;">'+
					    						JSONData.list[i].replyRegDate+
				    						   '</div></div>'+
				    						   
				    						   '<div class ="row">'+
									    		'<div class="col-xs-12">'+
												'<hr sytle="border-style:dotted">'+
												'</div>'+
												'</div>';
							}
							//alert(displayValue);
							var totalcount=
								'<div class="col-md-2">'+
								'<strong>댓 글 목 록</strong>'+		
							'</div>'+
							'<div class="col-md-2" >'+
								'댓글수  : '+JSONData.totalCount+				
							'</div>';
							
							$('div[name="row"]').html(displayValue); 				   
							$('#totalCount').html(totalcount);
							
						}
			}); 
			 } 
		});
		 
	});
	
	
	
	/* $(document).on('click' ,'.row2', function() {
		alert($('.row2').index(this));
	});	 */

		
	///////////////////////////////////////////top//////////////////
	  $( function() {
		  
	    /* $( window ).scroll( function() {
	      if ( $( this ).scrollTop() > 100 ) {
	        $( '.top' ).fadeIn();
	      } else {
	        $( '.top' ).fadeOut();
	      }
	    } ); */
	    
	    $( '#floating-button' ).click( function() {
	      $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	      return false;
	    } );
	    
	  } );
	///////////////////////////////sendQuestion///////////////////
	
	$(document).on('click','button[name=sendQuestion]', function() {
		 var msguserno = ${product.hostNo};
		 var msgusername = '${product.hostName}';
		 var inmsg =
			 '<input type="text" class="form-control" id="msgtitle" row="6" col="50" placeholder="제목 작성" value=""/>'+
			'<input type="text" class="form-control" id="msgno" row="6" col="50" placeholder="제목 작성" value="'+msguserno+'"/>'+
			'<textarea id="msgcontent"  name="msgcontent" row="6" col="50" value="" placeholder="내용 작성"></textarea>';
		 
		 if(${empty user.userId}){
			 alert('로그인후 사용하여주세요');	 
		 }else if(${user.userNo== msguserno}){
			 alert('자기 자신에게 쪽지를 보낼수 없습니다.');
		 }else{ 
			$('#msg').html(inmsg);
		 	$('#modalmessage').modal('show');
		 }
		 $(document).on('click','#upmessage',function(){
			var msgcontent = $('#msgcontent').val();
			var msgtitle = $('#msgtitle').val();
			//modalmessage

				if(msgcontent==''| msgtitle==''){
				 alert('내용과 제목을 입력하세요.');			 
				 }
				 else{
				  $.ajax( 
						{
						url : "/mypage/json/addMessage",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify({
							"toUserNo":"${user.userNo}",
							"fromUserNo":msguserno,
							"messageContent":msgcontent,
							"messageType":"1",
							"messageTitle":msgtitle							
						}),
						success : function(JSONData) {
							alert(JSON.stringify(JSONData));
							$('#modalmessage').modal('toggle');
							
						}
				});
			 	}
			});	
		});	

///////////////////////////////////////////////////addreport////////////////////////////////////////
$(document).on('click','.row2 a[name=addreport]', function() {	
	 var reportuserno = $($('input[name=userReplyNo]')[$('.row2 a[name=addreport]').index(this)]).val();
	 alert(reportuserno);	
	 var reportreplyno = $($('input[name=replyNo]')[$('.row2 a[name=addreport]').index(this)]).val();
	 var reportbody = 
		        '<h3>신고글 작성<h3>'+
				'<input type="text" class="form-control" id="reportuser" row="6" col="50" value="'+reportuserno+'" readonly/>'+
				'<input type="text" class="form-control" id="reporttitle" row="6" col="50" placeholder="신고 제목 작성" value=""/>'+
				'<textarea id="reportcontent"  name="reportcontent" row="6" col="50" value="" placeholder="신고 내용"></textarea>';
		 alert(${user.userNo});
	 if(${empty user.userId}){
		 alert('로그인후 사용하여주세요');	 
	 }else if(${user.userNo} == reportuserno){
		 alert('자기자신은 신고 못합니다.');
	 }else{
		$('#reportbody').html(reportbody);
		$('#modalreport').modal('show');
	 }
	
	$(document).on('click','#addreportcommunity',function(){
		 	var reportcontent = $('#reportcontent').val();
		 	var reporttitle = $('#reporttitle').val();
		 	if(reportcontent==''| reporttitle==''){
				 alert('내용과 제목을 입력하세요.');			 
			}
			else{
		 	 $.ajax( 
					{
					url : "/common/json/addReport",
					method : "POST" ,
					dataType : "json" ,
					contentType:"application/json;charset=UTF-8",
					data : JSON.stringify({
						"userNo":"${user.userNo}",
						"reportContent":reportcontent,
						"reportTitle":reporttitle,
						"targetUserNo":reportuserno,
						"targetReplyNo":reportreplyno						
					}),
					
					success : function(JSONData) {
						alert(JSON.stringify(JSONData));
						$('#modalreport').modal('toggle');	
					}
				});
		 	 }
		});
});

///////////////////////////////////////////////addfriend///////////////////////////////////////////////////
$(document).on('click','.row2 a[name=addfriend]', function() {
	 var addfrienduserno = $($('input[name=userReplyNo]')[$('.row2 a[name=addfriend]').index(this)]).val();
	 if(${empty user.userId}){
		 alert('로그인후 사용하여주세요');	 
	 }
	 else if(${user.userNo}== addfrienduserno){
		 alert('자기 자신을 친구 추가할수 없습니다.');
	 }else{
	 	$('#modalfriend').modal('show');
	 }
	
	$(document).on('click','#addmodalfriend',function(){
		  $.ajax({
					url : "/common/json/addFriend",
					method : "POST" ,
					dataType : "json" ,
					contentType:"application/json;charset=UTF-8",
					data : JSON.stringify({
						"userNo":"${user.userNo}",
						"friendNo":addfrienduserno,
					}),
					success : function(JSONData) {
						alert(JSON.stringify(JSONData));
						$('#modalfriend').modal('toggle');					
				}
			}); 
		});
	});

/////////////////////////////////////////////////addmessage////////////////////////////////////////////////////
$(document).on('click','.row2 a[name=addmessage]', function() {
	 var msguserno = $($('input[name=userReplyNo]')[$('.row2 a[name=addmessage]').index(this)]).val();
	 var msgusername = $($('input[name=userName]')[$('.row2 a[name=addmessage]').index(this)]).val();
	 var inmsg =
		 '<input type="hidden" class="form-control" id="msguserno" row="6" col="50" value="'+msguserno+'"/>'+
			'<input type="text" class="form-control" id="msgtitle" row="6" col="50" placeholder="제목 작성" value=""/>'+
			'<input type="text" class="form-control" id="msgusername" row="6" col="50"  value="'+msgusername+'" readonly/>'+
			'<textarea id="msgcontent"  name="msgcontent" row="6" col="50" value="" placeholder="내용 작성"></textarea>';
	 
	 if(${empty user.userId}){
		 alert('로그인후 사용하여주세요');	 
	 }else if(${user.userNo }== msguserno){
		 alert('자기 자신에게 쪽지를 보낼수 없습니다.');
	 }else{ 
		$('#msg').html(inmsg);
	 	$('#modalmessage').modal('show');
	 }
	 $(document).on('click','#upmessage',function(){
		var msgcontent = $('#msgcontent').val();
		var msgtitle = $('#msgtitle').val();
		//modalmessage

			if(msgcontent==''| msgtitle==''){
			 alert('내용과 제목을 입력하세요.');			 
			 }
			 else{
			  $.ajax( 
					{
					url : "/mypage/json/addMessage",
					method : "POST" ,
					dataType : "json" ,
					contentType:"application/json;charset=UTF-8",
					data : JSON.stringify({
						"toUserNo":"${user.userNo}",
						"fromUserNo":msguserno,
						"messageContent":msgcontent,
						"messageType":"2",
						"messageTitle":msgtitle							
					}),
					success : function(JSONData) {
						alert(JSON.stringify(JSONData));
						$('#modalmessage').modal('toggle');
					}
			});
		 	}
		});	
	});

///////////////////////////////////////////////deleteReply/////////////////////////////////////////////
$(document).on('click','.row2 a[name=deletereply]', function() {
	 var deletereply = $($('input[name=replyNo]')[$('.row2 a[name=deletereply]').index(this)]).val();
	 var deleteuserno = $($('input[name=userReplyNo]')[$('.row2 a[name=deletereply]').index(this)]).val();
	 
	//alert(${user.userNo}+'==='+deleteuserno);
	 
	 if(${empty user.userId}){
		 alert('로그인후 사용하여주세요');	 
	 }else if(${user.userNo } == deleteuserno){
		 
		 $('#deletemodalreply').modal('show');
	 }else{
	 	alert('자신의 댓글을 선택하여 지우세요.');
	 }
	
	$(document).on('click','#deletereplym',function(){
		  $.ajax({
					url : "/common/json/deleteReply",
					method : "POST" ,
					dataType : "json" ,
					contentType:"application/json;charset=UTF-8",
					data : JSON.stringify({
						"userNo":"${user.userNo}",
						"replyNo":deletereply,
					}),
					success : function(JSONData) {
						//alert(JSON.stringify(JSONData));
						alert('success');
						$('#deletemodalreply').modal('toggle');		
						window.location.reload();
					}
			}); 
		});
	});

//////////////////////////////////////updatereply//////////////////////////////////////////
$(document).on('click','.row2 a[name=updatereply]', function() {
	var updateuserno = $($('input[name=userReplyNo]')[$('.row2 a[name=updatereply]').index(this)]).val();
	var updatereplyno = $($('input[name=replyNo]')[$('.row2 a[name=updatereply]').index(this)]).val();
	var updatecontent = $($('input[name=replyContent]')[$('.row2 a[name=updatereply]').index(this)]).val();
	var uprel ='<textarea id="updatecontent"  name="updatecontent" row="5" col="40" value="" placeholder="내용 작성">'+updatecontent+'</textarea>';
	
	if(${empty user.userId}){
		 alert('로그인후 사용하여주세요');	 
	 }else if(${user.userNo } == updateuserno){
		 $('#upreply').html(uprel);
		 $('#updatemodalreply').modal('show');
	 }else{
	 	alert('자신의 댓글을 선택하여 지우세요.');
	 }
	
	$(document).on('click','#updatereplym',function(){
		 $.ajax({
				url : "/common/json/updateReply",
				method : "POST" ,
				dataType : "json" ,
				contentType:"application/json;charset=UTF-8",
				data : JSON.stringify({
					"replyNo":updatereplyno,
					"replyContent":$('#updatecontent').val()
				}),
					success : function(JSONData) {
						alert(JSON.stringify(JSONData));
						 $('#updatemodalreply').modal('toggle');		
						window.location.reload();
				}
		}); 
	});
});

	///////////////////////////////////
	
	  $(function() {
			
			 $( "div.nd1" ).on("click" , function() {
				
				 self.location = "/product/listProduct";
			});
		});
	  
	  $(function() {
			
			 $( "div.nd3" ).on("click" , function() {
				 
				 self.location="/product/updateProduct?productNo="+${product.productNo};
			});
		});
	  
	  $(function() {
			
			 $( "div.nd4" ).on("click" , function() {
				 swal({
					  title: "Daily Tour를 정말로 삭제하시겠습니까?",
					  text: "한번 삭제하면 복구할 수 없습니다.",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
					    swal("Daily Tour 삭제가 완료되었습니다.", {
					      icon: "success",
					    }).then((value) => {self.location="/product/deleteProduct?productNo="+${product.productNo}});
					  } else {
					    swal("삭제가 취소되었습니다.");
					  }
					});				 
				 
			});
		});
	  
	  $(function() {
			
			 $( "div[name='hostInfo']" ).on("click" , function() {
				 if(${user != null}){				
				 	window.open("/user/getHost?hostNo="+${product.hostNo},'HostInfo','location=no,menubar=no,resizable=no,status=no,right=0,width=500,height=500');
				 }else{
					 alert("로그인을 해주세요");
				 }
			});
		});
	  
	  $(function() {
			
			 $( "button[name='sendQuestion']" ).on("click" , function() {
				
				 //window.open("/user/getUser?userNo="+${product.hostNo},'','');
			});
		});
	
	</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="row">
	<div class="container">
		<input type="hidden" name="userNo" value="${user.userNo }"/>
		<input type="hidden" name="userName" value="${user.userName }"/>
		
		<%-- <button type="button" id="showPro" class="btn btn-default">목록보기</button>
	       <c:if test="${user.userNo == product.hostNo }">
	       <button type="button" class="btn btn-default">수정</button>
	       <button type="button" class="btn btn-default">삭제</button>
	       </c:if> --%>
	       
		<div class="row"> 
	      <div class="col-sm-12" >
			<div class="text-info">
				<h3>
				${product.productName}
				</h3>
			<b class="pull-right">조회수 ${product.viewCount }</b>
			</div>
			</div>
	       <!-- <h5 class="text-muted">상품을 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5> -->
	       </div>
	       </div>
	   </div>    
	      
	    <div class="container">
		<hr/>
		<div class="col-sm-12">		
		<div class="col-sm-4 col-sm-offset-2">
				
		<div class="row">
	  		<div class="col-xs-4 "><strong>상품유형</strong></div>
			<div class="col-xs-8">${product.productType }</div>
		</div>
				
		<!-- <hr/> -->
		<br/>
		
		<div class="row">
	  		<div class="col-xs-4 "><strong>국가</strong></div>
			<div class="col-xs-8">${product.country }</div>
		</div>
				
		<!-- <hr/> -->
		<br/>
		
		<div class="row">
	  		<div class="col-xs-4"><strong>도시</strong></div>
			<div class="col-xs-8">${product.city }</div>
		</div>
				
		<!-- <hr/> -->
		<br/>
		
		<div class="row">
	  		<div class="col-xs-4"><strong>1일 투어 인원</strong></div>
			<div class="col-xs-8 ">${product.tourHeadCount}</div>
		</div>
		
		<!-- <hr/> -->
		<br/>
		
		<div class="row">
	  		<div class="col-xs-4  "><strong>가격</strong></div>
			<div class="col-xs-8 ">${product.productPrice}</div>
		</div>
		
		<!-- <hr/>  -->		
 		<br/>
 		
		<div class="row">
	  		<div class="col-xs-4"><strong>투어일자</strong></div>
			<div class="col-xs-8 ">
			<c:set var="date" value="${product.tripDate}"></c:set>
			<c:set var="date_array" value="${fn:split(date,',')}"></c:set>			
				<c:forEach var="tdate" items="${date_array}" begin="0" step="1">
					${fn:split(tdate,'=')[0]}<br/>
				</c:forEach>
			</div>
		</div>
		<br/>		
		</div>
	
		  <div class="col-sm-6">
		  
		  <div class="row col-xs-12">
		   <div class="col-xs-6">
		<div class="row">
		
	  		<div class="col-xs-5 text-center"><strong>호스트</strong></div>
	  		<div name="hostInfo" class="col-xs-7">	  		
			<c:if test="${empty product.hostImage}"><img style="width:80px; height:80px; alt="" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" class="rounded-circle"></c:if>
			<c:if test="${!empty product.hostImage}"><img style="width:80px; height:80px; alt="" src="/resources/images/userThumbnail/${product.hostImage}" class="rounded-circle"></c:if>
			</div>	
			
		</div>		
		<div class="row">
	  		<div class="col-xs-5 "></div>
			<div name="hostInfo" class="col-xs-7 ">${product.hostName}	</div>
			</div>
		</div>
		<br/>
		
			<div class="col-xs-3 text-center">
			<br/>
			<button type="button" class="btn btn-primary btn-responsive" name="sendQuestion">1:1 문의</button>
			</div>
			<br/>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="modalmessage"  role="dialog">
			<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3 class="modal-title">
					<Strong>쪽지</Strong>
				</h3>
			</div>
			<div class="modal-body">
				<div id="msg">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="upmessage">보내기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
			</div>
			</div>
			</div>
			<!--Modal  -->			
		
		<br/><br/>
		
		
		<form>
		<div class="col-xs-12">
		<br/>
			<div class="row col-xs-6">
				<input type="hidden" name="productNo" value="${product.productNo }"/>
				<select class="form-control" name="tripDate" id="tripDate">
					<option value="0" >날짜선택</option>
					<c:set var="date" value="${product.tripDate}"></c:set>
					<c:set var="date_array" value="${fn:split(date,',')}"></c:set>
					<c:forEach var="tdate" items="${date_array}" begin="0" step="1">
						<option value="${fn:split(tdate,'=')[0]}">${fn:split(tdate,'=')[0]}</option>
						
					</c:forEach>
				</select> 
				<br/>
				<select class="form-control" name="count" id="count">
					<%-- <c:set var="i" value="1"></c:set> --%>
					<option value="0" >갯수선택</option>
					<%-- <c:set var="date_array" value="${fn:split(date,'[=,]')}"></c:set> --%>
					<%-- <c:if test="==${fn:split(tdate,'=')[0]}"> --%>
					<%-- <c:forEach var="num" items="${date_array}" begin="0" step="1">
					
						<c:forEach var="i" begin="1" end="${fn:split(num,'=')[1]}" step="1" >
							<option value="${i}">${i}</option>
						</c:forEach>
					</c:forEach> --%>
					<%-- </c:if> --%>
				</select>
			</div>
			<br/>
			<div class="row col-xs-1"></div>
			<div class="row col-xs-5">
	  			<button type="button" class="btn btn-primary">구매</button>
	  			<button type="button" class="btn btn-primary">이전</button>	  							  			
			</div>
			</div>
		</form>
		
		
		</div>
		</div>
		</div>
		
		
		<!-- <div class="row">
		<hr/>
		</div> -->
		
		<div class="row">
		<div class="container">
		<div class="col-sm-12">
		<hr/>
		<div class="row">
	  		<div class="col-sm-4 col-sm-offset-2"><strong>상품상세정보</strong></div>
			<div class="col-sm-4">${product.description}</div>
			<!-- <a href="#" type="button" class="top">Top</a> -->
		
		</div>
		</div>
		<hr/>			
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>평점</strong></div>
			<div class="col-xs-8 col-md-4" name="eval">${transaction.evalProduct}</div>
		</div>
		
		<hr/>		
	  </div>
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	<div id="container-floating">
		<c:if test="${user.userNo == product.hostNo }">
		<div class="nd4 nds" data-toggle="tooltip" data-placement="left"
			data-original-title="deleteProduct" title="삭제">
			<img class="reminder" src="/resources/images/productIcons/delete.png" style="width: 35px; height: 35px;">
		</div>
		<div class="nd3 nds" data-toggle="tooltip" data-placement="left"
			data-original-title="updateProduct" title="수정">
			<img class="reminder" src="/resources/images/productIcons/edit.png" style="width: 35px; height: 35px;">
		</div>
		</c:if>
		<div class="nd1 nds" data-toggle="tooltip" data-placement="left"
			data-original-title="listProduct" title="목록">
			<img class="reminder" src="/resources/images/productIcons/list.png" style="width: 35px; height: 35px;">
		</div>

		<div id="floating-button" data-toggle="tooltip" data-placement="center" data-original-title="top" title="top">				
				<p class="letter" id="addProduct">TOP</p>
			</div>
		</div>
 	
 	<div class="container">
 		<div class="col-xs-4 col-md-2 "><strong>리뷰/별점</strong></div>
 		<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
 	<!--  table Start /////////////////////////////////////-->
 	<div >
      <table class="table  table-striped" >
      <input type="hidden" id="currentPage" name="currentPage" value=""/>
        <thead>
          <tr>
            <th align="left">이름</th>
            <th align="left" >리뷰</th>                       
            <th align="left">별점</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="transaction" items="${reviewList}">
			<c:set var="i" value="${ i+1 }" /> 
			<tr name="n">
			  <td align="left" >${transaction.userName}</td>			  
			  <td align="left" >${transaction.reviewProduct}</td>
			  <td align="left" >${transaction.starEvalProduct}</td>			  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
      </div>
	  <!--  table End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<center><jsp:include page="../common/pageNavigator_review.jsp"/> </center>
	<!-- PageNavigation End... -->
	
	<hr/>	
	</div>
	
	<!-- Reply -->
	<div class="container">
	<div class="form-group" id="replyinput">
         <div class="col-md-10">
            <textarea id="replyContent"  name="comment_content" row="6" col="50" value=""></textarea>
         </div>
         <div class="col-md-2">
            <button type="button"  id="write" class="btn btn-default">댓글입력</button>
         </div>
      </div>
      
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <div class="form-group" id = "totalCount">
         <div class="col-md-2 ">
            <strong>댓 글 목 록</strong>      
         </div>
         <div class="col-md-2" >
            댓글수  : <c:if test="${totalCountReply == null}">0</c:if>
                  <c:if test="${totalCountReply != null}">${totalCountReply}</c:if>            
         </div>
      </div>
      
       <div class="row">
	      <div class="col-xs-12 ">
	      <hr sytle="border-style:dotted">
	      </div>
	   </div>  
					      
					   <div class="col-sm-12">   
					      <div class="row" name="row">
							<c:forEach var="reply" items="${list}">
							<div class= "row2">
								<input type="hidden" name="userReplyNo"	 value="${reply.userNo}"/>
								<input type="hidden" name="userName" 	 value="${reply.userName}"/>
								<input type="hidden" name="replyNo" 	 value="${reply.replyNo}"/>
								<input type="hidden" name="replyContent" value="${reply.replyContent}"/>
								
								
								
								<div class="col-sm-2 col-sm-offset-1"  style="padding-top: 10px;">
					    			<strong>${reply.userName}</strong>
					    		</div>
					    		<c:if test="${empty user.userId}">
							    </c:if>
							    <c:if test="${!empty user.userId}">
					    		
					    		<div class="btn-group pull-right">
					                            <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown" style="margin-right: 50px;">
					                                <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>
					                            </button>
					                            <ul class="dropdown-menu slidedown">
					                           		<%-- <c:if test="${user.userNo != reply.userNo}"> --%>
					                            	<li><a href="#" name="addmessage"><span class="glyphicon glyphicon-pencil"></span>&nbsp;Message</a></li>                            	
					                                <li><a href="#" name="addreport"><span class="glyphicon glyphicon-alert"></span>&nbsp;Report</a></li>                                
					                                <li><a href="#" name="addfriend"><span class="glyphicon glyphicon-user"></span>&nbsp;AddFriend</a></li>
					                                <%-- </c:if> --%>
					                                <%-- <c:if test="${user.userNo == reply.userNo}"> --%>
					                                <li><a href="#" name="deletereply"><span class="glyphicon glyphicon-trash"></span>&nbsp;Delete</a></li>
					                                <li><a href="#" name="updatereply"><span class="glyphicon glyphicon-scissors"></span>&nbsp;Update</a></li>
					                                <%-- </c:if> --%>
					                            </ul>
					             </div>				
								</c:if>
								</div>
								<div class ="row" name="upcontent" style="padding-top: 10px;">
					    		<div class="col-sm-3">
					    			${reply.replyContent}
					    		</div>
					    		<div class="pull-right" style="padding-right: 100px;">
					    			${reply.replyRegDate}
					    		</div>
					    		</div>					    		
					    
					    		<div class ="row">
					    		<div class="col-xs-12">
								<hr sytle="border-style:dotted">
								</div>
								</div>
					 		</c:forEach>
					 		</div>
       
       <div class="col-xs-2 col-xs-offset-5" id="aReply">
         <div class="button-2">
          <div class="eff-2"></div>
          <a href="#" id="addReply"> 댓글 더보기 </a>
           </div>
           <div class="col-xs-10 col-xs-offset-1">
         <br/>
         </div>
      </div>
      </div>
      
     <div class="modal fade" id="modalreport"  role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<Strong>REPORT</Strong>
				</h4>
				<h7 class="modal-title"></h7>
			</div>
			<div class="modal-body">
			
				<div id="reportbody"></div>
			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="addreportcommunity">신고등록</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
			</div>
		</div>
		</div>
		</div>
		
		
		<div class="modal fade" id="modalfriend"  role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3 class="modal-title">
					<Strong>친구추가</Strong>
				</h3>
			</div>
			<div class="modal-body">
				<h4><Strong>친구 추가를 하시겠습니까 ????</Strong></h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="addmodalfriend">예</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
		</div>
		</div>
		
		<div class="modal fade" id="modalmessage"  role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3 class="modal-title">
					<Strong>쪽지</Strong>
				</h3>
			</div>
			<div class="modal-body">
				<div id="msg">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="upmessage">보내기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
		</div>
		</div>
		
		<div class="modal fade" id="deletemodalreply"  role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			 	<h3 class="modal-title">
					<Strong>댓글삭제</Strong>
				</h3>
			</div>
			<div class="modal-body">
				<h4><Strong>댓글을 삭제하시겠습니까??</Strong></h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="deletereplym">예</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
		</div>
		</div>
		
		<div class="modal fade" id="updatemodalreply"  role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3 class="modal-title">
					<Strong>댓글 수정</Strong>
				</h3>
			</div>
			<div class="modal-body">
				<div id="upreply">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="updatereplym">수  정</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			</div>
		</div>
		</div>
		</div>

</body>

</html>