<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review Board</title>
<link href="../css/review.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<div class="review_wrap">

<div class="container">

 <div class="review_pic">

  <a class="prev" onclick="plusSlides(-1)">❮</a>
  <a class="next" onclick="plusSlides(1)">❯</a>
  
 <div class="mySlides">
  <img alt="첨부사진" src="../images/피자1.jpg">
 </div>
 <div class="mySlides">
  <img alt="첨부사진" src="../images/파스타2.jpg">
 </div>
 <div class="mySlides">
  <img alt="첨부사진" src="../images/파스타5.jpg">
 </div>
  <a class="next" onclick="plusSlides(1)">❯</a>
  
 </div>



 <div class="row">
  <div class="column">
   <img class="demo cursor" src="../images/피자1.jpg" style="width:100%" onclick="currentSlide(1)" alt="">
  </div>
  <div class="column">
   <img class="demo cursor" src="../images/파스타2.jpg" style="width:100%" onclick="currentSlide(2)" alt="">
  </div>  
  <div class="column">
   <img class="demo cursor" src="../images/파스타5.jpg" style="width:100%" onclick="currentSlide(3)" alt="">
  </div>
 </div>
 
</div>

<div class="clear"></div>

<!-- 
<div class="dot-container">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>
 -->

<hr>

<div class="rating">
 <i class="fa fa-star"></i>
 <i class="fa fa-star"></i>
 <i class="fa fa-star"></i>
 <i class="fa fa-star"></i>
 <i class="fa fa-star-o"></i>
 <span> 4.0 </span>
</div>

<div class="like">
 <button type="button">
  <i class="fa fa-heart-o"></i>
  <p>좋아요</p>
 </button>
 
</div>

<div class="clear"></div>

<div class="name"> <p>글쓴이</p> </div>
<div class="date"> <p>2018.10.26 14:37:00</p> </div>

<div class="clear"></div>

<div class="content">
 <p>내용<br>
   내용<br>
   내용<br>
   내용<br>
 </p>
</div>

<hr>

<div class="comment">
 <textarea placeholder="댓글"></textarea>
</div>

</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) { showSlides(slideIndex += n); }
function currentSlide(n) { showSlides(slideIndex = n); }

function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("demo");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";
	  dots[slideIndex-1].className += " active";
	}
</script>

</body>
</html>