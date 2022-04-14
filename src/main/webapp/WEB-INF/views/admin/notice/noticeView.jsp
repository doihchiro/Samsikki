<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 한글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/include/header.jsp" />
	
	<%@ include file="../../include/topInclude.jsp" %>
	
	<meta charset="UTF-8">
	<title>MANAGER : 공지사항 상세 정보(NoticeView)</title>
	<script src="/resources/js/jquery-3.6.0.js"></script>

	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
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
	
	.form-horizontal { margin: 0 200px; }
	</style>
</head>
<body>
	<div id="container">
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
		
		<form class="form-horizontal" name ="readForm" method="post">
			<input type="hidden" id="brdNum" name="brdNum" value="${view.brdNum}" />
			<div class="form-group">
				<div style="text-align: center; margin: 50px 0;">
					<h5><b>공지사항 상세 정보</b></h5>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">제  목</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="brd_Title" maxlength="50" value="${view.brd_Title}"  readonly="readonly" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">글쓴이</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="userName" maxlength="30" value="${view.userName}"  readonly="readonly" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">작성일자</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="repDate" value="<fmt:formatDate value="${view.repDate}" pattern="yyyy년 MM월 dd일"/>"  readonly="readonly" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">내  용</label>
				<div class="col-sm-4">
					<textarea rows="15" cols="140" name="brd_Content" readonly="readonly" style="cursor:not-allowed; background:#EEE; padding:5px; border-radius:4px;">${view.brd_Content}</textarea>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-9">
					<button type ="button" class="btn btn-primary" onclick="location.href='updateView?brdNum=${view.brdNum}'" >수정</button>&nbsp;
					<button type="button" class="btn btn-danger" onclick="location.href='delete?brdNum=${view.brdNum}'" >삭제</button>
				</div>
			</div>
		</form>
		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>
