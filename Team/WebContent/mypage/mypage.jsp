<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.review.db.ReviewBean"%>
<%@page import="java.util.List"%>
<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="./css/mypage.css" rel="stylesheet">
<link href="./css/default.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css' integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns' crossorigin='anonymous'>
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/httpRequest.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
    /* 마우스 휠로 화면이동할때 효과 */
        window.onload = function () {
            $(".mpbox").each(function () {
                // 개별적으로 Wheel 이벤트 적용
                $(this).on("mousewheel DOMMouseScroll", function (e) {
                    e.preventDefault();
                    var delta = 0;
                    if (!event) event = window.event;
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                        if (window.opera) delta = -delta;
                    } else if (event.detail) delta = -event.detail / 3;
                    var moveTop = null;
                    // 마우스휠을 위에서 아래로
                    if (delta < 0) {
                        if ($(this).next() != undefined) {
                            moveTop = $(this).next().offset().top;
                        }
                    // 마우스휠을 아래에서 위로
                    } else {
                        if ($(this).prev() != undefined) {
                            moveTop = $(this).prev().offset().top;
                        }
                    }
                    // 화면 이동 0.8초(800)
                    $("html,body").stop().animate({
                        scrollTop: moveTop + 'px'
                    }, {
                        duration: 800, complete: function () {
                        }
                    });
                });
            });
        }

// ------------------------------------------마이페이지 제어창(info)-------------
   	var passck = false;
   	var repassck = false;
   	var nameck = true;
   	var phoneck = true;
   	var birthck = true;
   	
 // 수정, 탈퇴 버튼 활성화조건
   	function checkInfo(){
 		
		//조건에 맞으면
		if(passck == true && repassck == true && nameck == true && phoneck == true && birthck == true){
			
			// 버튼 활성화
			$(".mem_update").prop("disabled", false);
	        $(".mem_update").css("background-color", "#000");
	        $(".mem_update").css("color", "#eee");
	        $(".mem_delete").prop("disabled", false);
	        $(".mem_delete").css("background-color", "#000");
	        $(".mem_delete").css("color", "#eee");
		}else{
		
			// 버튼 비활성화
			$(".mem_update").prop("disabled", true);
			$(".mem_update").css("background-color", "rgb(240,240,240)");
		    $(".mem_update").css("color", "rgb(188,188,188)");
		    $(".mem_delete").prop("disabled", true);
			$(".mem_delete").css("background-color", "rgb(240,240,240)");
		    $(".mem_delete").css("color", "rgb(188,188,188)");
		}
	}
   	

   	/* 패스워드확인 자리수 4자리 이상 */
   		function checkPwd() {
   			var pw1 = fr1.pass.value;
   			var pw2 = fr1.repass.value;
   			
   			if(pw1.length>=4){	
   				document.getElementById('checkPwd1').innerHTML = "<p></p>";
   				passck = true;
   				checkInfo();
   					//비밀번호 재확인
   				if (pw1 != pw2) {
   					document.getElementById('checkPwd2').style.color = "#800000";
   					document.getElementById('checkPwd2').innerHTML = "<p>비밀번호가 일치하지 않습니다.</p>";
   					repassck = false;
   					checkInfo();
   						//모든조건이 맞을 때 repassck=ture 반환
   				} else {
   					document.getElementById('checkPwd2').innerHTML = "<p></p>";
   					repassck = true;
   					checkInfo();
   				}
   			}else {
   				document.getElementById('checkPwd1').style.color = "#800000";
   				document.getElementById('checkPwd1').innerHTML = "<p>비밀번호를 4자리 이상 입력하세요</p>";
   				document.getElementById('checkPwd2').innerHTML = "<p></p>";
   				passck = false;
   				checkInfo();
   				}
   		}
   	/* 이름 필수입력 */
   		function checkName(){
   			if(document.fr1.name.value.length==0){
   				document.getElementById('checkName').style.color = "#800000";
   				document.getElementById('checkName').innerHTML = "<p>이름을 입력하세요</p>";
   				nameck = false;
   				checkInfo();
   			}else {
   				document.getElementById('checkName').innerHTML = "<p></p>";
   				nameck = true;
   				checkInfo();
   			}
   		}
   	/* 휴대폰번호 필수입력 */
   		function checkPhone(){
   				if(document.fr1.phone.value.length!=11){
   					document.getElementById('checkPhone').style.color = "#800000";
   					document.getElementById('checkPhone').innerHTML = "<p>휴대폰번호 11자리를 입력해주세요.</p>";
   					phoneck = false;
   					checkInfo();
   		
   				}else {
   					document.getElementById('checkPhone').innerHTML = "<p></p>";
   					phoneck = true;
   					checkInfo();
   				}
   		    	
   		}

   	/* 생일제어 입력안하거나 입력하면 4자리 */
   		function checkBirth(){
   			if(document.fr1.birth.value.length==0||document.fr1.birth.value.length==4){	
   				document.getElementById('checkBirth').innerHTML = "<p></p>";
   				birthck = true;
   				checkInfo();

   			}else {
   				document.getElementById('checkBirth').style.color = "#800000";
   				document.getElementById('checkBirth').innerHTML = "<p>생일 4자리를 입력해주세요.</p>";
   				birthck = false;
   				checkInfo();
   			}
   		}
   	
   	/* 폰,생일에 숫자만 입력되도록 제어 */
	function digit_check(evt){
	    var code = evt.which?evt.which:event.keyCode;
	    if(code < 48 || code > 57){
	        return false;
	    }
	}

   	/* 다중 submit 제어 */
   	function Action(index){
   		if(index==1){
   			if (confirm("회원정보를 수정하시겠습니까?")==true){    //확인
   				document.fr1.action="./MemberUpdate.me";
   			}else{   //취소
   			    return false;
   			}
   		}else if(index==2){
   			if (confirm("정말 탈퇴하시겠습니까?")==true){   
   				document.fr1.action="./MemberDelete.me";
   			}else{   //취소
			    return false;
			}
   		}
   		document.fr1.submit();
   	}
    </script>

