<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/book.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
<link rel="stylsheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>
<div id="wrap">
<article>
<h1>Reservation</h1>

<div class="book_nav">
  <a href="#" class="step2"><i class="fa fa-calendar" style="font-size:15px"></i> STEP 1 <br> 지점 및 날짜 선택</a>
  <a href="#" class="step2"><i class="fa fa-fw fa-user" style="font-size:15px"></i> STEP 2 <br> 인원 및 테이블 선택</a> 
  <a href="#" class="step2"><i class="fa fa-plus" style="font-size:15px"></i> STEP 3 <br> 옵션 및 요청 선택</a> 
  <a href="#" class="step2"><i class="fa fa-info-circle" style="font-size:15px"></i> STEP 4 <br> 고객 정보 입력 </a>
  <a href="#" class="step2"><i class="fa fa-check" style="font-size:15px"></i> STEP 5 <br> 확인 & 완료 </a>
</div>

<form id="book_form" action="">
  <fieldset>
	<div class="tab">
	 <div class="accordion">
	  <p>지점 및 날짜 선택</p>
	   <i class="fa fa-arrow-circle-down" style="font-size:24px"></i>
	 </div>
	 <div class="panel1">
	       설명
	   1
	   2
	   3
	 </div>
	 <div class="panel2">
	 <label>지점</label>
		<select>
		 <option> 강남점 </option>
		 <option> 부산점 </option>
		</select><br>
	 <label>날짜 선택</label>
	    <input type="date">
	 </div>
	</div>
	
	<div class="tab">
	 <div class="accordion">
	  <p>인원 및 테이블 선택</p>
	   <i class="fa fa-arrow-circle-down" style="font-size:24px"></i>
	 </div>
	 <div class="panel1">
	      설명
	   1
	   2
	   3
	 </div>
	 <div class="panel2">
	 <label>인원</label>
		<select>
		 <option> 1~2명 </option>
		 <option> 3~4명 </option>
		 <option> 5~8명 </option>
		</select><br>
	 <label>테이블 선택</label>
	 </div>
	</div>
	
	<div class="tab">
	 <div class="accordion">
	  <p>지점 및 날짜 선택</p>
	   <i class="fa fa-arrow-circle-down" style="font-size:24px"></i>
	 </div>
	 <div class="panel1">
	       설명
	   1
	   2
	   3
	 </div>
	 <div class="panel2">
	 <label>지점</label>
		<select>
		 <option> 강남점 </option>
		 <option> 부산점 </option>
		</select><br>
	 <label>날짜 선택</label>
	    <input type="date">
	 </div>
	</div>
	
	<div class="tab">
	 <div class="accordion">
	  <p>지점 및 날짜 선택</p>
	   <i class="fa fa-arrow-circle-down" style="font-size:24px"></i>
	 </div>
	 <div class="panel1">
	       설명
	   1
	   2
	   3
	 </div>
	 <div class="panel2">
	 <label>지점</label>
		<select>
		 <option> 강남점 </option>
		 <option> 부산점 </option>
		</select><br>
	 <label>날짜 선택</label>
	    <input type="date">
	 </div>
	</div>
	
	<div class="tab">
	 <div class="accordion">
	  <p>지점 및 날짜 선택</p>
	   <i class="fa fa-arrow-circle-down" style="font-size:24px"></i>
	 </div>
	 <div class="panel1">
	       설명
	   1
	   2
	   3
	 </div>
	 <div class="panel2">
	 <label>지점</label>
		<select>
		 <option> 강남점 </option>
		 <option> 부산점 </option>
		</select><br>
	 <label>날짜 선택</label>
	    <input type="date">
	 </div>
	</div>
 <div style="overflow:auto;">
  <div style="float:right;">
    <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
    <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
  </div>
 </div>
 </fieldset>
  <div style="text-align:center;margin-top:40px;">
   <span class="step"></span>
   <span class="step"></span>
   <span class="step"></span>
   <span class="step"></span>
   <span class="step"></span>
  </div>
</form>
<div></div>
<div></div>
</article>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</div>
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