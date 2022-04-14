<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>SAMSIKKI : 자체제작 디자인 테이블웨어</title>
	
	<script src="/resources/js/jquery-3.6.0.js"></script>
	
	<%@ include file="../include/topInclude.jsp" %>

	<style>
	body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
	a { color:#000; text-decoration:none; }
	a:hover { color:#000; font-weight: bolder; text-decoration:none; }
	
	.atag{
		color:#06F;
	}
	#reply > p{
		text-align:center;
		margin-top:80px;
	}
	
	h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
	ul, lo, li { margin:0; padding:0; list-style:none; }
	
	/* ---------- */
	
	section#container::after { content:""; display:block; clear:both; }
	
	/* ---------- */
	
	header#header div#header_box { text-align:center; padding:40px 0 30px 0; }
	header#header div#header_box h1 { font-size:50px; }
	header#header div#header_box h1 a { color:#000; }

	/* 센터 맞추기 추가 */
	section#container { padding: 100px 380px 0 380px; }
	
	section.container { padding: 100px 50px 50px 50px; }
	</style>
	
	<style>
	div.goods div.goodsImg { float:left; width:350px; }
	div.goods div.goodsImg img { margin: 20px 0 0 50px; width:380px; height:auto; }
	
	div.goods div.goodsInfo { float:right; width:330px; font-size:22px; margin: 40px 50px 0 0; }
	div.goods div.goodsInfo p { margin:0 0 20px 0; border-bottom: 1px solid #000; border-radius: 2px; font-size: 18; }
	div.goods div.goodsInfo p.gdsstock { margin: 0 0 5px 0; }
	div.goods div.goodsInfo p span { display:inline-block; width:100px; margin:-5px 15px 15px 0; }
	
	div.goods div.goodsInfo p.cartStock input { font-size:20px; width:60px; text-align:center; padding: 5px 0 5px 13px; margin:6px 5px 0 5px; border:1px solid #000; background:#E3E3E3; cursor:not-allowed }
	div.goods div.goodsInfo p.cartStock button { font-size:13px; border:1px solid #000; padding: 2px 5px; border-radius: 100%;  background: none; margin-bottom:5px; }
	div.goods div.goodsInfo p.addToCart { text-align:left; border-bottom: none; }
	div.goods div.gdsDes { font-size:18px; clear:both; padding:100px 0 50px 0; text-align: center; }
	
	div.goods div.goodsInfo p button.plus{
		transition: background .3s ease-in-out;
	}
	div.goods div.goodsInfo p button.plus:hover{
		transition: background .3s ease-in-out;
		background: #F5F5F5;
	}
	div.goods div.goodsInfo p button.minus{
		transition: background .3s ease-in-out;
	}
	div.goods div.goodsInfo p button.minus:hover{
		transition: background .3s ease-in-out;
		background: #F5F5F5;
	}
	
	
	
	#cartbtn{
		text-align:left;
		width:50%;
		margin:0 -15px 0 0;
	}
	.addToCart button {
		font-size: 15;
		height: 50px;
		
		margin-bottom:10px;
		border-radius: 2px;
		transition: background .3s ease-in-out;
	}
	
	.addToCart button.addCart_btn1{
		width:100%;
		
		background: #E3E3E3;
		color: #000;
	}
	.addToCart button.addCart_btn1:hover{
		background: #000;
		color: #FFF;
		transition: background .3s ease-in-out;
	}
	.addToCart button.addCart_btn2{
		width:100%;
		padding:0 1px;
		
		background: #000;
		color: #FFF;
	}
	.addToCart button.addCart_btn2:hover{
		background: #E3E3E3;
		color: #000;
		transition: background .3s ease-in-out;
	}
	.addToCart button.QnA_btn{
		width:100%; 
		background: #E3E3E3;
		color: #000;
		
		margin-left:10px;
	}
	.addToCart button.QnA_btn:hover{
		background: #000;
		color: #FFF;
		transition: background .3s ease-in-out;
	}
	</style>
	
	<style>
	section.replyForm div.input_area { margin:10px 0; text-align:right; }
	
	#reply_btn{
		border: 1px solid #000;
		background: #E3E3E3;
		color: #000;
		transition: background .3s ease-in-out;
	}
	#reply_btn:hover{
		background: #F5F5F5;
		color: #000;
		transition: background .3s ease-in-out;
	}
	
	section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:100px; }
	section.replyForm button { font-size:15px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
	
	section.replyList { padding:30px 0; }
	section.replyList ol { padding:0; margin:0; }
	section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
	section.replyList div.userInfo { }
	section.replyList div.userInfo .userName { font-size:15px; font-weight:bold; }
	section.replyList div.userInfo .date { color:#000; display:inline-block; margin-left:84%; }
	section.replyList div.replyContent { padding:10px; margin:20px 0 10px 0; }
	section.replyList div.replyFooter { margin-bottom:10px; text-align:right; }
	
	section.replyList div.replyFooter button { font-size:13px; border: 1px solid #000; background:none; padding:3px 5px; margin-right:5px; }
	
	section.replyList div.replyFooter button.modify {
		background: #E3E3E3;
		color: #000;
		transition: background .3s ease-in-out;
	}
	section.replyList div.replyFooter button.modify:hover {
		background: #F5F5F5;
		transition: background .3s ease-in-out;
	}
	section.replyList div.replyFooter button.delete {
		background: #E3E3E3;
		color: #000;
		transition: background .3s ease-in-out;
	}
	section.replyList div.replyFooter button.delete:hover {
		background: #F5F5F5;
		transition: background .3s ease-in-out;
	}
	</style>
	
	<style>
	div.replyModal { position:relative; z-index:1; display:none; }
	div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
	div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:520px; height:300px; padding:20px 10px; background:#fff; border:2px solid #666; }
	div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
	div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
	div.modalContent button.modal_cancel { margin-left:20px; }
	
	textarea#repCon{
		width: 100%;
		background: rgba(0,0,0,0.03);
	}
	</style>
	
	<style>
	h5{
		text-align: center;
		margin: 80px 0 0 0;
	}
	#num{ /* 번호 */
		width: 15%;
	}
	#tit{ /* 제목 */
		width: 55%;
	}
	#make{ /* 작성자 */
		width: 17.5%;
	}
	#reg{ /* 등록일 */
		width: 10%;
	}
	
	/* 자물쇠 이미지 */
	.glyphicon-lock{
		margin: 0 10px;
	}
	</style>
	<style>
	.blue {
	color:blue;}
	</style>
	
	<script>
		function replyList() {
			
			var gdsNum = ${view.gdsNum};
			
			$.getJSON("/shop/view/replyList" + "?n=" + gdsNum, function(data){
				
				var str = "";
				
				$(data).each(function(){
					
					console.log(data);
					
					var repDate = new Date(this.repDate);
					repDate = repDate.toLocaleDateString("ko-US")
					
					// HTML 코드 조립
					str += "<li data-repNum='" + this.repNum + "'>"
						+ "<div class='userInfo'>"
						+ "<span class='userName'>" + this.userName + "</span>"
					    + "<span class='date'>" + repDate + "</span>"
						+ "</div>"
						+ "<div class='replyContent'>" + this.repCon + "</div>"
						
						+ "<c:if test='${member != null}'>"
						
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
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp" %>
			</div>	
		</header>
		
		<section id="container">
			<div id="container_box">
				<section id="content">
					<form role="form" method="post">
	 					<input type="hidden" name="gdsNum" value="${view.gdsNum}" />
					</form>
					
					<div class="goods">
	 					<div class="goodsImg">
	  						<img src="${view.gdsImg}">
	 					</div>
	 					
	 					<div class="goodsInfo">
	  						<p class="gdsName"><span>상품명</span>${view.gdsName}</p>
	  						
	  						<p class="gdsPrice">
	   							<span>정상가격 </span><fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" /> 원
	  						</p>
	  						<c:if test="${view.gdsRate != '0' }">
	  						<p class="salePrice">
	   							<span class="blue">할인가격</span><span class="blue"><fmt:formatNumber pattern="###,###,###" value="${(view.gdsPrice*(100-view.gdsRate))/100}" /> 원</span>
	  						</p>
	  						</c:if>
	  						
	  						<p class="gdsStock">
	   							<span>재고 </span><fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}" /> EA
	  						</p>
	  						
	  						<c:if test="${view.gdsStock != 0}">
		  						<p class="cartStock">
		   							<span>구입 수량</span>
		   							<button type="button" class="plus">╋</button>
		   							<input type="number" class="numBox" min="1" max="${view.gdsStock}" value="1" readonly="readonly" />
		   							<button type="button" class="minus">━</button>
		   							
		   							<script>
		   								$(".plus").click(function(){
		   									var num = $(".numBox").val();
		   									var plusNum = Number(num) + 1;
		   									
		   									if(plusNum >= ${view.gdsStock}) {
		   										$(".numBox").val(num);
		   									} else {
		   										$(".numBox").val(plusNum);
		   									}
		   								});
		   								
		   								$(".minus").click(function(){
		   									var num = $(".numBox").val();
		   									var minusNum = Number(num) - 1;
		   									
		   									if(minusNum <= 0) {
		   										$(".numBox").val(num);
		   									} else {
		   										$(".numBox").val(minusNum);
		   									}
		   								});
		   							</script>
		  						</p>
	  							
		  						<p class="addToCart">
			   						
			   						<button type="button" class="addCart_btn2">Buy Now</button>
			   						
			  						<span id="cartbtn">
			   							<button type="button" class="addCart_btn1">Add to Cart</button>
			   						</span>
			   						<span id="cartbtn">
		   								<button type="button" class="QnA_btn" onclick="location.href='/board/QnAInsert?n=${view.gdsNum }'">Q & A</button>
		   							</span>
		   							
		   							<script>
		   								$(".addCart_btn1").click(function(){
		   									var gdsNum = $("#gdsNum").val();
		   									var cartStock = $(".numBox").val();
		   									
		   									var data = {
		   											gdsNum : gdsNum,
		   											cartStock : cartStock
		   											};
		   									
		   									$.ajax({
		   										url : "/shop/view/addCart",
		   										type : "post",
		   										data : data,
		   										success : function(result){
		   											
		   											if(result == 1) {
		   												alert("카트 담기 성공")
		   												$(".numBox").val("1");
		   											} else {
		   												alert("로그인 후 이용이 가능합니다.")
		   												$(".numBox").val("1");
		   											}
		   										},
		   										error : function(){
		   											alert("카트 담기 실패");
		   										}
		   									});
		   								});
		   							</script>
		   							
		   							
		   							<script>
		   								$(".addCart_btn2").click(function(){
		   									var gdsNum = $("#gdsNum").val();
		   									var cartStock = $(".numBox").val();
		   									
		   									var data = {
		   											gdsNum : gdsNum,
		   											cartStock : cartStock
		   											};
		   									
		   									$.ajax({
		   										url : "/shop/view/addCart",
		   										type : "post",
		   										data : data,
		   										success : function(result){
		   											
		   											if(result == 1) {
		   												alert("결제화면로 이동합니다.")
		   												$(".numBox").val("1");
		   												location.href="/shop/cartList"
		   											} else {
		   												alert("로그인 후 이용이 가능합니다.")
		   												$(".numBox").val("1");
		   											}
		   										},
		   										error : function(){
		   											alert("바로 구매 실패");
		   										}
		   									});
		   								});
		   							</script>
		  						</p>
	  						</c:if>
	  						
	  						<c:if test="${view.gdsStock == 0 }">
	  							<p>상품 수량이 부족합니다.</p>
	  						</c:if>
	 					</div>
	 					
	 					<div class="gdsDes">${view.gdsDes}</div>
	 					
					</div>
					
					<div id="reply">
						<h5>
							◎&nbsp; 이 상품에 대한 여러분의 소감을 남겨보세요 :) &nbsp;◎
						</h5>
						
						<c:if test="${member == null }">
							<p>소감을 남기시려면<a class="atag" href="/member/signin"> 로그인 </a>해주세요</p>
						</c:if>
						
						<c:if test="${member != null }">
							<section class="replyForm">
								<form role="form" method="post" autocomplete="off">
									
									<input type="hidden" name="gdsNum" id="gdsNum" value="${view.gdsNum}">
									
									<div class="input_area">
										<textarea name="repCon" id="repCon"></textarea>
									</div>
									
									<div class="input_area">
										<button type="button" id="reply_btn">작성완료</button>
										
										<script>
											$("#reply_btn").click(function(){
												
												var formObj = $(".replyForm form[role='form']");
												var gdsNum = $("#gdsNum").val();
												var repCon = $("#repCon").val()
												
												var data = {
													gdsNum : gdsNum,
													repCon : repCon
												};
												$.ajax({
													url : "/shop/view/registReply",
													type : "post",
													data : data,
													success : function(){
														replyList();
														$("#repCon").val("");
														
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
					 			<%--		
								<c:forEach items="${reply}" var="reply">
								<li>
									<div class="userInfo">
										<span class="userName">${reply.userName}</span>
										<span class="date"><fmt:formatDate value="${reply.repDate}" pattern="yyyy-MM-dd"/></span>
									</div>
									<div class="replyContent">${reply.repCon}</div>
								</li>
								</c:forEach>	
								--%>
							</ol>
							
							<%--
							<script>
								function replyList() {
									
									var gdsNum = ${view.gdsNum};
									$.getJSON("/shop/view/replyList" + "?n=" + gdsNum, function(data){
										var str = "";
										
										$(data).each(function(){
											
											console.log(data);
											
											var repDate = new Date(this.repDate);
											repDate = repDate.toLocaleDateString("ko-US")
											
											str += "<li data-gdsNum='" + this.gdsNum + "'>"
												 + "<div class='userInfo'>"
												 + "<span class='userName'>" + this.userName + "</span>"
												 + "<span class='date'>" + repDate + "</span>"
												 + "</div>"
												 + "<div class='replyCountent'>" + this.repCon + "</div>"
												 + "</li>";
										});
										
										$("section.replyList ol").html(str);
										
									});
								}
							</script>
							--%>
							
							<script>
								replyList();
							</script>
							
							<script>
								$(document).on("click", ".modify", function(){
									//$(".replyModel").attr("style", "display:block;");
									$(".replyModal").fadeIn(200);
									
									var repNum = $(this).attr("data-repNum");
									var repCon = $(this).parent().parent().children(".replyContent").text();
									
									$(".modal_repCon").val(repCon);
									$(".modal_modify_btn").attr("data-repNum", repNum);
								});
								
								$(document).on("click", ".delete", function(){
									
									var deletConfirm = confirm("정말로 삭제하시겠습니까?");
									
									if(deletConfirm) {
										
										var data = { repNum : $(this).attr("data-repNum") };
										
										$.ajax({
											url : "/shop/view/deleteReply",
											type : "post",
											data : data,
											success : function(result){
												
												if(result == 1) {
													replyList();
											 	} else {
													alert("작성자 본인만 할 수 있습니다.")
												}
											},
											error : function() {
												alert("로그인하셔야합니다.")
											}
										});
									}
								});
							</script>
						</section>
					</div>
				</section>
			</div>	
		</section>
		
		<div class="container">
			<hr />
			<header>
				<h5>문의하기</h5>
			</header>
			
			<section class="container">
				<form role= "form" method="post">
					<table class="table table-hover">
						<thead>
							<tr><th id="num">번호</th><th id="tit">제목</th><th id="make">작성자</th><th id="reg">등록일</th></tr>
						</thead>
						
						<c:forEach items="${QnA}" var = "QnA">
							<tr>
								<c:set var = "secret" scope="session" value="${QnA.secret }" />
								<c:choose>
									<c:when test ="${secret == 1 }">
										<td><c:out value="${QnA.brdNum}"/><span class="glyphicon glyphicon-lock"></span></td>
										<td><a class ="QnAbtn${QnA.brdNum }" href="#" ><c:out value="${QnA.brd_Title}" /></a></td>
										<input type="hidden" name="brdNum" id="brdNum" value="${QnA.brdNum}">
										<input type="hidden" name="verify" id="berify" value="${QnA.verify }">
									</c:when>
									<c:when test ="${secret == 0 }">
										<td><c:out value="${QnA.brdNum}"/></td>
										<td><a href="/shop/QnADetail?brdNum=${QnA.brdNum }&n=${QnA.gdsNum}" ><c:out value="${QnA.brd_Title}" /></a></td>
									</c:when>
								</c:choose>
								
								<td><c:out value="${QnA.userName}" /></td>
								<td><fmt:formatDate value="${QnA.repDate}" pattern="yyyy.MM.dd"/></td>
							</tr>
							
							<script>
								$(document).on("click", ".QnAbtn${QnA.brdNum }", function(){
									
									var brdNum = $("#brdNum").val();
										
									var data = { brdNum : brdNum};
									
									$.ajax({
										url : "/shop/QnADetail",
										type : "post",
										data : data,
										success : function(result){
											
											if(result == 1 ) {
												location.href = "/shop/QnADetail?brdNum=${QnA.brdNum}&n=${QnA.gdsNum}";
										 	} else {
												alert("비밀글입니다.")
											}
										},
										error : function() {
											alert("로그인하셔야합니다.")
										}
									});
								});
	 						</script>
						</c:forEach>
					</table>
				</form>
			</section>
		</div>
		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
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
	 	$(".modal_cancel").click(function(){
			//$(".replyModal").attr("style", "display:none;");
			$(".replyModal").fadeOut(200);
	 	});
	</script>
	
	<script>
		$(".modal_modify_btn").click(function(){
			var modifyConfirm = confirm("정말로 수정하시겠습니까?");
			
			if(modifyConfirm) {
				var data = {
					repNum : $(this).attr("data-repNum"),
					repCon : $(".modal_repCon").val()
				};  // ReplyVO 형태로 데이터 생성
				
				$.ajax({
					url : "/shop/view/modifyReply",
					type : "post",
					data : data,
					success : function(result){
						
						// result의 값에 따라 동작
						if(result == 1) {
							replyList(); // 리스트 새로고침
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
</body>
</html>
