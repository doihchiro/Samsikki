<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>SAMSIKKI : 자체제작 디자인 테이블웨어</title>
	
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
	<%@ include file="../include/topInclude.jsp" %>
	
	<style>
	body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
	a { color:#05f; text-decoration:none; }
	a:hover { text-decoration:underline; }
	
	section#container::after { content:""; display:block; clear:both; }
	
	header#header div#header_box { text-align:center; padding:40px 0 30px 0; }
	
	section#container { padding: 70px 300px 80px 300px; }
	
	#content{
		text-align: center;
		word-spacing: 2px;
	}
	.logo{
		margin: 50px;
	}
	
	#origin{
		text-decoration: none;
		color: #000;
	}
	#origin:hover{ 
		font-weight: bolder;
	}
	</style>
	
</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>	
	</header>
	
	<div id="root">
		<section id="container">
			<div id="container_box">
				<section id="content">
					<header>
						<h5><b>About us</b></h5>
						<br/>
					</header>
					
					<h3><b>" 디자인 테이블웨어의 새로운 제안 "</b></h3>
					
					<div class="logo">
						<img src="../resources/images/samsikCircle.png" alt="로고" title="LOGO" 
							width="200px" height="150px" />
					</div>
					
					<h5>
						<b>삼식기</b>의 모든 제품들은<br/>
						도예를 전공한 디자이너들이 직접 디자인하고,<br/>
						100% 국내 수작업으로 생산되는 자체 제작 상품입니다.
					</h5>
					<h5>
						도자 전공자로서 도자의 특성을 충분히 이해하고,<br/>
						도자기와 그래픽(패턴) 디자인의 접목을 시도하여<br/>
						감각적이고 유니크한 디자인의 테이블웨어를 합리적인 가격으로 만들어나가고자 합니다.
					</h5>
					<br/>
					<br/>
					
					<h3><b>Making Story</b></h3>
					<br/>
					<h5>
						음식을 담는 식기는 식생활과 가장 밀접한 도구이기에, 무엇보다 안전해야합니다.<br/>
						<br/>
						<b>삼식기</b>의 모든 도자 제품은 경기도 여주에서 핸드메이드로 제작되는 100% 국내산 도자기이며,<br/>
						검사기관의 '용출시험검사' 에서 납, 카드뮴 등의 유해물질 불검출로 평가되어<br/>
						안정성을 인정 받았습니다.<br/>
						<br/>
						<b>삼식기</b>의 모든 도자 제품은<br/>
						성형-초벌-재벌-전사지 부착-소성(삼벌) 의 5단계 과정을 거쳐 제작됩니다.<br/>
						전 과정 핸드메이드 제작으로, 차별화된 정성이 들어가있습니다.
					</h5>
					<br/>
					<br/>
					
					<h3><b>Meaning of Samsikki</b></h3>
					<br/>
					<h5>
						<b>삼식기</b>는 우리나라에 가장 보편화된 식사문화 '삼시세끼' 와<br/>
						그릇을 표현하는 '식기' 를 더해 탄생한 상호로서<br/>
						삼시세끼를 먹는 동안 가장 행복한 시간을 보내시길 바라는 마음으로 네이밍하게 되었습니다.
					</h5>
					<br/>
					<br/>
					
					<h3><b>Developer</b></h3>
					<br/>
					<h5>
						<b>Front-end</b>	홍준수 /
						<b>Back-end</b>		정수호 정호상 최범용 전명길 /
						<b>Database</b>		최유나
					</h5>
					<br/>
					<br/>
					
					<h3><b>Origin</b></h3>
					<br/>
					<h5>
						<b>카루셀리</b><br/>
						<a id="origin" href="https://www.karuselli.co.kr/">
							www.karuselli.co.kr
						</a>
					</h5>
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
