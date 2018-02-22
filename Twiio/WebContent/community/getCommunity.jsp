<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<%-- 
<%@ page import="com.model2.mvc.service.domain.*" %>

<%
	Product vo = (Product)request.getAttribute("product2");
	User vo2 = (User)request.getAttribute("userVO");
	String name = request.getParameter("menu");
%>	
--%>

<html lang="ko">
<head>
<title>Insert title here</title>
<meta charset="UTF-8">

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- ///////////////////////summnernote/////////////////////////// -->
	<link href="/resources/css/summernote.css" rel="stylesheet">
    <script src="/resources/javascript/summernote.min.js"></script> 
    
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
    <script src="/resources/lang/summernote-ko-KR.js"></script>
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/resources/css/animate.min.css" rel="stylesheet">
   <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
   <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   <!-- jQuery UI toolTip 사용 CSS-->
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <!-- jQuery UI toolTip 사용 JS-->
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	
 	<!-- 다이얼로그  -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
 	<!-- ///////////////////////// Sweet Alert ////////////////////////// -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<style>
      /*  body > div.container{
        	border: 3px solid #D6CDB7;
            padding-top : 20px ;
        } */
        body {
        	padding-top : 70px ;
            background-color: #f1eeee;
			color: #666666 ;
        }
        textarea {
	  width: 100%;
	  height: 100px;
	  resize: none;
		}

 		.button-2{
		  width:140px;
		  height:50px;
		  border:2px solid #34495e;
		  float:left;
		  text-align:center;
		  cursor:pointer;
		  position:relative;
		  box-sizing:border-box;
		  overflow:hidden;
		  margin:0 0 40px 50px;
		}
		.button-2 a{
		  font-family:arial;
		  font-size:16px;
		  color:#34495e;
		  text-decoration:none;
		  line-height:50px;
		  transition:all .5s ease;
		  z-index:2;
		  position:relative;
		}
		.eff-2{
		  width:140px;
		  height:50px;
		  top:-50px;
		  background:#34495e;
		  position:absolute;
		  transition:all .5s ease;
		  z-index:1;
		}
		.button-2:hover .eff-2{
		  top:0;
		}
		.button-2:hover a{
		  color:#fff;
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
		hr {
			color: #08708A;
			display: block;
		    height: 1px;
		    border: 0;
		    border-top: 1px solid #08708A;
		    margin: 1em 0;
		    padding: 0;
		} 
		.red{
    	color:red;
   	   }
   	   .btn-outlined.btn-light:hover,
			.btn-outlined.btn-light:active {
			    color: #FFF;
			    background: #D73A31;
			    border-color: #D73A31;
			}
			
			.btn-outlined.btn-light {
			    background: #f4f4f4;
			    color: #D73A31;
				border-color: #D73A31;
			}
			
			.btn-xs{
				font-size:11px;
				line-height:14px;
				border: 1px solid;
				padding:5px 10px;
			}

	</style>

<script type="text/javascript">

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $("button.btn.btn-primary").bind("click" , function() {
		 $("form").attr("method" , "POST").attr("action" , "/community/listCommunity").submit();
	});
});



