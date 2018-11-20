<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>L'harmonie</title>
<link href="./css/default.css" rel="stylesheet">
<link href="./css/book.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/jquery-ui.js"></script>
<script src="./js/bookScript.js"></script>
<link href="./js/jquery-ui.css" rel="stylesheet">
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>

<%
//id session 없으면 -> 로그인
%>

<!-- 본문 -->
<div id="wrap">
<h1 id="title">BOOK</h1>
<article id="book_art">

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
<form id="book_form" name="bf" action="./BookAction.bk" method="post">

<!-- 1단계(지점, 인원) -->
<div class="tab">
<div class="panel">

 <div id="location">
  <label class="label">지점</label>
  <div class="slot" onclick ="selectLocation(0)">서울강남점</div>
  <div class="slot" onclick ="selectLocation(1)">부산서면점</div>
  <input type="hidden" name="location" value="">
 </div>
 
 <div id="guest">
  <label class="label">인원</label>
  <div class="slot" onclick = "selectGuest(0)">1</div>
  <div class="slot" onclick = "selectGuest(1)">2</div>
  <div class="slot" onclick = "selectGuest(2)">3</div>
  <div class="slot" onclick = "selectGuest(3)">4</div>
  <input type="hidden" name="guest" value="">
 </div>

</div>
</div>

<!-- 1단계(지점, 인원) -->
	
<!-- 2단계(날짜, 시간) -->
<div class="tab">
<div class="panel">

 <div id="date">
  <label class="label">날짜</label>
  <div id="datepicker"><input type="hidden" name="date" id="dateval"></div>
 </div>
  
 <div id="time">
  <label class="label">시간</label>
  <div class="slot" onclick = "selectTime(0)">11:00</div>
  <div class="slot" onclick = "selectTime(1)">13:00</div>
  <div class="slot" onclick = "selectTime(2)">17:00</div>
  <div class="slot" onclick = "selectTime(3)">19:00</div>
  <input type="hidden" name="time" value="">
 </div>
 
</div>
</div>
<!-- 2단계(날짜, 시간) -->
	
<!-- 3단계(테이블) -->
<div class="tab">
<div class="panel">

<label class="label">테이블선택</label>
<div id="table">
 <div id="door">입구</div>
 <div id="kitchen">주방</div>
 <div id="t1" class="tabl tfor2" onclick="selectTable(0)">1</div>
 <div id="t2" class="tabl tfor2" onclick="selectTable(1)">2</div>
 <div id="t3" class="tabl tfor2" onclick="selectTable(2)">3</div>
 <div id="t4" class="tabl tfor2" onclick="selectTable(3)">4</div>
 <div id="t5" class="tabl tfor4" onclick="selectTable(4)">5</div>
 <div id="t6" class="tabl tfor4" onclick="selectTable(5)">6</div>
 <div id="t7" class="tabl tfor4" onclick="selectTable(6)">7</div>
 <div id="t8" class="tabl tfor4" onclick="selectTable(7)">8</div>
 <div id="t9" class="tabl tfor4" onclick="selectTable(8)">9</div>
 <div id="t10" class="tabl tfor4" onclick="selectTable(9)">10</div>
 <input type="hidden" name="tablenum" value="">
</div>

</div>
</div>
<!-- 3단계(테이블) -->
	
<!-- 4단계 (요청사항)-->
<div class="tab">
<div class="panel">
 <div class="request">
  <label class="label">요청사항</label><br>
  <label>고객님께 드리는 질문<b style="color:red;">[필수]</b> </label>
  <span>음식 관련 알레르기나 특별 요청사항이 있으면 말씀해주시기 바랍니다</span><br>
  <input type="radio" name="alergy" value="false" onclick="showDetail(false)" checked>없습니다<br>
  <input type="radio" name="alergy" value="true" onclick="showDetail(true)" >있습니다<br>
  <input type="text" id="detail" placeholder="구체적으로" size=30><br>
  <label>특별 요청</label>
  <textarea cols="80" rows="10" name="request"></textarea>
 </div> 
</div>
</div>
<!-- 4단계 (요청사항)-->

<!-- 5단계 (확인 & 완료)-->
<div class="tab">
<div class="panel">
 <label class="label">확인</label>
 <table id="confirm" border="1">
 <tr>
  <td>지점</td>
  <!-- <td>00점</td> -->
 </tr>
 <tr>
  <td>인원</td>
  <!-- <td>00명</td> -->
  </tr>
  <tr>
   <td>예약날짜</td>
   <!-- <td>2018년 12월 1일</td> -->
  </tr>
  <tr>
   <td>예약시간</td>
   <!-- <td>13:00시</td> -->
  </tr>
  <tr>
   <td>예약테이블</td>
   <!-- <td>t7번</td> -->
  </tr>
  <tr>
   <td>알러지여부</td>
   <!-- <td>없음</td> -->
  </tr>
  <tr>
   <td>특별요청사항</td>
   <!-- <td>맛있게 만들어 주세요</td> -->
  </tr>

 </table>
</div>
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
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the crurrent tab

$(document).ready(function(){
	
	//datepicker 
 	$(function () {
 		var minDate = new Date();
 		
		$("#datepicker").datepicker({
			showMonthAfterYear: true, //연도와 달 위치 변경
			monthNames:['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			dateFormat: 'yy-mm-dd',
 			minDate: minDate,
 			maxDate: '+14d',
 			defaultDate: '+1d',	//초기값
			onSelect: function (date) { //date:선택된날짜 inst:인스턴스
				$('#dateval').val(date);				
 			}
		});

		//초기값 받아오기
		$("#dateval").val($("#datepicker").datepicker().val());
		
		$('.ui-datepicker').css({
			"margin":"0 auto"
		});
	});
});
</script>

</body>
</html>