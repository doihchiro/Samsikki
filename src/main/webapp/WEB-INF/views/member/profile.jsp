<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>SAMSIKKI : 자체제작 디자인 테이블웨어</title>
   
    <script src="/resources/js/jquery-3.6.0.js"></script>

    <link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
    <script src="/resources/bootstrap/bootstrap.min.js"></script>
   
    <%@ include file="../include/topInclude.jsp" %>
   
    <style>   
    body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
    a{ /* 제목 글자 색 */
    	color: #000;
    }
    a:hover{ /* 제목 글자 효과 */
        text-decoration:none;
      	color: #000;
      	font-weight: bolder;
    }
   
   
   
   	h1, h2, h3, h4, h6 { margin:0; padding:0; }
   	ul, lo, li { margin:0; padding:0; list-style:none; }
   
   	/* ---------- */
   
   	/*div#root { width:900px; margin:0 auto; }*/
   	section#container::after { content:""; display:block; clear:both; } 
   
   	/* ---------- */
   
	header#header div#header_box { text-align:center; padding:40px 0 30px 0; }
	header#header div#header_box h1 { font-size:50px; }
	header#header div#header_box h1 a { color:#000; }
   
	/* 센터 맞추기 추가 */
	section#container { padding: 50px 130px 1px;  }
	ul.memberlist { padding: 0 155px; }
	section#container_con { margin: 80px 60px; padding: 0 155px; }
	
	#h5{
	   	text-align: center;
	}
   	.h5{
      	text-align: center;
      	margin-bottom: 80px;
    }
   	.hh{
      	margin-top: 30px;
   	}
   
   	#num{ /* 번호 */
      	width: 17.5%;
   	}
   	#tit{ /* 제목 */
      	width: 53%;
   	}
   	#make{ /* 작성자 */
      	width: 17.5%;
   	}
   	#reg{ /* 등록일 */
      	width: 12%;
   	}
   	</style>
   
   	<style>
   	section#content ul li { border:5px solid #eee; padding:30px 50px 20px 50px; margin:20px; }
   	section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:50px; }
   
   	.orderList{
      	padding: 50px 25px 0 25px;
      	margin-bottom: -20px;
   	}
   	.glyphicon{
      	margin-left: 10px;
   	}
   
   
   	/* 회원탈퇴 버튼 */
	button.memberDeleteBtn{
		padding: 5px 10px;
		background: #EEE;
		color: #000;
		transition: background .3s ease-in-out;
		border-radius: 4px;
		border: rgba(0,0,0,0);
		width: 80px;
	}
	button.memberDeleteBtn:hover{
		background: #ECCBCB;
		color: #000;
		transition: background .3s ease-in-out;
	}
   	/* 수정 버튼 */
	button.memberUpdateBtn{
		margin-left: 3px;
		
		padding: 5px 10px;
		background: #EEE;
		color: #000;
		transition: background .3s ease-in-out;
		border-radius: 4px;
		border: rgba(0,0,0,0);
		width: 80px;
	}
	button.memberUpdateBtn:hover{
		background: #CFD3DA;
		color: #000;
		transition: background .3s ease-in-out;
	}
	.bt{
		text-align: right;
		margin: 5px 30px 0 0;
	}
   
   
   	.memberList #ptag{
      	margin-top: 35px;
   	}
   	.memberList #ptag p{
      	width: 100%;
      	padding: 10px 10px 15px 10px;
      	border-bottom: 1px solid #EEE;
      	border-radius: 2px;
   	}
   	/* 프로필 박스 내용 */
   	.memberList span#na{ /* 이름 */
      	margin-right: 180px;
   	}
   	.memberList span#br{ /* 생년월일 */
      	margin-right: 153px;
   	}
   	.memberList span#ad{ /* 주소 */
      	margin-right: 180px;
   	}
   	.memberList span#ph{ /* 휴대폰번호 */
      	margin-right: 141px;
   	}
   	.memberList span#em{ /* 이메일 */
      	margin-right: 167px;
   	}
   
   	hr { margin: 0 50px; }
   	</style>
