<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="UTF-8">

   <!-- 참조 : http://getbootstrap.com/css/   참조 -->
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

   
   <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    
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
     
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
  <!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css"> -->
  
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <link rel="stylesheet" href="/resources/css/font.css" />




    
   
<style>
body {
            padding-top : 100px ;
            background-color: #f4f4f4;
         color: #666666 ;
         font-family: "Source Sans Pro", Helvetica, sans-serif;
        }
        h1 {
         text-align: center;
      }
        

        .ct_list_pop {
           margin-left: 80px;
           color: blue; 
           float: center;
        }
        
       td { 
           cursor: default;
        }
        
        .panel {
         border: 1px solid #ddd;
         background-color: #fcfcfc;
      }

       .red{
       color:red;
            }
            
            /* 사이드바 <START> */
         img {
        float: none;
        margin: 0 auto;
        width: 80%;
        height: 80%;
        -webkit-border-radius: 50% !important;
        -moz-border-radius: 50% !important;
        border-radius: 50% !important;
        border: 3px solid;
      }
   
         .sidenav::-webkit-scrollbar {
           width: 0.7em;
           background: transparent;
         }
         
         .sidenav::-webkit-scrollbar-thumb {
           background: transparent;
         }

         .sidenav {
         margin-top: 53px;
          height: 100%;
          width: 0;
          position: fixed;
          z-index: 1;
          top: 0;
             left: 0;
          overflow-x: hidden;
          transition: 0.6s;
          padding-top: 60px;
          background-color: #ffffff;
          border-right: solid 0.8px #C2C2C2;
         }

         .sidenav a {
          padding: 8px 8px 8px 32px;
          text-decoration: none;
          font-size: 25px;
           color: #818181;
          display: block;
          transition: 0.3s;
         }

         .sidenav a:hover {
             color: #f1f1f1;
         }
         
         .sidenav .closebtn {
             position: absolute;
             top: 0;
             right: 25px;
             font-size: 36px;
             margin-left: 50px;
         }
         
         #main {
             transition: margin-left .5s;
             padding: 5px;
         }
         
         @media screen and (max-height: 450px) {
           .sidenav {padding-top: 15px;}
           .sidenav a {font-size: 18px;}
         }
         
         #contentsBox {
            height: 6em;
            border-bottom: dashed 0.5px #C2C2C2;
         }
         
         /* 사이드바 <END> */
         .table-filter tr td:first-child {
         }
         .sideBarIcon{
            cursor : pointer;
            margin-left : 10px;
         }
         .sideBarIcon:hover {
             color: #f1f1f1;
         }
   
    
</style>

<script type="text/javascript">

 function fncGetUserList(currentPage) {
    if(${resultPage.maxPage}>=currentPage){
   $("#currentPage").val(currentPage);
   $("form").attr("method" , "POST").attr("action" , "/mypage/message/listMessage").submit();
   }
 }


//============= "검색"  Event  처리 =============   
 $(function() {
    //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
    $("#search").on("click" , function() {
      fncGetUserList(1);
   });
 });


//////////////////////////쪽지보내기/////////////////////////////
$(document).on('click','#writemesg',function(){
   var toUserName = $($('input[name=toUserName]')[$('span[id=writemesg]').index(this)]).val();
   var fromUserNo = $($('input[name=fromUserNo]')[$('span[id=writemesg]').index(this)]).val();
   
   $('#targetNo').val(fromUserNo);
   $('#toUsern').val(toUserName);
   $("#modalwrite").modal('show');
});

$(document).on('click','#addMess',function(){
   var targetNo = $('#targetNo').val();
   var toUsern = $('#toUsern').val();
   var modalMessageTitle = $('#modalMessageTitle').val();
   var modalMessageContent = $('#modalMessageContent').val();
   //modalmessage

   if(modalMessageTitle==''| modalMessageContent==''){
      swal("제목과 내용을 적어주세요.", {
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
            "toUserNo":targetNo,
            "fromUserNo":"${user.userNo}",
            "messageContent":modalMessageContent,
            "messageType":"2",
            "messageTitle":modalMessageTitle,
            "targetUserName":toUsern,
            "userName":"${user.userName}"
         }),
         success : function(JSONData) {
            swal("메시지가  보내기 성공!!", {
                  icon: "success",
             }).then((willDelete)=>{
                $('#targetNo').val('');
                $('#toUsern').val('');
                $('#modalMessageTitle').val('');
                $('#modalMessageContent').val('');
                $('#modalwrite').modal('toggle');
            });
          } 
      });
   }
});
///////////////////////////////////////////////////////////
/////////////////////////삭제//////////////////////////////
$(document).on('click','#deletemesg',function(){
   var messageNo = $($('input[name=messageNo]')[$('span[id=deletemesg]').index(this)]).val();
   $('#mesgNo').val(messageNo);
   $("#modaldelete").modal('show');
});

