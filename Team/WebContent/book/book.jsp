<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>L'harmonie</title>
<link href="../css/book.css" rel="stylesheet">
<link href="../css/default.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script src="../js/jquery-3.3.1.js"></script>
<script src="../js/jquery-ui.js"></script>
<link href="../js/jquery-ui.css" rel="stylesheet">

</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>

<!-- <img src="../images/comming.jpg" alt="준비중입니다." width="100%" id="img2"> -->

<!-- 본문 -->
<div id="wrap">
<article>




<!-- 예약 네비게이션 메뉴바 -->
<div class="book_nav">
 <a href="#" class="step2"><i class="fa fa-fw fa-user" style="font-size:15px"></i> STEP 1 <br> 지점 및 인원 선택</a>
 <a href="#" class="step2"><i class="fa fa-calendar" style="font-size:15px"></i> STEP 2 <br> 날짜 및 시간 선택</a> 
 <a href="#" class="step2"><i class="fa fa-cutlery" style="font-size:15px"></i> STEP 3 <br> 테이블 선택</a> 
 <a href="#" class="step2"><i class="fa fa-edit" style="font-size:15px"></i> STEP 4 <br> 요청사항 입력 </a>
 <a href="#" class="step2"><i class="fa fa-check" style="font-size:15px"></i> STEP 5 <br> 확인 &amp; 완료 </a>
</div>
<!-- 예약 네비게이션 메뉴바 -->

<!-- 예약 폼 -->
<form id="book_form" action="">
<fieldset>

<!-- 1단계(지점, 인원) -->
<div class="tab">
<!-- form부분 -->
<div class="panel2">
 <label>지점</label>
 <select>
  <option> 강남점 </option>
  <option> 서면점 </option>
 </select><br>
 <label>인원</label>
 <select>
  <option> 1명 </option>
  <option> 2명 </option>
  <option> 3명 </option>
  <option> 4명 </option>
 </select><br>		
</div>
 <!-- form부분 -->
</div>
<!-- 1단계(지점, 인원) -->
	
<!-- 2단계(날짜, 시간) -->
<div class="tab">
<!-- form부분 -->
<div class="panel2">
 <!-- <input type="date"><br> -->	<!-- 익스 지원x -->
 <div id="datepicker"></div>
 <script>
 	$(function () {
		$("#datepicker").datepicker({
			showMonthAfterYear: true, //연도와 달 위치 변경
			monthNames:['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:['일','월','화','수','목','금','토']
		});
	});
 </script>
 <select>
  <option> 11:00 ~ 13:00 </option>
  <option> 13:00 ~ 15:00 </option>
  <option> 17:00 ~ 19:00 </option>
  <option> 19:00 ~ 21:00 </option>
 </select><br>		 
</div>
<!-- form부분 -->
</div>
<!-- 2단계(날짜, 시간) -->
	
<!-- 3단계(테이블) -->
<div class="tab">
<!-- form부분 -->
<div class="panel2">
<div id="table">
 <div id="door">입구</div>
 <div id="kitchen">주방</div>
 <div id="t1"><img src="table2.png" onmouseover="this.src='table2_g.png'" onmouseout="this.src='table2.png'"></div>
 <div id="t2"><img src="table2.png" onmouseover="this.src='table2_g.png'" onmouseout="this.src='table2.png'"></div>
 <div id="t3"><img src="table2.png" onmouseover="this.src='table2_g.png'" onmouseout="this.src='table2.png'"></div>
 <div id="t4"><img src="table2.png" onmouseover="this.src='table2_g.png'" onmouseout="this.src='table2.png'"></div>
 <div id="t5"><img src="table4.png" onmouseover="this.src='table4_g.png'" onmouseout="this.src='table4.png'"></div>
 <div id="t6"><img src="table4.png" onmouseover="this.src='table4_g.png'" onmouseout="this.src='table4.png'"></div>
 <div id="t7"><img src="table4.png" onmouseover="this.src='table4_g.png'" onmouseout="this.src='table4.png'"></div>
 <div id="t8"><img src="table4.png" onmouseover="this.src='table4_g.png'" onmouseout="this.src='table4.png'"></div>
 <div id="t9"><img src="table4.png" onmouseover="this.src='table4_g.png'" onmouseout="this.src='table4.png'"></div>
 <div id="t10"><img src="table4.png" onmouseover="this.src='table4_g.png'" onmouseout="this.src='table4.png'"></div>
</div>
</div>
<!-- form부분 -->
</div>
<!-- 3단계(테이블) -->
	
<!-- 4단계 (요청사항)-->
<div class="tab">
<!-- form부분 -->
<div class="panel2">
 <label>요청사항</label>
</div>
<!-- form부분 -->
</div>
<!-- 4단계 (요청사항)-->

<!-- 5단계 (확인 & 완료)-->
<div class="tab">
<!-- form부분 -->
<div class="panel2">
 <label>확인</label>
</div>
<!-- form부분 -->
</div>
<!-- 5단계 (확인 & 완료)-->
	
<!-- 버튼 -->
<div style="overflow:auto;">
 <div style="float:right;">
  <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
  <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
 </div>
</div>
<!-- 버튼 -->
  
</fieldset>
 
<!-- 동그라미 -->
<div style="text-align:center;margin-top:40px;">
 <span class="step"></span>
 <span class="step"></span>
 <span class="step"></span>
 <span class="step"></span>
 <span class="step"></span>
</div>
<!-- 동그라미 -->
 
</form>
<!-- 예약 폼 -->

</article>

</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
            panel.style.display = "none";
        } else {
            panel.style.display = "block";
        }
    });
}
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the crurrent tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
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
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    document.getElementById("regForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
  
  var i, x = document.getElementsByClassName("step2");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}
</script>

</body>
</html>