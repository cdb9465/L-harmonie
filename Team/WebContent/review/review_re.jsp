<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Review Board</title>
<link href="../css/default.css" rel="stylesheet">
<link href="../css/review.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<div class="clear"></div>
<div id="wraap">
<div class="review_write">
<form action="review.jsp">
 
 <div class="write_location">
  <div class="title">지점선택</div>
  <select name="sel_location">
   <option value="gangnam">강남점</option>
   <option value="seomyeon">서면점</option>
  </select>
 </div>
 <div class="clear"></div>

 <div class="write_rating">
  <div class="title">별점</div>
<span class="star-input">
	<span class="input">
    	<input type="radio" name="star-input" value="1" id="p1">
    	<label for="p1">1</label>
    	<input type="radio" name="star-input" value="2" id="p2">
    	<label for="p2">2</label>
    	<input type="radio" name="star-input" value="3" id="p3">
    	<label for="p3">3</label>
    	<input type="radio" name="star-input" value="4" id="p4">
    	<label for="p4">4</label>
    	<input type="radio" name="star-input" value="5" id="p5">
    	<label for="p5">5</label>
    	</span>
    	<output for="star-input"><b>0</b>점</output>	
    				
</span>
<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/star.js"></script>
 </div> 
 <div class="clear"></div>
 
 <div class="write_content">
  <div class="title">리뷰</div>
  <div class="clear"></div>
  <textarea placeholder="내용입력되어있음."></textarea>
  <button type="submit" >리뷰등록</button>
 </div>

</form>

</div>
</div>










<script>
var bClick = false;
var activeIndex = 0;
var slideIndex = 0;
//showSlides(slideIndex);

function plusSlides(n) { showSlides(slideIndex += n); }
function currentSlide(n) {	showSlides(slideIndex = n); }

function showSlides(n) {
	var i;
	var slides = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("demo");
	var prev = document.getElementsByClassName("prev");
	var next = document.getElementsByClassName("next");
	
	if (n > slides.length) {slideIndex = 1}
	if (n < 1) {slideIndex = slides.length}

	for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";
	}

	for (i = 0; i < dots.length; i++) {
		dots[i].className = dots[i].className.replace(" active", "");
	}	
	
	if(activeIndex == slideIndex)	//사진 닫을때
	{
		for (i = 0; i < dots.length; i++) {
			dots[i].className += " active";
		}

		slides[slideIndex-1].style.display = "none";
		prev[0].style.display = "none";
		next[0].style.display = "none";
		
		activeIndex = -1;
	}
	else	//사진 열릴때
	{
		for (i = 0; i < dots.length; i++) {
		    dots[i].className = dots[i].className.replace(" active", "");
		}
		
		slides[slideIndex-1].style.display = "block";
		dots[slideIndex-1].className += " active";
		prev[0].style.display = "block";
		next[0].style.display = "block";
		
		activeIndex = slideIndex;
	}
}
</script>
</div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</body>
</html>