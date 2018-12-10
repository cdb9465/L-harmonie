	var passck = false;
	var repassck = false;

/* 버튼 비활성화시키는 함수 (공통) */
/* submit 버튼 활성화조건*/
 function check(){
		//조건에 맞으면
		if(passck == true && repassck == true){
			// 버튼 활성화
			$(".submitBtn").prop("disabled", false);
	        $(".submitBtn").css("background-color", "#b41616");
	        $(".submitBtn").css("color", "#000");
		}else{
			// 버튼 비활성화
			$(".submitBtn").prop("disabled", true);
			$(".submitBtn").css("background-color", "#c7c5c5");
		    $(".submitBtn").css("color", "#adabab");
		}
}
 
 /* 패스워드확인 자리수 4자리 이상 */
	function checkPwd() {
		var pw1 = fr1.pass.value;
		var pw2 = fr1.repass.value;
		
		if(pw1.length>=4){	
			document.getElementById('checkPwd1').innerHTML = "<p></p>";
			passck = true;
			check();
				//비밀번호 재확인
			if (pw1 != pw2) {
				document.getElementById('checkPwd2').style.color = "#800000";
				document.getElementById('checkPwd2').innerHTML = "<p>비밀번호가 일치하지 않습니다.</p>";
				repassck = false;
				check();
					//모든조건이 맞을 때 repassck=ture 반환
			} else {
				document.getElementById('checkPwd2').innerHTML = "<p></p>";
				repassck = true;
				check();
			}
		}else {
			document.getElementById('checkPwd1').style.color = "#800000";
			document.getElementById('checkPwd1').innerHTML = "<p>비밀번호를 4자리 이상 입력하세요</p>";
			document.getElementById('checkPwd2').innerHTML = "<p></p>";
			passck = false;
			check();
			}
	}