/*============= jQuery 변경 주석처리 =============
function resetData() {
		document.detailForm.reset();
}========================================	*/
//==> 추가된부분 : "취소"  Event 처리 및  연결
/* $(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $("a[href='#']").on("click" , function() {
		 history.go(-1);
	});
}); */

	

	var page = 1;
	var page2='';
	 
	//////////////////////////////////////////////////////addreply////////////////////////////////////////////////////
	$(function() {
		 $("#addReply").on("click" , function() {
			 page=page+1;
			 
		  $.ajax( 
							{
					url : "/common/json/listCommunityReply",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify({
							"communityNo":"${community.communityNo}",
							"userNo":"${community.userNo}",
							"userName": "${community.userName}",
							"currentPage" : page
						}),
						success : function(JSONData) {
							var displayValue='';
							//alert(JSONData.length);
							for(var i=0; i<JSONData.list.length;i++){
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
							if(JSONData.list[i]!=1){
							displayValue += '<div class="row2">'+
											 '<input type="hidden" name="userNo" value="'+JSONData.list[i].userNo+'"/>'+
											 '<input type="hidden" name="replyNo" value="'+JSONData.list[i].replyNo+'"/>'+
											 '<input type="hidden" name="userName" value="'+JSONData.list[i].userName+'"/>'+
											'<div class="col-sm-12"><div style="font-size: 0.8em;"><strong style="font-size: 1.2em;">&nbsp;&nbsp;'+
											JSONData.list[i].userName+'</strong>&nbsp;&nbsp;'+
											JSONData.list[i].replyRegDate+
											'</div></div>'+tool+'<div class ="row" name="upcontent"><div class="col-sm-10 col-sm-offset-1">'+
											(JSONData.list[i].replyContent == null?'':JSONData.list[i].replyContent)+'</div></div></div><hr class="col-sm-12" style="border-style:dotted">';
											
								
								
								/* '<div class="row2">'+
												 '<input type="hidden" name="userNo" value="'+JSONData.list[i].userNo+'"/>'+
												 '<input type="hidden" name="replyNo" value="'+JSONData.list[i].replyNo+'"/>'+
												 '<input type="hidden" name="userName" value="'+JSONData.list[i].userName+'"/>'+
												'<div class="col-md-2 col-md-offset-1">'+
												'[ 작성자  : '+JSONData.list[i].userName+' ]'+
						   						'</div>'+
						   						tool+
					    						   '<div class="col-md-10 col-md-offset-1">'+
					    						   (JSONData.list[i].replyContent == null?'':JSONData.list[i].replyContent)+
					    						   '</div>'+
					    						   '<div class="col-md-10 col-md-offset-1">'+
					    						   JSONData.list[i].replyRegDate+
					    						   '</div>'+
					    						   '<div class="col-xs-12">'+
												   '<hr sytle="border-style:dotted">'+
								  				   '</div></div>'; */
							}
							}
							
							if(JSONData.list[JSONData.list.length-1] == 1){
								 $("#aReply").remove();
							}
							var totalcount=
								'<div class="col-sm-10 col-sm-offset-1">'+
								'<strong>댓 글 목 록</strong>'+		
								'</div>'+
								'<div class="pull-right" style="font-size: 1em;" >'+
									'댓글수  : '+JSONData.totalCount+				
								'</div>';
	
							$('#replylist').html(displayValue);
							$('#totalCount').html(totalcount); 
						}
			}); 
		});
		 $(document).ready(function(){ page2 = $('.row2').length});
		 console.log('page2 : '+page2);
	});
	
	/////////////////////////////////////////////////writereply//////////////////////////////////////////////
	$(function() {
		 $("#write").on("click" , function() {
			alert('들어오니??');
			if(${empty user.userId}){
				 alert('로그인후 사용하여주세요');	 
			 }
			 else{
				// alert('들어오니??');
			 var replycontent = $('#replyContent').val();
			  $.ajax( 
						{
						url : "/common/json/addReply",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify({
							"replyContent":replycontent,
							"communityNo":"${community.communityNo}",
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
											 '<input type="hidden" name="userNo" value="'+JSONData.list[i].userNo+'"/>'+
											 '<input type="hidden" name="replyNo" value="'+JSONData.list[i].replyNo+'"/>'+
											 '<input type="hidden" name="userName" value="'+JSONData.list[i].userName+'"/>'+
											'<div class="col-sm-12"><div style="font-size: 0.8em;"><strong style="font-size: 1.2em;">&nbsp;&nbsp;'+
											JSONData.list[i].userName+'</strong>&nbsp;&nbsp;'+
											JSONData.list[i].replyRegDate+
											'</div></div>'+tool+'<div class ="row" name="upcontent"><div class="col-sm-10 col-sm-offset-1">'+
											(JSONData.list[i].replyContent == null?'':JSONData.list[i].replyContent)+'</div></div></div><hr class="col-sm-12" style="border-style:dotted">';
											
											  /*  '<div class="row2">'+
											   '<input type="hidden" name="userNo" value="'+JSONData.list[i].userNo+'"/>'+
											   '<input type="hidden" name="replyNo" value="'+JSONData.list[i].replyNo+'"/>'+
											   '<input type="hidden" name="userName" value="'+JSONData.list[i].userName+'"/>'+
											   '<input type="hidden" name="replyContent" value="'+JSONData.list[i].replyContent+'/>'+
											   '<div class="col-md-2 col-md-offset-1">'+
											   '[ 작성자  : '+JSONData.list[i].userName+' ]'+
				    						   '</div>'+
				    						   tool+
				    						   '<div class="col-md-10 col-md-offset-1">'+
				    						   (JSONData.list[i].replyContent == null?'':JSONData.list[i].replyContent)+
				    						   '</div>'+
				    						   '<div class="col-md-10 col-md-offset-1">'+
				    						   JSONData.list[i].replyRegDate+
				    						   '</div>'+
				    						   '<div class="col-xs-12">'+
											   '<hr sytle="border-style:dotted">'+
							  				   '</div></div>'; */
							}
							var totalcount=
							'<div class="col-sm-10 col-sm-offset-1">'+
							'<strong>댓 글 목 록</strong>'+		
							'</div>'+
							'<div class="pull-right" style="font-size: 1em;" >'+
								'댓글수  : '+JSONData.totalCount+				
							'</div>';
							
							$('#replylist').html(displayValue); 					   
							$('#totalCount').html(totalcount);
						}
				 }); 
			 } 
		}); 
	});
	///////////////////////////////////////////////////ajax 리스트만 뿌려주기//////////////////////////////////////////
	function listReplyajax(){
				$.ajax( 
				{
				url : "/common/json/listReply",
				method : "POST" ,
				dataType : "json" ,
				contentType:"application/json;charset=UTF-8",
				data : JSON.stringify({
					"communityNo":"${community.communityNo}",
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
									 '<input type="hidden" name="userNo" value="'+JSONData.list[i].userNo+'"/>'+
									 '<input type="hidden" name="replyNo" value="'+JSONData.list[i].replyNo+'"/>'+
									 '<input type="hidden" name="userName" value="'+JSONData.list[i].userName+'"/>'+
									'<div class="col-sm-12"><div style="font-size: 0.8em;"><strong style="font-size: 1.2em;">&nbsp;&nbsp;'+
									JSONData.list[i].userName+'</strong>&nbsp;&nbsp;'+
									JSONData.list[i].replyRegDate+
									'</div></div>'+tool+'<div class ="row" name="upcontent"><div class="col-sm-10 col-sm-offset-1">'+
									(JSONData.list[i].replyContent == null?'':JSONData.list[i].replyContent)+'</div></div></div><hr class="col-sm-12" style="border-style:dotted">';
									
									  /*  '<div class="row2">'+
									   '<input type="hidden" name="userNo" value="'+JSONData.list[i].userNo+'"/>'+
									   '<input type="hidden" name="replyNo" value="'+JSONData.list[i].replyNo+'"/>'+
									   '<input type="hidden" name="userName" value="'+JSONData.list[i].userName+'"/>'+
									   '<input type="hidden" name="replyContent" value="'+JSONData.list[i].replyContent+'/>'+
									   '<div class="col-md-2 col-md-offset-1">'+
									   '[ 작성자  : '+JSONData.list[i].userName+' ]'+
		    						   '</div>'+
		    						   tool+
		    						   '<div class="col-md-10 col-md-offset-1">'+
		    						   (JSONData.list[i].replyContent == null?'':JSONData.list[i].replyContent)+
		    						   '</div>'+
		    						   '<div class="col-md-10 col-md-offset-1">'+
		    						   JSONData.list[i].replyRegDate+
		    						   '</div>'+
		    						   '<div class="col-xs-12">'+
									   '<hr sytle="border-style:dotted">'+
					  				   '</div></div>'; */
					}
					var totalcount=
					'<div class="col-sm-10 col-sm-offset-1">'+
					'<strong>댓 글 목 록</strong>'+		
					'</div>'+
					'<div class="pull-right" style="font-size: 1em;" >'+
						'댓글수  : '+JSONData.totalCount+				
					'</div>';
					
					$('#replylist').html(displayValue); 					   
					$('#totalCount').html(totalcount);
				}
		 });
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	///////////////////////////////////////////////////addfriendcommunity 해결/////////////////////////////////////
		 	$(document).on("click", '#addfriendcommunity', function(){
		 		var addfrienduserno = $('input[name=communityUserNo]').val();
				 if(${empty user.userId}){
					 alert('로그인후 사용하여주세요');	 
				 }
				 else if(${user.userNo}== addfrienduserno){
					 alert('자기 자신을 친구 추가할수 없습니다.');
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
	
	//////////////////////////////////////////////reportcommunity///////////////////////////////////////
	
	$(document).on('click','#reportcommunity', function() {
		 var reportuserno = $('input[name=communityUserNo]').val();
		 var reportusername = $('input[name=communityUserName]').val();
		 
		 if(${empty user.userId}){
			 alert('로그인후 사용하여주세요');	 
		 }else if(${user.userNo} == reportuserno){
			 alert('자기자신은 신고 못합니다.');
	 	 }else{
			$('#reportuser2').val(reportusername);
			$('#reportuserno2').val(reportuserno);
	 		$('#modalreport2').modal('show');
	 	 }
	});
	
	$(document).on('click','#addreportcommunity2',function(){
		 	var reportcontent = $('#reportcontent2').val();
		 	var reporttitle = $('#reporttitle2').val();
		 	
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
						"targetUserNo":"${community.userNo}",
						"targetCommunityNo" :"${community.communityNo}"
					}),
					
					success : function(JSONData) {
						
						 swal("신고 접수가 완료 되었습니다.", {
						      icon: "success",
						 });
						 $('#modalreport2').modal('toggle');
						 $('#reportcontent2').val('');
						 $('#reporttitle2').val('');
				}
			});
		 }
	});
	////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	///////////////////////////////////////////////////addreport////////////////////////////////////////
	$(document).on('click','.row2 a[name=addreport]', function() {
		 var reportuserno = $($('input[name=userNo]')[$('.row2 a[name=addreport]').index(this)]).val();
		 var reportusername = $($('input[name=userName]')[$('.row2 a[name=addreport]').index(this)]).val();
		 var reportreplyno = $($('input[name=replyNo]')[$('.row2 a[name=addreport]').index(this)]).val();
		 
		 if(${empty user.userId}){
			 alert('로그인후 사용하여주세요');	 
		 }else if(${user.userNo} == reportuserno){
			 alert('자기자신은 신고 못합니다.');
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
						"targetReplyNo":reportreplyno,
						"targetCommunityNo" :"${community.communityNo}"
					}),
					
					success : function(JSONData) {
						 swal("신고 접수가 완료 되었습니다.", {
						      icon: "success",
						 });
						 listReplyajax();
						 $('#reportcontent').val('');
						 $('#reporttitle').val('');
						 $('#reportuserno').val('');
						 $('#reportreplyno').val('');
						$('#modalreport').modal('toggle');
				}
			});
		 }
	});
		///////////////////////////////////////////////addfriend 해결///////////////////////////////////////////////////
	$(document).on('click','.row2 a[name=addfriend]', function() {
		 var addfrienduserno = $($('input[name=userNo]')[$('.row2 a[name=addfriend]').index(this)]).val();
		 if(${empty user.userId}){
			 alert('로그인후 사용하여주세요');	 
		 }
		 else if(${user.userNo}== addfrienduserno){
			 alert('자기 자신을 친구 추가할수 없습니다.');
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
		 var msguserno = $($('input[name=userNo]')[$('.row2 a[name=addmessage]').index(this)]).val();
		 var msgusername = $($('input[name=userName]')[$('.row2 a[name=addmessage]').index(this)]).val();
		 
		 if(${empty user.userId}){
			 alert('로그인후 사용하여주세요');	 
		 }else if(${user.userNo }== msguserno){
			 alert('자기 자신에게 쪽지를 보낼수 없습니다.');
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
				alert('내용과 제목을 입력하세요.');			 
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
						"targetUserName":msgusername,
						"userName":"${user.userName}"
					}),
					success : function(JSONData) {
						 swal("메시지를 보냈습니다.", {
						      icon: "success",
						    });
						 
						 listReplyajax();
						$('#msguserno').val('');
						$('#msgcontent').val('');
						$('#msgtitle').val('');
						$('#msgusername').val('');
						$('#modalmessage').modal('toggle');
				    } 
			   });
			}			
	});
	
	///////////////////////////////////////////////deleteReply/////////////////////////////////////////////
	$(document).on('click','.row2 a[name=deletereply]', function() {
		 var deletereply = $($('input[name=replyNo]')[$('.row2 a[name=deletereply]').index(this)]).val();
		 var deleteuserno = $($('input[name=userNo]')[$('.row2 a[name=deletereply]').index(this)]).val();
		 
		//alert(${user.userNo}+'==='+deleteuserno);
		 
		 if(${empty user.userId}){
			 alert('로그인후 사용하여주세요');	 
		 }else if(${user.userNo } == deleteuserno){
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
							alert('success');
							listReplyajax();
						}
					}); 
			  	});
			  	}  
			});	 
		 }else{
		 	alert('자신의 댓글을 선택하여 지우세요.');
		 }		  
	});
	
	//////////////////////////////////////updatereply//////////////////////////////////////////
	$(document).on('click','.row2 a[name=updatereply]', function() {
		var updateuserno = $($('input[name=userNo]')[$('.row2 a[name=updatereply]').index(this)]).val();
		var updatereplyno = $($('input[name=replyNo]')[$('.row2 a[name=updatereply]').index(this)]).val();
		var updatecontent = $($('input[name=replyContent]')[$('.row2 a[name=updatereply]').index(this)]).val();
		
		if(${empty user.userId}){
			 alert('로그인후 사용하여주세요');	 
		 }else if(${user.userNo } == updateuserno){
			 $('#updatereplyno').val(updatereplyno);
			 $('#updatecontent').val(updatecontent);
			 $('#updatemodalreply').modal('show');
		 }else{
		 	alert('자신의 댓글을 선택하여 지우세요.');
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
						alert(JSON.stringify(JSONData));
						$('#updatereplyno').val("");
						$('#updatecontent').val("");
						listReplyajax();
						$('#updatemodalreply').modal('toggle');		
				}
		}); 
	});
	
	
	//////////////////////////////////////////////updateCommunity//////////////////////////////////////////////////
	
	$(document).on('click','#updatecommunity', function(){
		$(self.location).attr("href","/community/updateCommunity?communityNo=${community.communityNo}");
	});
	
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

