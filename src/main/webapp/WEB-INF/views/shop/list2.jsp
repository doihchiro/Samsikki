<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
   	<title>SAMSIKKI : 자체제작 디자인 테이블웨어</title>
   
   	<%@ include file="../include/topInclude.jsp" %>
   
   	<style>
	body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
	a { color:#05f; text-decoration:none; }
	
	h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
	ul, lo, li { margin:0; padding:0; list-style:none; }
	
	
	/* ---------- */
	
	/* div loot 뻄 */
	section#container::after { content:""; display:block; clear:both; }
	
	/* ---------- */
	
	header#header div#header_box { text-align:center; padding:40px 0 30px 0; }
	header#header div#header_box h1 { font-size:50px; }
	header#header div#header_box h1 a { color:#000; }
	
	/* 센터 맞추기 추가 */
	section#container { margin: 100px 300px 0 300px; }
	
	/* 푸터 다 뻄 */
	
	section#content ul li { display:inline-block; margin:10px; }
	section#content div.goodsThumb img { width:200px; height:200px; }
	section#content div.goodsName { padding:10px 0; text-align:center; }
	section#content div.goodsName a { color:#000; }
	
	/* 푸터 다 뻄 */
   	</style>
   
   	<style>
	/* 검색 영역 */
	.search_wrap{
		margin-top:15px;
	}
	.search_input{
	    position: relative;
	    margin-top: 100px;
	    text-align: center;
	    margin-left: 5px;
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
	    line-height: 20px;
	    position: absolute;
	    margin-left: 8px;
	    
	    border-radius: 0.5px;
	    background:#000; 
	    color:#E3E3E3; 
	    outline:1px solid #000; 
	    height:25px;
	    transition: background .3s ease-in-out;
	}
	.search_btn:hover{
		transition: background .3s ease-in-out;
		font-color: #000;
		background-color: #E3E3E3;
	}
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
	
	.next, .prev {
	    border: 1px solid #ccc;
	    padding: 0 10px;
	}
	.pageMaker_btn a:link {color: black;}
	.pageMaker_btn a:visited {color: black;}
	.pageMaker_btn a:active {color: black;}
	.pageMaker_btn a:hover {color: black;}
	.next a, .prev a {
	    color: #ccc;
	}
	
	.goodsPrice{
		text-align:center;
	}
	
   .goodsPrice1{
      text-align:center;
      text-decoration:line-through;
   }
   
      .salePrice{
      text-align:center;
   	color: blue;

   }
   .background { background:#EE8;
	color: red; }
	
	
	/* 카테고리 분류 */
	#kategorie { margin: 20px 10px; padding: 0 5px; background-color: #E3E3E3; }
	
	/* 가격순, 판매량순 버튼 */
	#content > .bb{
		margin: 0 0 20px 15px;
		background: rgba(0,0,0,0.03);
		color: #000;
		padding: 0 7px;
		transition: background .3s ease-in-out;
		border-radius: 4px;
	}
	#content > .tt{
		margin: 0 0 20px 5px;
		background: rgba(0,0,0,0.03);
		color: #000;
		padding: 0 7px;
		transition: background .3s ease-in-out;
		border-radius: 4px;
	}
	#content > button:hover {
		background: #000;
		color: #E3E3E3;
		transition: background .3s ease-in-out;
	}
	</style>
</head>
<body>
	<div id="root">
	   	<header id="header">
	      	<div id="header_box">
	         	<%@ include file="../include/header.jsp" %>
	      	</div>   
	   	</header>
		
	   	<section id="container">
	      	<div id="container_box">
	         	<section id="content">
	            	<ul>
			            <c:if test="${listcheck != 'empty' }">
			               <c:forEach items="${list2}" var="list2">
				               <li>
				                  	<div class="goodsThumb">
				                     	<img src="${list2.gdsThumbImg}">
				                  	</div>
				                  	<div class="goodsName">
				                     	<a href="/shop/view?n=${list2.gdsNum}">${list2.gdsName}</a>
				                  	</div>
				                  	<c:if test="${list2.gdsRate == '0' }">
                                 <div class="goodsPrice">
                                    상품가격: <fmt:formatNumber pattern="###,###,###" value="${list2.gdsPrice}"/> 원
                                 </div>
                                 <div>
                                 &nbsp;
                              </div>
                              </c:if>
                              
                              <c:if test="${list2.gdsRate != '0' }">
                                 <div class="goodsPrice1">
                                    상품가격: <fmt:formatNumber pattern="###,###,###" value="${list2.gdsPrice}"/> 원
                                 </div>
                              </c:if>
                              
                              <c:if test="${list2.gdsRate != '0' }">
                                 <div class="salePrice">
                                    할인가격: <fmt:formatNumber pattern="###,###,###" value="${(list2.gdsPrice*(100-list2.gdsRate))/100}"/> 원
                                     <span class="background">(<fmt:formatNumber value="${list2.gdsRate}" />%)할인</span>
                                 </div>
                              </c:if>

				               	</li>
			               	</c:forEach>
			            </c:if>
	            	</ul>
	            	
		            <c:if test="${listCheck == 'empty' }">
		               	<div class="table_empty" style="text-align:center; margin: 100px 0;">
		                  	상품이 없습니다.
		               	</div>
		            </c:if>
	         	</section>
	      		
	         	<!-- 검색 영역 -->
	            <div class="search_wrap">
	               	<form id="searchForm" action="/shop/list1" method="get">
	                   	<div class="search_input">
	                       	<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
	                       	<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
	                       	<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
	                       	<button class='btn search_btn'>Search</button>                            
	                   	</div>
	                </form>
	            </div>
	        	
	            <!-- 페이징 영역 -->
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
		                      	<a id="atag" href="/shop/list2?pageNum=${num }">${num}</a>
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
		            <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	            </form>
	        </div>        
	   	</section>
	   
	   	<footer id="footer">
	      	<div id="footer_box">
	         	<%@ include file="../include/footer.jsp" %>
	      	</div>
	   	</footer>
	</div>
	
	<script>
		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');
		
		/* 작거 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e){
		   
		   	e.preventDefault();
		   
		   	/* 검색 키워드 유효성 검사 */
		   	if(!searchForm.find("input[name='keyword']").val()){
		      	alert("키워드를 입력하십시오");
		      	return false;
		   	}
		   
		   	searchForm.find("input[name='pageNum']").val("1");
		   
		   	searchForm.submit();
		   
		});
		
		/* 페이지 이동 버튼
		$(".pageMaker_btn a").on("click", function(e){
		   
		   	e.preventDefault();
		   
		   	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		   
		   	moveForm.submit();
		   
		}); */
	</script>
</body>
</html>