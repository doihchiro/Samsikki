<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SAMSIKKI : 자체제작 디자인 테이블웨어</title>
	
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>	
	
	<%@ include file="../include/topInclude.jsp" %>
	
	<style>
	body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
	a { color:#05f; text-decoration:none; }
	a:hover { text-decoration:underline; }
	
	h5{
		text-align: center;
		margin: 80px 0 0 0;
	}
	
	section#container::after { content:""; display:block; clear:both; }
	
	header#header div#header_box { text-align:center; padding:40px 0 30px 0; }
	
	section#container { padding: 80px 100px 0 100px; }
	
	.col-md-offset {
		text-align: center;
	}
	
	
	h5{
		text-align: center;
		margin: 80px 0 50px 0;
	}
	
	/* 제목 */
	#ti{
		width: 793px;
		height: 32px;
		padding: 0 5px;
		border-radius: 2px;
	}
	
	/* 선택란 */
	.cho{
		width: 100px;
		height: 31px;
		margin-left: 195px;
		padding: 0 5px;
		
		background: rgba(0,0,0,0.03);
		border: 1px solid #000;
		border-radius: 2px;
	}
	textarea{
		background: rgba(0,0,0,0.03);
		border-radius: 2px;
	}
	#ti{
		background: rgba(0,0,0,0.03);
	}
	
	.secret{
		text-align: right;
		margin-right: 150px;
	}
	.secret > label{
		margin: 0 5px 0 0;
		cursor: pointer;
	}
	.secret > label > input{
		margin: 0 5px 0 0;
		cursor: pointer;
	}
	.btm{
		text-align: right;
		margin-top: 13px;
	}
	.bt{
		margin-right: 170px;
	}
	.bt > button{
		background: rgba(0,0,0,0.03);
		color:#000;
		border-radius: 3px;
		padding: 3px 24px;
		transition: background .3s ease-in-out;
	}
	.bt > button:hover{
		background: #000;
		color:#E3E3E3;
		transition: background .3s ease-in-out;
	}
	</style>
</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>	
	</header>
	
	<div class="container">
		
		<form class="form-horizontal" method="post">
			<div class="form-group">
				<header>
					<h5><b>문의사항</b></h5>
				</header>
			</div>
			
			<div class="form-group">
				<div class="col-xs-2 col-sm-2">
					<select name="select" class="cho">
						<option style="background:#DADADA;" value ="0">---선택---</option>
						<option style="background:#DADADA;" value ="2">상품문의</option>
						<option style="background:#DADADA;" value ="3" >배송문의</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">제  목</label>
				<div class="col-sm-4">
					<input type="text" id="ti" name="brd_Title" maxlength="50" placeholder="Enter Title"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">내  용</label>
				<div class="col-sm-4">
					<textarea rows="10" cols="118" name="brd_Content" style="padding:5px;"></textarea>
				</div>
			</div>
			
			<div class="secret">
			    <label><input type="radio" name="secret" value="0" />공개</label>
			    <label><input type="radio" name="secret" value="1" />비공개</label>
			</div>
			
			<div class="form-group btm">
				<div class="col-sm-offset bt">
					<button type="submit">작성완료</button>
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
