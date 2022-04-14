<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<!-- 한글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/include/header.jsp" />
	
	<%@ include file="../../include/topInclude.jsp" %>
	
	<title>MANAGER : 상품 목록(List)</title>
	
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
	<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
	
	section#container { margin: 100px 200px; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	div.search_input{ text-align: center; margin-left: 50px; }
	div.search_input > input{ width: 300px; margin-top: 50px; }


	#container_box table td {width:500px; }
	
	#container_box table { width:100%; }
	#container_box table th { font-size:20px; font-weight:bold; text-align:center; padding:10px; border-bottom:2px solid #666; }
	#container_box table tr:hover { background:#eee; }
	#container_box table td { padding:10px; text-align:center; }
	#container_box table img { width:150; height:auto; }

	
	/* 사이드 높이 */
	#header { margin-top: 40px; }
	
	/* 페이지 버튼 인터페이스 */
	.pageMaker_wrap{
		text-align: center;
	    margin-top: 30px;
	    margin-bottom: 40px;
	}
	.pageMaker{
	    list-style: none;
	    display: inline-block;
	}	
	.pageMaker_btn {
		float: left;
	    width: 40px;
	    height: 40px;
	    line-height: 40px;
	}
	.active{
		border : 2px solid black;
		font-weight:400;
	}
	.next, .prev {
	    border: 1px solid #ccc;
	    padding: 0 10px;
	}
	.pageMaker_btn a:link {color: black;}
	.pageMaker_btn a:visited {color: black;}
	.pageMaker_btn a:active {color: black;}
	.pageMaker_btn a:hover {color: black;}
	
	.next a, .prev a { color: #ccc; }
	</style>
</head>
<body>
	<div id="root">
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
			
			<div id="container_box">
				<table>
					<thead>
						<tr>
							<th>사진</th>
							<th>이름</th>
							<th>카테고리</th>
							<th>정상가격</th>
							<th>세일가격</th>
							<th>수량</th>
							<th>등록날짜</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>
									<img src="${list.gdsThumbImg}">
								</td>
								<td>
									<a href="/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a>
								</td>
								<td>
								 	${list.cateCode}
			 					</td>
								<td>
								    <fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,###"/>
								</td>
								<td>
								    <fmt:formatNumber value="${(list.gdsPrice*(100-list.gdsRate))/100}" pattern="###,###,###"/>
								</td>
								<td>
									${list.gdsStock}
								</td>
								<td>
									<fmt:formatDate value="${list.gdsDate}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<!-- 검색 영역 -->
		       	<div class="search_wrap">
		      		<form id="searchForm" action="/admin/goods/list" method="get">
		       			<div class="search_input">
		           			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
		           			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
		           			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
		           			<button class='btn search_btn'>Search</button>                				
		       			</div>
		       		</form>
		       	</div>
				
				<!-- 페이징 처리-->
		        <div class="pageMaker_wrap">
		        	<ul class="pageMaker">
						
						<!-- 이전 버튼 -->
						<c:if test="${pageMaker.prev }">
							<li class="pageMaker_btn prev">
								<a href="${pageMaker.startPage -1}">이전</a>
							</li>
						</c:if>
						
						<!-- 페이지 번호 -->
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
							<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
								<a href="/admin/goods/list?pageNum=${num }">${num}</a>
							</li>	
						</c:forEach>
						
						<!-- 다음 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageMaker_btn next">
								<a href="${pageMaker.endPage + 1 }">다음</a>
							</li>
						</c:if>
						
		            </ul>
		        </div>
				
				<form id="moveForm" method="get" >
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				</form>
				
			</div>	
		</section>
		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>