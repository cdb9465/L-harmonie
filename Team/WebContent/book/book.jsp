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
<style>
	.ui-datepicker{ font-size: 1.1em; width: 320px; padding: .3em .3em 0;}
	
</style>
</head>
<body>
<%
// session 없으면 -> 로그인
String email = (String)session.getAttribute("email");
if(email == null){
%>
<script>
alert("로그인 후 이용가능합니다.");
history.back();
</script>	
<%
}
%>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>

<!-- 본문 -->
<div id="wrap">
<h1 id="title">BOOK</h1>
<article id="book_art">

<!-- 예약 네비게이션 메뉴바 -->
<div class="book_nav">
 <div class="steps">
  <!-- <div class="step2" onclick="moveTab(0)"><i class="far fa-user" style="font-size:15px"></i> STEP 1 <br> 지점 및 인원 선택</div> -->
  <div class="step2"><i class="far fa-user" style="font-size:15px"></i> STEP 1 <br> 지점 및 인원 선택</div>
 </div>
 <div class="steps">
  <!-- <div class="step2" onclick="moveTab(1)"><i class="fas fa-calendar-alt" style="font-size:15px"></i> STEP 2 <br> 날짜 및 시간 선택</div> --> 
  <div class="step2"><i class="fas fa-calendar-alt" style="font-size:15px"></i> STEP 2 <br> 날짜 및 시간 선택</div>
 </div>
 <div class="steps">
  <!-- <div class="step2" onclick="moveTab(2)"><i class="fas fa-utensils" style="font-size:15px"></i> STEP 3 <br> 테이블 선택</div> -->
  <div class="step2"><i class="fas fa-utensils" style="font-size:15px"></i> STEP 3 <br> 테이블 선택</div>
 </div>
 <div class="steps">
  <!-- <div class="step2" onclick="moveTab(3)"><i class="fa fa-edit" style="font-size:15px"></i> STEP 4 <br> 요청사항 입력 </div> -->
  <div class="step2"><i class="fa fa-edit" style="font-size:15px"></i> STEP 4 <br> 요청사항 입력 </div>
 </div>
 <div class="steps">
  <!-- <div class="step2" onclick="moveTab(4)"><i class="fa fa-check" style="font-size:15px"></i> STEP 5 <br> 확인 &amp; 완료 </div> -->
  <div class="step2"><i class="fa fa-check" style="font-size:15px"></i> STEP 5 <br> 확인 &amp; 완료 </div>
 </div>
</div>
<!-- 예약 네비게이션 메뉴바 -->

<!-- 예약 폼 -->
<form id="book_form" name="bf" action="./BookAction.bk" method="post">

<!-- 1단계(지점, 인원) -->
<div class="tab">
<div class="panel">

 <div id="location">
  <label class="label">지점 선택</label>
  <div class="slot" onclick ="selectLocation(0)">서울강남점</div>
  <div class="slot" onclick ="selectLocation(1)">부산서면점</div>
  <input type="hidden" name="location" value="">
 </div>
 
 <div id="guest">
  <label class="label">인원수 선택</label>
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
  <label class="label">날짜 선택</label>
  <div id="datepicker"><input type="hidden" name="date" id="dateval"></div>
  
  <div id="dateDesc">
   <div id="squToday"><i class="fa fa-square" style="color:#666666"></i> 오늘날짜</div>
   <div id="squSelect"><i class="fa fa-square" style="color:#333333"></i> 선택된날짜</div>
   <div id="squAble"><i class="fa fa-square" style="color:#eeeeee"></i> 예약가능날짜</div>
  </div>
 </div>
  
 <div id="time">
  <label class="label">시간 선택</label>
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

