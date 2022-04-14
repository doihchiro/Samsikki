<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SAMSIKKI : 자체제작 디자인 테이블웨어</title>
	<script src="/resources/js/jquery-3.6.0.js"></script>

	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>

  	<%@ include file="../include/topInclude.jsp" %>

	
	<script>
		function QnAreplyList() {
			
         	var brdNum = ${view.brdNum};
         	$.getJSON("/shop/QnADetail/QnAreplyList" + "?brdNum=" + brdNum, function(data){
            	var str="";
            	
            	$(data).each(function(){
               		console.log(data);
               		
               		var repDate = new Date(this.repDate);
               		repDate = repDate.toLocaleDateString("ko-US")
               		
               		str += "<li data-repNum='" + this.repNum + "'>"
                  		+ "<div class='userInfo'>"
	                  	+ "<span class='userName'>" + this.userName + "</span>"
	                  	+ "<span class='date'>" + repDate + "</span>"
                  		+ "</div>"
                  		+ "<div class='replyContent'>" + this.repCon + "</div>"
                  		
                  		+ "<c:if test = '${member != null}'>"
                  		
	                   	+ "<div class='replyFooter'>"
		                + "<button type='button' class='modify' data-repNum='" + this.repNum +"'>수정</button>"
		                + "<button type='button' class='delete' data-repNum='" + this.repNum +"'>삭제</button>"
	                   	+ "</div>"
              			
                  		+ "</c:if>"
                  		
                  		+ "</li>";
            	});
            	
            	$("section.replyList ol").html(str);
         	});
         
      	}
    </script>
    
	<style>
	h5{
		text-align: center;
		margin: 150px 0 80px 0;
	}
	
	/* 답변영역 */
	#repCon{
		width: 805px;
		height: 100px;
		margin-left: 195px;
		background: rgba(0,0,0,0.03);
	}
	
	/* 답변완료버튼 */
	.bt{
		text-align: right;
		padding-right: 140px;
	}
	#QnAreply_btn{
		border: 1px solid #000;
		background:#E3E3E3;
		transition: background .3s ease-in-out;
	}
	#QnAreply_btn:hover{
		background:#F5F5F5;
		transition: background .3s ease-in-out;
	}
	
	.but{
		text-align: right;
		padding-right: 155px;
	}
	
	.but > button{
		padding:  5px 10px;
		marin: 0 5px;
		
		background:#E3E3E3;
		color:#000;
		transition: background .3s ease-in-out;
	}
	.but > button:hover{
		padding:  5px 10px;
		marin: 0 5px;
		
		background:#F5F5F5;
		transition: background .3s ease-in-out;
	}
	
	input{
		height: 35px;
		width: 805px;
		padding: 0 5px;
		background: rgba(0,0,0,0.03);
		cursor: not-allowed
	}
	
	p{
		text-align: center;
		margin: 10px 0;
	}
	a:hover{
		font-weight: bolder;
		text-decoration:none;
	}
	
	div.replyFooter button { font-size:13px; border: 1px solid #000; background:none; padding:2px 5px; margin-right:5px; }
	
	div.replyFooter button.modify {
		background: #E3E3E3;
		color: #000;
		transition: background .3s ease-in-out;
	}
	div.replyFooter button.modify:hover {
		background: #F5F5F5;
		transition: background .3s ease-in-out;
	}
	div.replyFooter button.delete {
		background: #E3E3E3;
		color: #000;
		transition: background .3s ease-in-out;
	}
	div.replyFooter button.delete:hover {
		background: #F5F5F5;
		transition: background .3s ease-in-out;
	}
	</style>
	
	<style>
	textarea{
		border:1px solid #000;
	}
	
	section.replyForm { padding:30px 0; }
	section.replyForm div.input_area { margin:10px 0; }
	section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:100px; }
	section.replyForm button { font-size:15px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
	
	section.replyList { margin:0 150px 0 125px; padding:30px 0; }
	section.replyList ol { padding:0; margin:0; }
	section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
	section.replyList div.userInfo { }
	section.replyList div.userInfo .userName { font-size:15px; font-weight:bold; }
	section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:84%; }
	section.replyList div.replyContent { padding:10px; margin:20px 0 10px 0; }
	section.replyList div.replyFooter { margin-bottom:10px; text-align:right; }
	
	section.replyList div.replyFooter button { font-size:14px; border: 1px solid #000; background:none; margin-right:10px; }
	</style>

	<style>
	div.replyModal { position:relative; z-index:1; display:none; }
	div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
	div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:520px; height:300px; padding:20px 10px; background:#fff; border:2px solid #666; }
	div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
	div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
	div.modalContent button.modal_cancel { margin-left:20px; }
	</style>
</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>	
	</header>
	
	<div class="container">
		<form class="form-horizontal" name ="readForm" method="post">
			<input type="hidden" id="brdNum" name="brdNum" value="${view.brdNum}" />
			<input type="hidden" id="n" name="n" value="${view.gdsNum }" />
	 		<header>
				<h5><b>상세정보</b></h5>
			</header>
			
			<div class="form-group">
				<label class="control-label col-sm-2">제  목</label>
				<div class="col-sm-4">
					<input type="text" name="brd_Title" maxlength="50" value="${view.brd_Title}"  readonly="readonly" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">글쓴이</label>
				<div class="col-sm-3">
					<input type="text" name="userName" maxlength="30" value="${view.userName}"  readonly="readonly" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">작성일자</label>
				<div class="col-sm-3">
					<input type="text" name="repDate" value="<fmt:formatDate value="${view.repDate}" pattern="yyyy년 MM월 dd일"/>"  readonly="readonly" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">내  용</label>
				<div class="col-sm-4">
					<textarea rows="10" cols="116" name="brd_Content" readonly="readonly" style="background:rgba(0,0,0,0.03); padding: 5px; cursor:not-allowed;">${view.brd_Content}</textarea>
				</div>
			</div>
			
			<div class="form-group">
				<div class="but">
					<button type ="button" onclick="location.href='QnAupdateView?brdNum=${view.brdNum}&n=${view.gdsNum}'" >수정</button>
					<button type="button" onclick="location.href='delete?brdNum=${view.brdNum}&n=${view.gdsNum}'" >삭제</button>
				</div>
			</div>
		</form>
		
		<div id ="reply">
			
			<c:if test="${member == null }">
				<p>소감을 남기시려면<a href="/member/signin"> 로그인 </a>해주세요</p>
			</c:if>
			
			<section class="QnAreplyList">
				<script>
					QnAreplyList();
				</script>
				
				<script>
					$(document).on("click", ".modify", function(){
						//$(".replyModal").attr("style", "display:block;");
						$(".replyModal").fadeIn(200);
						
						var repNum = $(this).attr("data-repNum");
						var repCon = $(this).parent().parent().children(".replyContent").text();
						
						$(".modal_repCon").val(repCon);
						$(".modal_modify_btn").attr("data-repNum", repNum);
						
					});
					
					$(document).on("click", ".delete", function(){
						
						var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
						
						if(deleteConfirm){
							
							var data = {repNum : $(this).attr("data-repNum")};
							
							$.ajax({
								url : "/shop/QnADetail/deleteReply",
								type : "post",
								data : data,
								success : function(result){
									if(result == 1) {
									QnAreplyList();
										
									}else {
										alert("작성자 본인만 할 수 있습니다.")
									}
								},
								error : function(){
									alert("로그인하셔야합니다.")
								}
							});
						}	
					});
				</script>
			</section>
			<hr/>
			
			<c:if test="${member != null }">
	      		<section class="replyForm">
	         		<form role ="form" method="post" autocomplete="off">
	         			<input type="hidden" name="brdNum" id="brdNum" value="${view.brdNum }">
			         	<div class="input_area">
			            	<textarea name="repCon" id="repCon"></textarea>
			         	</div>
			         	
         				<div class="input_area bt">
         	   				<button type="button" id="QnAreply_btn">답변작성</button>
            				
            				<script>
				               	$("#QnAreply_btn").click(function(){
				                  
				                  	var formObj = $(".replyForm form[role='form']");
				                  	var brdNum  = $("#brdNum").val();
				                  	var repCon    = $("#repCon").val()
				                  
				                  	var data = {
				                     	brdNum : brdNum,
				                     	repCon : repCon
				                     
				                  	};
				                  	$.ajax({
				                     	url : "/shop/QnADetail/QnAregistReply",
				                     	type : "post",
				                     	data : data,
				                     	success : function(){
				                        	QnAreplyList();
				                        	
				                        	alert("소중한 의견 감사합니다 :)")
				                     	}
				                  	});
				               	});
				            </script>
						</div>	
					</form>
				</section>
			</c:if>
			
			<section class="replyList">
				<ol>
					<li>댓글목록</li>
				</ol>
			</section>
		</div>	
	</div>
	
	<div class="replyModal">
		<div class="modalContent">
			<div>
				<textarea class="modal_repCon" name="modal_repCon"></textarea>
			</div>
			
			<div>
				<button type="button" class="modal_modify_btn">수정</button>
				<button type="button" class="modal_cancle">취소</button>
			</div>
		</div>
		
		<div class="modalBackground"></div>
		
	</div>
	
	<script>
		$(".modal_modify_btn").click(function(){
			var modifyConfirm = confirm("정말로 수정하시겠습니까?");
			
			if(modifyConfirm) {
				var data = {
					repNum : $(this).attr("data-repNum"),
					repCon : $(".modal_repCon").val()
				};  // ReplyVO 형태로 데이터 생성
				
				$.ajax({
					url : "/shop/QnADetail/modifyReply",
					type : "post",
					data : data,
					success : function(result){
						
						// result의 값에 따라 동작
						if(result == 1) {
							alert("댓글 수정이 완료되었습니다.")
							QnAreplyList(); // 리스트 새로고침
							$(".replyModal").fadeOut(200);
						} else {
							alert("작성자 본인만 할 수 있습니다.") // 본인이 아닌 경우
						}
					},
					error : function(){
						// 로그인하지 않아서 에러가 발생한 경우
						alert("로그인하셔야합니다.")
					}
				});
			}
		});
		
		$(".modal_cancle").click(function(){
			//$(".replyModal").attr("style", "display:none;");
			$(".replyModal").fadeOut(200);
		});
	</script>
	
  	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
</body>
</html>