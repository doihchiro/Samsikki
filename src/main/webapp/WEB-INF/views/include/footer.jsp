<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/include/header.jsp" />

	<style>
	*{
		font-family: 'Noto Sans KR', sans-serif;
		
		list-style: none;
		text-decoration: none;
		border-collapse: cokkapse;
		margin: 0px;
		padding: 0px;
		color: #000;
	}
	div.text ul li a{
		text-decoration-line:none;
		color:#000;
	}
	div.text ul li a:hover{
		font-weight:bold;
		cursor:pointer;
	}
	.f_logo img{
		width: 60%;
		height: 70%;
	}
	.footer_inner{
		border:1px solid rgba(0,0,0,0.0); 
		position:relative; 
		width:70%;
		height:300px;
		left:250px;
		right:150px;
	}
	#f_left{
		position:absolute; left:30px; bottom:20px; width:230px;
	}
	#f_center{
		position:absolute; left:570px; bottom:20px; width:200px;
	}
	#f_right{
		position:absolute; left:1000px; bottom:20px; width:370px;
	}
	</style>
</head>

<div id="footer">
	<div class="footer_inner">
		<div id="f_left" class="left">
			<div class="foot_logo">
				<a class="f_logo" href="/"><img src="/resources/images/logo09.png"  alt="삼식 푸터" title="HOME" /></a>
			</div>
			
			<div class="text">
				<ul>
					<li><a href="../../shop/about">About us</a></li>
					<li><a href="../../shop/agreement">Agreement</a></li>
					<li><a href="../../shop/policy">Privacy Policy</a></li>
					<li><a href="../../shop/guide">Guide</a></li>
					<li>
						<p class="copyright" style="margin:15px 0 0; font-size:0.9em;">Hosting by NHN Godo / <a href="https://hazeldesign.co.kr" target="_blank">Design by Hazel</a><br>Copyright samsikki all rights reserved.</p>
					</li>
				</ul>
			</div>
		</div>
		
		<div id= "f_center" class="text">
			<ul>
				<br/>
				<li>C/S Center</li>
				<li>02-733-8781</li>
				<li>Mon-Fri 11:00-17:00<br />
				Sat, Sun, Red day off<br />
				<br />
				Bank Account<br />
				삼식은행 372372-37-372372<br />
				SAMSIKKI(삼식컴퍼니)</li>
			</ul>
		</div>
		
		<div id="f_right" class="foot_cont">
			<div class="foot_info">
				<div class="text">
					<ul>
						<br/>
						<li>Company : SAMSIKKI(삼식컴퍼니)</li>
						<li>CEO : 최유나 전명길 최범용 정호상 정수호 홍준수</li>
						<li>Business License : <a>842-85-01564</a></li>
						<li>E-Commerce Permit : 2020-서울종로-2007호</li>
						<li>Tel : 02-733-8781</li>
						<li>Address : 서울특별시 종로구 종로 78 미려빌딩 6층 </li>
						<li>Personal Information Manager : SAMSIKKI CEO</li>
						<li>Contact <a>wnstn521@naver.com</a> for more information.</li>
					</ul>
				</div>
			</div>
		</div> <!-- //foot_cont -->
	</div> <!-- //"footer_inner" -->
</div> <!-- //"footer" -->




