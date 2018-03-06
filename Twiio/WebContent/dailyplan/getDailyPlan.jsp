<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 다이얼로그  -->

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- Hover Jquery -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<!--  구글  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 내 CSS -->
<link rel="stylesheet" href="/resources/css/plan-listMainPlan.css" />

<!--  ///////////////////////// CSS ////////////////////////// -->
<link rel="stylesheet" href="/resources/css/font.css" />
<link rel="stylesheet" href="/resources/css/plan-getDailyPlan.css" />

<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



<title>getDailyPlan</title>

<style type="text/css">
body::-webkit-scrollbar {
  width: 0.7em;
  background: transparent;
}
body::-webkit-scrollbar-thumb {
  background: transparent;
}

#mainBody {
	
	padding-top: 70px;
	font-family:'JEJUGOTHIC';
	background: #f4f4f4;
}

#innerMain {
	font-size: 6em;
	margin-top: 1.5em;
}

#thumbnailMainBox {
	min-height: 1500px;
	font-family:'JEJUMYEONGJO';
	background: linear-gradient(-45deg, #08708A, transparent),linear-gradient(45deg, #D73A31, transparent);
	border-radius: 8px;
	border-color: #000000;
	border-width: 10px;
	display: inline-block;
	padding: 1px;
	text-decoration: none;
}

#thumbnailMainThumbBox {
	min-height: 1500px;
	background: #fff;
	display: inline-block;
	border-radius: 6px;
}
.btn {
	font-family:'JEJUGOTHIC';
}


/* 사이드바 <START> */

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
    padding: 16px;
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

/* 은애 */

/* //////////////////eunae_modal_table////////////////////////// */
		.content h1 {
			text-align: center;
		}
		.panel {
			border: 1px solid #ddd;
			background-color: #fcfcfc;
		}
		.table-filter {
			background-color: #fff;
			font-size: 15px;
		}
		.table-filter tbody tr:hover {
			cursor: pointer;
			background-color: #eee;
		}
		.table-filter tbody tr td {
			padding: 10px;
			vertical-align: middle;
			border-top-color: #FFF;
		}
		.table-filter tbody tr.selected td {
			background-color: #eee;
		}
		.table-filter tr td:first-child {
			width: 60px;
		}
		.media-photo{
		  float: none;
		  margin: 0 auto;
		  -webkit-border-radius: 50% !important;
		  -moz-border-radius: 50% !important;
		  border-radius: 50% !important;
		  border: 3px solid;
		}
}
.btn {
	font-family:'JEJUGOTHIC';
}

/*///////////////////// imaged preview ///////////////////*/ 
.filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}

/* imaged preview */
.filebox .upload-display {
    margin-bottom: 5px;
}

@media(min-width: 768px) {
    .filebox .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
    }
}

.filebox .upload-thumb-wrap {
    display: inline-block;
    width: 54px;
    padding: 2px;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
}

.filebox .upload-display img {
    display: block;
    /* max-width: 100%;
    width: 200px;
    height: auto; */
}

.filebox.bs3-primary label {
  color: #fff;
  background-color: #337ab7;
    border-color: #2e6da4;
}



/*///////////////////// map_modal_size ///////////////////*/ 
.modal-dialog.modal-map {
  width: 55%;
  height: 55%;
  margin: 0;
  padding: 0;
  display: inline-block; 
  text-align: left; 
  vertical-align: middle; 
    left: 20%;

}


/* Button-dy css  */
.btn-dy {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 10%;
  font-family:TYPO_JEONGJOL;
  color: #545454;
  font-size: 16px;
  background: #ffffff;
  padding: 6px 20px 6px 20px;
  text-decoration: none;
}

.btn-dy:hover {
  background: #545454;
  text-decoration: none;
  color:#ffffff;
  opacity:0.8;
}


