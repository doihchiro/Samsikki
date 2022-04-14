<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>	
	
	<%@ include file="../include/topInclude.jsp" %>
	
	<title>SAMSIKKI : 자체제작 디자인 테이블웨어</title>
	
	<style>
	body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
	a { color:#05f; text-decoration:none; }
	a:hover { text-decoration:underline; }
	
	h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
	ul, lo, li { margin:0; padding:0; list-style:none; }
	
	/* ---------- */
	section#container::after { content:""; display:block; clear:both; }
	/* ---------- */
	
	header#header div#header_box { text-align:center; padding:30px 0; }
	header#header div#header_box h1 { font-size:50px; }
	header#header div#header_box h1 a { color:#000; }
	
	section#container { padding: 100px 305px 0 305px; }

	h5{
	text-align: center;
	margin: -10px 0 80px 0;
	}
	</style>
	
	<style>
	/*
	section#content ul li { display:inline-block; margin:10px; }
	section#content div.goodsThumb img { width:200px; height:200px; }
	section#content div.goodsName { padding:10px 0; text-align:center; }
	section#content div.goodsName a { color:#000; }
	*/

	.orderInfo { border:5px solid #eee; padding:30px 50px 20px; margin:20px 0;}
	.orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:50px; }
	

	.orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
	.orderView li::after { content:""; display:block; clear:both; }

	.thumb { float:left; width:200px; }
	.thumb img { width:200px; height:200px; }
	.gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
	.gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
	
	.blue {
	color:blue;}
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
				<h5><b>주문 상세목록</b></h5>
			</header>
			
			<div id="container_box">
				<section id="content">
					<div class="orderInfo">
	  					<c:forEach items="${orderView}" var="orderView" varStatus="status">
						 	<c:if test="${status.first}">
						  		<p><span>수령인</span>${orderView.orderRec}</p>
							  	<p><span>주소</span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}</p>
							  	<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
							  	<p><span>상태</span>${orderView.delivery}</p>
							  	<c:set var="account" scope="session" value="${orderView.account }" />
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
						 	</c:if>
						</c:forEach>
					</div>
					
					<ul class="orderView">
					 	<c:forEach items="${orderView}" var="orderView">
					 		<li>
					  			<div class="thumb">
	    			   				<img src="${orderView.gdsThumbImg}" />
	   				  			</div>
	   				  			<div class="gdsInfo">
	   				   				<p>
					   				    <span>상품명</span>${orderView.gdsName}<br />
					   				    <span>정상 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}" /> 원<br />
					   				    <c:if test="${orderView.gdsRate != '0' }">
				                        <span class="blue">할인 가격   </span><span class="blue"><fmt:formatNumber pattern="###,###,###" value="${(orderView.gdsPrice*(100-orederView.gdsRate))/100}" /> 원</span><br />
				                        </c:if>
					   				    <span>구입 수량</span>${orderView.cartStock} 개<br />
					   				    <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}" /> 원
	   				   				</p>
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
