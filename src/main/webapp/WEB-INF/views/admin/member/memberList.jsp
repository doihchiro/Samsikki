<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 한글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/include/header.jsp" />
	
	<%@ include file="../../include/topInclude.jsp" %>
	
	<meta charset="UTF-8">
	<title>MANAGER : 회원 목록(MemberList)</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>
		
	<script src="/resources/js/jquery-3.6.0.js"></script>	
	
	
	<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
	
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	#list { margin: 100px 200px 120px 200px; }
	
	/* 사이드 높이 */
	#header { margin-top: 40px; }
	
	#list_center { margin-left: 200px; }
	</style>
</head>
<body>
	<div id="container_con">
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
		
		<div id="list">
			<aside>
				<%@ include file="../include/aside.jsp" %>
			</aside>
			
			<div id="list_center">
				<h5 id="h2" align="center" style="margin: 0 50px 50px 0"><b>회원목록</b></h5>
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<td align="center">아이디</td>
							<td align="center">이  름</td>
							<td align="center">가입일자</td>
							<td align="center">전화번호</td>
							<td align="center">주  소</td>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="List" items="${List}">
							<tr>
								<td align="center">${List.userId}</td>
								<td align="center">${List.realName}</td>
								<td align="center"><fmt:formatDate value="${List.regDate}" pattern="yyyy년 MM월 dd일"/></td>
								<td align="center">${List.userPhon}</td>
								<td align="center">${List.userAddr3}</td>
							</tr>	
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>	
</body>
</html>






