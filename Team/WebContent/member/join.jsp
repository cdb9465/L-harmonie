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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css' integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns' crossorigin='anonymous'>
	
<title>L'harmonie|Join</title>

<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/httpRequest.js"></script>
<script type="text/javascript">
	var emailck = false;
	var passck = false;
	var repassck = false;
	var nameck = false;
	var phoneck = false;
	var birthck = false;
	var boxck1 = false;
	var boxck2 = false;

/* 버튼 비활성화시키는 함수 (공통) */
/* submit 버튼 활성화조건*/
 function checkJoin(){
		//조건에 맞으면
		if(emailck == true && passck == true && repassck == true && nameck == true 
			&& phoneck == true && birthck == true && boxck1 == true && boxck2 == true){
			// 버튼 활성화
			$(".joinbtn").prop("disabled", false);
	        $(".joinbtn").css("background-color", "#000");
	        $(".joinbtn").css("color", "#eee");
		}else{
			// 버튼 비활성화
			$(".joinbtn").prop("disabled", true);
			$(".joinbtn").css("background-color", "rgb(240,240,240)");
		    $(".joinbtn").css("color", "rgb(188,188,188)");
		}
}

/* 이메일형식 제한 */
	function checkEmail() {
		var email = document.fr1.email.value;
	    var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	    if(email.length!=0){
	        if(exptext.test(email)==false){
	        //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우         
	        	document.getElementById('checkEmail').style.color = "#800000";
				document.getElementById('checkEmail').innerHTML = "<p>올바른 이메일 형식이 아닙니다.</p>";
				emailck = false;
				checkJoin();
	        }else{
	            $.ajax({
		            data: {email:email},
		            type: 'POST',
		            url: "./EmailCheck.me", //이페이지에서 중복체크를 한다
		            success: function(data){
		                 if(data==1){
		                	document.getElementById('checkEmail').style.color = "#800000";
		    				document.getElementById('checkEmail').innerHTML = "<p>이미 사용중인 이메일입니다.</p>";
		    				emailck = false;
		    				checkJoin();
		                }else if(data==0){
		                	//모든 조건이 맞을 때 emailck = true로 반환
		                	document.getElementById('checkEmail').style.color = "green";
		    				document.getElementById('checkEmail').innerHTML = "<p>사용 가능한 이메일입니다.</p>";
		    				emailck = true;
		    				checkJoin();
		               	 } 
		           	 	}
		            });
	        }
	    }else{
	    document.getElementById('checkEmail').style.color = "#800000";
		document.getElementById('checkEmail').innerHTML = "<p>아이디로 사용할 이메일을 입력해주세요.</p>";
		emailck = false;
		checkJoin();
	    }
	}

/* 패스워드확인 자리수 4자리 이상 */
	function checkPwd() {
		var pw1 = fr1.pass.value;
		var pw2 = fr1.repass.value;
		
		if(pw1.length>=4){	
			document.getElementById('checkPwd1').innerHTML = "<p></p>";
			passck = true;
			checkJoin();
				//비밀번호 재확인
			if (pw1 != pw2) {
				document.getElementById('checkPwd2').style.color = "#800000";
				document.getElementById('checkPwd2').innerHTML = "<p>비밀번호가 일치하지 않습니다.</p>";
				repassck = false;
				checkJoin();
					//모든조건이 맞을 때 repassck=ture 반환
			} else {
				document.getElementById('checkPwd2').innerHTML = "<p></p>";
				repassck = true;
				checkJoin();
			}
		}else {
			document.getElementById('checkPwd1').style.color = "#800000";
			document.getElementById('checkPwd1').innerHTML = "<p>비밀번호를 4자리 이상 입력하세요</p>";
			document.getElementById('checkPwd2').innerHTML = "<p></p>";
			passck = false;
			checkJoin();
			}
	}
/* 이름 필수입력 */
	function checkName(){
		if(document.fr1.name.value.length==0){
			document.getElementById('checkName').style.color = "#800000";
			document.getElementById('checkName').innerHTML = "<p>이름을 입력하세요</p>";
			nameck = false;
			checkJoin();
		}else {
			document.getElementById('checkName').innerHTML = "<p></p>";
			nameck = true;
			checkJoin();
		}
	}
