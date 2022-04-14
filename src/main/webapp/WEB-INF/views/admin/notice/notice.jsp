<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 한글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/include/header.jsp" />
	
	<%@ include file="../../include/topInclude.jsp" %>
	
	<meta charset="UTF-8">
	<title>MANAGER : 게시글 작성(Notice)</title>
	
	<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
	 
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
	
	section#container { margin: 140px 200px; }
	section#container::after { content:""; display:block; clear:both; }
	
	aside { float:left; width:200px; }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	/* 사이드 높이 */
	#header { margin-top: 40px; }
	
	.form-horizontal { margin: 0 200px; }
	select.form-control { margin-left: 230px; }
	.btn-warning { margin-left: 150px; }
	</style>
</head>
<body>
	<div class="container_con">
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
		
		<form class="form-horizontal" method="post">
			<div class="form-group">
				<div style="text-align: center; margin: 50px 0;">
					<h5><b>게시글 작성</b></h5>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">제  목</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="brd_Title" maxlength="50" placeholder="Enter Title"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">내  용</label>
				<div class="col-sm-4">
					<textarea rows="15" cols="150" name="brd_Content"></textarea>
				</div>
			</div>
			
			<div class="type">
				<div class="col-xs-2 col-sm-2">
					<select name = "brd_type" class="form-control">
						<option value ="0" >---선택---</option>
						<option value ="1" >공지사항</option>
						<option value ="2" >상품문의</option>
						<option value ="3" >배송문의</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-3">
					<button type="reset"  class="btn btn-warning btn-sm">다시 작성하기</button>
					<button type="submit" class="btn btn-primary btn-sm">글 올리기</button>
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
