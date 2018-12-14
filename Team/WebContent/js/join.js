	var emailck = false;
	var passck = false;
	var repassck = false;
	var nameck = false;
	var phoneck = false;
	var boxck1 = false;
	var boxck2 = false;

/* 버튼 비활성화시키는 함수 (공통) */
/* submit 버튼 활성화조건*/
 function checkJoin(){
		//조건에 맞으면
		if(emailck == true && passck == true && repassck == true && nameck == true 
			&& phoneck == true && boxck1 == true && boxck2 == true){
			// 버튼 활성화
			$(".joinbtn").prop("disabled", false);
	        $(".joinbtn").css("background-color", "#000");
	        $(".joinbtn").css("color", "#eee");
		        //마우스올렸을 때
	        $(".joinbtn").hover(function() {
	        	$(this).css("background-color", "#800000");
	        	$(this).css("color", "#000");
	        }, function(){
	        	$(this).css("background-color", "#000");
	 	        $(this).css("color", "#eee");
	        });
		}else{
			// 버튼 비활성화
			$(".joinbtn").prop("disabled", true);
			$(".joinbtn").css("background-color", "rgb(240,240,240)");
		    $(".joinbtn").css("color", "rgb(188,188,188)");
		}
}
/* 이메일선택 */
 $('#selectEmail').change(function(){
	 $("#selectEmail option:selected").each(function () {
		 
		 if($(this).val()== '1'){ //직접입력일 경우 
			 $("#str_email02").val('');  //값 초기화
			 $("#str_email02").attr("disabled",false); //비활성화 
			 
			 }else{  //직접입력이 아닐경우
				 $("#str_email02").val($(this).text()); //선택값 입력
				 $("#str_email02").attr("disabled",true); //비활성화
				 } 
		 }); 
	 });

/* 이메일형식 제한 */
	function checkEmail() {
		var email = document.fr1.email.value;
		var email2 = document.fr1.email2.value;
		var emailAll = email+"@"+email2;
		var exptext2 = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; //특수문자제어
	    var exptext = /^[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	    
	    if(email.length>=4 && exptext2.test(email)==false){
	        if(exptext.test(email2)==false){
	        //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우         
	        	document.getElementById('checkEmail').style.color = "#800000";
				document.getElementById('checkEmail').innerHTML = "<p>올바른 이메일 형식이 아닙니다.</p>";
				emailck = false;
				checkJoin();
	        }else{
	            $.ajax({
		            data: {email:emailAll},
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
		document.getElementById('checkEmail').innerHTML = "<p>올바른 이메일 형식이 아닙니다.</p>";
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
