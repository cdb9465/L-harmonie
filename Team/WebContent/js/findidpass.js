
//id찾기변수
var nameck = false;
var phoneck = false;
//pass찾기변수
var emailck2 = false;
var nameck2 = false;
var phoneck2 = false;

/* 버튼 비활성화시키는 함수 (find ID 영역) */
/* submit 버튼 활성화조건*/
 function checkFindid(){
		//조건에 맞으면
		if(nameck == true && phoneck == true){
			// 버튼 활성화
			$("#findidbtn").prop("disabled", false);
	        $("#findidbtn").css("background-color", "#b41616");
	        //background-color:#b41616;
	        $("#findidbtn").css("color", "#000");
		}else{
			// 버튼 비활성화
			$("#findidbtn").prop("disabled", true);
			$("#findidbtn").css("background-color", "#c7c5c5");
		    $("#findidbtn").css("color", "#adabab");
		}
}

/* 이름 필수입력 */
function checkName(){
	if(document.fr1.name.value.length==0){

		nameck = false;
		checkFindid();
	}else {
		nameck = true;
		checkFindid();
	}
}
/* 휴대폰번호 필수입력 */
function checkPhone(){
		if(document.fr1.phone.value.length!=11){
			
			phoneck = false;
			checkFindid();

		}else {
			
			phoneck = true;
			checkFindid();
		}
    	
}


/* 버튼 비활성화시키는 함수 (find PASS 영역) */
/* submit 버튼 활성화조건*/
 function checkFindpass(){
		//조건에 맞으면
		if(emailck2 == true && nameck2 == true && phoneck2 == true){
			// 버튼 활성화
			$("#findpassbtn").prop("disabled", false);
	        $("#findpassbtn").css("background-color", "#b41616");
	        $("#findpassbtn").css("color", "#000");
		}else{
			// 버튼 비활성화
			$("#findpassbtn").prop("disabled", true);
			$("#findpassbtn").css("background-color","#c7c5c5");
		    $("#findpassbtn").css("color", "#adabab");
		}
}

function checkEmail2(){
	var email1 = document.fr2.email1.value.length;
	var email2 = document.fr2.email2.value.length;
	if(email1==0 && email2==0){
		emailck2 = false;
		checkFindpass();
	}else{
		emailck2 = true;
		checkFindpass();

	}
}
/* 이름 필수입력 */
function checkName2(){
	if(document.fr2.name.value.length==0){

		nameck2 = false;
		checkFindpass();
	}else {

		nameck2 = true;
		checkFindpass();
	}
}
/* 휴대폰번호 필수입력 */
function checkPhone2(){
		if(document.fr2.phone.value.length!=11){
			
			phoneck2 = false;
			checkFindpass();

		}else {
			
			phoneck2 = true;
			checkFindpass();
		}
    	
}

/* 전화번호에 숫자만 입력되도록 제어(공통) */
function digit_check(evt){
    var code = evt.which?evt.which:event.keyCode;
    if(code < 48 || code > 57){
        return false;
    }
}