</head>
<body>
	<div id="root">
	    <header id="header">
	      	<div id="header_box">
	         	<%@ include file="../include/header.jsp" %>
	      	</div>   
	   	</header>
	   
	   	<section id="container">
	      	<h5 class="h5 hh">
	         	<b>프로필</b>
	      	</h5>
	      
	      	<div id="container_box">
	         	<section id="content">
	               	<ul class="memberList">
	               		<c:forEach items="${memberList}" var="memberList">
	                  		<li>
	                     		<div id="ptag">
			                        <p><span id="na">이름</span>${memberList.realName}</p>
			                        <p><span id="br">생년월일</span>${memberList.birth}</p>
			                        <p><span id="ad">주소</span>(${memberList.userAddr1}) ${memberList.userAddr2} ${memberList.userAddr3}</p>
			                        <p><span id="ph">휴대폰번호</span>${memberList.userPhon}</p>
			                        <p><span id="em">이메일</span>${memberList.userId}</p>
	                        		
	                       			<input type="hidden" name="userId" id="userId" value="${memberList.userId}">
	                       			
	                       			<div class="bt">
				                        <button type = "button" class="memberDeleteBtn" >회원탈퇴</button>
				                        <button type = "button" class="memberUpdateBtn" >수정</button>
	                        		</div>
	                        		
	                        		<script>
			                           	$(".memberUpdateBtn").click(function(){
			                              	location.href="/member/profileUpdate"
			                           	});
			                        </script>
	                         		<script>
	   									$(".memberDeleteBtn").click(function(){
											
	   										var deletConfirm = confirm("정말로 삼식기를 떠나실겁니까? :(");
	   										
	   										if(deletConfirm) {
	   											
	   											var userId = $("#userId").val();
	   											
	   											
	   											var data = {
	   												userId : userId
	   											};
	   											
			   									$.ajax({
			   										url : "/member/profile/deleteUserId",
			   										type : "post",
			   										data : data,
			   										success : function(data){
			   											
			   											alert("회원탈퇴에 성공하셨습니다.");
			   											
			   											location.href="/"
			   										},
			   										error : function(){
			   											alert("회원탈퇴에 실패했습니다.");
			   										}
			   									});
			   								}	
			   							});
	   								</script>
	                     		</div>
	                  		</li>
	               		</c:forEach>
	            	</ul>
	         	</section>
	         	<hr/>
	   				
	   			<section id="container">
			      	<h5 id="h5">
			         	<b>구매 목록</b>
			      	</h5>
	      			
	      			<div id="container_box">
	         			<section id="content">
	            			<ul class="orderList">
	               				<c:forEach items="${orderList}" var="orderList">
	                  				<li>
	                     				<div>
					                        <p><span>주문번호</span><a href="/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
					                        <p><span>수령인</span>${orderList.orderRec}</p>
					                        <p><span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
					                        <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
					                        <p><span>상태</span>${orderList.delivery}</p>
					                        
	                        				<c:set var="account" scope="session" value="${orderList.account }" />
										    <c:choose>
											   	<c:when test="${account==1 }">
											   		<p><span>결제계좌</span>국민은행 11111-111-111111 최유나</p>
											   	</c:when>
											   	<c:when test="${account==2 }">
											   		<p><span>결제계좌</span>우리은행 22222-222-222222 정수호</p>
											   	</c:when>
											   	<c:when test="${account==3 }">
											   		<p><span>결제계좌</span>신한은행 33333-333-333333 정호상</p>
											   	</c:when>
										    </c:choose>
	                     				</div>
	                     				<div class="orderChange">
								<form role="form" method="post" class="orderForm">
									<input type="hidden" name="orderId" value="${orderList.orderId}" />
									<input type="hidden" name="delivery" class="delivery" value="" />
									
									<button type="button" class="order_cancel_btn">주문 취소</button>
									
									<script>
									$(".order_cancel_btn").click(function(){
										$(".delivery").val("주문취소");
										run();
									});
									function run(){
										$(".orderForm").submit();
									}
									</script>
								</form>
							</div>
	                  				</li>
	               				</c:forEach>
	             			</ul>
	         			</section>
	      			</div>
	   			</section>
	      	</div>
	      	<hr/>
	      
	   		<div class="container_con">
	      		<section id="container_con">
	         		<h5 class="h5">
	            		<b>작성글</b>
	         		</h5>
	         		
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
	                                 		<input type="hidden" name="verify" id="verify" value="${QnA.verify }">
	                                	</c:when>
	                              		<c:when test ="${secret == 0 }">
	                                 		<td><c:out value="${QnA.brdNum}"/></td>
	                                 		<td><a href="/shop/QnADetail?brdNum=${QnA.brdNum }&n=${QnA.gdsNum}" ><c:out value="${QnA.brd_Title}" /></a></td>
	                              		</c:when>
	                     			</c:choose>
	                           		
	                           		<td><c:out value="${QnA.userName}" /></td>
	                           		<td><fmt:formatDate value="${QnA.repDate}" pattern="yyyy. MM. dd."/></td>
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
		</section>
	   
	   	<footer id="footer">
	      	<div id="footer_box">
	         	<%@ include file="../include/footer.jsp" %>
	      	</div>
	   	</footer>
	</div>
</body>
</html>