$(document).on('click','#modalDeleteMessage',function(){
   var mesgNo = $('#mesgNo').val();
    $.ajax({
      url : "/mypage/json/deleteMessage",
      method : "POST" ,
      dataType : "json" ,
      contentType:"application/json;charset=UTF-8",
      data : JSON.stringify({
         "messageNo":mesgNo
      }),
      success : function(JSONData) {         
         swal("메시지가 삭제되었습니다.", {
             icon: "success",
         }).then((willDelete)=>{
            $("#modaldelete").modal('toggle');
            location.reload();
         });
       } 
   });    
}); 
/////////////////////////////////////////////////////////////////
/////////////////////////////상세보기//////////////////////////////
   
   $(document).on('click','td:nth-child(4)[id="title"]',function(){
   var mesgNo = $($('input:hidden[name="messageNo"]')[$('td:nth-child(4)[id="title"]').index(this)]).val();
    $.ajax({
      url : "/mypage/json/getMessage",
      method : "POST" ,
      dataType : "json" ,
      contentType:"application/json;charset=UTF-8",
      data : JSON.stringify({
         "messageNo":mesgNo
      }),
      success : function(JSONData) {
         $('#targetNo').val(JSONData.fromUserNo);
         $('#toUsern1').val(JSONData.userName);
         $('#modalmessageRegDate').val(JSONData.messageRegDate);
         if(JSONData.messageType == '3'){
         	$('#modaldetailMessageTitle').val(JSONData.messageTitle.split("&")[0]);
         	$("#roomKey").val(JSONData.messageTitle.split("&")[1]);
         }else{
        	 	$('#modaldetailMessageTitle').val(JSONData.messageTitle);
         }
         $('#modaldetailMessageContent').text(JSONData.messageContent);
         $('modaldetailMessageType').val(JSONData.messageType);
         
         $("button[name=okay]").remove();
         $("button[name=denied]").remove();
         
         if(JSONData.messageType == '3'){
            $("#yesOrNo").append('<button type="button" class="btn btn-default" style="margin-left:2px;" name="okay" id="okay">수락</button>')
            .append('<button type="button" class="btn btn-default" style="margin-left:4px;" name="denied" id="denied">거절</button>');
         }
         
         
         $("#modaldetail").modal('show');
         
         
       } 
  });
  });
  //수락 Event
   $(document).on('click','#okay',function(){
		swal('채팅방 초대 수락 ! ',{
			icon: "success",
		}).then((okay)=>{
			if(okay){
				$.ajax({
					url:"/room/json/addRoomUser/"+$("#roomKey").val(),
					method: "POST",
					dataType: "json",
					headers :{
			            "Accept" : "application/json",
			            "Content-Type" : "application/json"
			         },  
					success : function(JSONData){
						
					}
					
				})//END ajax
				$('#modaldetail').modal('hide');
			}	
		})//END swal	
	});