/* Button-dy css - listFriendRecommendation */
.btn-dy2 {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 23px;
  font-family:JEJUGOTHIC;
  color: #545454;
  font-size: 15px;
  background: #ffffff;
  padding: 10px 15px 10px 15px;
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

/* Button-dy css - listFriendRecommendation */
.btn-dy3 {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 23px;
  font-family:JEJUGOTHIC;
  color: #ffffff;
  font-size: 0.7vw;
  background: #C2C2C2;
  padding: 8px 13px 8px 13px;
  text-decoration: none;
}

.btn-dy3:hover {
  background: rgba(255, 0, 0, 0.4);
  opacity: 0.7;
  text-decoration: none;
  color:#3B3B3B;
}

/* Button-dy css - listFriendRecommendation */
.btn-dy4 {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 23px;
  font-family:JEJUGOTHIC;
  color: #ffffff;
  font-size: 12px;
  background: #56B1BF;
  padding: 8px 13px 8px 13px;
  border: solid #56B1BF 0px;
  text-decoration: none;
}

.btn-dy4:hover {
  background: #56B1BF;
  opacity: 0.8;
  border: solid #56B1BF 0px;
  text-decoration: none;
  color:#ffffff;
}

/* floating top button<START>  */
   		.top {
        position: fixed;
        left: 75%;
        bottom: 3%;
   	   	background: transparent;
      	color:transparent;
      }
      
        div.top2 {
        position: fixed;
        left: 36.63%;
        bottom: 1%;
        width: 5vw;
   	   	height: 2vw;
   	   	background: rgba(255, 0, 0, 0.6);
  		color: #ffffff;
      	text-align: center;
      	border-radius: 23px;
      	 min-width: 70px;
        min-height:30px;
      	
      }
      
           
        div.top3 {
        position: fixed;
        left: 42.03%;
        bottom: 1%;
        width: 5vw;
   	   	height: 2vw;
   	   background: rgba(255, 0, 0, 0.6);
  		color: #ffffff;
      	text-align: center;
      	border-radius: 23px;
      	 min-width: 70px;
        min-height:30px;
      }
      
           
        div.top4 {
        position: fixed;
        left: 47.43%;
        bottom: 1%;
        width: 5vw;
   	   	height: 2vw;
   	   background: rgba(255, 0, 0, 0.6);
      	color: #ffffff;
      	text-align: center;
      	border-radius: 23px;
      	 min-width: 70px;
        min-height:30px;
      }
      
           
        div.top5 {
        position: fixed;
        left: 52.83%;
        bottom: 1%;
        width: 5vw;
   	   	height: 2vw;
   	   	background: rgba(255, 0, 0, 0.6);
      	color: #ffffff;
      	text-align: center;
      	border-radius: 23px;
         min-width: 70px;
        min-height:30px;
      }
           
        div.top6 {
        position: fixed;
        left: 58.23%;
        bottom: 1%;
        width: 5vw;
   	   	height: 2vw;
   	   	background:rgba(255, 0, 0, 0.6);
      	color: #ffffff;
      	text-align: center;
      	border-radius: 23px;
        text-align: center;
        vertical-align: middle;
        min-width: 70px;
        min-height:30px;
        
      }
      
/* floating top button<END>  */      

</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<!-- 스크립트 -->
<script type="text/javascript">
			 
	 $(function() {
			$(".dayClick:contains('DAY')").bind("click",function() {
				var index = $(".dayClick:contains('DAY')").index(this);
				var dailyPlanNo = $($("input[name='dailyPlanNo']")[index]).val();
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/dailyplan/getDailyPlan?dailyPlanNo="+dailyPlanNo+"&mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			});
		 })
</script>

<script type="text/javascript">
		/////////////////////////이미지 제목 노출///////////////////////////
		
		
		$("#addImage").ready(function(){
			   var fileTarget = $('.filebox .upload-hidden');

			    fileTarget.on('change', function(){
			        if(window.FileReader){
			            // 파일명 추출
			            var filename = $(this)[0].files[0].name;
			        } 

			        else {
			            // Old IE 파일명 추출
			            var filename = $(this).val().split('/').pop().split('\\').pop();
			        };

			        $(this).siblings('.upload-name').val(filename);
			    });

			    //preview image 
			    var imgTarget = $('.preview-image .upload-hidden');

			    imgTarget.on('change', function(){
			        var parent = $(this).parent();
			        parent.children('.upload-display').remove();

			        if(window.FileReader){
			            //image 파일만
			            if (!$(this)[0].files[0].type.match(/image\//)) return;
			            
			            var reader = new FileReader();
			            reader.onload = function(e){
			                var src = e.target.result;
			                parent.prepend('<div class="upload-display col-sm-4 col-sm-offset-4"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb" style=" width:200px; height:auto"></div></div><br/>');
			            }
			            reader.readAsDataURL($(this)[0].files[0]);
			        }

			        else {
			            $(this)[0].select();
			            $(this)[0].blur();
			            var imgSrc = document.selection.createRange().text;
			            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

			            var img = $(this).siblings('.upload-display').find('img');
			            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
			        }
			    });
			});

	/////////////////////////이미지 추가 버튼 클릭했을 때 작동///////////////////////////

	$(function() {
		$("button[name=add]").on("click",function() {
					$("form[name=form]").attr("method", "POST").attr("enctype","multipart/form-data").attr("action",	"/dailyplan/addImage").submit();
			});
	});
	
	/////////////////////////친구 추천 받는 부분///////////////////////////
	$(function() {
	
		$("#friendRecButton").bind("click",function() {
			var dailyPlanNo = "${dailyPlan.dailyPlanNo}";
			var user;
			var result ="";
			 $.ajax({
	    				url:"/dailyplan/json/listFriendRec?dailyPlanNo="+dailyPlanNo,
	    				method:"GET",	    					
	    				dataType:"json",
	    				headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
	    				success:function(JSONData){
	    					user = JSONData.userList;
		    					for(var i=0;i<user.length;i++){
		    						result +='<div class="col-sm-3 col-sm-offset-1" ><img src="/resources/images/userimages/'+user[i].userImage+'" style="width: 50px; height: 50px;" class="media-photo"></div>'
    								+'<div class="col-sm-3 "  style="padding-top: 8px;" >'+user[i].userName+'</div>'
    								+'<div class="col-sm-2 "  style="padding-top: 8px;" >'+user[i].userGender+'</div>'
    								+'<button type="button" id="addToMyFriendList'+i+'" class="btn-dy2" onclick="addFriend('+user[i].userNo+','+i+')">친구추가</button><p>&nbsp;</p>';
		    					}
		    				 $('#friendListForRec').html(result);
		    				 $('#friendRec').modal('show'); 
	    					},error: function(){
	    					    swal("선택하신 날짜에 같은 나라로 떠나는 친구들이 없네요. \n그래도 슬퍼하지 말아요\n 트위챗에서는 찾을 수 있지 않을까요? \n\nGOOD LUCK!");
	    					  }
	    					
			    });
		});
	 });
	 
	function addFriend(userNo,i) {
			$.ajax({
	            url:'/dailyplan/json/addFriend?userNo='+userNo,
	            type:'get'
	         });
			 swal("친구로 추가 되었습니다.");
	   var a = "#addToMyFriendList" + i;
	    $("#addToMyFriendList"+i).attr('disabled','true'); 
	   
	}
	
/////////////////////////서비스 기능 구현///////////////////////////
	$(function() {
		$("#service").on("click",function() {
			$("#serviceModal").modal('show'); 
		});
	});
	
	
	
	/////////////////////////수정 및 삭제를 위한 hover기능 구현///////////////////////////
	
	
	$(function() {
		$("div[name=editedit]").on("click",function() {
			if($("#deleteAllAll").val() == 'flag'){
				$(".deleteButtons").remove();
				$(".deleteButtons2").remove();
			}else{
				$("#deleteAllButton").append('<div class="deleteButtons"><a class="btn btn-success" role="button" onclick="deleteAllButton()">전체삭제</a><input id="deleteAllAll" type="hidden" value="flag"></div>');
				var lastIndexNo = $("#lastIndex").val();
				 for(var i=1;i<lastIndexNo+2;i++){
					 var contentNo = $("#contentsNo"+i).val();
					 var result = '<div class="deleteButtons2"><a class="btn btn-primary" role="button" id="deleteButton'+i+'" onclick="deleteContent('+contentNo+','+i+')"> delete </a></div>';
	 			$("#here"+(i-1)).append(result); 
	 			}
			}
		});
	 });
	
	 function deleteContent(contentNo,i) { // db에 콘텐츠 내용 삭제하고 버튼 및 내용 삭제 수정 
		$.ajax({
            url:'/dailyplan/json/deleteContent?contentNo='+contentNo,
            type:'get'
         });
		 $("#here"+(i-1)).remove();  //삭제 버튼 삭제 
		 $("#contentsBoxNo"+i).remove(); //내용전체삭제 
	}
	 
	 
	 function deleteAllButton(){
		 
		 var dailyPlanNo = $("#idDailyPlanNo").val();
		 swal({
			 title: "전체삭제 하시겠습니까?",
			 icon: "warning",
			 buttons: true,
			 dangerMode: true,
		 }).then( (willDelete) => {
			 $.ajax({
		            url:'/dailyplan/json/deleteAllContent?dailyPlanNo='+dailyPlanNo,
		            type:'get'
		         });
			 $("#PlanContentList").remove();	 
		 });//END swal
		 
	 }
	 

	$(function() {
		$("#addRouteButton").on("click",function() {
			var url = "/dailyplan/addRouteBefore?dailyPlanNo="+${dailyPlan.dailyPlanNo}+"&mainPlanNo="+${dailyPlan.mainPlan.mainPlanNo};
			$(location).attr('href', url);
				});
	});
	
	/////////////////////////글씨 크기 조절 기능 구현///////////////////////////
/* 	$(function() {
		$(".contentsTxt").hover(function() {
			var index = $(".contentsTxt").index(this);
			alert(index);
			$("#txtSize").append('<input type="button" value="크게">');
		});
	}); */
	
	/*  $(function() {
			$("button:contains('선택')").bind("click",function() {
				var index = $("button:contains('선택')").index(this);
				var mainPlanNo = $($("input[name='mainPlanNo']")[index]).val();
				var url = "/dailyplan/listDailyPlan?mainPlanNo="+mainPlanNo;
				$(location).attr('href', url);
			}); */
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
<script>
/////////////////////////PDF 기능 구현///////////////////////////
$(function() {
	
	$("#saveAsPDF").on("click" , function() {
		 	 var doc = new jsPDF();
			 var specialElementHandlers = { 
			    ".top_con_zone": function (element, renderer) { 
			        return true; 
			    }
			} 	
	
			html2canvas($(".top_con_zone"),{
				background :'#FFFFFF',
			    useCORS: true,
			    allowTaint: true,
			    page: this,
			    onclone: function(doc){
			    	
                },
			    onrendered:function(canvas){
			    	
			        var imgData = canvas.toDataURL('image/jpeg');
			        var doc = new jsPDF('p', 'mm');
			         doc.text(20, 20, 'Hello world!'); 
			    	doc.text(20, 30, 'This is client-side Javascript, pumping out a PDF.');
			    	doc.addPage();  
			    	doc.addImage(imgData, 'JPEG',8, 8, 90, 95);
			        doc.save('test.pdf');
			    }
			}); 
		
		         
		});
			
	
	});
</script>

<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "280px";
			document.getElementById("main").style.marginLeft = "280px";
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
		
		$(function() {
			$("#contentList").on("click",function() {
				var url = "/dailyplan/listDailyPlan?mainPlanNo="+${dailyPlan.mainPlan.mainPlanNo};
				$(location).attr('href', url);
			});
		});
		
		
		$(function() {
			$("#select").on("click",function(){
				$("#select").hide();				
				$("#countryButtonGroup").show();
				$("input.countrySelectButton").show();
				
			});
			
			$("input[name='countrySelectButton']").on('click',function() {
				var target = $( event.target );	
				
				$.ajax( 
						{
						url : "/dailyplan/json/selectCountryNew",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify({
							dailyPlanNo : ${dailyPlan.dailyPlanNo},
							dailyCountry : target.val()
						}),
						success : function(JSONData) {
							//alert(JSON.stringify(JSONData));
							//alert(JSON.stringify(JSONData.dailyCountry));
							$("p.getCountry").empty();
							$("p.getCountry").append(JSONData.dailyCountry);
						}
				});			
				//$("p.getCountry").append(target.val()+"  ");
				target.hide();
			});
			
			$("div.get").on("click",function(){
				
				$.ajax( 
						{
						url : "/dailyplan/json/resetCountry",
						method : "GET" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : { dailyPlanNo : ${dailyPlan.dailyPlanNo}	},success : function(JSONData) {
						}
				});	
			
				$("p.getCountry").empty();
				$("p.getCity").empty();
				
				$("#countryButtonGroup").show();
				$("input[name=countrySelectButton]").show();
				
			});
			
			$("input[name=SelectButton]").on("click",function(){
				var cityName="";
				for(var i=0; i<$(".cityList").index($(".cityList").last())+1; i++){
					
					if(i==$(".cityList").index($(".cityList").last())){
						cityName += $($(".cityList")[i]).val();				
					}else{
						cityName += $($(".cityList")[i]).val()+",";
					}
					
				}
				//$("input[name='cityList']").val();
				$.ajax( 
						{
						url : "/dailyplan/json/selectCity",
						method : "POST" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify({
							"dailyPlanNo" : ${dailyPlan.dailyPlanNo},
							"dailyCity" : cityName
						}),
						success : function(JSONData) {
							//alert(JSON.stringify(JSONData));				
						}
				});		
				$("p.getCity").append(cityName);
				
				$("#countryButtonGroup").hide();
				$("input[name=countrySelectButton]").hide();
				
				$.ajax( 
						{
						url : "/dailyplan/json/getDailyCountry",
						method : "GET" ,
						dataType : "json" ,
						contentType:"application/json;charset=UTF-8",
						data : {
							dailyPlanNo : ${dailyPlan.dailyPlanNo}							
						},
						success : function(JSONData) {
							//alert(JSON.stringify(JSONData));
							if(JSONData){
								$("#select").show();
							}
						}
				});	
			});
		});
		
		$(function(){
			$.ajax( 
					{
					url : "/dailyplan/json/getDailyCountry",
					method : "GET" ,
					dataType : "json" ,
					contentType:"application/json;charset=UTF-8",
					data : {
						dailyPlanNo : ${dailyPlan.dailyPlanNo}							
					},
					success : function(JSONData) {
						//alert(JSON.stringify(JSONData));
						if(JSONData){
							$("#select").show();
						}
					}
			});				
		
		});
		
		/* $(document).on('change',"input[name='cityList']",function() {
			var target = $( event.target );				
					
			$("p.getCity").append(target.val()+"  ");
			
		});	 */	
		

	var i = 1;
	$(function() {

		$("#addCity").on("click",function() {
			
			if (i == 1) {$("#removeCity").attr("disabled", false);
			i++;		
			$("div[name=addCity]").append($('<input  type="text" id="city'+i+'" name="cityList" style="position: absoloute" class="cityList form-control input-md contents" >'));
			}
			else if (i > 4) {//alert("2");
			$("#addCity").attr("disabled", true);
			}
			else if(i==4){
				i++;
				$("#addCity").attr("disabled", true);
				$("div[name=addCity]").append($('<input  type="text" id="city'+i+'" name="cityList" style="position: absoloute" class="cityList form-control input-md contents" >'));
			}
			else{
				i++;
				$("#removeCity").attr("disabled", false);
				$("div[name=addCity]").append($('<input  type="text" id="city'+i+'" name="cityList" style="position: absoloute" class="cityList form-control input-md contents" >'));
			}
			
		});

		$(function() {

			$("#removeCity").on("click", function() {
				if (i > 2) {
					//alert("11");
					$("#addCity").attr("disabled", false);
					$('#city' + i).remove();
					i--;
				} else if (i == 2) {
					//alert("22");
					$("#removeCity").attr("disabled", true);
					$('#city' + i).remove();
					i--;
				}

			});
		});
	});
	
	
	

	$(function() {	
				
		 $("#search").on("click" , function() {
				
				var standardCountry = $("#standardCountryValue").val();
				var compareCountry = $("#compareCountryValue").val();
				var inputPrice = $("#standard").val();
				event.preventDefault();
				
					$.ajax( 
							{
								url : "/information/json/getCurrency/" ,
								method : "POST" ,
								data : {
									"standardCountry" : standardCountry,
									"compareCountry" : compareCountry,
									"inputPrice" : inputPrice
								},
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
	
									$( "#compare" ).val(JSONData);
								},
								error : function(JSONData , status) {
									swal("에러가 발생했습니다. 다시 시도해주시기 바랍니다.");
								}
				});
			
			}); 
	 
	});	
	
	
///////////////////////////CURRENCY///////////////////////////////////////////////////////
$(function() {
	
	 $("#currencyToMyPlan").on("click",function(){
		
		var resultCurrency= $("#compare").val();
		var dailyPlanNo = "${dailyPlan.dailyPlanNo}";
		var standardCountry = $("#standardCountryValue").val();
		var compareCountry = $("#compareCountryValue").val();
		var inputPrice = $("#standard").val();
		
		var standardCountryEnc= encodeURI(encodeURIComponent(standardCountry));
		var compareCountryEnc= encodeURI(encodeURIComponent(compareCountry));
		 
		 $.ajax({
	            url:'/dailyplan/json/addTextContent?standardCountryEnc='+standardCountryEnc+'&compareCountryEnc='+compareCountryEnc+"&inputPrice="+inputPrice+"&resultCurrency="+resultCurrency+"&dailyPlanNo="+dailyPlanNo,
	            type:'get'
	         });
			
		 swal("Good job!", "환율 등록 완료!", "success");
		 
		 });
	});	

///////////////////////////TRANSLATION//////////////////////////////////////////////////////

	$(function() {
		
		$("#papa").on("click",function(){
			$.ajax({
				url : "/dailyplan/json/papagoTranslate",
				method : "POST",
				data : JSON.stringify({
					translate : $("#translate").val(),
					papagoCompareCountry : $("#papagoCompareCountry").val(),
					papagoMyCountry : $("#papagoMyCountry").val()
				}),
				
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType : "json",
				headers : {
					"Accept" : "application/json;charset=UTF-8",
					"Content-Type" : "application/json;charset=UTF-8"
				},
				success : function(JSONData,status){
					
					var displayValue = JSONData.message.result.translatedText;
					
					$("#result").val(displayValue);
					$("#resultPapago").val(displayValue);
					
				}
			})
		});
	});
	
	
$(function() {
	
	 $("#translationToMyPlan").on("click",function(){
		
		 var dailyPlanNo = "${dailyPlan.dailyPlanNo}";
		 var compare = $("#resultPapago").attr('value');
		 
			$.ajax({
				url : "/dailyplan/json/addTextContentPapago",
				method : "POST",
				data : JSON.stringify({
					translate : $("#translate").val(),
					papagoCompareCountry : $("#papagoCompareCountry").val(),
					papagoMyCountry : $("#papagoMyCountry").val(),
					compare : compare,
					dailyPlanNo : dailyPlanNo
				}),		
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType : "json",
				headers : {
					"Accept" : "application/json;charset=UTF-8",
					"Content-Type" : "application/json;charset=UTF-8"
				}
			})
	  
		 swal("Good job!", "번역 등록 완료!", "success");
		 
		 });
	});		


$( function() {
    $( window ).scroll( function() {
      if ( $( this ).scrollTop() > -1 ) {
        $( '.top' ).fadeIn();
        $( '.top2' ).fadeIn();
        $( '.top3' ).fadeIn();
        $( '.top4' ).fadeIn();
        $( '.top5' ).fadeIn();
        $( '.top6' ).fadeIn();
        
      } else {
        $( '.top' ).fadeOut();
        $( '.top2' ).fadeOut();
        $( '.top3' ).fadeOut();
        $( '.top4' ).fadeOut();
        $( '.top5' ).fadeOut();
        $( '.top6' ).fadeOut();
      }
    } );
    $( '.top' ).click( function() {
      $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
      return false;
    } );
    
  } );
  
	
	
</script>

</head>
<body id="mainBody">
	
	
	
	<!-- ----------------------------------- -->


	<div id="mySidenav" class="sidenav" style="font-family:'JEJUMYEONGJO';">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<div class="col-xs-12" align="center" style="margin-bottom: 4em; ">
				<h2><strong>Contents</strong></h2><br/><br/>				 
				<c:if test="${empty user.userImage}"><img src="/resources/images/dailyPlanContent/seojun.jpg" width="60px" height="60px" style="border-radius: 5%;"></c:if>
				<c:if test="${!empty user.userImage}">
				<img src="/resources/images/userimages/${user.userImage}" width="60px" height="60px" style="border-radius: 5%;">
				</c:if>
				<c:forEach var="listUser" items="${listForMainPlanShared}">
					<c:if test=" ${empty listUser.userImage}"><img src="/resources/images/dailyPlanContent/yumi.jpg" width="60px" height="60px" style="border-radius: 5%;"></c:if>
					<c:if test="${!empty listUser.userImage}">
					<img src="/resources/images/userimages/${listUser.userImage}" width="60px" height="60px" style="border-radius: 5%;">
					</c:if>					
				</c:forEach>
				<h5> Writer :  ${dailyPlan.user.userName}
				<c:forEach var="listUser" items="${listForMainPlanShared}">
					& ${listUser.userName}
				</c:forEach>
				</h5>
				
			</div>
			
			<div class="col-xs-12" style="background:transparent;">
		<c:set var="i" value="0" />
			<h5 align="right" id="contentList">크게보기</h5>
		<c:forEach var="dailyPlan" items="${listDailyPlan}">
			<c:set var="i" value="${ i+1 }" />
			<input type="hidden" name="dailyPlanNo" value="${dailyPlan.dailyPlanNo}" />
			<input type="hidden" name="mainPlanNo" value="${dailyPlan.mainPlan.mainPlanNo}" />
			<div class="col-xs-12 contentsBox dayClick" id="contentsBox" name="contentsBox" style="border-radius: 10%;">
				
				<div class="col-xs-4 contents " name="contents" align="left">
					<h4>DAY${ i }</h4>
				</div>
				<div class="col-xs-8 contents " name="contents" align="center">
					<h6>${dailyPlan.dailyDate}</h6>
					<h6>${dailyPlan.dailyCountry}</h6>
					<h6>${dailyPlan.dailyCity}</h6>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>

	<div id="main" style="position:fixed; z-index:1000;" id="openSideBar">

		<h2>&nbsp;</h2>
		<p>&nbsp;</p>
		<span style="font-size: 20px; font-family:'JEJUMYEONGJO'; cursor: pointer" onclick="openNav()" >&#9776;
		OPEN</span>
	</div>





	<!-- ----------------------------------- -->

	<div><jsp:include page="/layout/toolbar.jsp" /></div>
	
	
	
	<form class="form-horizontal">
		<div class="container">
			<div class="col-xs-12 inner" id="thumbnailMainBox">
				<div align="center" class="col-xs-1">&nbsp;</div><!-- 그라디언트 보이게 해주려고 한 부분 -->
				<div class="col-xs-12 inner" id="thumbnailMainThumbBox" align="center">
					<div class="col-xs-12" >


					<div class="row" align="center">
					
								
					<!-- -------------TOP<START>--------------- -->
					
						<div style="margin-top:30px;">
							<input type="button" id="friendRecButton" name="friendRecButton" class="btn-dy2" value=" 친구 찾기 " /> 
							<input type="button" id="service" name="service" class="btn-dy2" value="환율 & 번역" /> 
						</div>
						
						<!-- <input type="button" id="saveAsPDF" name="saveAsPDF" class="btn btn-default" value="PDF로 저장하기" /></p> -->
						<p></p>
						<p></p>
						<div class="col-xs-12 innerMain" id="innerMain" align="center">
						<p>DAY ${dailyPlan.day}</p>
						 </div>
						<div class="col-xs-12" style="font-family:'JEJUGOTHIC' !important; font-size:1.1em !important;" align="center">
						<p>${dailyPlan.dailyDate}</p>
						<div class="get"> 
						<p class="getCity">${dailyPlan.dailyCity}</p>
						<p class="getCountry">${dailyPlan.dailyCountry}</p>	
						</div>					
						</div>
						<%-- <c:if test="${empty dailyPlan.dailyCountry }"> --%>
						<div id="select" style="font-family:'JEJUGOTHIC' !important; font-size:1.1em !important; display:none"><p>여행할 국가와 도시를 선택해주세요</p></div>
						<%-- </c:if> --%>
						<div style="display:none"; class="btn-group" role="group" id="countryButtonGroup">
						<c:set var="i" value="0" />
						<div><label class="control-label" for="textinput">여행하고 싶은 국가를 입력해주세요</label> </div>
						<c:forEach var="countryList" items="${countryList}">
						<c:set var="i" value="${i+1}" />
<%-- 						<a class="btn-dy" name="countrySelectButton" id="country${i}" style="font-family:\'JEJUGOTHIC\';" >${countryList}</a>
 --%>					<input type="button" class="btn-dy" name="countrySelectButton" id="country${i}" class="btn btn-default" value="${countryList}" style="font-family:\'JEJUGOTHIC\';"/>
					</c:forEach>
						
						<div name="addCity" style="">
							
							<label class="control-label" for="textinput">여행하고 싶은 도시를 입력해주세요</label> 
							<a class="btn btn-default btn" href="#" role="button" id="addCity" name="addCity">
							<span class="glyphicon glyphicon-plus" aria-hidden="true" style="color:#A6A0A5;"></span></a> 
							<a class="btn btn-default btn" href="#" role="button" id="removeCity" name="removeCity" disabled="true">
							<span class="glyphicon glyphicon-minus" aria-hidden="true" style="color:#A6A0A5;"></span></a>
							<input type="text" id="city1" name="cityList" style="position: absoloute" class="cityList form-control input-md contents">
													
						
							
						
						</div>
						
						<input type="button" class="btn-dy" name="SelectButton" class="btn btn-default" value="확인" style="margin-top:10px;font-family:\'JEJUGOTHIC\';"/>
						
						
						</div>
						<div class="col-xs-12" style="margin-top:130px" align="center">
						<input type="hidden" value="${dailyPlan.dailyPlanNo}" id="idDailyPlanNo" />
						<input type="hidden" value="${dailyPlan.dailyDate}" id="idDailyDate" /> 
						<input type="hidden" value="${dailyPlan.dailyCity}" id="idDailyCity" />
						</div>
						
					</div>

					<!-- -------------TOP<END>--------------- -->




					<!-- ----------CONTENTS<START>----------- -->
					<div class="PlanContentList" id="PlanContentList" align="center" style="font-family:'JEJUGOTHIC' !important; font-size:1.1em !important; font-color: #C2C2C2 !important;">

						<div id="deleteAllButton"></div>

						<c:set var="i" value="0" />
						<c:forEach var="planContent" items="${list}" varStatus="index">
							<!-- <img src="/resources/images/dailyPlanContent/line.png" width="200px" style="opacity: 0.6" height="30px" > -->
							<div id="here${i}"></div>
							<c:if test="${index.last}">
								<input type="hidden" id="lastIndex" value="${i}" />
								<div id="here${i}"></div>
							</c:if>
							<c:set var="i" value="${ i+1 }" />

							<input type="hidden" name="planContentNo" id="contentsNo${i}"
								value="${planContent.contentNo}" />

							<div id="contentsBoxNo${i}" class="realContents">
								
								<c:if test="${!empty planContent.route}">
									<div class="col-sm-offset-3 col-sm-6" style="margin-top:10px;margin-bottom:10px;"><p class="contentsDelete"> ${planContent.route}</p></div>
								</c:if>
								
								<c:if test="${!empty planContent.routeDescription}">
									<p class="contents" align="center" 
									style="font-size:0.7em !important; font-color: #C2C2C2 !important;">
									${planContent.routeDescription}</p>
								</c:if>
								
								<c:if test="${!empty planContent.departureLocation}">
									<p class="contents">출발지 : ${planContent.departureLocation}</p>
								</c:if>

								<c:if test="${!empty planContent.arrivalLocation}">
									<p class="contents" >도착지 : ${planContent.arrivalLocation}</p>
								</c:if>

								<c:if test="${!empty planContent.estimatedTime}">
									<p class="contents">소요시간 : ${planContent.estimatedTime}</p>
								</c:if>
								
								<!-- ---------------------지도정보 <START>-------------------- -->

								<c:if test="${!empty planContent.mapImage}">
									<div class="col-xs-12"  style="margin-top: 20px" align="center">
									<p class="contents">
										<Strong> <img src="/resources/images/dailyPlanContent/map.png" width="40px"> </Strong>
									</p>
									</div>
									<div class="col-xs-6" align="center">
									<p class="contents">
										<img src="${planContent.mapImage}&key=AIzaSyCmTcIdw0uowsiJrs4YNA0lhjLnN8PigjE" name="mapImg" class="contentsDelete" width="300px" style="border-radius: 99%;"
											onclick="javascript:location.href='${planContent.mapUrl}';" /></p>
									</div>
								</c:if>

								<c:if test="${!empty planContent.mapName}">
									<div class="col-xs-6"  style="margin-top:30px ;" align="left">
									<p>&nbsp;</p>
									<p class="contents" style="font-size:1.1em !important; font-color: #C2C2C2 !important;">[${planContent.mapName}]</p>
								</c:if>

								<c:if test="${!empty planContent.mapAddress}">
									<p class="contents" style="font-size:0.9em !important; font-color: #C2C2C2 !important;">ADDRESS : ${planContent.mapAddress}</p>
								</c:if>

								<c:if test="${!empty planContent.mapPhone}">
									<p class="contents" style="font-size:0.9em !important; font-color: #C2C2C2 !important;" >PHONE : ${planContent.mapPhone}</p>
								</c:if>

								<c:if test="${!empty planContent.mapWebsite}">
									<p class="contents" style="font-size:0.9em !important; font-color: #C2C2C2 !important;">WEBSITE: ${planContent.mapWebsite}</p>
								</c:if>
<%-- 
								<c:if test="${!empty planContent.mapType}">
									<p class="contents" style="font-size:0.9em !important; font-color: #C2C2C2 !important;">TYPE : ${planContent.mapType}</p>
									</div>
								<div class="col-xs-12"  style="height: 30px" align="center"></div>
								</c:if> --%>
								<!-- ---------------------지도정보 <END>-------------------- -->
								
								<!--  채팅 일정 픽스 사진  -->
								<c:if test="${planContent.contentType eq 6}">
									<c:if test="${!empty planContent.mapUrl}">
											<div class="col-xs-12" align="center" style="margin-bottom:20px;font-family:'JEJUMYEONGJO';">
											<h3>Your appointment</h3>
											</div>
											<div>
											<p class="contents">
												<img src="${planContent.mapUrl}" name="mapImg" class="contentsDelete" width="300px" style="border-color:#C2C2C2;border-style: solid;border-width: 3px;border-radius: 99%;"
													onclick="javascript:location.href='${planContent.mapUrl}';" /></p>
											</div>
									</c:if>
								</c:if>
								
								<!--  채팅 일정 픽스 사진  -->
								<c:if test="${planContent.contentType eq 7}">

											<div class="col-xs-12" align="center" style="margin-bottom:20px;font-family:'JEJUMYEONGJO';margin-bottom:15px;">
											<h3>Your Tour Reservation</h3>
											</div>
											<div>
											<p class="contents">
												<img src="/resources/images/productThumbnail/${planContent.contentImage}" class="contentsDelete" width="300px" height="300px"
												style="border-color:#3B3B3B;border-style: solid;border-width: 3px;border-radius: 50%;"
													/></p>
											</div>

								</c:if>
								
								<c:if test="${!empty planContent.contentText}">
									<p>
										<div class="col-xs-12" align="center" style="margin-top:20px;font-size:1.1em !important;font-color: #C2C2C2 !important;">
											${planContent.contentText}
											<div id="col-xs-12 txtSize" class="txtSize"></div>
										</div>
									</p>
								</c:if>

								<c:if test="${!empty planContent.contentImage}">
									<c:if test="${! (planContent.contentType eq 7)}">
									<p class="contentsThis">
										<img src="/resources/images/dailyPlanContent/${planContent.contentImage}"
											class="contentsDelete" width="400px" style="border-radius: 5%;"/>
									</p>
									</c:if>
								</c:if>

								<div id="buttonForDelete${i}"></div>
								<div id="buttonForEdit${i}"></div>

								<p class="contents">&nbsp;</p>
								<p class="contents">&nbsp;</p>

							</div>

						</c:forEach>
						
				
						
						
						<div class="col-xs-12" style="margin-top:100px" align="center"></div>
							
						</div>
					</div>
				</div>
				<div align="right" class="col-xs-1">&nbsp;</div>
			</div>
			<!-- 섬네일 전체 박스 부분 -->
			
			<div class="top"><img src="/resources/images/go-to-the-top.png" width="50px"></div>
						
			<div class="top2 btn-dy3" data-toggle="modal" data-target="#addText" style="padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;font-family:'JEJUGOTHIC';">
			<img src="/resources/images/icon/edit_icon.png" width="20px">&nbsp;문장</div>
			
			<div class="top3 btn-dy3" data-toggle="modal" data-target="#addImage" style="padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;font-family:'JEJUGOTHIC';">
			<img src="/resources/images/icon/image.png" width="20px">&nbsp;사진</div>
			
			<div class="top4 btn-dy3" data-toggle="modal" data-target="#addMap" style="padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;font-family:'JEJUGOTHIC';">
			<img src="/resources/images/icon/pin.png" width="20px">&nbsp;지도</div>
			
			<div class="top5 btn-dy3" id="addRouteButton" style="padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;font-family:'JEJUGOTHIC';">
			<img src="/resources/images/icon/route-Icon.png" width="20px">&nbsp;길찾기</div>
			
		
			<div class="top6 btn-dy3" name="editedit" style="padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;font-family:'JEJUGOTHIC';">
			<img src="/resources/images/icon/eraser.png" width="20px">&nbsp;편집</div>
			
		<!-- -------Floating Button<START>----------- -->

<!-- 	<div id="container-floating" style="font-family:'JEJUGOTHIC'; ">
	
	  <div class="nd6 nds" class="btn" id="fixedbtn"  >
	  <p class="letter">&nbsp;&nbsp;&nbsp;&nbsp;<strong>편집</strong></p>
	  </div>
	  
	  <div class="nd5 nds" class="btn" id="addRouteButton" >
	  <p class="letter"><strong>길찾기</strong></p>
	  </div>
	  <div class="nd4 nds" data-toggle="modal" data-target="#addMap"  >
	    <p class="letter"><strong>지도</strong></p>
	  </div>
	  <div class="nd3 nds" data-toggle="modal" data-target="#addImage" >
	   <p class="letter"><strong>사진</strong></p>
	  </div>
	  <div class="nd1 nds" data-toggle="modal" data-target="#addText"  >
	    <p class="letter"><strong>글</strong></p>
	  </div>
	
	  <div id="floating-button" data-toggle="tooltip" data-placement="left" data-original-title="Create" onclick="newmail()">
	    <p class="plus">+</p>
	  </div>
	
	</div> -->

	<!-- -------Floating Button<END>----------- -->	

	</form>

	<!-- ----------CONTENTS<END>----------- -->

	
	
	<!---------- Map Dialog ------------->
		<div class="modal fade" id="addMap" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content" style="font-family:'JEJUGOTHIC';"> 
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<Strong>지도</Strong>
					</h4>
				</div>
				<div class="modal-body" align="center">
					<jsp:include page="/dailyplan/addMap.jsp" flush="false">
						<jsp:param name="data" value="${dailyPlan.dailyPlanNo}" />
						<jsp:param name="mainPlanNo" value="${dailyPlan.mainPlan.mainPlanNo}" />
					</jsp:include>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
				</div>
			</div>
		</div>
	</div>
	<!---------- Text Dialog ------------->
	<div class="modal fade" id="addText" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" style="font-family:'JEJUGOTHIC';">
						<Strong>글</Strong>
					</h4>
				</div>
				<div class="modal-body" class="margin-left:30px;">
					<jsp:include page="/dailyplan/addText.jsp" flush="true">
						<jsp:param name="data" value="${dailyPlan.dailyPlanNo}" />
						<jsp:param name="mainPlanNo" value="${dailyPlan.mainPlan.mainPlanNo}" />
					</jsp:include>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<!---------- Image Dialog ------------->


		<div class="modal fade" id="addImage" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" style="font-family:'JEJUGOTHIC';">
						<Strong>사진</Strong>
					</h4>
				</div>

				<div class="modal-body col-sm-12">
				
						<form name="form" enctype="multipart/form-data">
							<div class="form-group">	
									<div class="filebox bs3-primary preview-image">
			                            <input class="upload-name col-sm-4 col-sm-offset-3"  value="파일선택" disabled="disabled" style="width: 200px;">
			                            <label for="input_file" class="col-sm-2 col-offset-4" style="font-family:'JEJUGOTHIC';">사진 선택</label> 
			                          <input type="file" id="input_file" name="uploadFile" class="upload-hidden"> 
	                       			</div>
							</div>
							<br/>
							<input type="hidden" name="dailyPlanNo" value="${dailyPlan.dailyPlanNo}" />
							<input type="hidden" name="mainPlanNo" value="${dailyPlan.mainPlan.mainPlanNo}" />
							<button name="add" class="btn btn-default btn-sm col-sm-2 col-sm-offset-5 text-center" type="button">ADD</button>
						</form>
						<br/>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!---------- FriendRec Dialog <START>------------->

		<div class="modal fade" id="friendRec" role="dialog" style="font-family: 'Jeju Gothic', serif;">
		<div class="modal-dialog modal-md">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="background-image: url('/resources/images/dailyPlanContent/bf2.jpg'); opcity:0.8;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" align="center" style="font-family:'JEJUGOTHIC';margin-top:50px; margin-bottom:50px; color:#ffffff;">
							<Strong>나와 같은 곳, 같은 날짜에 </br> 떠나는 친구들을 만나보면 어떨까요?</Strong>
						</h4>
				</div>
				<div class="modal-body col-sm-12" align="center" style="padding-top: 10px;">
							<table class="table table-filter" style="align-content: center;">
								<tbody>
										<tr data-status="pagado">
										<div class="media-body">
										  <td align="left" vailgn="middle">
											  <div class="row" >
											  	<div id="friendListForRec"></div>
											  </div>
										 	 </td>
										  </div>
										</tr>
								</tbody>
							</table>
						
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	

	<!---------- FriendRec Dialog <END>------------->
	
		<!---------- customized Dialog <START>------------->

		<div class="modal fade" id="serviceModal" role="dialog" style="font-family: 'Jeju Gothic', serif;">
		<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="background-image: url('/resources/images/dailyPlanContent/currency.jpg'); opcity:0.8; ">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" align="center" style="font-family:'JEJUGOTHIC';margin-top:50px; margin-bottom:50px; color:#ffffff;">
							<Strong>환율 & 번역</Strong>
						</h4>
				</div>
				<div class="modal-body col-sm-12" align="center" style="padding-top: 10px;">
							<table class="table table-filter" style="align-content: center;">
								<tbody>
										<tr data-status="pagado">
										  <div class="media-body">
										 
				<form class="form-horizontal">
				<div class="col-sm-12">
					<div class="form-group">
						<div class="col-sm-8 col-sm-offset-2" style="margin-top:10px;margin-bottom:10px;" align="center">
								<img src="/resources/images/money-bag.png" width="50px"/><h3>환율 검색</h3>
						</div>
						<div class="col-sm-8 col-sm-offset-2" id="standardCountry">
								
							    <select class="form-control" id="standardCountryValue" >
							    <!-- <option value="0">나라를 선택해주세요</option> -->
									<c:set var="i" value="0" />
					 				 <c:forEach var="currency" items="${returnList}">
					 				 <option value="${currency.cur_nm}" >
					 				 ${currency.cur_nm}
					 				  </option>
					 				 </c:forEach>
								</select>
								
							</div>
							<div class="col-sm-4 col-sm-offset-4">
					    	</div>
					    <div class="col-sm-8 col-sm-offset-2">
					      <input type="text" class="form-control" id="standard" name="standard"  >
					    </div>
					 </div>
					 
						<div class="form-group">
							     <div class="col-sm-offset-4  col-sm-4 text-center">
							      <button class="btn btn-default" id="search" >계 &nbsp;산</button>
							  	</div>
						</div>
					  
					 <div class="form-group">
					    <div class="col-sm-8 col-sm-offset-2" id="compareCountry">
							    <select class="form-control"  id="compareCountryValue" >
							   <!-- <option value="0">나라를 선택해주세요</option> -->
									<c:set var="i" value="0" />
					 				 <c:forEach var="currency" items="${returnList}">
					 				 <option value="${currency.cur_nm}">
					 				 ${currency.cur_nm}
					 				  </option>
					 				 </c:forEach>
								</select>
							</div>
							<div class="col-sm-4 col-sm-offset-4">
					    	</div>
					    <div class="col-sm-8 col-sm-offset-2">
					      <input type="text" class="form-control" id="compare" name="compare" readOnly="true">
					    </div>
					    
					    <div class="col-sm-8 col-sm-offset-2" style="margin-top:10px;margin-bottom:10px;">
								<a type="button" id="currencyToMyPlan" class="btn-dy3">내 플랜에 저장</a>
						 </div>
							
					 </div>
					
					</div>
				</form>




									<form>
										<div class="col-sm-8 col-sm-offset-2" style="margin-top: 10px; margin-bottom: 10px;" align="center">
											<img src="/resources/images/translate.png" width="50px" />
											<h3>번역 검색</h3>
										</div>

										<div class="col-sm-8 col-sm-offset-2">
											<select class="form-control" name="papagoMyCountry" id="papagoMyCountry">
												<!-- 1.ko : 한국어
												2.en : 영어
												3.zh-CN : 중국어 간체
												4.zh-TW : 중국어 번체
												5.es : 스페인어
												6.fr : 프랑스어
												7.vi : 베트남어
												8.th : 태국어
												9.id : 인도네시아어 -->
											<option value="ko">한국어</option>
												<option value="en">영어</option>
												<option value="zh-CN">중국어 간체</option>
												<option value="zh-TW">중국어 번체</option>
												<option value="es">스페인어</option>
												<option value="fr">프랑스어</option>
												<option value="vi">베트남어</option>
												<option value="th">태국어</option>
												<option value="id">인도네시아어</option>	
											</select>
										</div>
										
										<div class="col-sm-8 col-sm-offset-2" style="margin-bottom:20px;">
											<input type="text" class="form-control" id="translate" name="translate">
										</div>

									

										<div class="col-sm-8 col-sm-offset-2" style="margin-bottom:10px;">
										    <a type="button" id="papa" class="btn btn-default">번&nbsp;역</a>
									   </div>

										
							
										
										<div class="col-sm-8 col-sm-offset-2">
											<select class="form-control" name="papagoCompareCountry" id="papagoCompareCountry">
									
												<option value="ko">한국어</option>
												<option value="en" selected>영어</option>
												<option value="zh-CN">중국어 간체</option>
												<option value="zh-TW">중국어 번체</option>
												<option value="es">스페인어</option>
												<option value="fr">프랑스어</option>
												<option value="vi">베트남어</option>
												<option value="th">태국어</option>
												<option value="id">인도네시아어</option>		
											</select>
										</div>
										
										<div class="col-sm-8 col-sm-offset-2" >
											<input type="text" class="form-control" name="result" id="result" value="" readonly>
											<input type="hidden" id="resultPapago" value="a">
										</div>
										
										  <div class="col-sm-8 col-sm-offset-2" style="margin-top:10px;margin-bottom:10px;">
												<a type="button" id="translationToMyPlan" class="btn-dy3">내 플랜에 저장</a>
										 </div>
						 
									</form>






								</div>
										</tr>
								</tbody>
							</table>
						
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:window.location.reload()">Close</button>
				</div>
			</div>
		</div>
	</div>
	

	<!---------- customized Dialog <END>------------->
	
</body>



</html>
