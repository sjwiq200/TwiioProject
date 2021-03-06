
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
	<link rel="stylesheet" href="/resources/css/font.css" />

	<style>
	
	body {
		padding-top: 70px;
		font-family:'JEJUGOTHIC';
		background: #f4f4f4;
		color
		}
		
	#thumbnailMainBox {
	border-radius: 23px;
		 	  border-radius: 23px;
		 	border: dashed rgba(102, 102, 102, 1) 1.3px;
		 	font-family:JEJUGOTHIC !important;
}



		textarea {
			width: 100%;
			height: 100px;
			resize: none;
		}
		
		hr {
			color: #C2C2C2;
			display: block;
		    border: 0;
		    border-top: 1px dashed #C2C2C2;
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
		
		
/* Button-dy css  */
.btn-dy {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 23px;
  font-family:JEJUGOTHIC;
  color:#ffffff;
  font-size: 12px;
  background: #D73A31;
  padding: 8px 13px 8px 13px;
  opacity: 0.8;
  border: solid #545454 0px;
  text-decoration: none;
}

/* Button-dy css - listFriendRecommendation */
.btn-dy2 {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 23px;
  font-family:JEJUGOTHIC;
  color: #545454;
  font-size: 12px;
  background: #ffffff;
  padding: 8px 13px 8px 13px;
  border: solid #545454 0.5px;
  text-decoration: none;
}

.btn-dy2:hover {
  background: #D73A31;
  opacity: 0.8;
  border: solid #545454 0px;
  text-decoration: none;
  color:#ffffff;
}
img { max-width: 100%; height: auto; }

div[name='hostInfo']:hover {
   opacity: 0.7;
   transition-duration: 0.5s;
}

/* Button-dy css  */
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
		
		 $( "button.btn-dy2:contains('구매')" ).on("click" , function() {
			 if(${empty user}){				 
				 swal("로그인 후 이용해 주세요",{
					  icon: "warning",
					});
				 return
			 }
			 
			if($( "#tripDate" ).val()==0 || $("select[name='count']").val()==0){				
				 swal("날짜와 갯수를 선택해주세요 :: ",{
					  icon: "warning",
					});
				return
			}
			//var productNo=$("input[name=productNo]").val();
			//alert(productNo);
			 $("form.form").attr("method" , "POST").attr("action" , "/transaction/addTransaction").submit();
		});
	});
	
	$(function() {
		
		 $( "button.btn-dy2:contains('이전')" ).on("click" , function() {
			
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
				swal("날짜를 선택해주세요 :: ",{
					  icon: "warning",
					});
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
									if(${user.userNo != JSONData.list[i].userNo}){
				                        tool='<div class="btn-group pull-right">'+
				                        '<button type="button" class="btn-dy2 dropdown-toggle" data-toggle="dropdown" style="margin-right: 50px;">'+
				                        ' <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>'+
				                        '</button>'+
				                        '<ul class="dropdown-menu slidedown">'+
				                        '<li style="display: none;"><a href="#" name="addmessage"><span class="glyphicon glyphicon-pencil"></span>&nbsp;Message</a></li>'+
				                        '<li style="display: none;"><a href="#" name="addreport"><span class="glyphicon glyphicon-alert"></span>&nbsp;Report</a></li>'+
				                        '<li style="display: none;"><a href="#" name="addfriend"><span class="glyphicon glyphicon-user"></span>&nbsp;AddFriend</a></li>'+
				                        '<li><a href="#" name="deletereply"><span class="glyphicon glyphicon-trash"></span>&nbsp;Delete</a></li>'+
				                        '<li><a href="#" name="updatereply"><span class="glyphicon glyphicon-scissors"></span>&nbsp;Update</a></li>'+
				                        '</ul>'+
				                         '</div>';
				                     }else{                     
				                        tool='<div class="btn-group pull-right">'+
				                        '<button type="button" class="btn-dy2 dropdown-toggle" data-toggle="dropdown" style="margin-right: 50px;">'+
				                        ' <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>'+
				                        '</button>'+
				                        '<ul class="dropdown-menu slidedown">'+
				                        '<li><a href="#" name="addmessage"><span class="glyphicon glyphicon-pencil"></span>&nbsp;Message</a></li>'+
				                        '<li><a href="#" name="addreport"><span class="glyphicon glyphicon-alert"></span>&nbsp;Report</a></li>'+
				                        '<li><a href="#" name="addfriend"><span class="glyphicon glyphicon-user"></span>&nbsp;AddFriend</a></li>'+
				                        '<li style="display: none;"><a href="#" name="deletereply"><span class="glyphicon glyphicon-trash"></span>&nbsp;Delete</a></li>'+
				                        '<li style="display: none;"><a href="#" name="updatereply"><span class="glyphicon glyphicon-scissors"></span>&nbsp;Update</a></li>'+
				                        '</ul>'+
				                         '</div>';
				                     }	
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
				 //alert('로그인후 사용하여주세요');
				swal("로그인 후 이용해 주세요",{
					  icon: "warning",
				});
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
									if(${user.userNo != JSONData.list[i].userNo}){
				                        tool='<div class="btn-group pull-right">'+
				                        '<button type="button" class="btn-dy2 dropdown-toggle" data-toggle="dropdown" style="margin-right: 50px;">'+
				                        ' <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>'+
				                        '</button>'+
				                        '<ul class="dropdown-menu slidedown">'+
				                        '<li style="display: none;"><a href="#" name="addmessage"><span class="glyphicon glyphicon-pencil"></span>&nbsp;Message</a></li>'+
				                        '<li style="display: none;"><a href="#" name="addreport"><span class="glyphicon glyphicon-alert"></span>&nbsp;Report</a></li>'+
				                        '<li style="display: none;"><a href="#" name="addfriend"><span class="glyphicon glyphicon-user"></span>&nbsp;AddFriend</a></li>'+
				                        '<li><a href="#" name="deletereply"><span class="glyphicon glyphicon-trash"></span>&nbsp;Delete</a></li>'+
				                        '<li><a href="#" name="updatereply"><span class="glyphicon glyphicon-scissors"></span>&nbsp;Update</a></li>'+
				                        '</ul>'+
				                         '</div>';
				                     }else{                     
				                        tool='<div class="btn-group pull-right">'+
				                        '<button type="button" class="btn-dy2 dropdown-toggle" data-toggle="dropdown" style="margin-right: 50px;">'+
				                        ' <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>'+
				                        '</button>'+
				                        '<ul class="dropdown-menu slidedown">'+
				                        '<li><a href="#" name="addmessage"><span class="glyphicon glyphicon-pencil"></span>&nbsp;Message</a></li>'+
				                        '<li><a href="#" name="addreport"><span class="glyphicon glyphicon-alert"></span>&nbsp;Report</a></li>'+
				                        '<li><a href="#" name="addfriend"><span class="glyphicon glyphicon-user"></span>&nbsp;AddFriend</a></li>'+
				                        '<li style="display: none;"><a href="#" name="deletereply"><span class="glyphicon glyphicon-trash"></span>&nbsp;Delete</a></li>'+
				                        '<li style="display: none;"><a href="#" name="updatereply"><span class="glyphicon glyphicon-scissors"></span>&nbsp;Update</a></li>'+
				                        '</ul>'+
				                         '</div>';
				                     }		
								}
								
							 displayValue += '<div class="row2">'+
											 '<input type="hidden" name="userReplyNo"	 value="'+JSONData.list[i].userNo+'"/>'+
											 '<input type="hidden" name="userReplyName" 	 value="'+JSONData.list[i].userName+'"/>'+
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
		 
		 if(${empty user.userId}){
			 //alert('로그인후 사용하여주세요');
			 swal("로그인 후 이용해 주세요",{
				  icon: "warning",
				});
		 }else if( (${empty user.userNo } ?'': ${user.userNo})== msguserno){
			 //alert('자기 자신에게 쪽지를 보낼수 없습니다.');
			 swal("자기 자신에게 쪽지를 보낼수 없습니다.",{
				  icon: "warning",
				});
		 }else{
			$('#questionusername').val(msgusername);
			$('#questionuserno').val(msguserno);
		 	$('#modalquestion').modal('show');
		 }
	});

	$(document).on('click','#upquestion',function(){
			var msguserno = $('#questionuserno').val();
			var msgcontent = $('#questioncontent').val();
			var msgtitle = $('#questiontitle').val();
			var msgusername = $('#questionusername').val();
			//modalmessage

			if(msgcontent==''| msgtitle==''){
				//alert('내용과 제목을 입력하세요.');	
				swal("내용과 제목을 입력하세요.",{
					  icon: "warning",
					});
			}
			else{
			  	$.ajax({
					url : "/mypage/json/addMessage",
					method : "POST" ,
					dataType : "json" ,
					contentType:"application/json;charset=UTF-8",
					data : JSON.stringify({
						"toUserNo":msguserno,
						"fromUserNo":"${user.userNo}",
						"messageContent":msgcontent,
						"messageType":"1",
						"messageTitle":msgtitle,
						"targetUserName":msgusername					
					}),
					success : function(JSONData) {
						 swal("메시지를 보냈습니다.", {
						      icon: "success",
						    });
						 
						 listReplyajax();
						$('#modalquestion').modal('toggle');
				    }
			   });
			}			
	});

///////////////////////////////////////////////////addreport////////////////////////////////////////

$(document).on('click','.row2 a[name=addreport]', function() {
	 var reportuserno = $($('input[name=userReplyNo]')[$('.row2 a[name=addreport]').index(this)]).val();
	 alert(reportuserno);
	 alert($($('input[name=userReplyName]')[$('.row2 a[name=addreport]').index(this)]).val());
	 var reportusername = $($('input[name=userReplyName]')[$('.row2 a[name=addreport]').index(this)]).val();
	 var reportreplyno = $($('input[name=replyNo]')[$('.row2 a[name=addreport]').index(this)]).val();
	 
	 if(${empty user.userId}){
		 //alert('로그인후 사용하여주세요');
		 swal("로그인후 이용해주세요.",{
			  icon: "warning",
			});
	 }else if((${empty user.userNo } ?'': ${user.userNo}) == reportuserno){
		 //alert('자기자신은 신고 못합니다.');
		 swal("자기자신은 신고 못합니다.",{
			  icon: "warning",
			});
	 }else{
		$('#reportuser').val(reportusername);
		$('#reportuserno').val(reportuserno);
		$('#reportreplyno').val(reportreplyno); 
		$('#modalreport').modal('show');
	 }
});

$(document).on('click','#addreportcommunity',function(){
	 	var reportcontent = $('#reportcontent').val();
	 	var reporttitle = $('#reporttitle').val();
	 	var reportuserno = $('#reportuserno').val();
	 	var reportreplyno = $('#reportreplyno').val();
	 	
	 	if(reportcontent==''| reporttitle==''){
			 //alert('내용과 제목을 입력하세요.');	
	 		swal("내용과 제목을 입력하세요.",{
				  icon: "warning",
				});
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
					 swal("신고 접수가 완료 되었습니다.", {
					      icon: "success",
					 });
					 listReplyajax();
					$('#modalreport').modal('toggle');
			}
		});
	 }
});
///////////////////////////////////////////////addfriend///////////////////////////////////////////////////