/* 휴대폰번호 필수입력 */
	function checkPhone(){
			if(document.fr1.phone.value.length!=11){
				document.getElementById('checkPhone').style.color = "#800000";
				document.getElementById('checkPhone').innerHTML = "<p>휴대폰번호 11자리를 입력해주세요.</p>";
				phoneck = false;
				checkJoin();
	
			}else {
				document.getElementById('checkPhone').innerHTML = "<p></p>";
				phoneck = true;
				checkJoin();
			}
	    	
	}
/* 숫자만 입력되도록 제어 */
	function digit_check(evt){
	    var code = evt.which?evt.which:event.keyCode;
	    if(code < 48 || code > 57){
	        return false;
	    }
	}

/* 생일제어 입력안하거나 입력하면 4자리 */
	function checkBirth(){
		if(document.fr1.birth.value.length==0||document.fr1.birth.value.length==4){	
			document.getElementById('checkBirth').innerHTML = "<p></p>";
			birthck = true;
			checkJoin();

		}else {
			document.getElementById('checkBirth').style.color = "#800000";
			document.getElementById('checkBirth').innerHTML = "<p>생일 4자리를 입력해주세요.</p>";
			birthck = false;
			checkJoin();
		}
	}
/* 체크박스 확인 */
$(document).ready(function(){
    $("#ckbox1").change(function(){
        if($("#ckbox1").is(":checked")){
        	boxck1 = true;
			checkJoin();
        }else{
        	boxck1 = false;
			checkJoin();
        }
    });
});
$(document).ready(function(){
    $("#ckbox2").change(function(){
        if($("#ckbox2").is(":checked")){
        	boxck2 = true;
			checkJoin();
        }else{
        	boxck2 = false;
			checkJoin();
        }
    });
});
/* 전체 체크하기 */
$(document).ready(function(){
    $("#ckAll").change(function(){
        if($("#ckAll").is(":checked")){
        	 $("input[name=ckbox]").prop("checked", true);
        	 boxck1 = true;
        	 boxck2 = true;
 			 checkJoin();

        }else{
        	$("input[name=ckbox]").prop("checked", false);
        	boxck1 = false;
       	 	boxck2 = false;
			checkJoin();
        }
    });
});

</script>
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
						<i class='far fa-envelope' style='font-size: 24px'></i>
						</th>
						<td>	<input type="text" name="email" id="email" placeholder="이메일  ex)laharmonie@itiwill.com" onkeyup="checkEmail()">
							<span id="checkEmail"></span>
						</td>
				</tr>
				<tr>
					<th><i class='fas fa-lock' style='font-size: 24px'></i></th>
							<td><input type="password" name="pass" id="pass" placeholder="비밀번호 4자리 이상" onkeyup="checkPwd()">			
								<span id="checkPwd1"></span>
							</td>
				</tr>
				<tr>
						<th>
							<i class='fas fa-lock' style='font-size: 24px'></i></th>
						<td><input type="password" name="repass" id="repass" placeholder="비밀번호 확인" onkeyup="checkPwd()"/>
							<span id="checkPwd2"></span>
						</td>
				</tr>
				<tr>
						<th >
							<i class='fas fa-male' style='font-size: 32px' id="name_icon" ></i></th>
						<td><input type="text" name="name" id="name" placeholder="이름  ex)홍길동" onkeyup="checkName()" >
						<span id="checkName"></span>
						</td>
				</tr>
				<tr>
						<th>
							<i class="material-icons" style='font-size: 28px' id="phone_icon">phone_android</i></th>
							<td><input type="text" name="phone" id="phone" placeholder="휴대폰번호 ex)0101234567" maxlength="11" 
								style="ime-mode:disabled;" onkeyup="checkPhone()" onkeypress="return digit_check(event)" >
								<span id="checkPhone"></span>
							</td>
				</tr>
				<tr>
					<th>
							<i class='far fa-calendar-alt' style='font-size: 24px'></i>선택</th>
							<td> <input
								type="text" name="birth" placeholder="생월일 ex)0620" maxlength="4"
								style="ime-mode:disabled;" onkeyup="checkBirth()" onkeypress="return digit_check(event)">
								<span id="checkBirth"></span>
								</td>
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

	</article>

	<!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- 푸터 들어가는 곳 -->
</body>
</html>