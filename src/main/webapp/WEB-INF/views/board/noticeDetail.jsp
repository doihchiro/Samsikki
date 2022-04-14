<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SAMSIKKI : 자체제작 디자인 테이블웨어</title>
	<script src="/resources/js/jquery-3.6.0.js"></script>

	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
	<%@ include file="../include/topInclude.jsp" %>
	
	<style>
	body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
	a { color:#05f; text-decoration:none; }
	a:hover { text-decoration:underline; }
	
	header#header div#header_box { text-align:center; padding:40px 0 30px 0; }
	
	.form-horizontal {
		margin-left: 40px;
	}
	
	h5{
		text-align: center;
		margin: 80px 0;
	}
	
	#content{
		width: 209%;
		cursor: text;
	}
	
	input{
		padding: 0 5px;
		height: 35px;
		width: 725px;
		background: rgba(0,0,0,0.03);
	}
	textarea{
		padding: 10px 5px;
		background: rgba(0,0,0,0.03);
		border: 1px solid #000;
	}
	</style>
</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>	
	</header>
	
	<header>
		<h5><b>상세보기</b></h5>
	</header>
	
	<div class="container">
		<form class="form-horizontal" name="readForm" method="post">
		<input type="hidden" id="brdNum" name="brdNum" value="${view.brdNum}" />
			
			<div class="form-group">
				<label class="control-label col-sm-2">제  목</label>
				<div class="col-sm-8">
					<input type="text" name="brd_Title" maxlength="50" style="cursor:text;" value="${view.brd_Title}" readonly="readonly" style="cursor:text" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">글쓴이</label>
				<div class="col-sm-8">
					<input type="text" name="userName" maxlength="30" style="cursor:text;" value="${view.userName}" readonly="readonly" style="cursor:text" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">작성일자</label>
				<div class="col-sm-8">
					<input type="text" name="repDate" style="cursor:text;" value="<fmt:formatDate value="${view.repDate}" pattern="yyyy년 MM월 dd일"/>" readonly="readonly" style="cursor:text" />
				</div>
			</div>
			
			<div id="form-group" class="form-group">
				<label class="control-label col-sm-2">내  용</label>
				<div class="col-sm-4">
					<textarea id="content" rows="20" cols="120" name="brd_Content" readonly="readonly" >${view.brd_Content}</textarea>
				</div>
			</div>
		</form>
	</div>

  	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
</body>
</html>