<title>L'harmonie|My page</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<div class="clear"></div>
<%
MemberBean mb = (MemberBean)request.getAttribute("mb");
%>
<div class="mpbox" id="sec1_mypage"><!-- 배경들어가는 영역 -->
 <h1>MODIFY</h1>
 	<div id="modify"> 	
 		<form id="info_update" method="post" name="fr1">
 		<input type="hidden" value="<%=mb.getMem_num() %>" name="mem_num"><!-- 회원번호 숨겨서 넘기기 -->
				<table >
				<tr>
						<td><i class='far fa-envelope' style='font-size:24px'></i></td>
						<th>아이디 : </th><td><input type="text" name="email" value="<%=mb.getEmail() %>" size="35" Readonly>
						</td>
				</tr>
				<tr>
						<td><i class='fas fa-lock' style='font-size:24px'></i></td>
						<th>새 비밀번호 : </th><td><input type="password" name="pass" id="pass" value="" size="35" onkeyup="checkPwd()">
											<span id="checkPwd1"></span>
											</td>
				</tr>
				<tr>
						<td><i class='fas fa-lock' style='font-size:24px'></i></td>
						<th>비밀번호 확인 : </th><td><input type="password" name="repass" id="repass" value="" size="35" onkeyup="checkPwd()">
											<span id="checkPwd2"></span>
											</td>
				</tr>
				<tr>
						<td><i class='fas fa-male' style='font-size:32px' id="name_icon"></i></td>
						<th>이름 : </th><td><input type="text" name="name" id="name" value="<%=mb.getName() %>" size="35" onkeyup="checkName()" >
										<span id="checkName"></span>
										</td>
				</tr>
				<tr>
						<td><i class="material-icons" style='font-size:28px'>phone_android</i></td>
						<th>휴대폰 : </th><td><input type="text" name="phone" id="phone" value="<%=mb.getPhone() %>" size="35" maxlength="11"
											style="ime-mode:disabled;" onkeyup="checkPhone()" onkeypress="return digit_check(event)">
										<span id="checkPhone"></span>	
										</td>
				</tr>
				<tr>
						<td><i class='far fa-calendar-alt' style='font-size:24px'></i></td>
						<th>생년월일 : </th><td><input type="text" name="birth" value="<%=mb.getBirth() %>" size="35" maxlength="4"
												style="ime-mode:disabled;" onkeyup="checkBirth()" onkeypress="return digit_check(event)">
										<span id="checkBirth"></span>
										</td>
				</tr>	

				<tr><td id="button_area"></td><td><input type="button" id="mem_update" class="mem_update" value="정보수정" disabled="disabled" onclick="Action(1)"></td>
					<td><input type="button" id="mem_delete" class="mem_delete" value="회원탈퇴" disabled="disabled" onclick="Action(2)">
					</td>
				</tr>
				
			</table>
		</form>
		
		
	 </div>