<label class="label">테이블 선택</label>
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
  <label class="label">그 외 요청사항</label>
  <!-- <label>고객님께 드리는 질문<b style="color:red;">[필수]</b> </label><br>
  <span>음식 관련 알레르기나 특별 요청사항이 있으면 말씀해주시기 바랍니다</span><br> -->
  <div id="alergy">
   <label><i class="fa fa-check"></i> 알러지 여부</label>
   <div id="rad">
    <input type="radio" name="alergy" value="false" onclick="showDetail(false)" checked>없음
    <input type="radio" name="alergy" value="true" onclick="showDetail(true)" >있음
    <input type="text" id="detail" placeholder="ex) 땅콩 알러지" size="20"><br>
   </div>
   <br>
   <span><i class="fa fa-exclamation"></i> 음식 알러지가 있을경우 있음을 선택하고 그 종류를 써주세요.</span>
  </div>
  
  <div id="req">
   <label><i class="fa fa-check"></i> 특별 요청사항</label>
   <textarea cols="62" rows="10" name="special"></textarea>
  </div>
  
   <input type="hidden" name="request">
 </div>
</div>
</div>
<!-- 4단계 (요청사항)-->
 
<!-- 5단계 (확인 & 완료)-->
<div class="tab">
<div class="panel">
 <label class="label">예약내역 확인</label>
 <table id="confirm">
 <tr>
  <th><i class="fa fa-home"> </i> 지점 : </th>
  <!-- <td>00점</td> -->
 </tr>
 <tr>
  <th><i class="fa fa-user"> </i> 인원 : </th>
  <!-- <td>00명</td> -->
  </tr>
  <tr>
   <th><i class="fa fa-calendar-check-o"> </i> 예약 날짜 : </th>
   <!-- <td>2018년 12월 1일</td> -->
  </tr>
  <tr>
   <th><i class="fa fa-clock-o"> </i> 예약 시간 : </th>
   <!-- <td>13:00시</td> -->
  </tr>
  <tr>
   <th><i class="fas fa-utensils"> </i> 예약 테이블 : </th>
   <!-- <td>t7번</td> -->
  </tr>
  <tr>
   <th><i class="fa fa-edit"> </i> 요청 사항 : </th>
   <!-- <td>없음</td> -->
  </tr>

 </table>

</div>
</div>
<!-- 5단계 (확인 & 완료)-->
	
<!-- 버튼 -->
<div style="overflow:auto;">
 <div>
  <button type="button" id="prevBtn" onclick="nextPrev(-1)">이전</button>
  <button type="button" id="nextBtn" onclick="nextPrev(1)">다음</button>
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
var moveDiff = 0; //몇칸 이동하는지 계산(이전탭 보기위해)
showTab(currentTab); // Display the crurrent tab

$(document).ready(function(){
	//datepicker 
 	$(function () {
 		var today = $.datepicker.formatDate('yy-mm-dd', new Date());
 		
		$("#datepicker").datepicker({
			showMonthAfterYear: true, //연도와 달 위치 변경
			monthNames:['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			dateFormat: 'yy-mm-dd',
 			minDate: today,
 			maxDate: '+14d',
 			defaultDate: '+1d',	//초기값
			onSelect: function (date) { //date:선택된날짜 inst:인스턴스
				//내일날짜구하기
				var day = new Date();
				day.setDate(day.getDate()+1);
				var nextDay = $.datepicker.formatDate('yy-mm-dd', day);
				//alert(nextDay); 
				
				if(date == today)
				{
					alert("예약은 익일날짜부터 가능합니다.");
					//$("#datepicker").datepicker("option", "defaultDate", selected);
					//$("#datepicker").datepicker("refresh"); //refresh
					$("#datepicker").datepicker('setDate', nextDay);					
				}
				else
				{
					$('#dateval').val(date);				
				}
				
				initTime(); //날짜선택시 시간선택 초기화
				getDisableTime();
 			}
		});

		//초기값 받아오기
		$("#dateval").val($("#datepicker").datepicker().val());

	});
	
	//지점, 인원 변경시  시간, 테이블 선택값 초기화
	$("#location, #guest").click(function(){
		//initDate();
		initTime();
		initTable();
		
		getDisableTime();
	});
	
	//테이블 중복제어
 	$("#time").click(function(){
 		initTable(); 	//시간변경시 테이블선택 초기화
 		getDisableTable();
 	});
		
});
</script>
<style>
 .ui-datepicker { margin: 0 auto; }
 .ui-datepicker td span, .ui-datepicker td a { padding: .5em; }
</style>

</body>
</html>