<body>
<!-- ToolBar Start ///////////////////////////4//////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	
   <div class="container jumbotron" style=" align-content: center; background-color: rgba(255, 255, 255, 0.5); padding-top: 30px; "  >
   	 
   	 <div class="col-xs-10 col-xs-offset-1">
   	 			
		<input type="hidden" name = "communityType" id = "communityType" value="${communityType}"/>
		<input type="hidden" name = "communityUserNo" id = "communityUserNo" value="${community.userNo}"/>
		<input type="hidden" name = "communityUserName" id = "communityUserName" value="${community.userName}"/>
		<form name="detailForm" class="form-horizontal" enctype="multipart/form-data">
		<div class="form-group" style="padding-top : 60px;">
			<div class="row">
				<div class="col-sm-12">
						<div class="col-sm-12">
								<c:if test="${community.communityType == '0'}">
									<div style="color:#08708A;">&nbsp;&nbsp;[ Question Q&A ]</div>
								</c:if>
								<c:if test="${community.communityType == '1'}">
									<div style="color:#08708A;">&nbsp;&nbsp;[ Trip Review ]</div>
								</c:if>
							<strong style="font-size: 2em;">
					    	<c:if test="${community.communityType == 1}"> 	
					    	
					    	<c:if test="${community.communitySubTitle == 0}">
					    		[도시]
					    	</c:if>
					    	<c:if test="${community.communitySubTitle == 1}">
					   	 		[루트]
					    	</c:if>
					    	<c:if test="${community.communitySubTitle == 2}">
					   	 		[교통]
					    	</c:if>
					    	<c:if test="${community.communitySubTitle == 3}">
					    		[숙소]
					    	</c:if>
					    	<c:if test="${community.communitySubTitle == 4}">
					    		[쇼핑]
					    	</c:if>
					    	<c:if test="${community.communitySubTitle == 5}">
					    		[기타]
					    	</c:if> 
					       			|	   
					       	</c:if>${community.communityTitle}
					   		</strong>
							<div class="pull-right" style="font-size: 1em; padding-top : 15px;">조회수  :  ${community.viewCount} | 등록일  :  ${community.regDate} | 작성자  :  ${community.userName}</div>
						</div>
					</div>
				</div>
		</div>
		
		<hr>
	
		<div class="form-group" style="padding-top : 20px; padding-bottom : 20px;">
			<div class="col-sm-10 col-sm-offset-1">	
				<div>
					${community.communityContent}
				</div>
			</div>
		</div>
		
		
			<div class="form-group">
				<div class="col-sm-12">
				    <c:if test="${empty user.userId}">
				    </c:if>
				    <c:if test="${!empty user.userId}">
				    <div class="pull-right">
				    	<c:if test="${community.userNo != user.userNo}">
							<button type="button"  id="addfriendcommunity" class="btn btn-outlined btn-light btn-xs">친구추가</button>
							<button type="button"  id="reportcommunity" class="btn btn-outlined btn-light btn-xs">신&nbsp;고</button>
						</c:if>
						<c:if test="${community.userNo == user.userNo}">
							<button type="button"  id="updatecommunity" class="btn btn-outlined btn-light btn-xs">수&nbsp;정</button>
						</c:if>
					</div>
				    </c:if>
				  </div>
			</div>
		<hr>
	
		
		<div class="form-group" id="replyinput">
			<div class="col-sm-10">
				<textarea id="replyContent"  name="comment_content" style="resize:none;" row=2 col=50 value=""></textarea>
			</div>
			<div class="col-sm-2">
				<button type="button"  id="write" class="btn btn-default" style="margin-top : 20px;">댓글입력</button>
				<span class="help-block" ><p id="characterLeft" class="help-block ">You have reached the limit</p></span>
			</div>
		</div>
		
		<br/>
		<br/>
		<br/>
		<div class="form-group" id = "totalCount">
			<div class="col-sm-10 col-sm-offset-1">
				<strong>댓 글 목 록</strong>		
			
				<div class="pull-right" style="font-size: 1em;">
					댓글수  : <c:if test="${totalCountReply == null}">0</c:if>
						   <c:if test="${totalCountReply != null}">${totalCountReply}</c:if>				
				</div>
			</div>
		</div>
		
			<hr>

		<div class="row col-sm-12" id="replylist">
		<c:forEach var="reply" items="${list}">
		<div class= "row2">
			<input type="hidden" name="userNo" 	  	 value="${reply.userNo}"/>
			<input type="hidden" name="userName" 	 value="${reply.userName}"/>
			<input type="hidden" name="replyNo" 	 value="${reply.replyNo}"/>
			<input type="hidden" name="replyContent" value="${reply.replyContent}"/>
			
			<div class="col-sm-12">
				<div style="font-size: 0.8em;">
	    			<strong style="font-size: 1.2em;">&nbsp;&nbsp;${reply.userName}</strong>&nbsp;&nbsp; ${reply.replyRegDate}
	    		</div>
	    	</div>	
	    		
	    		
    		<c:if test="${empty user.userId}">
		    </c:if>
		    <c:if test="${!empty user.userId}">
    		<div class="btn-group pull-right">
                  <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown" style="margin-right: 50px;">
                  		<span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>
                  </button>
                  <ul class="dropdown-menu slidedown">                    	
						    <li><a href="#" name="addmessage"><span class="glyphicon glyphicon-pencil"></span>&nbsp;Message</a></li>                            	
					        <li><a href="#" name="addreport"><span class="glyphicon glyphicon-alert"></span>&nbsp;Report</a></li>                                
					        <li><a href="#" name="addfriend"><span class="glyphicon glyphicon-user"></span>&nbsp;AddFriend</a></li>
					        <li><a href="#" name="deletereply"><span class="glyphicon glyphicon-trash"></span>&nbsp;Delete</a></li>
					        <li><a href="#" name="updatereply"><span class="glyphicon glyphicon-scissors"></span>&nbsp;Update</a></li>
                   </ul>
             </div>				
			</c:if>
		
		<div class ="row" name="upcontent">
    		<div class="col-sm-10 col-sm-offset-1">
    			${reply.replyContent}
    		</div>
    	</div>
    	
		</div>
		<hr class="col-sm-12" style="border-style:dotted">
 		</c:forEach>
 		</div>
 		
 		<div class="col-xs-2 col-xs-offset-4" id="aReply">
			<div class="button-2">
    		<div class="eff-2"></div>
    		<a href="#" id="addReply"> 댓글 더보기 </a>
  			</div>
		</div>
		
   <!-- ToolBar End /////////////////////////////////////-->
		</form>
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
									<button type="button" class="close" data-dismiss="modal">&times;</button>
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
										<button type="button" class="btn btn-default" id="addreportcommunity">신고등록</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">취  소</button>
									</div>
									
								</div>
								</div>
								<div class="col-sm-2"></div>
							</div>
							
						</form>
					</div>
			</div>
			
			
			
			<div id="modalreport2" class="modal fade" role="dialog" style="background-color: transparent;" >
			<div class="modal-dialog" align="center" style="background-color: black;">
						<form name="addMainForm">
				
							<div class="col-sm-12 form-group center-block contentsList" style="font-family: 'TYPO_JEONGJOL';
