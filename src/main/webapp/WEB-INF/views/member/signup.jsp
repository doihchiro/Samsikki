<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
   	<%@ include file="../include/topInclude.jsp" %>

   	<title>SAMSIKKI : 자체제작 디자인 테이블웨어</title>
   
   	<style>
	form{
	   padding: 100px 90px 0 90px;
	}
	#content{
	   margin: 100px 200px;
	}
	.member_tit{
	   text-align: center;
	   margin: 0 0 50px 0;
	}
	.input_area{
	   border-bottom:1px solid #000;
	}
	input{
	   padding: 3px 10px;
	   background-color: rgba(0,0,0,0);
	   border-width: 1px;
	}
      
      
	/* 이메일 */
	input#userId{
		width: 407px;
	}
	.input_area > span > label{
	   	width: 25%;
	}
	.input_area > input{
	   	width: 50%;
	}
	label{
	   	margin: 15px 0 15px 10px;
	}
	#T{
	   	margin: 15px 0;
	}
	#inc{
	   	margin-top: -60px;
	}
	
	/* 중복검사 */
	button#emailCheck{
		transition: background .3s ease-in-out;
		background: #EEE;
		width: 200px;
		height: 28px;
		padding-bottom:1px;
		border-radius: 2px;
	}
	button#emailCheck:hover{
      	transition: background .3s ease-in-out;
      	background: rgba(0,0,0,0.02);
    }
      
    #signup_btn{
		width: 122px;
		background-color: #000;
		text-decoration: none;
		text-align: center;
		color: #FFF;
		border-width: 1px solid #000;
		height: 40px;
		border-radius: 2px;
		transition: background .3s ease-in-out;
	}
    #signup_btn:hover{
        transition: background .3s ease-in-out;
        color: #000;
        background: #E3E3E3;
    }
    #cancel_btn{
        width: 122px;
        background-color: rgba(0,0,0,0);
        text-decoration: none;
        text-align: center;
        color: #000;
        height: 40px;
        margin-top: 50px;
        border-width: 1px;
        border-radius: 2px;
        transition: background .3s ease-in-out;
    }
    #cancel_btn:hover{
        transition: background .3s ease-in-out;
        color: #FFF;
        background: #000;
    }
    span.bt{
        margin: 50px 0 0 484px;
    }
      
    /* 주소 입력창 */
	input#sample2_postcode{ /* 우편번호 */
		width: 407px;
		background: #E3E3E3;
	}
	input#find{ /* 우편번호 찾기 */
      	width: 200px;
      	transition: background .3s ease-in-out;
     		background: #EEE;
    }
    input#find:hover{ /* 우편번호 찾기 */
      	transition: background .3s ease-in-out;
     		background: rgba(0,0,0,0.02);
    }
	input#sample2_address{ /* 주소 */
		margin-bottom: 5px;
		width: 610px;
		background: #E3E3E3;
	}
	input#sample2_detailAddress{ /* 상세주소 */
		width: 407px;
		background: #E3E3E3;
		margin-bottom: 10px;
	}
	input#sample2_extraAddress{ /* 참고항목 */
		width: 200px;
		background: #E3E3E3;
	}
	
	span.bt{
		text-align: center;
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
	                      	<h5><b>회원가입</b></h5>
	                   	</div>
	                   
	                   	<div class="input_area">
	                      	<div id="T">기본정보</div>
	                   	</div>
	                   
	                   	<div class="input_area">
	                     	<span id="label">
	                         	<label for="realName">성명</label>
	                      	</span>
	                      
	                      	<input type="text" id="realName" name="realName" placeholder="이름을 입력하세요." required="required" maxlength="35" />      
	                  	</div>
	                  
	                  	<div class="input_area">
	                     	<span id="label">
	                         	<label for="birth">생년월일</label>
	                      	</span>
	                      
	                      	<input type="text" id="birth" name="birth" placeholder="ex)19900801" required="required" maxlength="35" />      
	                  	</div>
	                   
	                  	<div class="input_area">
	                     	<span id="label">
	                         	<label for="userId">이메일</label>
	                      	</span>
	                      
	                      	<input type="email" id="userId" name="userId" placeholder="samsikki@email.com" required="required" maxlength="35" />
	                      	<button type="button" id= "emailCheck" onclick="fn_emailCheck();" value="N">중복검사</button>       
	                  	</div>
	                  
	                  	<div class="input_area">
	                     	<span id="label">
	                         	<label for="userPass">비밀번호</label>
	                      	</span>
	                      
	                      	<input type="password" id="userPass" name="userPass" required="required" maxlength="15" />      
	                  	</div>
	                  
	                  	<div class="input_area">
	                     	<span id="label">
	                         	<label for="userName">닉네임</label>
	                      	</span>
	                      
	                      	<input type="text" id="userName" name="userName" required="required" maxlength="10" />      
	                  	</div>
	                  
	                  	<div class="input_area">
	                     	<span id="label">
	                         	<label for="userPhon">휴대폰번호</label>
	                      	</span>
	                      
	                      	<input type="text" id="userPhon" name="userPhon" placeholder="- 없이 입력하세요." required="required" maxlength="13" />      
	                  	</div>
	                  
	               		<div class="input_area">
	               	  		<span id="label">
	                  			<label for="userAdd">주소</label>
	                  		</span>
	                  		
	                  		<input type="text" id="sample2_postcode" placeholder="우편번호">
	                  		<input type="button" id="find" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
	               			
	               			<span id="label">
	               				<label></label>
	               			</span>
	                  		<input type="text" name="userAddr1" id="sample2_address" placeholder="주소"><br>
	                  		
	                 		<span id="label">
	               				<label></label>
	               			</span>
	               			
	                  		<input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="상세주소">
	                  		<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="참고항목">
	               			
	               			<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
	               			<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
	               				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	               			</div>
	               			
	               			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	               			<script>
	                   			// 우편번호 찾기 화면을 넣을 element
	                   			var element_layer = document.getElementById('layer');
	                  			
	                   			function closeDaumPostcode() {
	                       			// iframe을 넣은 element를 안보이게 한다.
	                       			element_layer.style.display = 'none';
	                   			}
	                  			
	                   			function sample2_execDaumPostcode() {
	                       			new daum.Postcode({
	                           			oncomplete: function(data) {
	                               			// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	                           				
	                               			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                               			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                               			var addr = ''; // 주소 변수
	                               			var extraAddr = ''; // 참고항목 변수
	                           				
	                               			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                               			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                                   		addr = data.roadAddress;
	                               		} else { // 사용자가 지번 주소를 선택했을 경우(J)
	                                   		addr = data.jibunAddress;
	                               		}
	                           			
	                               		// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                               		if(data.userSelectedType === 'R'){
	                                   		// 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                                   		// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                                   		if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                                       		extraAddr += data.bname;
	                                   		}
	                                   		// 건물명이 있고, 공동주택일 경우 추가한다.
	                                   		if(data.buildingName !== '' && data.apartment === 'Y'){
	                                      		extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                                   		}
	                                   		// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                                   		if(extraAddr !== ''){
	                                       		extraAddr = ' (' + extraAddr + ')';
	                                   		}
	                                   		// 조합된 참고항목을 해당 필드에 넣는다.
	                                   		document.getElementById("sample2_extraAddress").value = extraAddr;
	                               			
	                               			} else {
	                                   			document.getElementById("sample2_extraAddress").value = '';
	                               			}
	                           				
	                               			// 우편번호와 주소 정보를 해당 필드에 넣는다.
	                               			document.getElementById('sample2_postcode').value = data.zonecode;
	                               			document.getElementById("sample2_address").value = addr;
	                               			// 커서를 상세주소 필드로 이동한다.
	                               			document.getElementById("sample2_detailAddress").focus();
	                           				
	                               			// iframe을 넣은 element를 안보이게 한다.
	                               			// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                               			element_layer.style.display = 'none';
	                           			},
	                           			width : '100%',
	                           			height : '100%',
	                           			maxSuggestItems : 5
	                       			}).embed(element_layer);
	                     			
	                       			// iframe을 넣은 element를 보이게 한다.
	                       			element_layer.style.display = 'block';
	                     			
	                       			// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	                       			initLayerPosition();
	                   			}
	                  			
	                   			// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	                   			// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	                   			// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	                   			function initLayerPosition(){
	                       			var width = 300; //우편번호서비스가 들어갈 element의 width
	                       			var height = 400; //우편번호서비스가 들어갈 element의 height
	                       			var borderWidth = 5; //샘플에서 사용하는 border의 두께
	                     			
	                       			// 위에서 선언한 값들을 실제 element에 넣는다.
	                       			element_layer.style.width = width + 'px';
	                       			element_layer.style.height = height + 'px';
	                       			element_layer.style.border = borderWidth + 'px solid';
	                       			// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	                       			element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
	                       			element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	                   			}
	               			</script>
	               		</div> 
	                  
	                  	<span class="bt" style="cursor:default; height: 50px;">
	                     	<button type="submit" id="cancel_btn" name="cancel_btn" onclick="location.href='/'">취소</button>
	                     	<button type="submit" id="signup_btn" name="signup_btn">회원가입</button>
	                  	</span>
	                  	
	                </form>   
	            </section>
	        </div>
	    </section>
   	</div>
   
   	<div id="footer">
      	<%@ include file="../include/footer.jsp" %>
   	</div>
   
	<script>
		function fn_emailCheck() {
		   	var result = spaceCheck(); // 회원아이디 공백 검사
		   
		   	// 회원 아이디에 공백을 입력하면 안된다.
		   	if(result == true) {
		      	$.ajax({
		         	url:      "/member/signup/emailCheck",
		         	type:      "post",
		         	dataType:   "json",
		         	data:      { "userId":   $("#userId").val() },
		         	success:   function(data) {
		            	if(data == 1) {
		               		$("#userID").focus();
		               		alert("이미 사용 중인 아이디입니다.");
		            	} else if(data == 0) {
		               		$("#emailCheck").attr("value", "Y");
		               		alert("사용 가능한 아이디입니다.");
		            	}
		         	}
		      	});
		   	} else {
		      	alert("회원 이메일에는 공백을 사용할 수 없습니다.");
		      	$("#userId").focus();
		   	}
		}
		
		function spaceCheck(){
			
		   	var str = document.getElementById('userId');
			
		   	if( str.value == '' || str.value == null ){
		     
		       	return false;
		   	}
			
		   	var blank_pattern = /^\s+|\s+$/g;
		   	if( str.value.replace( blank_pattern, '' ) == "" ){
		       	alert(' 공백만 입력되었습니다 ');
		       	return false;
		   	}
			
		   	var blank_pattern = /[\s]/g;
		   	if( blank_pattern.test( str.value) == true){
		       	alert(' 공백은 사용할 수 없습니다. ');
		       	return false;
		   	}
		   	return true;
		}
   </script>
</body>
</html>
