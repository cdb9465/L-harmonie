<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/join.css" rel="stylesheet">
<link href="../css/default.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css' integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns' crossorigin='anonymous'>
<title>L'harmonie|Join</title>
</head>
<body>
	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더파일들어가는 곳 -->
	<article id="article_join">
		<div id="sec1_join">
			<h1>SIGN UP</h1>
		</div>
		<div id="sec2_join">
			<form action="#" id="form_join" method="post" name="fr1">
			<ul>
				<li>
					<div class="info_join">
						<i class='far fa-envelope' style='font-size:24px'></i>
						<input type="text" name="email" placeholder="이메일">
						<!-- <p>＊아이디로사용할 이메일을 입력하세요.</p> -->
					</div>
				</li>
				<li>
					<div class="info_join">
						<i class='fas fa-lock' style='font-size:24px'></i>
						<input type="password" name="pass" placeholder="비밀번호">
						<!-- <p>＊비밀번호 형식이맞지않습니다.</p> -->
					</div>
				</li>	
				<li>
					<div class="info_join">
						<i class='fas fa-lock' style='font-size:24px'></i>
						<input type="password" name="repass" placeholder="비밀번호 확인">
						<!-- <p>＊비밀번호가 맞지않습니다.</p> -->
					</div>
				</li>
				<li>
					<div class="info_join">
						<i class='fas fa-male' style='font-size:32px' id="name_icon"></i>
						<input type="text" name="name" placeholder="이름">
						<!-- <p>＊이름을 입력하세요</p> -->
					</div>
				</li>
				<li>
					<div class="info_join">
						<i class="material-icons" style='font-size:28px' id="phone_icon">phone_android</i>
						<input type="text" name="phone" placeholder="휴대폰 - 제외 ex)0101234567">
						<!-- <p>＊휴대폰번호를 입력하세요</p> -->
					</div>
				</li>
				<li>
					<div class="info_join">
						<i class='far fa-calendar-alt' style='font-size:24px'></i>
						<input type="text" name="birth" placeholder="생년월일 ex)930620">
						<!-- <p>＊생년월일을 입력하세요<p> -->
					</div>
				</li>
			</ul>
		
				<div id="access">
					<div class="acc_checkall"><input type="checkbox">전체약관동의 <a href="#">전체보기</a></div>
					<div class="acc_check"><input type="checkbox"><b class="red_b">[필수]</b> 이용약관에 동의합니다. <a href="#">전체보기</a></div>
					<div class="acc_check"><input type="checkbox"><b class="red_b">[필수]</b> 개인정보 수집/이용에 동의합니다. <a href="#">전체보기</a></div>
					<div class="acc_check"><input type="checkbox"><b>[선택]</b> 이벤트/매장정보 SMS수신동의 <a href="#">전체보기</a></div>
					<div class="acc_check"><input type="checkbox"><b>[선택]</b> 이벤트/매장정보 이메일수신동의 <a href="#">전체보기</a></div>
				</div>
				<input type="button" value="회원가입">
			</form>
		</div>

	</article>

	<!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- 푸터 들어가는 곳 -->
</body>
</html>