/*  							background: linear-gradient(-45deg, #56B1BF, transparent),linear-gradient(45deg, #D73A31, transparent);
 */ 							background-color: #ffffff;
 							border-radius: 3% !important; 
 							border: 1px dashed #3B3B3B;
 							color: #3B3B3B !important;">
								<div style="font-size:1.5em;font-family:Pacifico; margin-top:50px;margin-bottom:20px;color:#D73A31; opacity:0.8;">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h1 class="modal-title">
									<strong>REPORT</strong>
									</h1>
								</div>
								
								<input type="hidden" id="reportuserno2" name="reportuserno2" value=""/>
					      		
								<div class="col-sm-2"></div>
								<div class="col-sm-8">					      

								<div name="planer">
									<label for="targetReportUser" class="col-md-12 control-label">신고 대상</label> 
									<input type="text" class="form-control contents" style="position: absoloute" id="reportuser2" name="reportuser2" value="" readonly>
									<p>&nbsp;</p>
				
									<label for="targetReportTitle" class="col-md-12 control-label">신고 제목</label>
									<input type="text" class="form-control contents" style="position: absoloute" id="reporttitle2" name="reporttitle2" placeholder="신고 제목 " >
									<p>&nbsp;</p>
									
									<label for="departureDate" class="col-sm-12 control-label ">신고 내용</label> 
									<textarea  class="form-control contents" id="reportcontent2"  name="reportcontent2" style="position: absoloute" row="5" col="50" value="" placeholder="신고 내용"></textarea>
									<p>&nbsp;</p>
									<div style="margin-bottom:50px;"  align="center">
										<button type="button" class="btn btn-default" id="addreportcommunity2">신고등록</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">취  소</button>
									</div>
									
								</div>
								</div>
								<div class="col-sm-2"></div>
							</div>
							
						</form>
					</div>
			</div>
			<!------------------------------------------------report---------------------------------------------------------->
			
			<!------------------------------------------------message---------------------------------------------------------->
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
									<button type="button" class="close" data-dismiss="modal">&times;</button>
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
										<button type="button" class="btn btn-default" id="upmessage">보내기</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">취  소</button>
									</div>
									
								</div>
								</div>
								<div class="col-sm-2"></div>
							</div>
						</form>
					</div>
			</div>
			<!------------------------------------------------message---------------------------------------------------------->
			
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
									<button type="button" class="close" data-dismiss="modal">&times;</button>
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
										<button type="button" class="btn btn-default" id="updatereplym">수  정</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">취  소</button>
									</div>
								</div>
								</div>
								<div class="col-sm-2"></div>
							</div>
						</form>
					</div>
			</div>
			<!------------------------------------------------updateReply---------------------------------------------------------->
</body>
</html>