///////////////////////////////////////////////////////////////////////
///////////////////////////여러개 삭제///////////////////////////////////

   $(function(){
      $("#deletemesgselect").on("click", function(){
         var checkedMessage = $("input[name=checkbox]").length;
         var checkedMessageCount = $("input[name=checkbox]:checked").length;
         var messageNoList="";
         //var array = new Array();
         
         if(checkedMessageCount < 1){
            swal("메시지를 선택 하여주세요.", {
                  icon: "warning",
                });
         }else{
         for (var i = 0; i < checkedMessageCount; i++) {
            if(i != checkedMessageCount-1){
               var value = $($("input[name=checkbox]:checked")[i]).val()+","; 
            }else{
               var value = $($("input[name=checkbox]:checked")[i]).val();
            }
            
            messageNoList += value;
         
         }
         
         //alert(messageNoList);
         deleteMessage(messageNoList);
         }
      });
   });
   
   function deleteMessage(messageNoList){
      $.ajax({
         url:"/mypage/json/deleteSelectMessage/"+messageNoList,
         method:"GET",
         dataType:"json",
         headers :{
            "Accept" : "application/json",
            "Content-Type" : "application/json"
         },                  
         success: function(returnData){
            var count = returnData.count;
            swal("선택하신 메시지가 삭제되었습니다.", {
                  icon: "warning",
            }).then((willDelete)=>{
               location.reload();
            });
                        
         }
         
      });
   }
   ///////////////////////////////////////////////////////////////////
   ///////////////////////////////삭제/////////////////////////////////
   $(document).on("click",'td:nth-child(4) span[name="friendDelete"]', function(){
          var friendNo = $($('input[name=friendNo]')[$('td:nth-child(4) span[name="friendDelete"]').index(this)]).val();
          $.ajax({
             url : "/common/json/deleteFriend/"+friendNo,
             method:"GET",
             dataType:"json",
             headers :{
                "Accept" : "application/json",
                "Content-Type" : "application/json"
             },      
             success : function(JSONData) {
                swal("친구가 삭제되었습니다.", {
                      icon: "warning",
                }).then((willDelete)=>{
                   location.reload();
                });
              },error : function(request,error){
                 alert(에러);
              }
         }); 
       });
        
      ////////////////////////////////////////////friendMessage///////////////////////////////////////////////
        $(document).on("click",'td:nth-child(4) span[name="friendMessage"]', function(){
           var userNo = $($('input[name=userNo]')[$('td:nth-child(4) span[name="friendMessage"]').index(this)]).val();
           var userName = $($('input[name=userName]')[$('td:nth-child(4) span[name="friendMessage"]').index(this)]).val();
           
           $('#targetNo2').val(userNo);
           $('#toUsern2').val(userName);
           $("#modalwrite2").modal('show');
        });

        $(document).on('click','#addMess2',function(){
           var targetNo = $('#targetNo2').val();
           var toUsern = $('#toUsern2').val();
           var modalMessageTitle = $('#modalMessageTitle2').val();
           var modalMessageContent = $('#modalMessageContent2').val();
           //modalmessage

           if(modalMessageTitle==''| modalMessageContent==''){
              swal("내용과 제목을 적어주세요.", {
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
                    "toUserNo":targetNo,
                    "fromUserNo":"${user.userNo}",
                    "messageContent":modalMessageContent,
                    "messageType":"2",
                    "messageTitle":modalMessageTitle,
                    "targetUserName":toUsern,
                    "userName":"${user.userName}"
                 }),
                 success : function(JSONData) {
                    swal("메세지 보내기 성공 !!", {
                        icon: "success",
                     }).then((willDelete)=>{
                        $('#targetNo2').val('');
                            $('#toUsern2').val('');
                            $('#modalMessageTitle2').val('');
                            $('#modalMessageContent2').val('');
                          $('#modalwrite2').modal('toggle');
                     });
                  } 
              });
           }
        });
        
        $(function() {
         //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         $( "td:nth-child(2)" ).on("click" , function() {
            var userNo = $($('input[name=userNo]')[$('td:nth-child(2)').index(this)] ).val();
            window.open("/user/getProfile2?userNo="+userNo,"getProfile2","width=500, height=650,status=no, scrollbars=no, location=no");
            //self.location ="/user/getProfile2?userNo="+userNo; 
         });
      });
   ///////////////////////////////////////////////////////////////////
   //////////////////////////////////사이드바///////////////////////////////////////function openNav() {
      function openNav() {
         document.getElementById("mySidenav").style.width = "300px";
         document.getElementById("main").style.marginLeft = "300px";
         document.body.style.backgroundColor = "#f4f4f4";
         
      }

      function closeNav() {
         document.getElementById("mySidenav").style.width = "0";
         document.getElementById("main").style.marginLeft = "0";
         document.body.style.backgroundColor = "#f4f4f4";
      }
      
      $(function() {
         $("div[name=contentsBox]").hover(function() {
            var index = $("div[name=contentsBox]").index(this);
             $($("div[name=contentsBox]")[index]).attr("style","background-color:#A6A0A5; color:white;");
                }, function(){
                   var index = $("div[name=contentsBox]").index(this);
                   $($("div[name=contentsBox]")[index]).attr("style","background-color:#ffffff;");
                
          });
       });
      ////////////////////////////////////////사이드바///////////////////////////////////////////////////
