<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>SAMSIKKI : 자체제작 디자인 테이블웨어</title>
	
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
	
	h5{
		text-align: center;
		margin: 0 0 80px 0;
	}
	
	section#container::after { content:""; display:block; clear:both; }
	
	header#header div#header_box { text-align:center; padding:40px 0 30px 0; }
	
	section#container { padding: 80px 65px 0 65px; }
	</style>
	
	<style>
	/*
	 section#content ul li { display:inline-block; margin:10px; }
	 section#content div.goodsThumb img { width:200px; height:200px; }
	 section#content div.goodsName { padding:10px 0; text-align:center; }
	 section#content div.goodsName a { color:#000; }
	*/
	
	section#content ul li { border:5px solid #eee; padding:20px 50px 10px 50px; margin-bottom:20px; }
	section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:50px; }
	
	.orderList{
		padding: 0 240px;
	}
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
			<header>
				<h5>주문목록</h5>
			</header>
			
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
		  					</li>
	  					</c:forEach>
	 				</ul>
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
