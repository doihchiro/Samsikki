<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	a { color:#000; text-decoration:none; }
	a:hover { color:#000; font-weight: bolder; text-decoration:none; }
	
	section#container::after { content:""; display:block; clear:both; }

	/* 센터 맞추기 추가 */
	section#container { padding: 100px 180px 50px 180px; }
	</style>
  	
  	<style>
	h5{
		text-align: center;
		margin: 50px 0 80px 0;
	}
	
	.but{
		text-align: right;
		padding-right: 155px;
	}
	
	.but > button{
		padding:  5px 10px;
		marin: 0 5px;
		
		background:#E3E3E3;
		color:#000;
		transition: background .3s ease-in-out;
	}
	.but > button:hover{
		padding:  5px 10px;
		marin: 0 5px;
		
		background:#F5F5F5;
		transition: background .3s ease-in-out;
	}
	
	input{
		height: 35px;
		width: 805px;
		padding: 0 5px;
		background: rgba(0,0,0,0.03);
	}
	
	p{
		text-align: center;
		margin: 10px 0;
	}
	textarea{
		border:1px solid #000;
	}
	</style>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "/shop/view?n=${update.gdsNum}";
		})
	})
</script>

<body>
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>	
	</header>

	<section id="container">
		<form class="form-horizontal" name="updateForm" role="form" method="post" action="/shop/QnAupdateView">
			<input type="hidden" name="brdNum" value="${update.brdNum}" readonly="readonly"/>
			<input type="hidden" name="n" value="${update.gdsNum}" readonly="readonly"/>
			
			<header>
				<h5><b>상세정보 수정</b></h5>
			</header>
			
			<div class="form-group">
				<label class="control-label col-sm-2">제  목</label>
				<div class="col-sm-4">
					<input type="text" id="brd_Title" name="brd_Title" value="${update.brd_Title}"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">글쓴이</label>
				<div class="col-sm-3">
					<input style="cursor:not-allowed;" type="text" id="userName" name="userName" value="${update.userName}" readonly="readonly"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="repDate">작성일자</label>
				<div class="col-sm-3">
					<input style="cursor:not-allowed;" value="<fmt:formatDate value="${update.repDate}" pattern="yyyy-MM-dd"/>" readonly="readonly" />				
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="content">내용</label>
				<div class="col-sm-4">
					<textarea id="brd_Content" rows="10" cols="116" name="brd_Content" style="background:rgba(0,0,0,0.03); padding: 5px;"><c:out value="${update.brd_Content}" /></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<div class="but">
					<button type="submit" class="update_btn">저장</button>
					<button type="submit" class="cancel_btn">취소</button>
				</div>
			</div>
		</form>
	</section>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
</body>
</html>