</script>
</head>

<body>
   <!-- ToolBar Start ///////////////////////////4//////////-->
   <jsp:include page="/layout/toolbar.jsp" />
      <!-- ToolBar End /////////////////////////////////////-->
      
      <c:if test="${user.userType != '3' }">
      <!---------------------------------------사이드바--------------------------------------------------------->
   <div id="mySidenav" class="sidenav" style="font-family:'JEJUMYEONGJO';">
      <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
         
         <div class="col-xs-12" align="center" style="margin-bottom: 2em; ">
         
            <c:if test="${empty user.userImage}">
               <img name="ffriend" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" width="80px" height="80px" style="border-radius: 5%;">
            </c:if>
            <c:if test="${!empty user.userImage}">
               <img name="ffriend" src="/resources/images/userimages/${user.userImage}" style="width: 100px; height: 100px;">                                           
            </c:if>
                        
         </div>
         <div class="col-xs-12" align="center">
            [ 이      름  :  ${user.userName } ]
         </div>
         
         <div class="col-xs-12" align="center" >
            <c:if test="${user.userType == 1}">
               [  유    형  :  회원  ]
            </c:if>
            <c:if test="${user.userType == 2}">
               [  유    형  :  호스트  ]
            </c:if>
            <c:if test="${user.userType == 3}">
               [  유    형  :  관리자  ]
            </c:if>
         </div>
         <div class="col-xs-12" align="center"style="margin-bottom: 4em; ">
            [ 핸드폰  : ${user.userPhone } ]
         </div>
         <div class="col-xs-12" style="background:transparent;">
         
         <table class="table table-filter" style="align-content: center;">
            <thead>
            <h3 align = "center">친  구</h3>
               <tr data-status="pagado">
                   <th align="center" >No</th>
                   <th align="left" >사진</th>
                   <th align="left" >Friend</th>
                   <th align="left" >쪽지/삭제</th>
               </tr>
               </thead>               
               <tbody>
               <c:set var="i" value="0" />
               <c:forEach var="friend" items="${listFriend}">                            
                  <c:set var="i" value="${ i+1 }"/>
                  <input type="hidden" id="friendNo" name="friendNo" value="${friend.profilePublic}"/>
                  <input type="hidden" id="userNo" name="userNo" value="${friend.userNo}"/>
                  <input type="hidden" id="userName" name="userName" value="${friend.userName}"/>
                  <tr data-status="pagado">
                  <div class="media-body">
                  <td align="pull-right">${ i }</td>
                  <td align="left" name="productget">
                     <c:if test="${empty friend.userImage}">
                        <img name="ffriend" src="http://download.seaicons.com/download/i93784/custom-icon-design/silky-line-user/custom-icon-design-silky-line-user-user.ico" style="width: 40px; height: 40px;" class="img-responsive">
                     </c:if>
                     <c:if test="${!empty friend.userImage}">
                        <img name="ffriend" src="/resources/images/userimages/${friend.userImage}" class="img-responsive" style="width: 40px; height: 40px;">                                           
                     </c:if>
                  </td>
                  <td align="left" name="productget">
                     ${friend.userName}
                  </td>
                  <td align="left" class="row">
                        <!-- <div href="#" role="button" name="friendMessage" style="max-width : 40%;" ><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></div>
                        <div href="#"  role="button" name="friendDelete" style="max-width : 40%;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></div> -->
                     <span class="glyphicon glyphicon-envelope sideBarIcon" name="friendMessage" aria-hidden="true"></span>
                     <span class="glyphicon glyphicon-remove sideBarIcon" name="friendDelete" aria-hidden="true"></span>
                  
                  </td>
                  </div>
                  </tr>
               </c:forEach>
            </tbody>                     
            </table>
            
          </div>
   </div>
   <div id="main" style="position:fixed; z-index:1000;">

   
      <span style="font-size: 20px; font-family:'JEJUMYEONGJO'; cursor: pointer" onclick="openNav()" >&#9776;
      OPEN
      </span>
   </div>
      </c:if>
   <!---------------------------------------사이드바--------------------------------------------------------->
      
      
      
      
 
      <div class="container">

   <div class="row col-md-10 col-md-offset-1">
   
        <div class="col-md-12">
      
        <div class="table-responsive">
          <h1 style="font-family: 'Jeju Gothic', serif; ">Message</h1>       
         <div class="pull-left">
              <p class="text-primary">
                전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
             </p>
         </div>
         <div class="pull-right">
              <p class="text-primary">
               [ 삭제   :  <td align="left"><button class="btn btn-danger btn-xs" id="deletemesgselect"><span class="glyphicon glyphicon-trash"></span></button></td> ]
            </p>
         </div>
         <form class="form-inline" name="detailForm"> 
          <input type="hidden" id="currentPage" name="currentPage" value="" />
          </form>
      </div>
        </div>  
            
       <div class="row">
       <div class="col-md-12">
       <div class="panel panel-default">       
             <table class="table table-hover " style="margin-left: auto; margin-right: auto; text-align: center;">
              
                   <thead>   
                   <th align="center"></th>
                   <th align="left" width="10%">보낸 사람</th>
                   <th align="left" width="10%">쪽지 유형</th>
                   <th align="left" width="40%">작성 제목</th>
                   <th align="left" width="20%">보낸 시간</th>
                   <th align="left" width="10%">작성 하기</th>
                   <th align="left" width="10%">지  우  기</th>
                   </thead>
          <tbody>
            <c:set var="i" value="0" />
             <c:forEach var="message" items="${list}">
           <c:set var="i" value="${ i+1 }" />
           <input type="hidden" id="messageNo" name="messageNo" value="${message.messageNo}"/>
            <input type="hidden" id="toUserName" name="toUserName" value="${message.userName}"/>
            <input type="hidden" id="fromUserNo" name="fromUserNo" value="${message.fromUserNo }"/>   
            <tr>         
              <td><input type="checkbox" name="checkbox" id="checkbox" value="${message.messageNo}">  </td>
               <td align="left">${message.userName}</td>
               <td align="left">
                <c:if test="${message.messageType == '1'}">상품</c:if>
               <c:if test="${message.messageType == '2'}">개인 </c:if>
               <c:if test="${message.messageType == '3'}">채팅방</c:if>
               <c:if test="${message.messageType == '4'}">신고</c:if>
               </td>
               <c:if test="${message.messageType == '3' }">
               		<c:set var="messageSplit" value="${fn:split(message.messageTitle,'&')}"/>
               		<td align="left" id="title">${messageSplit[0] }</td>
               </c:if>
               <c:if test="${message.messageType != '3' }">
               		<td align="left" id="title">${message.messageTitle}</td>
               </c:if>
               
               <td align="left">${message.messageRegDate}</td>
               <td align="left"><span class="glyphicon glyphicon-envelope sideBarIcon" id="writemesg"></span></td>
               <td align="left"><span class="glyphicon glyphicon-remove sideBarIcon" id="deletemesg"></span></td>
  
            </tr>
            </c:forEach>
          </tbody>        
         </table> 
         </div>
         <div class ="row">
           <jsp:include page="../common/pageNavigator_new.jsp"/>
         </div>
         </div>
        </div>
    </div>
    </div>
    
    <div class="modal fade" id="modalwrite" role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
       <div class="modal-dialog">
          <div class="modal-content">
                <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                 <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
               </div>
             <div class="modal-body">
                   <input class="hidden" name="targetNo" id="targetNo" type="text" value="">
                <div class="form-group">
                   <input class="form-control" name="toUsern" id="toUsern" type="text" value="" readonly>
              </div>
              <div class="form-group"> 
                 <input class="form-control" name="modalMessageTitle" id="modalMessageTitle" type="text" value="" placeholder="제목을 작성하여 주세요.">
              </div>
              <div class="form-group">
                 <textarea rows="2" class="form-control" name="modalMessageContent" id="modalMessageContent" value="" placeholder="내용을 작성하여 주세요."></textarea>
              </div>
           </div>
            <div class="modal-footer ">
              <button type="button" class="btn btn-warning btn-lg" id="addMess" name="addMess" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> SEND</button>
            </div>
           </div>
        </div>
   </div>
    
    
    
     <div class="modal fade" id="modaldelete" role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
       <div class="modal-content">
          <div class="modal-header">
          <input type="hidden" id="mesgNo" name="mesgNo" val=""/>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
         </div>
          <div class="modal-body">
               <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div> 
           </div>
          <div class="modal-footer ">
            <button type="button" class="btn btn-success" id="modalDeleteMessage" name="modalDeleteMessage"><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
           <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
           </div>
        </div>
       </div>
     </div>
     
           
            
      <div class="modal fade" id="modalwrite2" role="dialog" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
       <div class="modal-dialog">
          <div class="modal-content">
                <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                 <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
               </div>
             <div class="modal-body">
                   <input class="hidden" name="targetNo2" id="targetNo2" type="text" value="">
                <div class="form-group">
                   <input class="form-control" name="toUsern2" id="toUsern2" type="text" value="" readonly>
              </div>
              <div class="form-group"> 
                 <input class="form-control" name="modalMessageTitle2" id="modalMessageTitle2" type="text" value="" placeholder="제목을 작성하여 주세요.">
              </div>
              <div class="form-group">
                 <textarea rows="2" class="form-control" name="modalMessageContent2" id="modalMessageContent2" value="" placeholder="내용을 작성하여 주세요."></textarea>
              </div>
           </div>
            <div class="modal-footer ">
              <button type="button" class="btn btn-warning btn-lg" id="addMess2" name="addMess2" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> SEND</button>
            </div>
           </div>
        </div>
      </div>
      

            
            
      <div id="modaldetail" class="modal fade" role="dialog" style="background-color: transparent;" >
         <div class="modal-dialog" align="center" style="background-color: black;">
                  <form name="addMainForm">
                     <input type="hidden" id =modaldetailMessageType value="">
                     <div class="col-sm-12 form-group center-block contentsList" style="font-family: 'TYPO_JEONGJOL';
