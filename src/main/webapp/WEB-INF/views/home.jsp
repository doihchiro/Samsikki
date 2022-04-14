<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="ko">
<head>
	
	<!-- 한글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/include/header.jsp" />
	
	<!-- 멘트폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&family=Tangerine&display=swap" rel="stylesheet">
	
	<%@ include file="include/topInclude.jsp" %>
	
	<title>SAMSIKKI : 자체제작 디자인 테이블웨어</title>
	
	<style>
	*{
		font-family: 'Noto Sans KR', sans-serif;
		font-family: 'Poppins', sans-serif;
		
		list-style: none;
		text-decoration: none;
		border-collapse: cokkapse;
		margin: 0px;
		padding: 0px;
		color: #000;
	}
	body{
		background: #E3E3E3;
	}
	.carousel-inner{
		max-width: 100%;
		max-height: 100%;
		overflow: hidden;
	}
	.carousel-inner img{
		max-width: initial;
		max-height: initial;
		margin-top: -9%;
	}
	#T{
		font-family: 'Noto Sans KR', sans-serif;
		font-family: 'Tangerine', cursive;
	}
	#T h4{
		font-size: 100px;
		text-align: center;
		margin-top: 340px;
		margin-bottom: 150px;
	}
	</style>
</head>
<body>
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>
		
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="/resources/images/main01.png">
			</div>
			<div class="item">
				<img src="/resources/images/main02.png">
			</div>
			<div class="item">
				<img src="/resources/images/main03.png">
			</div>
		</div>
	</div>
	
	<script>
		transform: translate(-100vw)
		
		document.querySelector('.btn2').addEventListener('click', function(){
			document.querySelector('.container').style.transform = 'translate(-100vw)';
		});
		
		document.querySelector('.btn3').addEventListener('click', function(){
			document.querySelector('.container').style.transform = 'translate(-200vw)';
		});
		
		document.querySelector('.btn1').addEventListener('click', function(){
			document.querySelector('.container').style.transform = 'translate(-300vw)';
		});
	</script>
	
	<div id="T">
		<h4>"&nbsp;&nbsp;We&nbsp;&nbsp;make&nbsp;&nbsp;with&nbsp;&nbsp;sincerity&nbsp;&nbsp;and&nbsp;&nbsp;heart&nbsp;&nbsp;"</h4>
	</div>
	
	<div class="header">
		<div class="nav">
			<%@ include file="include/header.jsp" %>
		</div>
	</div>
	
	<div class="footer">
		<%@ include file="include/footer.jsp" %>
	</div>
</body>
</html>

