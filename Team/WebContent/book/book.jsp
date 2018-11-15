7<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>L'harmonie</title>
<link href="./css/default.css" rel="stylesheet">
<link href="./css/book.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/jquery-ui.js"></script>
<link href="./js/jquery-ui.css" rel="stylesheet">
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>

<!-- 본문 -->
<div id="wrap">
<article>

<!-- 예약 네비게이션 메뉴바 -->
<div class="book_nav">
 <div class="steps">
  <div class="step2" onclick="moveTab(0)"><i class="fa fa-fw fa-user" style="font-size:15px"></i> STEP 1 <br> 지점 및 인원 선택</div>
 </div>
 <div class="steps">
  <div class="step2" onclick="moveTab(1)"><i class="fa fa-calendar" style="font-size:15px"></i> STEP 2 <br> 날짜 및 시간 선택</div> 
 </div>
 <div class="steps">
  <div class="step2" onclick="moveTab(2)"><i class="fa fa-cutlery" style="font-size:15px"></i> STEP 3 <br> 테이블 선택</div>
 </div>
 <div class="steps">
  <div class="step2" onclick="moveTab(3)"><i class="fa fa-edit" style="font-size:15px"></i> STEP 4 <br> 요청사항 입력 </div>
 </div>
 <div class="steps">
  <div class="step2" onclick="moveTab(4)"><i class="fa fa-check" style="font-size:15px"></i> STEP 5 <br> 확인 &amp; 완료 </div>
 </div>
</div>
<!-- 예약 네비게이션 메뉴바 -->

<!-- 예약 폼 -->
<form id="book_form" action="../book/bookCheck.jsp" method="post">

<!-- 1단계(지점, 인원) -->
<div class="tab">
<!-- form부분 -->
<div class="panel">

 <div id="location">
  <label class="label">지점</label>
  <div class="slot" >서울강남점</div>
  <div class="slot" >부산서면점</div>
  <input type="hidden" name="location" value="">
 </div>
 
 <div id="guest">
  <label class="label">인원</label>
  <div class="slot">1</div>
  <div class="slot">2</div>
  <div class="slot">3</div>
  <div class="slot">4</div>
  <input type="hidden" name="guest" value="">
 </div>

</div>
 <!-- form부분 -->
</div>

<!-- 1단계(지점, 인원) -->
	
<!-- 2단계(날짜, 시간) -->
<div class="tab">
<!-- form부분 -->
<div class="panel">
 <!-- <input type="date"><br> -->	<!-- 익스 지원x -->
 
 <div id="date">
 <label class="label">날짜</label>
 <div id="datepicker"><input type="hidden" name="date" id="dateval"></div>
 <!-- <input type="date" id="datepicker" name="date"> -->
 </div>
  
 <div id="time">
  <label class="label">시간</label>
  <div class="slot">11:00</div>
  <div class="slot">13:00</div>
  <div class="slot">17:00</div>
  <div class="slot">19:00</div>
  <input type="hidden" name="time" value="">
 </div>
 
 </div>
<!-- form부분 -->
</div>
<!-- 2단계(날짜, 시간) -->
	
<!-- 3단계(테이블) -->
<div class="tab">
<!-- form부분 -->
<div class="panel">
<label class="label">테이블선택</label>
<div id="table">
 <div id="door">입구</div>
 <div id="kitchen">주방</div>
 <div id="t1" class="tfor2"></div>
 <div id="t2" class="tfor2"></div>
 <div id="t3" class="tfor2"></div>
 <div id="t4" class="tfor2"></div>
 <div id="t5" class="tfor4"></div>
 <div id="t6" class="tfor4"></div>
 <div id="t7" class="tfor4"></div>
 <div id="t8" class="tfor4"></div>
 <div id="t9" class="tfor4"></div>
 <div id="t10" class="tfor4"></div>
 <input type="hidden" name="tablenum" value="">
</div>

</div>
<!-- form부분 -->
</div>
<!-- 3단계(테이블) -->
	
<!-- 4단계 (요청사항)-->
<div class="tab">
<!-- form부분 -->
<div class="panel">

<div class="request">
  <label class="label">요청사항</label><br>
  <label>고객님께 드리는 질문<b style="color:red;">[필수]</b> </label>
  <span>음식 관련 알레르기나 특별 요청사항이 있으면 말씀해주시기 바랍니다</span><br>
  <input type="radio" value="false" name="alergy" checked>없습니다<br>
  <input type="radio" value="true" name="alergy">있습니다<br>
<!--   <input type="text" placeholder="구체적으로" size=30><br> -->
  <label>특별 요청</label>
  <textarea cols="80" rows="10" name="request"></textarea>
 </div> 
 
</div>
<!-- form부분 -->
</div>
<!-- 4단계 (요청사항)-->

<!-- 5단계 (확인 & 완료)-->
<div class="tab">
<!-- form부분 -->
<div class="panel">
 <label class="label">확인</label>
 <table id="confirm">
 <tr>
  <td>지점</td>
  <td>00점</td>
 </tr>
 <tr>
  <td>인원</td>
  <td>00명</td>
  </tr>
  <tr>
   <td>예약날짜</td>
   <td>2018년 12월 1일</td>
  </tr>
  <tr>
   <td>예약시간</td>
   <td>13:00시</td>
  </tr>
  <tr>
   <td>예약테이블</td>
   <td>t7번</td>
  </tr>
  <tr>
   <td>알러지여부</td>
   <td>없음</td>
  </tr>
  <tr>
   <td>특별요청사항</td>
   <td>맛있게 만들어 주세요</td>
  </tr>

 </table>
</div>
<!-- form부분 -->
</div>
<!-- 5단계 (확인 & 완료)-->
	
