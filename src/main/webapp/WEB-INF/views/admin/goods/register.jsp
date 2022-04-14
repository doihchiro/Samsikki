<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<!-- 한글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/include/header.jsp" />
	
	<%@ include file="../../include/topInclude.jsp" %>
	
	<meta charset="UTF-8">
	<title>MANAGER : 상품 등록(Register)</title>
	
	<script src="/resources/js/jquery-3.6.0.js"></script>

	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
	<script src="/resources/ckeditor/ckeditor.js"></script>
	
	<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
	
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
	
	section#container { margin: 100px 200px; }
	section#container::after { content:""; display:block; clear:both; }
	
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	/* 사이드 높이 */
	#header { margin-top: 40px; }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	
	.inputArea { margin:10px 0; }
	select { width:100px; }
	label { display:inline-block; width:70px; padding:5px; }
	label[for='gdsDes'] { display:block; }
	input { width:150px; }
	textarea#gdsDes { width:400px; height:180px; }
	
	.select_img img { margin:20px 0;}
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
				<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
		 			<div class="inputArea">
						<label>카테고리</label>
						<select class="cateCode" id="cateCode" name="cateCode">
							<option value="">전체</option>
							<option value="100">CUP</option>
							<option value="200">PLATE</option>
							<option value="300">BOWL</option>
						</select>
						 
						<script>
							var cateCode = document.getElementById("cateCode");
							var cateCode = cateCode.option[cateCode.selectedIndex].value;
						</script>
					</div>
					
					<div class="inputArea">
						<label for="gdsName">상품명</label>
						<input type="text" id="gdsName" name="gdsName" />
					</div>
					
					<div class="inputArea">
						<label for="gdsPrice">상품가격</label>
						<input type="text" id="gdsPrice" name="gdsPrice" />
					</div>
					
					<div class="inputArea">
						<label for="gdsRate">할인율</label>
						<input type="text" id="gdsRate" name="gdsRate" />
					</div>
					
					<div class="inputArea">
						<label for="gdsStock">상품수량</label>
						<input type="text" id="gdsStock" name="gdsStock" />
					</div>
					
					<div class="inputArea">
						<label for="gdsDes">상품소개</label>
						<textarea rows="5" cols="50" id="gdsDes" name="gdsDes"></textarea>
						
						<script>
							var ckeditor_config = {
								
								resize_enaleb : false,
								enterMode : CKEDITOR.ENTER_BR,
								shiftEnterMode : CKEDITOR.ENTER_P,
								filebrowserUploadUrl : "/admin/goods/ckUpload"
								
							};
							
							CKEDITOR.replace("gdsDes", ckeditor_config);
						</script>
					</div>
					
					<div class="inputArea">
						<label for="gdsImg">이미지</label>
						<input type="file" id="gdsImg" name="file" />
						<div class="select_img"><img src="" /></div>
						
						<script>
						 	$("#gdsImg").change(function(){
								if(this.files && this.files[0]) {
									var reader = new FileReader;
									reader.onload = function(data) {
										$(".select_img img").attr("src", data.target.result).width(500);
								 	}
							  		reader.readAsDataURL(this.files[0]);
							 	}
						 	});
						</script>
						
						<%=request.getRealPath("/") %>	
						
					</div>
					
					<div class="inputArea">
						<button type="submit" id="register_Btn">등록</button>
					</div>
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
	// 컨트롤러에서 데이터 받기
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);
	
	var cate1Arr = new Array();
	var cate1Obj = new Object();
	
	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
	 
		if(jsonData[i].level == "1") {
			cate1Obj = new Object();  //초기화
			cate1Obj.cateCode = jsonData[i].cateCode;
			cate1Obj.cateName = jsonData[i].cateName;
			cate1Arr.push(cate1Obj);
		}
	}
	
	// 1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.category1")
	
	for(var i = 0; i < cate1Arr.length; i++) {
		cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
	    	+ cate1Arr[i].cateName + "</option>"); 
	}
	
	$(document).on("change", "select.category1", function(){
		
		var cate2Arr = new Array();
		var cate2Obj = new Object();
		
		// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < jsonData.length; i++) {
			
			if(jsonData[i].level == "2") {
				cate2Obj = new Object();  //초기화
				cate2Obj.cateCode = jsonData[i].cateCode;
				cate2Obj.cateName = jsonData[i].cateName;
				cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
				
				cate2Arr.push(cate2Obj);
			}
		}
		
		var cate2Select = $("select.category2");
		
		/*
		for(var i = 0; i < cate2Arr.length; i++) {
			cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
		    	+ cate2Arr[i].cateName + "</option>");
		}
		*/
		
		cate2Select.children().remove();
		
		$("option:selected", this).each(function(){
		  
			var selectVal = $(this).val();  
		  
			cate2Select.append("<option value='" + selectVal + "'>전체</option>");
		  
			for(var i = 0; i < cate2Arr.length; i++) {
				if(selectVal == cate2Arr[i].cateCodeRef) {
		    		cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
		        	+ cate2Arr[i].cateName + "</option>");
		   		}
		  	}
		  
		});
		
	});
	</script>
	
	<script>
	var regExp = /[^0-9]/gi;
	
	$("#gdsPrice").keyup(function(){ numCheck($(this)); });
	$("#gdsStock").keyup(function(){ numCheck($(this)); });
	
	function numCheck(selector) {
		var tempVal = selector.val();
		selector.val(tempVal.replace(regExp, ""));
	}
	</script>
</body>
</html>