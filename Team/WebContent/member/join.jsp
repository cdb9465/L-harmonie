<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Controller에서 가상주소로 연결하려니까 경로를 .으로 해야함 ! -->
<link href="./css/join.css" rel="stylesheet">
<link href="./css/default.css" rel="stylesheet">
<!-- 아이콘링크 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css' integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns' crossorigin='anonymous'>
	
<title>L'harmonie</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/httpRequest.js"></script>
<script type="text/javascript" src="./js/join.js"></script>
<style type="text/css">
input:read-only{background-color:#dedede}
</style>
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
			<form action="./MemberJoinAction.me" id="form_join" method="post" name="fr1">

				<table>
				<tr>
					<th>
						<i class='far fa-envelope' style='font-size: 24px'></i><br>이메일
						</th>
						<td>	
						<input type="text" name="email" id="email" style='ime-mode:disabled' placeholder="이메일 4자리이상 " onkeyup="checkEmail()">
						<span id="at">@</span>
						<input type="text" name="email2" id="email2" disabled value="naver.com" onkeyup="checkEmail()" >						
							<select name="selectEmail" id="selectEmail" onclick="checkEmail()">
								<option value="1">직접입력</option>
								<option value="naver.com" selected>naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="empas.com">empas.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="freechal.com">freechal.com</option>
								<option value="lycos.co.kr">lycos.co.kr</option>
								<option value="korea.com">korea.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmir.com">hanmir.com</option>
								<option value="paran.com">paran.com</option>
							</select>
							<span id="checkEmail"></span>
						</td>
				</tr>
				<tr>
					<th><i class='fas fa-lock' style='font-size: 24px'></i><br>비밀번호</th>
							<td><input type="password" name="pass" id="pass" placeholder="비밀번호 4자리 이상" onkeyup="checkPwd()">			
								<span id="checkPwd1"></span>
							</td>
				</tr>
				<tr>
						<th>
							<i class='fas fa-lock' style='font-size: 24px'></i><br>비밀번호확인</th>
						<td><input type="password" name="repass" id="repass" placeholder="비밀번호 확인" onkeyup="checkPwd()"/>
							<span id="checkPwd2"></span>
						</td>
				</tr>
				<tr>
						<th >
							<i class='fas fa-male' style='font-size: 32px' id="name_icon" ></i><br>이름</th>
						<td><input type="text" name="name" id="name" placeholder="이름  ex)홍길동" onkeyup="checkName()" >
						<span id="checkName"></span>
						</td>
				</tr>
				<tr>
						<th>
							<i class="material-icons" style='font-size: 28px' id="phone_icon">phone_android</i><br>휴대전화</th>
							<td><input type="text" name="phone" id="phone" placeholder="휴대폰번호 (-)제외 숫자만 입력" maxlength="11" 
								style="ime-mode:disabled;" onkeyup="checkPhone()" onkeypress="return digit_check(event)" >
								<span id="checkPhone"></span>
							</td>
				</tr>

				</table>

				<div id="access">
					<div class="acc_checkall">
						<input type="checkbox" id="ckAll">전체약관동의 <a href="#">전체보기</a>
					</div>
					<div class="acc_check">
						<input type="checkbox" name ="ckbox" id="ckbox1" value="약관필수1"><b class="red_b">[필수]</b> 이용약관에
						동의합니다. <a href="#">전체보기</a>
					</div>
					<div class="acc_check">
						<input type="checkbox" name ="ckbox" id="ckbox2" value="약관필수2"><b class="red_b">[필수]</b> 개인정보
						수집/이용에 동의합니다. <a href="#">전체보기</a>
					</div>
					<div class="acc_check">
						<input type="checkbox" name ="ckbox" id="ckbox3" value="약관선택1"><b>[선택]</b> 이벤트/매장정보 SMS수신동의 <a
							href="#">전체보기</a>
					</div>
					<div class="acc_check">
						<input type="checkbox" name ="ckbox" id="ckbox4" value="약관선택2"><b>[선택]</b> 이벤트/매장정보 이메일수신동의 <a
							href="#">전체보기</a>
					</div>
				</div>
				<input type="submit" class="joinbtn" disabled="disabled" value="회원가입">
			</form>
		</div>
		
<script type="text/javascript">
//이메일 선택박스
$('#selectEmail').change(function(){ 
	$("#selectEmail option:selected").each(function () {
		if($(this).val()== '1'){ //직접입력일 경우
			$("#email2").val(''); //값 초기화
			$("#email2").attr("disabled",false); //활성화
		}else{ //직접입력이 아닐경우
			$("#email2").val($(this).text()); //선택값 입력
			/* $("#email2").attr("disabled",true); //비활성화  */
		} 
	});
});
</script>

	</article>

	<!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- 푸터 들어가는 곳 -->
</body>
</html>