</div>

<!-- 2번째 메인 -->

<div class="mpbox" id="sec2_mypage"><!-- 배경들어가는 영역 -->
 <h1>MY BOOK</h1>
<div id="mybook">
<div class="term">

<i class='far fa-calendar-alt' style='font-size:27px'></i>
	<span>조회기간</span>
		 <input type="button" value="일주일" class="termbtn">
		 <input type="button" value="1개월" class="termbtn">
		 <input type="button" value="3개월" class="termbtn">
		 <input type="button" value="6개월" class="termbtn">
		 <input type="button" value="6개월 이전" class="termbtn">
	</div>

<div class="mpcount">전체 2건</div>
	<div class="clear"></div>
<table class="mybook_tbl">
<tr class="ttl"><th>예약번호</th><th>예약일자</th><th>테이블번호</th><th>인원</th>
	<th>지점</th><th class="ps">요청사항</th></tr>



	<tr class="ttl"><td><a href="#" class="bookdetail">181106131</a></td><td>2018-11-06 13:00</td><td>8</td><td>2</td>
	<td>부산(서면)</td><td>해산물 알러지가 있습니다 해산물은 빼고 조리 부탁드릴게요^^</td></tr>
	
</table>
</div>
</div>

<!-- 3번째 메인 -->
<%
List myReviewList = (List)request.getAttribute("myReviewList");
%>
<div class="mpbox" id="sec3_mypage">
 <h1>MY REVIEW</h1>
<div id="myreview">
<div class="term">

<i class='far fa-calendar-alt' style='font-size:27px'></i>
<span>조회기간</span>
 <input type="button" value="일주일" class="termbtn"> <input type="button" value="1개월" class="termbtn">
 <input type="button" value="3개월" class="termbtn"> <input type="button" value="6개월" class="termbtn">
  <input type="button" value="6개월 이전" class="termbtn">
</div>

<div class="mpcount">전체 1건</div>
	<div class="clear"></div>
<table class="mybook_tbl">
	<tr class="ttl"><th>번호</th><th>평점</th><th>날짜</th>
	<th class="ps">내용</th><th>지점</th><th>첨부</th></tr>
	
	<%	for(int i=0; i < myReviewList.size(); i++){

		ReviewBean rb = (ReviewBean)myReviewList.get(i);
%>
	<tr class="ttl"><td><a href="#" class="reviewdetail"><%=rb.getReview_num() %></a></td>
	<td><%
		//평점 점수에 따라 ★로 표시함
		for(int j=0; j < rb.getRating(); j++){
			out.print("★");
		}
		%>
	</td>
	<td><%=rb.getDate() %></td><td class="ps"><%=rb.getContent() %></td><td><%=rb.getLocation() %></td><td><%=rb.getFile() %></td></tr>
<%	}

	 %>
	
</table>
</div>
</div>


   
   
<div class="clear"></div>

<!-- 서브메뉴 들어가는 곳 -->
<jsp:include page="../inc/submenu.jsp"></jsp:include>
<!-- 서브메뉴 들어가는 곳 -->
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</body>
</html>