/*                       background: linear-gradient(-45deg, #56B1BF, transparent),linear-gradient(45deg, #D73A31, transparent);
 */                      background-color: #ffffff;
                      border-radius: 3% !important; 
                      border: 1px dashed #3B3B3B;
                      color: #3B3B3B !important;">
                        <div style="font-size:1.5em;font-family:Pacifico; margin-top:50px;margin-bottom:20px;color:#D73A31; opacity:0.8;">
                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                           <h1 class="modal-title">
                           <strong>MESSAGE</strong>
                           </h1>
                        </div>

                           <input class="hidden" name="targetNo" id="targetNo" type="text" value="">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8">                     

                        <div name="planer">
                           <input type="hidden" id="roomKey" value="">
                           <label for="reportuser" class="col-md-12 control-label">보낸 사람</label> 
                           <input type="text" class="form-control contents text-center" style="position: absoloute" id="toUsern1" name="toUsern1" value="" readonly>
                           <p>&nbsp;</p>
                           
                           <label for="targetReportUser" class="col-md-12 control-label">도착 시간</label> 
                           <input type="text" class="form-control contents text-center" style="position: absoloute" id="modalmessageRegDate" name="modalmessageRegDate" value="" readonly>
                           <p>&nbsp;</p>
            
                           <label for="targetReportTitle" class="col-md-12 control-label">제목</label>
                           <input type="text" class="form-control contents text-center" style="position: absoloute" id="modaldetailMessageTitle" name="modaldetailMessageTitle" value="" readonly >
                           <p>&nbsp;</p>
                           
                           <label for="departureDate" class="col-sm-12 control-label ">내용</label> 
                           <textarea  class="form-control contents" id="modaldetailMessageContent"  name="modaldetailMessageContent" style="position: absoloute; row=5; col=50;" value="" readonly></textarea>
                           <p>&nbsp;</p>
                           <div style="margin-bottom:50px;"  align="center">
                              <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
                              <span class id="yesOrNo"></span>
                           </div>
                           
                           
                           
                           
                        </div>
                        </div>
                        <div class="col-sm-2"></div>
                     </div>
                     
                  </form>
               </div>
         </div>
</body>

</html>