<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<!-- 한글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/include/header.jsp" />
	
	<%@ include file="../../include/topInclude.jsp" %>
	
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>	
	
 	<title>MANAGER : 공지사항(Notice)</title>
	
	<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
	
	section#container { margin: 100px 200px }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	#container > form { margin-left: 200px; }
	.col-md-offset-3 { margin: 0;text-align: center; }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	/* 사이드 높이 */
	#header { margin-top: 40px; }
	
	#num { padding-right: 100px; }
	#tit { padding-right: 330px; }
	#m { padding-right: 100px; }
	
	nav > button { width: 70px; padding: 2px 5px; }
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
		
		<section id="container">
			<aside>
				<%@ include file="../include/aside.jsp" %>
			</aside>
			
			<nav>
				<button type="button" onclick="location.href='notice'">글 작 성</button>
			</nav>
			<hr />
			
			<form role= "form" method="get">
				<table class="table table-hover">
					<thead>
						<tr><th id="num">번호</th><th id="tit">제목</th><th id="m">작성자</th><th>등록일</th></tr>
					</thead>
					
					<c:forEach items="${list}" var = "list">
						<tr>
							<td><c:out value="${list.brdNum}" /></td>
							<td>
								<a href="/admin/notice/noticeView?brdNum=${list.brdNum }&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.brd_Title}" /></a>
							</td>
							<td><c:out value="${list.userName}" /></td>
							<td><fmt:formatDate value="${list.repDate}" pattern="yyyy년MM월dd일"/></td>
						</tr>
					</c:forEach>
				</table>
				
				<div class="search row">
					<div class="col-xs-2 col-sm-2" style="margin-left:170px;">
						<select name = "searchType" class="form-control">
							<option value ="n" <c:out value = "$(scri.seachType == null ? 'selected' : '')"/>>---선택---</option>
							<option value ="t" <c:out value = "$(scri.seachType eq 't' ? 'selected' : '')"/>>제목</option>
							<option value ="c" <c:out value = "$(scri.seachType eq 'c' ? 'selected' : '')"/>>내용</option>
							<option value ="u" <c:out value = "$(scri.seachType eq 'w' ? 'selected' : '')"/>>작성자</option>
							<option value ="tc" <c:out value = "$(scri.seachType eq 'tc' ? 'selected' : '')"/>>제목+내용</option>
						</select>
					</div>
					
					<div class="col-xs-10 col-sm-5">
						<div class="input-group">
							<input type="text" name="keyword" id="keywordInput" value ="${scri.keyword}" class="form-control"/>
							<span class="input-group-btn">
								<button id ="searchBtn" type="button" class="btn btn-default">검색</button>
							</span>
						</div>
					</div>
					
					<script>
						$(function(){
							$('#searchBtn').click(function(){
								self.location = "list" + '${pageMaker.makeQuery(1)}' + "$searchType=" + $("select option:selected").val()
							});
						});
					</script>
				</div>
				
  				<div class="col-md-offset-3">
				  	<ul class="pagination">
					    <c:if test="${pageMaker.prev}">
					    	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if>
						
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					 		<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>   
					    	<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
					    </c:forEach>
						
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if>
			  		</ul>
				</div>
			</form>
		</section>
		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>

