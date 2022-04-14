<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
	#menu { margin: 100px 300px 50px 300px; }
</style>

<div id="menu">
	<ul id="nav">
		<c:if test="${member != null }">
			<li>
				<a href="/">구매자 화면</a>
			</li>
			<li>
				<a href="/member/signout">로그아웃</a>
			</li>
		</c:if>
	</ul>
</div>