$(document).on('click','.row2 a[name=addfriend]', function() {
	var addfrienduserno = $($('input[name=userReplyNo]')[$('.row2 a[name=addfriend]').index(this)]).val();
	 if(${empty user.userId}){
		 //alert('로그인후 사용하여주세요');	 
		 swal("로그인후 이용해주세요.",{
			  icon: "warning",
			});
	 }
	 else if((${empty user.userNo } ?'': ${user.userNo})== addfrienduserno){
		 //alert('자기 자신을 친구 추가할수 없습니다.');
		 swal("자기 자신을 친구 추가할수 없습니다.",{
			  icon: "warning",
			});
	 }else{
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
					if(JSONData.no == 0){
						swal("이미 친구 등록이 되었습니다.", {
						      icon: "warning",
						});
					}else{
					swal({title: "친구를 추가 하시겠습니까?",
						  icon: "warning",
						  buttons: true,
						  dangerMode: true,
						})
					.then((willDelete) => {
					    if (willDelete) {
					      swal("친구 등록이 되었습니다.", {
					      icon: "success",
					    }).then((next) => {
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
								listReplyajax();			
							}
					    });
					  });
					  }  
					});			
					}			
		 		}
		 	});
	 	}
	});
/////////////////////////////////////////////////addmessage////////////////////////////////////////////////////	
$(document).on('click','.row2 a[name=addmessage]', function() {
	 var msguserno = $($('input[name=userReplyNo]')[$('.row2 a[name=addmessage]').index(this)]).val();
	 var msgusername = $($('input[name=userReplyName]')[$('.row2 a[name=addmessage]').index(this)]).val();
	 
	 if(${empty user.userId}){
		// alert('로그인후 사용하여주세요');	 
		 swal("로그인후 이용해주세요.",{
			  icon: "warning",
			});
	 }else if((${empty user.userNo } ?'': ${user.userNo})== msguserno){
		 //alert('자기 자신에게 쪽지를 보낼수 없습니다.');
		 swal("자기 자신에게 쪽지를 보낼수 없습니다.",{
			  icon: "warning",
			});
	 }else{
		$('#msgusername').val(msgusername);
		$('#msguserno').val(msguserno);
	 	$('#modalmessage').modal('show');
	 }
});

