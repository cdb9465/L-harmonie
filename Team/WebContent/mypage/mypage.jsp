<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="../css/mypage.css" rel="stylesheet">
<link href="../css/default.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css' integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns' crossorigin='anonymous'>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
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
    </script>

<title>L'harmonie|My page</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<div class="clear"></div>

<div class="mpbox" id="sec1_mypage"><!-- 배경들어가는 영역 -->
 <h1>MODIFY</h1>
 	<div id="modify"> 	
 		<form id="info_update" method="post" name="fr1">
 		<input type="hidden" value="" name="num"><!-- 회원번호 숨겨서 넘기기 -->
				<table >
				<tr>
						<td><i class='far fa-envelope' style='font-size:24px'></i></td>
						<th>아이디 : </th><td><input type="text" name="email" value="" size="35" >
						</td>
				</tr>
				<tr>
						<td><i class='fas fa-lock' style='font-size:24px'></i></td>
						<th>새 비밀번호 : </th><td><input type="password" name="pass" value="" size="35"></td>
				</tr>
				<tr>
						<td><i class='fas fa-lock' style='font-size:24px'></i></td>
						<th>비밀번호 확인 : </th><td><input type="password" name="pass" value="" size="35"></td>
				</tr>
				<tr>
						<td><i class='fas fa-male' style='font-size:32px' id="name_icon"></i></td>
						<th>이름 : </th><td><input type="text" name="name" value="" size="35"></td>
				</tr>
				<tr>
						<td><i class="material-icons" style='font-size:28px'>phone_android</i></td>
						<th>휴대폰 : </th><td><input type="text" name="phone" value="" size="35"></td>
				</tr>
				<tr>
						<td><i class='far fa-calendar-alt' style='font-size:24px'></i></td>
						<th>생년월일 : </th><td><input type="text" name="birth" value="" size="35"></td>
				</tr>	

				<tr><td id="button_area"></td><td><input type="button" id="mem_update" value="정보수정" onclick="location.href=''"></td>
					<td><input type="button" id="mem_delete" value="회원탈퇴" onclick="location.href=''"></td>
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
 <input type="button" value="일주일" class="termbtn"> <input type="button" value="1개월" class="termbtn">
 <input type="button" value="3개월" class="termbtn"> <input type="button" value="6개월" class="termbtn">
  <input type="button" value="6개월 이전" class="termbtn">
</div>

<div class="mpcount">전체 2건</div>
	<div class="clear"></div>
<table class="mybook_tbl">
<tr class="ttl"><th>예약번호</th><th>예약일자</th><th>테이블번호</th><th>인원</th>
	<th>지점</th><th class="ps">요청사항</th></tr>
	
	<!-- jsp로 ㄱㄱ -->
	<tr class="ttl"><td>111111</td><td>2018-11-06 13:00</td><td>8</td><td>2</td>
	<td>부산(서면)</td><td>해산물 알러지가 있습니다 해산물은 빼고 조리 부탁드릴게요^^</td></tr>
	<tr class="ttl"><td>122222</td><td>2018-12-25 13:00</td><td>1</td><td>4</td>
	<td>부산(서면)</td><td></td></tr>
	<!-- jsp로 ㄱㄱ -->
	
</table>
</div>
</div>

<!-- 3번째 메인 -->
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
	<th class="ps">내용<th><th>파일</th></tr>
	
	<!-- jsp로 ㄱㄱ -->
	<tr class="ttl"><td>1</td><td>★★★★★</td><td>2018-12-25</td>
	<td class="ps">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<td><td>3</td></tr>
	<tr class="ttl"><td>2</td><td>★★☆☆☆</td><td>2018-1-2</td>
	<td class="ps">ㅇㅇㅇㅇㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㅇ<td><td>2</td></tr>
	<!-- jsp로 ㄱㄱ -->
	
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