<!-- 버튼 -->
<div style="overflow:auto;">
 <div>
  <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
  <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
 </div>
</div>
<!-- 버튼 -->
 
</form>
<!-- 예약 폼 -->

</article>

</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

<script>
//datepicker 
 	$(function () {
		$("#datepicker").datepicker({
			showMonthAfterYear: true, //연도와 달 위치 변경
			monthNames:['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			dateFormat: 'yy-mm-dd',
 				
			onSelect: function (dateText, inst) { //dateText:선택된날짜 inst:인스턴스
				$('#dateval').val(dateText);				
 			}
		});
		
		$('.ui-datepicker').css({
			"margin":"0 auto"
		});
	});
 </script>
 
<script>
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the crurrent tab

//해당 페이지로 이동
function moveTab(n)
{
	nextPrev(n-currentTab);
}

function showTab(n) {
	var x = document.getElementsByClassName("tab");
	
	x[n].style.display = "block";

	//fix the Previous/Next buttons:
	if (n == 0) {
	  document.getElementById("prevBtn").style.display = "none";
	} else {
	  document.getElementById("prevBtn").style.display = "inline";
	}
	if (n == (x.length - 1)) {
	  document.getElementById("nextBtn").innerHTML = "Submit";
	} else {
	  document.getElementById("nextBtn").innerHTML = "Next";
	}
	
	fixStepIndicator(n);
}

function nextPrev(n) {
	var x = document.getElementsByClassName("tab");
	
	//if (n == 1 && !validateForm()) return false;

	// Hide the current tab:
	x[currentTab].style.display = "none";
	 
	currentTab = currentTab + n;
	 
	if (currentTab >= x.length) {
		document.getElementById("book_form").submit();
		return false;
	 }
	 
	 //display the correct tab:
	 showTab(currentTab);
}

function validateForm() {
	var x, y, i, valid = true;
	x = document.getElementsByClassName("tab");
	y = x[currentTab].getElementsByTagName("input");

	for (i = 0; i < y.length; i++) {
		if (y[i].value == "") {
	    	// add an "invalid" class to the field:
	    	y[i].className += " invalid";
	    	valid = false;
	  	}
	}
	return valid;
}

function fixStepIndicator(n) {
	var i, x = document.getElementsByClassName("step2");

	for (i = 0; i < x.length; i++) {
		x[i].className = x[i].className.replace(" active", "");
	}
	x[n].className += " active";
}

$(document).ready(function(){
	
	$('#location').children('.slot').each(function(i){
		$(this).click(function(){
			$('#location').children('.slot').css({
				background : '#d3e0f1',
				color : '#424a52'
				});
			$(this).css({
				background : '#424a52',
				color : '#d3e0f1'
			});	
				
			if(i==0)
				$('input:hidden[name=location]').val('서울강남점');
			else if(i==1)
				$('input:hidden[name=location]').val('부산서면점');
		});
		
		
		
	});
	
	$('#guest').children('.slot').each(function(i){
		$(this).click(function(){
			$('#guest').children('.slot').css({
				background : '#d3e0f1',
				color : '#424a52'
				});
			
			$(this).css({
				background : '#424a52',
				color : '#d3e0f1'
			});	
				
			if(i==0)
				$('input:hidden[name=guest]').val('1');
			else if(i==1)
				$('input:hidden[name=guest]').val('2');
			else if(i==2)
				$('input:hidden[name=guest]').val('3');
			else if(i==3)
				$('input:hidden[name=guest]').val('4');
		});		
		
	});
	
	$('#time').children('.slot').each(function(i){
		$(this).click(function(){
			$('#time').children('.slot').css({
				background : '#d3e0f1',
				color : '#424a52'
				});
			
			$(this).css({
				background : '#424a52',
				color : '#d3e0f1'
			});	
				
			if(i==0)
				$('input:hidden[name=time]').val('11:00');
			else if(i==1)
				$('input:hidden[name=time]').val('13:00');
			else if(i==2)
				$('input:hidden[name=time]').val('17:00');
			else if(i==3)
				$('input:hidden[name=time]').val('19:00');
		});			
	});
	
	$('#table').children('.tfor2').each(function(i){
		$(this).click(function(){
			$('#table').children('.tfor2').css("background-image", "url(../images/book/table2.png)");
			
			$(this).css("background-image", "url(../images/book/table2_g.png)");
				
			if(i==0)
				$('input:hidden[name=tablenum]').val('1');
			else if(i==1)
				$('input:hidden[name=tablenum]').val('2');
			else if(i==2)
				$('input:hidden[name=tablenum]').val('3');
			else if(i==3)
				$('input:hidden[name=tablenum]').val('4');
		});	
		
	});
	
	 $('#table').children('.tfor4').each(function(i){
		$(this).click(function(){
			$('#table').children('.tfor4').css("background-image", "url(../images/book/table4.png)");
			
			$(this).css("background-image", "url(../images/book/table4_g.png)");
				
			if(i==0)
				$('input:hidden[name=tablenum]').val('5');
			else if(i==1)
				$('input:hidden[name=tablenum]').val('6');
			else if(i==2)
				$('input:hidden[name=tablenum]').val('7');
			else if(i==3)
				$('input:hidden[name=tablenum]').val('8');
			else if(i==4)
				$('input:hidden[name=tablenum]').val('9');
			else if(i==5)
				$('input:hidden[name=tablenum]').val('10');
		});	
			 
	}); 

	if($(':radio[name="alergy"]:checked').val() == "true")
		//$(this).append('<input type="text" placeholder="구체적으로" size=30><br>');
		//$('radio[name=alergy]').append('추가');
		alert('checked');
	

});



</script>

</body>
</html>