$(document).on('click','#upmessage',function(){
		var msguserno = $('#msguserno').val();
		var msgcontent = $('#msgcontent').val();
		var msgtitle = $('#msgtitle').val();
		var msgusername = $('#msgusername').val();
		//modalmessage

		if(msgcontent==''| msgtitle==''){
			//alert('내용과 제목을 입력하세요.');	
			swal("내용과 제목을 입력하세요.",{
				  icon: "warning",
				});
		}
		else{
		  	$.ajax({
				url : "/mypage/json/addMessage",
				method : "POST" ,
				dataType : "json" ,
				contentType:"application/json;charset=UTF-8",
				data : JSON.stringify({
					"toUserNo":msguserno,
					"fromUserNo":"${user.userNo}",
					"messageContent":msgcontent,
					"messageType":"2",
					"messageTitle":msgtitle,
					"targetUserName":msgusername					
				}),
				success : function(JSONData) {
					 swal("메시지를 보냈습니다.", {
					      icon: "success",
					    });
					 
					 listReplyajax();
					$('#modalmessage').modal('toggle');
					
			    } 
		   });
		}			
});

///////////////////////////////////////////////deleteReply/////////////////////////////////////////////
$(document).on('click','.row2 a[name=deletereply]', function() {
	 var deletereply = $($('input[name=replyNo]')[$('.row2 a[name=deletereply]').index(this)]).val();
	 var deleteuserno = $($('input[name=userReplyNo]')[$('.row2 a[name=deletereply]').index(this)]).val();
	 
	//alert(${user.userNo}+'==='+deleteuserno);
	 
	 if(${empty user.userId}){
		 //alert('로그인후 사용하여주세요');	 
		 swal("로그인후 이용해주세요.",{
			  icon: "warning",
			});
	 }else if((${empty user.userNo } ?'': ${user.userNo}) == deleteuserno){
		 swal({title: "댓글을 삭제 하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
		.then((willDelete) => {
		    if (willDelete) {
		      swal("삭제 되었습니다.", {
		      icon: "success",
		    }).then((next) => {
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
						//alert('success');
						listReplyajax();
					}
				}); 
		  	});
		  	}  
		});	 
	 }else{
	 	//alert('자신의 댓글을 선택하여 지우세요.');
		 swal("자신의 댓글을 선택하여 지우세요.",{
			  icon: "warning",
			});
	 }		  
});

