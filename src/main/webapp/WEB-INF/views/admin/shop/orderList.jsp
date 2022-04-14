<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<!-- 한글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/include/header.jsp" />
	
	<%@ include file="../../include/topInclude.jsp" %>
	
	<title>SAMSIKKI : 주문 목록(OrderList)</title>
	
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
	<style>
	/* 사이드 높이 */
	#header { margin-top: 40px; }
	
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
	
	section#container { margin: 100px 200px }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	
	#container_box table td {width:500px; }
	
	/*
	#container_box table { width:900px; }
	#container_box table th { font-size:20px; font-weight:bold; text-align:center; padding:10px; border-bottom:2px solid #666; }
	#container_box table tr:hover { background:#eee; }
	#container_box table td { padding:10px; text-align:center; }
	#container_box table img { width:150; height:auto; }
	*/
	
	div#container_box ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 	div#container_box .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
	</style>
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../../include/header.jsp" %>
			</div>	
		</header>
		
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp" %>
			</div> 
		</nav>
		
		<section id="container">
			<div id="container_box">
				<section id="content">
					<ul class="orderList">
						<c:forEach items="${orderList}" var="orderList">
							<li>
								<div>
									<p><span>주문번호</span><a href="/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
									<p><span>주문자</span>${orderList.userId}</p>
									<p><span>수령인</span>${orderList.orderRec}</p>
									<p><span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
									<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>					
									<p><span>상태</span>${orderList.delivery}</p>
								</div>
								
					   		    <div class="deleteOrder">
						   		    <form role="form" method="post">
						   		    	<input type="hidden" name="orderId" value="${orderList.orderId}" />
						   		    	<button type="submit" class="delete_${orderList.orderId}_btn">삭제</button>
						   		    </form>
					   		   </div>
							</li>
						</c:forEach>
					</ul>
				</section>
			</div>
			
			<aside>
				<%@ include file="../include/aside.jsp" %>
			</aside>
		</section>
		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>