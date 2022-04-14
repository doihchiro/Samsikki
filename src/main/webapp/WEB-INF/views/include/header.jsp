<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

<head>
	<style>
	*{
		font-family: 'Poppins', sans-serif;
	}
	.nav{
		width:100%;
		height:80px;
		background:rgba(0,0,0,0.0);
		display:flex;
		
		padding: 1rem;
		position: fixed;
		
		z-index:5;
		
		top: 0;
		left: 0;
		right: 0;
		justify-content: center;
		align-items: center;
	}
	.N:hover{
		background: #E3E3E3;
	}
	.nav > li{
		padding: 30px;
	}
	.nav > li a{
		text-align: center;
	}
	.nav > li a:hover{
		background:rgba(0,0,0,0.0);
		color: #000;
	}
	li a{
		color: #000;
	}
	ul, ol, li { list-style:none; margin:0; padding:0; }
	ul.nav > li { display:inline-block; width:130px; padding:30px 10px; 
				  text-align:-webkit-match-parent; position:relative; right:10px; }
	ul.nav > li:hover ul.submenu { display:block; }
	
	ul.nav > li ul.submenu { 
		display:none; 
		position:absolute; 
		top:30px;
		text-align:center; 
	}
	ul.nav > li ul.submenu > li { 
		display:inline-block; 
		width:160px; 
		padding:15px 20px; 
		background:#E3E3E3; 
		text-align:left; 
		border-bottom:1px solid #000; 
		right:5px; 
		cursor:pointer;
		transition: background .3s ease-in-out;
	}
	ul.nav > li ul.submenu > li#bottom { border-bottom:1px solid rgba(0,0,0,0.0); }
	ul.nav > li ul.submenu > li:hover { transition: background .3s ease-in-out; background:#FFF; }
	ul.nav > li ul.submenu > li a { text-decoration-line:none; }
	ul.nav > li.menu { padding:10px; cursor:pointer; }
	ul.nav > li.menu a#title { font-weight:bold; }
	</style>
</head>

<%@ include file="side.jsp" %>

<div id="container">
	<ul class="nav N">
		<li class="menu">
			<a id="title" href="../../shop/about">About</a>
		</li>
		
		<li class="menu">
			<a id="title" href="../../shop/list">Shop</a>
			<ul class="sub submenu">
				<br/>
				<br/>
				<li onclick="location.href='../../shop/list'">ALL</li>
				<li onclick="location.href='../../shop/list1'">cup</li>
				<li onclick="location.href='../../shop/list2'">plate</li>
				<li onclick="location.href='../../shop/list3'">bowl</li>
				<li onclick="location.href='../../shop/saleList'" id="bottom">SALE 세일</li>
			</ul>
		</li>
		
		<li class="menu">
			<a id="title">Board</a>
			<ul class="sub submenu">
				<br/>
				<br/>
				<li onclick="location.href='../../board/notice'" id="bottom">Notice</li>
			</ul>
		</li>
		
		<li class="menu">
			<a id="title">Account</a>
			<ul class="sub submenu">
				<br/>
				<br/>
				<c:if test="${member == null}">
					<li onclick="location.href='../../member/signin'">Log in</li>
					<li onclick="location.href='../../member/signup'" id="bottom">Register</li>
					<!-- <li onclick="location.href='#'">Order</li> -->
					<!-- <li onclick="location.href='#'" id="bottom">My Page</li> -->
				</c:if>
				
				<c:if test="${member != null}">
					<c:if test="${member.verify == 9}">
						<li onclick="location.href='../../admin/index'">Manager</li> 
					</c:if>
					
					<li onclick="location.href='../../member/profile'">My Page</li>
					<li onclick="location.href='../../member/signout'" id="bottom">Log out</li>
					<!-- <li onclick="location.href='#'">Order</li> -->
					<!-- <li onclick="location.href='#'" id="bottom">My Page</li> -->
				</c:if>
			</ul>
		</li>
	</ul>
</div>


</html>