function listReplyajax(){
    $.ajax( 
    {
    url : "/common/json/listReply",
    method : "POST" ,
    dataType : "json" ,
    contentType:"application/json;charset=UTF-8",
    data : JSON.stringify({
       "productNo":"${product.productNo}",
       "currentPage" : page
    }),
    
    success : function(JSONData) {
       //alert(JSON.stringify(JSONData));
       
       var displayValue='';
       
       for(var i=0;i<JSONData.list.length;i++){
          var tool="";
          if(${empty user.userId}){
             tool="";
          }else{
        	  if(${user.userNo != JSONData.list[i].userNo}){
                  tool='<div class="btn-group pull-right">'+
                  '<button type="button" class="btn-dy2 dropdown-toggle" data-toggle="dropdown" style="margin-right: 50px;">'+
                  ' <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>'+
                  '</button>'+
                  '<ul class="dropdown-menu slidedown">'+
                  '<li style="display: none;"><a href="#" name="addmessage"><span class="glyphicon glyphicon-pencil"></span>&nbsp;Message</a></li>'+
                  '<li style="display: none;"><a href="#" name="addreport"><span class="glyphicon glyphicon-alert"></span>&nbsp;Report</a></li>'+
                  '<li style="display: none;"><a href="#" name="addfriend"><span class="glyphicon glyphicon-user"></span>&nbsp;AddFriend</a></li>'+
                  '<li><a href="#" name="deletereply"><span class="glyphicon glyphicon-trash"></span>&nbsp;Delete</a></li>'+
                  '<li><a href="#" name="updatereply"><span class="glyphicon glyphicon-scissors"></span>&nbsp;Update</a></li>'+
                  '</ul>'+
                   '</div>';
               }else{                     
                  tool='<div class="btn-group pull-right">'+
                  '<button type="button" class="btn-dy2 dropdown-toggle" data-toggle="dropdown" style="margin-right: 50px;">'+
                  ' <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>'+
                  '</button>'+
                  '<ul class="dropdown-menu slidedown">'+
                  '<li><a href="#" name="addmessage"><span class="glyphicon glyphicon-pencil"></span>&nbsp;Message</a></li>'+
                  '<li><a href="#" name="addreport"><span class="glyphicon glyphicon-alert"></span>&nbsp;Report</a></li>'+
                  '<li><a href="#" name="addfriend"><span class="glyphicon glyphicon-user"></span>&nbsp;AddFriend</a></li>'+
                  '<li style="display: none;"><a href="#" name="deletereply"><span class="glyphicon glyphicon-trash"></span>&nbsp;Delete</a></li>'+
                  '<li style="display: none;"><a href="#" name="updatereply"><span class="glyphicon glyphicon-scissors"></span>&nbsp;Update</a></li>'+
                  '</ul>'+
                   '</div>';
               }		
          }
             
             
          
          displayValue += '<div class="row2">'+
			 '<input type="hidden" name="userReplyNo"	 value="'+JSONData.list[i].userNo+'"/>'+
			 '<input type="hidden" name="userReplyName" 	 value="'+JSONData.list[i].userName+'"/>'+
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

//////////////////////////////////////updatereply//////////////////////////////////////////
$(document).on('click','.row2 a[name=updatereply]', function() {
	var updateuserno = $($('input[name=userReplyNo]')[$('.row2 a[name=updatereply]').index(this)]).val();
	var updatereplyno = $($('input[name=replyNo]')[$('.row2 a[name=updatereply]').index(this)]).val();
	var updatecontent = $($('input[name=replyContent]')[$('.row2 a[name=updatereply]').index(this)]).val();
	
	if(${empty user.userId}){
		 //alert('로그인후 사용하여주세요');	 
		 swal("로그인후 이용해주세요.",{
			  icon: "warning",
			});
	 }else if((${empty user.userNo } ?'': ${user.userNo}) == updateuserno){
		 $('#updatereplyno').val(updatereplyno);
		 $('#updatecontent').val(updatecontent);
		 $('#updatemodalreply').modal('show');
	 }else{
	 	//alert('자신의 댓글을 선택하여 지우세요.');
	 	swal("자신의 댓글을 선택하여 지우세요.",{
			  icon: "warning",
			});
	 }
});

$(document).on('click','#updatereplym',function(){
	 var updatereplyno = $('#updatereplyno').val();
	
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
					//alert(JSON.stringify(JSONData));
					$('#updatereplyno').val("");
					$('#updatecontent').val("");
					listReplyajax();
					$('#updatemodalreply').modal('toggle');		
			}
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
					 //alert("로그인을 해주세요");
					 swal("로그인후 이용해주세요.",{
						  icon: "warning",
						});
				 }
			});
		});
	  
	  $(function() {
			
			 $( "button[name='sendQuestion']" ).on("click" , function() {
				
				 //window.open("/user/getUser?userNo="+${product.hostNo},'','');
			});
		});
	
	  //////////////////////////////////////////////////////replyLeft///////////////////////
	  $(document).ready(function(){ 
	    $('#characterLeft').text('100 characters left').attr("style","font-size: 1em;");
	    $('#replyContent').keyup(function () {
	        var max = 100;
	        var len = $(this).val().length;
	        if (len >= max) {
	            $('#characterLeft').text('You have reached the limit').attr("style","font-size: 1em;");
	            $('#characterLeft').addClass('red');
	            $('#write').addClass('disabled');            
	        }
	        else {
	            var ch  = max - len;
	            $('#characterLeft').text(ch + ' characters left').attr("style","font-size: 1em;");
	            $('#write').removeClass('disabled');
	            $('#characterLeft').removeClass('red');            
	        }
	    });    
	});
	</script>

</head>

<body style="font-family:'JEJUGOTHIC'; !important">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="row" style="font-family:'JEJUGOTHIC'; !important">
	<div class="container" style="font-family:'JEJUGOTHIC'; !important">
	
	
	
	<!-- ///////////////dayoung//////////////////// -->
	<div class="col-xs-12 inner" id="thumbnailMainBox" style="font-family:'JEJUGOTHIC'; !important">
				<div align="center" class="col-xs-1">&nbsp;</div><!-- 그라디언트 보이게 해주려고 한 부분 -->
				<div class="col-xs-12 inner" id="thumbnailMainThumbBox" align="center">
					<div class="col-xs-12" >
	<!-- ///////////////dayoung//////////////////// -->				
					
					
					
		<input type="hidden" name="userNo" value="${user.userNo }"/>
		<input type="hidden" name="userName" value="${user.userName }"/>
		<!-- <div class="row">  -->
	      <div class="col-sm-12" >
			<div class="text-info" style="margin-top:80px;margin-bottom:80px;color:#474747;">
				<h5>상품상세페이지</h5>
				<h2 style="color:#D73A31;opacity:0.8;">
				${product.productName}
				</h2>
				
			</div>
			<b class="pull-right">조회수 ${product.viewCount }</b>
			</div>
	       
	  <!--  </div> -->	
	   </div>    

		<div class="col-sm-12">		
		<div class="col-sm-6 ">
				
		<div class="row">
	  		<div class="col-xs-6" align="right"><strong>상품유형</strong></div>
			<div class="col-xs-offset-1 col-xs-5" align="left">
				<c:if test="${product.productType == 1}">명소투어</c:if>
				<c:if test="${product.productType == 2}">음식투어</c:if>
				<c:if test="${product.productType == 3}">트래킹</c:if>
				<c:if test="${product.productType == 4}">액티비티</c:if>
				<c:if test="${product.productType == 5}">night투어</c:if>
			</div>
		</div>
				
		<!-- <hr/> -->
		<br/>
		
		<div class="row">
	  		<div class="col-xs-6 " align="right"><strong>국가</strong></div>
			<div class="col-xs-offset-1 col-xs-5" align="left">${product.country }</div>
		</div>
				
		<!-- <hr/> -->
		<br/>
		
		<div class="row" style="font-family:'JEJUGOTHIC'; !important">
	  		<div class="col-xs-6" align="right"><strong>도시</strong></div>
			<div class="col-xs-offset-1 col-xs-5" align="left">${product.city }</div>
		</div>
				
		<!-- <hr/> -->
		<br/>
		
		<div class="row" style="font-family:'JEJUGOTHIC'; !important">
	  		<div class="col-xs-6" align="right"><strong>1일 투어 인원</strong></div>
			<div class="col-xs-offset-1 col-xs-5" align="left">${product.tourHeadCount}</div>
		</div>
		
		<!-- <hr/> -->
		<br/>
		
		<div class="row">
	  		<div class="col-xs-6" align="right"><strong>가격</strong></div>
			<div class="col-xs-offset-1 col-xs-5" align="left">${product.productPrice}</div>
		</div>
		
		<!-- <hr/>  -->		
 		<br/>
 		
		<div class="row">
	  		<div class="col-xs-6" align="right"><strong>투어일자</strong></div>
			<div class="col-xs-offset-1 col-xs-5" align="left">
			<c:set var="date" value="${product.tripDate}"></c:set>
			<c:set var="date_array" value="${fn:split(date,',')}"></c:set>			
				<c:forEach var="tdate" items="${date_array}" begin="0" step="1">
					${fn:split(tdate,'=')[0]}<br/>
				</c:forEach>
			</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-6" align="right"><strong>평점</strong></div>
			<div class="col-xs-offset-1 col-xs-5" align="left">${transaction.evalProduct}</div>
		</div>
		
		<br/>		
		</div>
		
		<div class="row">
		  <div class="col-sm-6">
		  
		  <!-- <div class="row col-xs-12"> -->
		   <div class="col-xs-6">
		   
			<div class="row">
				<div name="hostInfo" class="col-xs-12" >	  		
					<c:if test="${empty product.hostImage}"><img style="width:160px; height:160px;border-radius: 99%;" alt="" src="/resources/images/userImage/seojun.jpg" class="rounded-circle"></c:if>
					<c:if test="${!empty product.hostImage}"><img style="width:160px; height:160px;border-radius: 99%;" alt="" src="/resources/images/userimages/${product.hostImage}" class="rounded-circle"></c:if>
				
					</div>	
			</div>		
	
			</div>
			<br/>
		
			<div class="col-xs-6" align="left">
			<br/>
			<div name="hostInfo" class="col-xs-12 "><strong>호스트</strong> ${product.hostName}	</div>
	<!-- 		<input type="button" name="sendQuestion" class="btn-dy2" value="1:1 문의" />  -->
			<button type="button" class="btn-dy2" name="sendQuestion"  width="30px" style="margin-top:30px;margin-left:30px;font-family:\'JEJUGOTHIC\';"/>1:1 문의</button>
			<!-- <button type="button" class="btn btn-primary btn-responsive" name="sendQuestion">1:1 문의</button> -->
			</div>			
			<br/>			
			<!-- </div> -->		
			
		<br/><br/>
		
		
		<form class="form">
		<div class="col-xs-12">
		<br/>
			<div class="row col-xs-6">
				<input type="hidden" name="productNo" value="${product.productNo}"/>
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
	
			<div class="row col-xs-6">
				<button type="button" class="btn-dy2" width="30px" style="margin-left:20px;font-size: 12px;padding-left:20px;padding-right:20px;font-family:\'JEJUGOTHIC\';"/>구매</button>
				<button type="button" class="btn-dy2" width="30px" style="margin-left:20px;font-size: 12px;padding-left:20px;padding-right:20px;font-family:\'JEJUGOTHIC\';"/>이전</button>  
					
<!-- 			<button type="button" class="btn btn-primary">구매</button>
	  			<button type="button" class="btn btn-primary">이전</button>			 -->				  			
			</div>
			</div>
		</form>
		
		</div>
		</div>
		</div>
	
		
		
		<div class="row">
		<div class="col-sm-12">
		<hr/>
		</div>
		</div>
		
		<div class="row">
		
		<div class="col-sm-12">
		<!-- <hr/>  -->
		<div class="row">
	  		<div class="col-sm-12" style="margin-bottom:20px;"><strong>상품상세정보</strong></div>
			<div class="col-sm-12" style="margin-bottom:20px;">${product.description}</div>
			<!-- <a href="#" type="button" class="top">Top</a> -->
		
		</div>
		</div>
		
		
		
		<hr/>		

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
			<p class="letter" id="addProduct" style="padding-bottom:5px;font-family:JEJUGOTHIC !important;font-size:15px !important; ">BACK</p>
		</div>

		<div id="floating-button" data-toggle="tooltip" data-placement="center" data-original-title="top" title="top" style="opacity:0.8;">				
				<p class="letter" id="addProduct" style="margin-top:5px;font-family:JEJUGOTHIC !important;">TOP</p>
			</div>
		</div>
 	
 	<div style=" border-radius: 23px; background: #efefef;padding-top:20px;padding-bottom:20px;margin-bottom:150px;">
 			<div>
	 		<div class="col-xs-12"><strong><h3>리 뷰 / 별 점</h3></strong></div>
	 		<p class="text-primary">
			    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
			 </p>
			 </div>
	 	<!--  table Start /////////////////////////////////////-->
	 		<div>
			      <table class="table" >
			      <input type="hidden" align="center" id="currentPage" name="currentPage" value=""/>
			        <thead>
			          <tr align="center"> 
			            <td align="center">이름</th>
			            <td align="center" >리뷰</th>                       
			            <td align="center">별점</th>
			          </tr>
			        </thead>
			       
					<tbody>
					
					  <c:set var="i" value="0" />
					  <c:forEach var="transaction" items="${reviewList}">
						<c:set var="i" value="${ i+1 }" /> 
						<tr name="n" align="center">
						  <td align="center" >${transaction.userName}</td>			  
						  <td align="center" >${transaction.reviewProduct}</td>
						  <td align="center" >${transaction.starEvalProduct}</td>			  
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
	
	<div >
		  <div class="form-group" id="replyinput">
	         <div class="col-md-10">
	            <textarea id="replyContent"  name="comment_content" row="6" col="50" value=""></textarea>
	         </div>
	         <div class="col-md-2">
	            <button type="button" class="btn-dy2" id="write" class="btn btn-default">댓글입력</button>
	            <span class="help-block" ><p id="characterLeft" class="help-block ">You have reached the limit</p></span>
	         </div>
	      </div>
      </div>
      <div>
	      <br>
	      <br>
	      <br>
	      <br>
	      <br>
	      <br>
	      <div class="form-group" id = "totalCount">
	         <div class="col-md-12" align="center">
	            <strong><h3>댓 글 목 록</h3></strong>      
	         </div>
	         <div class="col-md-12" align="right">
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
								<input type="hidden" name="userReplyName" 	 value="${reply.userName}"/>
								<input type="hidden" name="replyNo" 	 value="${reply.replyNo}"/>
								<input type="hidden" name="replyContent" value="${reply.replyContent}"/>
								
								
								
								<div class="col-sm-2 col-sm-offset-1"  style="padding-top: 10px;">
					    			<strong>${reply.userName}</strong>
					    		</div>
					    		<c:if test="${empty user.userId}">
							    </c:if>
							    <c:if test="${!empty user.userId}">
					    		
					    		<div class="btn-group pull-right">
					                            <button type="button" class="btn-dy2" data-toggle="dropdown" style="margin-right: 50px;">
					                                <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>
					                            </button>
					                            <ul class="dropdown-menu slidedown">
					                           		<c:if test="${user.userNo != reply.userNo}">                       
								                      <li><a href="#" name="addmessage"><span class="glyphicon glyphicon-pencil"></span>&nbsp;Message</a></li>                               
								                       <li><a href="#" name="addreport"><span class="glyphicon glyphicon-alert"></span>&nbsp;Report</a></li>                                
								                       <li><a href="#" name="addfriend"><span class="glyphicon glyphicon-user"></span>&nbsp;AddFriend</a></li>
								                       <li style="display: none;"><a href="#" name="deletereply"><span class="glyphicon glyphicon-trash"></span>&nbsp;Delete</a></li>
								                       <li style="display: none;"><a href="#" name="updatereply"><span class="glyphicon glyphicon-scissors"></span>&nbsp;Update</a></li>
								                   </c:if>
								                   <c:if test="${user.userNo == reply.userNo}">                       
								                      <li style="display: none;"><a href="#" name="addmessage"><span class="glyphicon glyphicon-pencil"></span>&nbsp;Message</a></li>                               
								                       <li style="display: none;"><a href="#" name="addreport"><span class="glyphicon glyphicon-alert"></span>&nbsp;Report</a></li>                                
								                       <li style="display: none;"><a href="#" name="addfriend"><span class="glyphicon glyphicon-user"></span>&nbsp;AddFriend</a></li>
								                       <li><a href="#" name="deletereply"><span class="glyphicon glyphicon-trash"></span>&nbsp;Delete</a></li>
								                       <li><a href="#" name="updatereply"><span class="glyphicon glyphicon-scissors"></span>&nbsp;Update</a></li>
								                   </c:if>
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
      
      </div>
      
      
      
    <!------------------------------------------------report---------------------------------------------------------->
		<div id="modalreport" class="modal fade" role="dialog" style="background-color: transparent;" >
			<div class="modal-dialog" align="center" style="background-color: black;">
						<form name="addMainForm">
				
							<div class="col-sm-12 form-group center-block contentsList" style="font-family: 'TYPO_JEONGJOL';
/*  							background: linear-gradient(-45deg, #56B1BF, transparent),linear-gradient(45deg, #D73A31, transparent);
 */ 							background-color: #ffffff;
 							border-radius: 3% !important; 
 							border: 1px dashed #3B3B3B;
 							color: #3B3B3B !important;">
								<div style="font-size:1.5em;font-family:Pacifico; margin-top:50px;margin-bottom:20px;color:#D73A31; opacity:0.8;">
									<button type="button" class="close btn-dy2" data-dismiss="modal">&times;</button>
									<h1 class="modal-title">
									<strong>REPORT</strong>
									</h1>
								</div>
								
								<input type="hidden" id="reportuserno" name="reportuserno" value=""/>
					      		<input type="hidden" id="reportreplyno" name="reportreplyno" value=""/>
					      		
								<div class="col-sm-2"></div>
								<div class="col-sm-8">					      

								<div name="planer">
									<label for="targetReportUser" class="col-md-12 control-label">신고 대상</label> 
									<input type="text" class="form-control contents" style="position: absoloute" id="reportuser" name="reportuser" value="" readonly>
									<p>&nbsp;</p>
				
									<label for="targetReportTitle" class="col-md-12 control-label">신고 제목</label>
									<input type="text" class="form-control contents" style="position: absoloute" id="reporttitle" name="reporttitle" placeholder="신고 제목 " >
									<p>&nbsp;</p>
									
									<label for="departureDate" class="col-sm-12 control-label ">신고 내용</label> 
									<textarea  class="form-control contents" id="reportcontent"  name="reportcontent" style="position: absoloute" row="5" col="50" value="" placeholder="신고 내용"></textarea>
									<p>&nbsp;</p>
									<div style="margin-bottom:50px;"  align="center">
										<button type="button" class="btn-dy2" id="addreportcommunity">신고등록</button>
										<button type="button" class="btn-dy2" data-dismiss="modal">취  소</button>
									</div>
									
								</div>
								</div>
								<div class="col-sm-2"></div>
							</div>
							
						</form>
					</div>
			</div>
			<!------------------------------------------------report---------------------------------------------------------->
			
			<!------------------------------------------------message from reply---------------------------------------------------------->
		<div id="modalmessage" class="modal fade" role="dialog" style="background-color: transparent;" >
			<div class="modal-dialog" align="center" style="background-color: black;">
						<form name="addMainForm">
				
							<div class="col-sm-12 form-group center-block contentsList" style="font-family: 'TYPO_JEONGJOL';
/*  							background: linear-gradient(-45deg, #56B1BF, transparent),linear-gradient(45deg, #D73A31, transparent);
 */ 							background-color: #ffffff;
 							border-radius: 3% !important; 
 							border: 1px dashed #3B3B3B;
 							color: #3B3B3B !important;">
								<div style="font-size:1.5em;font-family:Pacifico; margin-top:50px;margin-bottom:20px;color:#D73A31; opacity:0.8;">
									<button type="button" class="close btn-dy2" data-dismiss="modal">&times;</button>
									<h1 class="modal-title">
									<strong>MESSAGE</strong>
									</h1>
								</div>
			
								<input type="hidden" id="msguserno" name="msguserno" value=""/>
					      		<input type="hidden" id="reportreplyno" name="reportreplyno" value=""/>
					      		
								<div class="col-sm-2"></div>
								<div class="col-sm-8">					      

								<div name="planer">
									<label for="targetReportUser" class="col-md-12 control-label">보낼 사람</label> 
									<input type="text" class="form-control contents" style="position: absoloute" id="msgusername" name="msgusername" value="" readonly>
									<p>&nbsp;</p>
				
									<label for="targetReportTitle" class="col-md-12 control-label">쪽지 제목</label>
									<input type="text" class="form-control contents" style="position: absoloute" id="msgtitle" name="msgtitle" placeholder="제목 작성" >
									<p>&nbsp;</p>
									
									<label for="departureDate" class="col-sm-12 control-label ">쪽지 내용</label> 
									<textarea  class="form-control contents" id="msgcontent"  name="msgcontent" style="position: absoloute" row="5" col="50" value="" placeholder="내용 작성"></textarea>
									<p>&nbsp;</p>
									<div style="margin-bottom:50px;"  align="center">
										<button type="button" class="btn-dy2" id="upmessage">보내기</button>
										<button type="button" class="btn-dy2" data-dismiss="modal">취  소</button>
									</div>
									
								</div>
								</div>
								<div class="col-sm-2"></div>
							</div>
						</form>
					</div>
			</div>
			<!------------------------------------------------message from reply---------------------------------------------------------->
			
			<!------------------------------------------------message from 1:1 question---------------------------------------------------------->
		<div id="modalquestion" class="modal fade" role="dialog" style="background-color: transparent;" >
			<div class="modal-dialog" align="center" style="background-color: black;">
						<form name="addMainForm">
				
							<div class="col-sm-12 form-group center-block contentsList" style="font-family: 'TYPO_JEONGJOL';
/*  							background: linear-gradient(-45deg, #56B1BF, transparent),linear-gradient(45deg, #D73A31, transparent);
 */ 							background-color: #ffffff;
 							border-radius: 3% !important; 
 							border: 1px dashed #3B3B3B;
 							color: #3B3B3B !important;">
								<div style="font-size:1.5em;font-family:Pacifico; margin-top:50px;margin-bottom:20px;color:#D73A31; opacity:0.8;">
									<button type="button" class="close btn-dy2" data-dismiss="modal">&times;</button>
									<h1 class="modal-title">
									<strong>MESSAGE</strong>
									</h1>
								</div>
			
								<input type="hidden" id="questionuserno" name="questionuserno" value=""/>
					      		<input type="hidden" id="reportreplyno" name="reportreplyno" value=""/>
					      		
								<div class="col-sm-2"></div>
								<div class="col-sm-8">					      

								<div name="planer">
									<label for="targetReportUser" class="col-md-12 control-label">보낼 사람</label> 
									<input type="text" class="form-control contents" style="position: absoloute" id="questionusername" name="questionusername" value="" readonly>
									<p>&nbsp;</p>
				
									<label for="targetReportTitle" class="col-md-12 control-label">쪽지 제목</label>
									<input type="text" class="form-control contents" style="position: absoloute" id="questiontitle" name="questiontitle" placeholder="제목 작성" >
									<p>&nbsp;</p>
									
									<label for="departureDate" class="col-sm-12 control-label ">쪽지 내용</label> 
									<textarea  class="form-control contents" id="questioncontent"  name="questioncontent" style="position: absoloute" row="5" col="50" value="" placeholder="내용 작성"></textarea>
									<p>&nbsp;</p>
									<div style="margin-bottom:50px;"  align="center">
										<button type="button" class="btn-dy2" id="upquestion">보내기</button>
										<button type="button" class="btn-dy2" data-dismiss="modal">취  소</button>
									</div>
									
								</div>
								</div>
								<div class="col-sm-2"></div>
							</div>
						</form>
					</div>
			</div>
			<!------------------------------------------------message 1:1 question---------------------------------------------------------->
			
			<!------------------------------------------------updateReply---------------------------------------------------------->
		<div id="updatemodalreply" class="modal fade" role="dialog" style="background-color: transparent;" >
			<div class="modal-dialog" align="center" style="background-color: black;">
						<form name="addMainForm">
				
							<div class="col-sm-12 form-group center-block contentsList" style="font-family: 'TYPO_JEONGJOL';
/*  							background: linear-gradient(-45deg, #56B1BF, transparent),linear-gradient(45deg, #D73A31, transparent);
 */ 							background-color: #ffffff;
 							border-radius: 3% !important; 
 							border: 1px dashed #3B3B3B;
 							color: #3B3B3B !important;">
								<div style="font-size:1.5em;font-family:Pacifico; margin-top:50px;margin-bottom:20px;color:#D73A31; opacity:0.8;">
									<button type="button" class="close btn-dy2" data-dismiss="modal">&times;</button>
									<h1 class="modal-title">
									<strong>REPLY MODIFY</strong>
									</h1>
								</div>			
								<input type="hidden" id="updatereplyno" name="updatereplyno" value=""/>
					      		
								<div class="col-sm-2"></div>
								<div class="col-sm-8">					      

								<div name="planer">							
									<label for="departureDate" class="col-sm-12 control-label ">댓글 내용</label> 
									<textarea  class="form-control contents" id="updatecontent"  name="updatecontent" style="position: absoloute" row="5" col="50" value="" placeholder="내용 작성"></textarea>
									<p>&nbsp;</p>
									<div style="margin-bottom:50px;"  align="center">
										<button type="button" class="btn-dy2" id="updatereplym">수  정</button>
										<button type="button" class="btn-dy2" data-dismiss="modal">취  소</button>
									</div>
								</div>
								</div>
								<div class="col-sm-2"></div>
							</div>
						</form>
					</div>
			</div>
			<!------------------------------------------------updateReply---------------------------------------------------------->			
		
		<!-- ///////////////////////dayoung///////////////////////// -->
				</div>
					</div>
						</div>
						<div align="right" class="col-xs-1">&nbsp;</div>
		<!-- ///////////////////////dayoung///////////////////////// -->
		
		
		</div>

</body>

</html>