<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<!-- 한글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/include/header.jsp" />
	
	<%@ include file="../include/topInclude.jsp" %>
	
	<title>MANAGER : 관리자 화면(Index)</title>
	
	<script src="/resources/js/jquery-3.6.0.js"></script>

	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
	<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding-top:50px; margin:100px 300px 50px 300px; list-style:none; }
	
	nav#nav ul li { display:inline-block; margin-left:10px; }
	
	section#container { margin: 160px 200px; }
	section#container::after { content:""; display:block; clear:both; }
	aside { width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	#nav_box { text-align: right; }
	#nav { padding: 5px 5px 0 0; }
	
	/* 사이드 높이 */
	#header { margin-top: 40px; }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0; }
	aside ul li a:hover { background:#eee; }
	
	.logo { margin: -325px 20px 0 300px; }
	</style>
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp" %>
			</div>	
		</header>
		
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="include/nav.jsp" %>
			</div> 
		</nav>
		
		<section id="container">
			<aside>
				<%@ include file="include/aside.jsp" %>
			</aside>
			
			<div class="logo">
				<img src="../../resources/images/logo02.jpg" alt="삼식기로고" title="Hello Manager :)" width="80%" height="auto" />
			</div>
		</section>
		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>