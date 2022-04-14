<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
   	<title>SAMSIKKI : 자체제작 디자인 테이블웨어</title>
   
   	<script src="/resources/js/jquery-3.6.0.js"></script>
   
   	<%@ include file="../include/topInclude.jsp" %>
   
   	<style>	
	body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
	a { color:#05f; text-decoration:none; }
	a:hover { text-decoration:underline; }
	
	h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
	ul, lo, li { margin:0; padding:0; list-style:none; }
	
	/* ---------- */
	
	/*div#root { width:900px; margin:0 auto; }*/
	section#container::after { content:""; display:block; clear:both; } 
	
	/* ---------- */
	
	header#header div#header_box { text-align:center; padding:40px 0 30px 0; }
	header#header div#header_box h1 { font-size:50px; }
	header#header div#header_box h1 a { color:#000; }
	
	/* 센터 맞추기 추가 */
	section#container { padding: 160px 300px; }	 
	</style>
   
   	<style>
	section#content ul li { margin:10px 0; padding:10px 0; border-bottom:1px solid #999; }
	section#content ul li img { width:150px; height:150px; }
	section#content ul li::after { content:""; display:block; clear:both; }
	section#content div.thumb { float:left; width:250px; }
	section#content div.gdsInfo { float:right; width:calc(100% - 270px); }
	section#content div.gdsInfo { font-size:20px; line-height:2; }
	section#content div.gdsInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
	section#content div.gdsInfo .delete { text-align:right; }
	section#content div.gdsInfo .delete button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}                 
	
	.allCheck { float:left; width:200px; }
	.allCheck input { width:16px; height:16px; }
	.allCheck label { margin-left:10px; }
	.delBtn { float:right; width:300px; text-align:right; }
	.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}

	.checkBox { float:left; width:30px; }
	.checkBox input { width:16px; height:16px; }
	
	.listResult { padding:20px; background:#eee; }
	.listResult .sum { float:left; width:45%; font-size:22px; }

	.listResult .orderOpne { float:right; width:45%; text-align:right; }
	.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
	.listResult::after { content:""; display:block; clear:both; }
	
	.orderInfo { border:5px solid #eee; padding:30px 20px 20px 20px; display:none; height:350px; }
	.orderInfo .inputArea { margin:10px 0; }
	.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
	.orderInfo .inputArea input { font-size:14px; padding:5px; }
	#userAddr2, #userAddr3 { width:250px; }

	.orderInfo .inputArea:last-child { margin:0 300px 0 0; }
	.orderInfo .inputArea_b {
		float: right;
	}
	.orderInfo .inputArea_b button { text-align: center; font-size:20px; border:1px solid #ccc; padding:5px 10px; background:#fff; margin: 30px 0 0 30px; } 
	.orderInfo .inputArea_b button.order_btn {  }
	.orderInfo .inputArea_b button.cancel_btn {  }

	.orderInfo .inputArea #sample2_address { width:230px; }
	.orderInfo .inputArea #sample2_detailAddress { width:280px; }
	.orderInfo .inputArea #sample2_extraAddress { width:230px; }
    </style>
    
    <style>
	.control-label{
		margin: 6px -10px 0 -15px;
	}
	
	/* 주문 정보 입력 인풋 */
	input{
		border-radius: 2px;
	}
	input#orderRec{ /* 수령인 */
		background: #EEE;
	}
	input#orderPhon{ /* 수령인 연락처 */
		background: #EEE;
	}
	input#sample2_postcode{ /* 우편번호 */
		background: #EEE;
		margin-left: 103px;
		width: 280px;
	}
	input#bb{
		width: 165px;
	}
	input#bb{ /* 우편번호 찾기 */
		height: 34px;
		
		background: #EEE;
		border: 1px solid #999;
		transition: background .3s ease-in-out;
	}
	input#bb:hover{ /* 우편번호 찾기 */
		background: #E3E3E3;
		transition: background .3s ease-in-out;
	}
	input#sample2_address{ /* 주소 */
		background: #EEE;
		width: 300px;
		margin-bottom: 5px;
		margin-left: 133px;
	}
	input#sample2_detailAddress{ /* 상세주소 */
		background: #EEE;
		margin-left: 133px;
	}
	input#sample2_extraAddress{ /* 참고항목 */
		background: #EEE;
	}
	select#account{ /* 결제계좌 */
		margin-left: 1px;
		padding: 0 3px;
		height: 35px;
		width: 280px;
		background: #EEE;
		border-radius: 2px;
	}
	
	
	/* 주문, 취소 버튼 */
	
	/* 주문 */
	button.order_btn{
		margin-top: 0;
		background: #E3E3E3;
		transition: background .3s ease-in-out;
		border-radius: 2px;
	}
	button.order_btn:hover{
		background: #EEE;
		transition: background .3s ease-in-out;
	}
	
	/* 삭제 */
	section#content div.gdsInfo .delete button{
		background: #EEE;
		transition: background .3s ease-in-out;
		border-radius: 2px;
	}
	section#content div.gdsInfo .delete button:hover{
		background: #E3E3E3;
		transition: background .3s ease-in-out;
	}
	
	/* 주문 정보 입력 */
	.listResult .orderOpne button{
		background: #E3E3E3;
		transition: background .3s ease-in-out;
		border-radius: 2px;
	}
	.listResult .orderOpne button:hover{
		background: #EEE;
		transition: background .3s ease-in-out;
	}
	
	.orderInfo .inputArea_b button{
		margin: 0;
		margin-top: 0;
		background: #EEE;
		transition: background .3s ease-in-out;
		border-radius: 2px;
	}
	.orderInfo .inputArea_b button:hover{
		background: #E3E3E3;
		transition: background .3s ease-in-out;
	}
	
	.delBtn button{
		margin: 0;
		margin-top: 30px;
		background: #EEE;
		transition: background .3s ease-in-out;
		border-radius: 2px;
	}
	.delBtn button:hover{
		background: #E3E3E3;
		transition: background .3s ease-in-out;
	}
	
	.orderInfo .inputArea #sample2_address{
		width: 450px;
	}
	.orderInfo .inputArea #sample2_extraAddress{
		width: 167px;
	}
	
	.control-label{
		width: 142px;
	}
	
	.blue{
	color:blue;}
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
		               	<li>
		                  	<div class="allCheck">
		                     	<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
		                     
		                     	<script>
			                     	$("#allCheck").click(function(){
			                        	var chk = $("#allCheck").prop("checked");
			                        	if(chk) {
				                           	$(".chBox").prop("checked", true);
				                        } else {
				                           $(".chBox").prop("checked", false);
				                        }
				                    });
		                     	</script>
		                  	</div>
		                  
		                  	<div class="delBtn">
		                     	<button type="button" class="selectDelete_btn">선택 삭제</button>
		                     
		                     	<script>
			                        $(".selectDelete_btn").click(function(){
			                           	var confirm_val = confirm("정말 삭제하시겠습니까?");
			                           
			                           	if(confirm_val) {
			                              	var checkArr = new Array();
			                              
			                              	$("input[class='chBox']:checked").each(function(){
			                                 	checkArr.push($(this).attr("data-cartNum"));
			                              	});
			                              
			                              	$.ajax({
			                                 	url : "/shop/deleteCart",
			                                 	type : "post",
			                                 	data : { chbox : checkArr },
			                                 	success : function(result){
			                                    	
				                                    if(result == 1) {
				                                       location.href = "/shop/cartList";
				                                    } else {
				                                       alert("삭제 실패");
				                                    }
				                                }
				                            });
				                        }
			                        });
			                    </script>
		                  	</div>
		               	</li>
		               
		               	<c:set var="sum" value="0" />
		               
		               	<c:forEach items="${cartList}" var="cartList">
		               		<li>
		                  		<div class="checkBox">
		                     		<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" />
		                     		
		                     		<script>
		                        		$(".chBox").click(function(){
		                           			$("#allCheck").prop("checked", false);
		                        		});
		                     		</script>
		                  		</div>
		                  		
		                  		<span class="thumb">
		                     		<img src="${cartList.gdsThumbImg}" />
		                  		</span>
		                  		
		                  		<div class="gdsInfo">
		                     		<p>
				                        <span>상품명      </span>${cartList.gdsName}<br />
				                        <span>정상 가격   </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /> 원<br />
				                        <c:if test="${cartList.gdsRate != '0' }">
				                        <span class="blue">세일 가격   </span><span class="blue"><fmt:formatNumber pattern="###,###,###" value="${(cartList.gdsPrice*(100-cartList.gdsRate))/100}" /> 원</span><br />
				                        </c:if>
				                        <span>구입 수량   </span>${cartList.cartStock} 개<br />
				                        <span>최종 가격   </span><fmt:formatNumber pattern="###,###,###" value="${(cartList.gdsPrice*(100-cartList.gdsRate))/100 * cartList.cartStock }" /> 원<br />
		                     		</p>
		                     		
		                     		<div class="delete">
		                        		<button type="button" class="delete_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}">삭제</button>
		                        		
		                        		<script>
		                           			$(".delete_${cartList.cartNum}_btn").click(function(){
		                              			var confirm_val = confirm("정말 삭제하시겠습니까?");
		                              			
		                              			if(confirm_val) {
		                                 			var checkArr = new Array();
		                                 			
		                                 			checkArr.push($(this).attr("data-cartNum"));
		                                 			
		                                 			$.ajax({
		                                    			url : "/shop/deleteCart",
		                                    			type : "post",
		                                    			data : { chbox : checkArr },
		                                    			success : function(result){
		                                       				
		                                       				if(result == 1) {
		                                          				location.href = "/shop/cartList";
		                                       				} else {
		                                          				alert("삭제 실패");
		                                       				}
		                                    			}
		                                 			});
		                              			}
		                           			});
		                        		</script>
		                     		</div>               
		                  		</div>
		               		</li>
		               		<c:set var="sum" value="${sum + ((cartList.gdsPrice*(100-cartList.gdsRate))/100 * cartList.cartStock)}" />
		               	</c:forEach>
		            </ul>
	            	
	         		<div class="listResult">
	            		<div class="sum">
	               			총 합계 : <fmt:formatNumber type="number" value="${sum}" />원
	            		</div>
	            		
	            		<div class="orderOpne">
	               			<button type="button" class="orderOpne_btn">주문 정보 입력</button>
	               			
	               			<script>
	                  			$(".orderOpne_btn").click(function(){
	                     			$(".orderInfo").slideDown();
	                     			$(".orderOpne_btn").slideUp();
	                  			});
	               			</script>
	            		</div>         
	         		</div>   
	         		
	         		<div class="orderInfo">
	             		<form role="form" method="post" autocomplete="off">
	             		

	             			<input type="hidden" name="amount" value="${sum}" id="num"/>
	             			
	                 		<!-- pattern="[0-9]+"  -->
	                 		<div class="inputArea">
	                     		<label for="">수령인</label>
	                     		<input type="text" name="orderRec" id="orderRec" required="required" />
	                 		</div>
	                 		
	                		<div class="inputArea">
	                     		<label for="orderPhon">수령인 연락처</label>
	                     		<input type="text" name="orderPhon" id="orderPhon" required="required" />
	                		</div>
	                 		
	                 		<!--
	                		<div class="inputArea">
	                     		<label for="userAddr1">우편번호</label>
	                     		<input type="text" name="userAddr1" id="userAddr1" required="required" />
	                		</div>
	                 		
	                		<div class="inputArea">
	                     		<label for="userAddr2">1차 주소</label>
	                     		<input type="text" name="userAddr2" id="userAddr2" required="required" />
	                		</div>
	                 		
		               		<div class="inputArea">
		                  		<label for="userAddr3">2차 주소</label>
		                  		<input type="text" name="userAddr3" id="userAddr3" required="required" />
		               		</div>
		               		-->
	               			
	               			<div class="inputArea">
	               				<p>
	               	  				<b>주소</b>
	               					
	                  				<input type="text" id="sample2_postcode" placeholder="우편번호">
	                  				<input id="bb" type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
	               				</p>
	               				<p>   
	                  				<input type="text" name="userAddr1" id="sample2_address" placeholder="주소"><br>
	                  				<input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="상세주소">
	                  				<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="참고항목">
	               				</p>
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
	               			
	               			<!-- 결제 부분 추가 -->
	               			<div class="form-group">
	                  			<label class="control-label col-sm-1">결제 계좌</label>
	                  			<div class="col-sm-4">
	                     			<select name="account" id="account">
	                       			 	<option value=1>국민은행 11111-111-11111 최유나</option>
	                        			<option value=2>우리은행 22222-222-22222 정수호</option>
	                        			<option value=3>기업은행 33333-333-33333 정호상</option>
	                     			</select>
	                  			</div>
	               			</div>
	               			
	               			<div class="inputArea_b">
		               			<br/>
		                  		<button type="submit"  class="order_btn">주문</button>
		                  		<button type="button" class="cancel_btn">취소</button>
		                  		
		                  		<script>
		                      		$(".cancel_btn").click(function(){
		                     			$(".orderInfo").slideUp();
		                     			$(".orderOpne_btn").slideDown();
		                  			});
		                  		</script>
	               			</div>
	             		</form> 
	             		
	               		<form name ="orderF" id="orderF" action="/order/list"></form>
	               		
	         		</div>
	      		</section>
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