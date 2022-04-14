<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<style>
	.cartLogo{
		position: absolute;
	    top: 90px;
	    left: 66px;
	}
	.menuLogo{
	    position: absolute;
	    top: 85px;
	    right: 55px;
	}
	.searchLogo{
	    position: absolute;
	    top: 140px;
	    right: 65px;
	}
	.samsikLogo{
	    position: absolute;
	    top: 470px;
	    left: 23px;
	}
	.instagramLogo{
	    position: absolute;
	    top: 690px;
	    right: 65px;
	}
	.facebookLogo{
	    position: absolute;
	    top: 720px;
	    right: 65px;
	}		
	body{
		background: #E3E3E3;
	}
	#pos{
		position: fixed;
		width: 100%;
	}
	</style>
</head>
<body>
	<div id="pos">
		<div class="cartLogo">
			<a href="../shop/cartList">
				<img src="/resources/images/cart01.png" alt="장바구니" title="BASKET" width= "30px" height= "30px" />
			</a>
		</div>
		
		<div class="menuLogo">
			<a href="">
				<img src="/resources/images/menu.png" alt="메뉴" title="MENU" width= "50px" height= "40px" />
			</a>
		</div>
		
		<div class="searchLogo">
			<a href="">
				<img src="/resources/images/search.png" alt="검색" title="SEARCH" width= "28px" height= "28px" />
			</a>
		</div>
		
		<div class="samsikLogo">
			<a href="/">
				<img src="/resources/images/logo08.png" alt="삼식 사이드" title="HOME" width= "100px" height= "280px" />
			</a>
		</div>
		
		<div class="instagramLogo">
			<a href="https://www.instagram.com/samsikki_com/">
				<img src="/resources/images/instagramLogo.png" alt="인스타그램" title="INSTAGRAM" width= "26px" height= "26px" />
			</a>
		</div>
		
		<div class="facebookLogo">
			<a href="https://www.facebook.com/profile.php?id=100075126859168">
				<img src="/resources/images/facebookLogo.png" alt="페이스북" title="FACEBOOK" width= "26px" height= "26px" />
			</a>
		</div>
	</div>
</body>
</html>