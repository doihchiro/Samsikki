<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<!-- 한글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/include/header.jsp" />
	
	<%@ include file="../../include/topInclude.jsp" %>
	
	<title>MANAGER : 상품 후기(AllReply)</title>
	
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
	<style>
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
	
	
	/* 사이드 높이 */
	#header { margin-top: 40px; }
	
	/*
	#container_box table { width:900px; }
	#container_box table th { font-size:20px; font-weight:bold; text-align:center; padding:10px; border-bottom:2px solid #666; }
	#container_box table tr:hover { background:#eee; }
	#container_box table td { padding:10px; text-align:center; }
	#container_box table img { width:150; height:auto; }
	*/
	
	#container_box ul li { margin-bottom:20px; border:10px solid #eee; }
	.replyInfo { background:#eee; padding:10px; font-size:18px; }
	.replyInfo span { font-size:20px; font-weight:bold; margin-right:20px; }
	.replyContent { padding:10px; }
	
	.replyControll {text-align:right; padding:10px; }
	.replyControll button { border:2px solid #999; background:#fff; }
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
			<aside>
				<%@ include file="../include/aside.jsp" %>
			</aside>
			
			<div id="container_box">
				<ul>
					<c:forEach items="${reply}" var="reply">
			    		<li>
			    			<div class="replyInfo">
			    				<p>
			     					<span>작성자</span>${reply.userName} (${reply.userId})
			    				</p>
							    <p>
							    	<span>작성된 상품</span> <a href="/shop/view?n=${reply.gdsNum}">바로가기</a>
							    </p>
			   				</div>
			   				
						    <div class="replyContent">
				    			${reply.repCon}
				   		    </div>
	   		   				
	   		   				<div class="replyControll">
	   		    				<form role="form" method="post">
					   		    	<input type="hidden" name="repNum" value="${reply.repNum}" />
					   		    	<button type="submit" class="delete_${reply.repNum}_btn">삭제</button>
					   		    </form>
	   		    			</div>
			  			</li>
			  		</c:forEach>
			 	</ul>											
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