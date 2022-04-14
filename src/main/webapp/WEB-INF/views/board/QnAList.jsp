<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
	<%@ include file="../include/topInclude.jsp" %>	
	
	<title>SAMSIKKI : 자체제작 디자인 테이블웨어</title>
	
	<style>
	body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
	a { color:#000; text-decoration:none; }
	a:hover { color:#000; text-decoration:underline; }
	
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
	
	#num{ /* 번호 */
		width: 17.5%;
	}
	#tit{ /* 제목 */
		width: 53%;
	}
	#make{ /* 작성자 */
		width: 17.5%;
	}
	#reg{ /* 등록일 */
		width: 12%;
	}
	#keywordInput{ /* 검색창 */
		background: rgba(0,0,0,0.02);
		border-radius: 2px;
	}
	.btn-default{ /* 검색버튼 */
		background: rgba(0,0,0,0);
		color: #000;
		border-radius: 2px;
	}
	#choice{ /* 선택란 */
		background: #E3E3E3;
		color: #000;
		border-radius: 2px;
		
		margin-right: 3.5px;
		padding: 2px 2px;
		margin-bottom: 1px;
	}
	.pagination > li:last-child > a{ /* 페이지번호박스 */
		background: #E3E3E3;
		color: #000;
		border-radius: 2px;
	}
	.pagination > li:last-child > a:hover{ /* 페이지번호박스 효과 */
		background: rgba(0,0,0,0.03);
	}
	a{ /* 제목 글자 색 */
		color: #000;
	}
	a:hover{ /* 제목 글자 효과 */
		text-decoration:none;
		color: #000;
		font-weight: bolder;
	}
	a#atag{
		padding: 5px 12px;
		border: 1px solid #000;
		transition: background .3s ease-in-out;
	}
	a#atag:hover{
		background: #F5F5F5;
		font-weight: normal;
		transition: background .3s ease-in-out;
	}
	
	.search_input{
	    text-align:center;
	    margin: 50px 90px 0 0;
	}
	
	.search_input input[name='keyword']{
		padding: 4px 10px;
	    font-size: 15px;
	    background:#E3E3E3; 
	    border-radius:2px; 
	    width:300px; 
	    height:26px;"
	}
	.btn{
		padding: 0 0 2px 0;
	}
	.search_btn{
	    width: 80px;
	    font-weight: 300;
	    font-size: 15px;
	    position: absolute;
	    margin: 0 0 0 8px;
	    
	    border-radius: 0.5px;
	    background:#000; 
	    color:#FFF; 
	    outline:1px solid #000; 
	    height:25px;
	    transition: background .3s ease-in-out;
	}
	.search_btn:hover{
		transition: background .3s ease-in-out;
		font-color: #000;
		background-color: #E3E3E3;
	}
	
	.pageMaker_wrap{
		text-align: center;
	    margin-top: 30px;
	    margin-bottom: 40px;
	}
	.pageMaker{
	    list-style: none;
	    display: inline-block;
	}	
	.pageMaker_btn{
	    float: left;
	    width: 40px;
	    height: 40px;
	    line-height: 40px;
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
		<header>
			<h5><b>상품문의</b></h5>
		</header>
		
		<section id="container">
			<form role= "form" method="post">
				<table class="table table-hover">
					<thead>
						<tr><th id="num">번호</th><th id="tit">제목</th><th id="make">작성자</th><th id="reg">등록일</th></tr>
					</thead>
					
					<c:forEach items="${QnA}" var = "QnA">
						<tr>
							<c:set var = "secret" scope="session" value="${QnA.secret }" />
							<c:choose>
								<c:when test ="${secret == 1 }">
									<td><c:out value="${QnA.brdNum}"/><span class="glyphicon glyphicon-lock"></span></td>
									<td><a class ="QnAbtn${QnA.brdNum }" href="#" ><c:out value="${QnA.brd_Title}" /></a></td>
									<input type="hidden" name="brdNum" id="brdNum" value="${QnA.brdNum}">
									<input type="hidden" name="verify" id="berify" value="${QnA.verify }">
								</c:when>
								<c:when test ="${secret == 0 }">
									<td><c:out value="${QnA.brdNum}"/></td>
									<td><a href="/shop/QnADetail?brdNum=${QnA.brdNum }" ><c:out value="${QnA.brd_Title}" /></a></td>
								</c:when>
							</c:choose>
							
							<td><c:out value="${QnA.userName}" /></td>
							<td><fmt:formatDate value="${QnA.repDate}" pattern="yyyy. MM. dd."/></td>
						</tr>
						
						<script>
						$(document).on("click", ".QnAbtn${QnA.brdNum }", function(){
							
							var brdNum = $("#brdNum").val();
							
							var data = { brdNum : brdNum};
							
							$.ajax({
								url : "/shop/QnADetail",
								type : "post",
								data : data,
								success : function(result){
									
									if(result == 1 ) {
										location.href = "/shop/QnADetail?brdNum=${QnA.brdNum}";
								 	} else {
										alert("비밀글입니다.")
									}
								},
								error : function() {
									alert("로그인하셔야합니다.")
								}
							});
							
						});
						</script>
					</c:forEach>
				</table>
				
				<div class="search row">
					<div class="search_wrap">
						<div class="search_b">
							<div class="search_input">
								<select id="choice" name="searchType">
									<option value ="n" <c:out value = "$(scri.seachType == null ? 'selected' : '')"/>>---선택---</option>
									<option value ="t" <c:out value = "$(scri.seachType eq 't' ? 'selected' : '')"/>>제목</option>
									<option value ="c" <c:out value = "$(scri.seachType eq 'c' ? 'selected' : '')"/>>내용</option>
									<option value ="u" <c:out value = "$(scri.seachType eq 'w' ? 'selected' : '')"/>>작성자</option>
									<option value ="tc" <c:out value = "$(scri.seachType eq 'tc' ? 'selected' : '')"/>>제목+내용</option>
								</select>
								
								<input type="text" name="keyword" value='<c:out value ="${scri.keyword}"></c:out>' />
								<button type="submit" class='btn search_btn'>Search</button>
							</div>
						</div>
					</div>
					
					<script>
						$(function(){
							$('#searchBtn').click(function(){
								self.location = "QnA" + '${pageMaker.makeQuery(1)}' + "$searchType=" + $("select option:selected").val()
							});
						});
					</script>
				</div>
				
				<div class="pageMaker_wrap">
					<ul class="pageMaker">
						<!-- 이전 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="pageMaker_btn prev">
								<a href="notice${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
							</li>
						</c:if> 
						
						<!-- 페이지 번호 -->
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li class="pageMaker_btn" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>   
								<a id="atag" href="notice${pageMaker.makeSearch(idx)}">${idx}</a>
							</li>
						</c:forEach>
						
						<!-- 다음 버튼 -->
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="pageMaker_btn next">
								<a href="notice${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
							</li>
						</c:if> 
					</ul>
				</div>
			</form>
		</section>
	</div>
	
  	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
</body>
</html>