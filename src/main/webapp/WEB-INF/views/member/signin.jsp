<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<%@ include file="../include/topInclude.jsp" %>
	
	<title>SAMSIKKI : 자체제작 디자인 테이블웨어</title>
	
	<style>
	#content{
		text-align: center;
		margin: 100px 200px;
	}
	.member_tit{
		margin: 50px 0;
	}
	form{
		padding-top: 100px;
		width: 100%;
	}
	form > div > input{
		border-top-width: 0;
		border-right-width: 0;
		border-bottom-width: 1px;
		border-left-width: 0;
		background-color: rgba(0,0,0,0.0);
		height: 40px;
		width: 246px;
	}
	#signin_btn{
		width: 250px;
		background-color: #000;
		text-align: center;
		color: #FFF;
		border-width: 1px solid #000;
		height: 40px;
		margin: 10px 0 15px 5px;
		border-radius: 2px;
		transition: background .3s ease-in-out;
	}
	#signin_btn:hover{
		transition: background .3s ease-in-out;
		color: #000;
		background: #E3E3E3;
	}
	.input_area{
		margin: 0 0 10px 0;
	}
	input{
		padding-left: 10px;
		padding-right: 10px;
	}
	#L{
		margin: 65px 0 15px 0;
	}
	#inc{
		margin-top: -60px;
	}
	p{
		margin: 10px 0;
	}
	</style>
</head>
<body>
	<div id="inc">
		<%@ include file="../include/header.jsp" %>
	</div>
	
	<div id="root">
		<section id="container">
			<div id="container_box">
				<section id="content">
	 				<form role="form" method="post" autocomplete="off">
	 					<div class="member_tit">
	 						<label id="L">로그인</label>
	 					</div>
	 					
	  					<div class="input_area">
	   						<label for="userId"></label>
	   						<input type="email" id="userId" name="userId" alt="이메일" placeholder="E-Mail" required="required" size="30" autocomplete="on" />      
	  					</div>
	  					
	  					<div class="input_area">
	   						<label for="userPass"></label>
	   						<input type="password" id="userPass" name="userPass" alt="비밀번호" placeholder="Password" required="required" size="30" />      
	  					</div>
	  					
	  			        <button type="submit" id="signin_btn" name="signin_btn">Log In</button>
	  			        
	  			        <c:if test="${msg == false }">
	  			        	<p style="color:#f00;">아이디 또는 비밀번호를 다시 확인하세요.</p>
	  			        	<p style="color:#f00;">삼식기에 등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하였습니다.</p>
	  			        </c:if>
				 	</form>   
				</section>
			</div>	
		</section>
	</div>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
</body>
</html>
