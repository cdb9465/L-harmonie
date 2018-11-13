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

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<div class="clear"></div>
<!-- 헤더파일들어가는 곳 -->
<div id="wraap">
<div class="clear"></div>
<article>
<!-- 메인 들어가는 곳 -->
<div class="main">
<!-- 리뷰쓰기 영역 시작 -->
<div class="review_write">
<form>
 
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
  <textarea placeholder="리뷰를 작성해주세요"></textarea>
  <button type="submit">리뷰등록</button>
 </div>

</form>
</div>
<!-- 리뷰쓰기 영역 끝 -->
<hr>
 <div class="write_find">
  <div class="title">*간편검색*</div>
  <select name="sel_location">
    <option value="gangnam">전체</option>
   <option value="gangnam">강남점</option>
   <option value="seomyeon">서면점</option>
  </select>
  
 </div>
<!-- review_wrap 시작 -->
<div class="review_wrap">	

<!-- 사진영역 div-->
<div class="container">	
<!-- 썸네일 이미지 목록 -->
 <div class="row">
  <div class="column">
   <img class="demo cursor active" src="seafood.jpg" style="width:100%" onclick="currentSlide(1)" alt="">
  </div>
  <div class="column">
   <img class="demo cursor active" src="salmon_steak.jpg" style= "width:100%" onclick="currentSlide(2)" alt="">
  </div>  
  <div class="column">
   <img class="demo cursor active" src="chicken_steak.jpg" style="width:100%" onclick="currentSlide(3)" alt="">
  </div>
 </div>
 <!-- 썸네일 이미지 목록 끝 --> 

 <!-- 사진펼침 시작 -->
 <div class="review_pic">
  <a class="prev" onclick="plusSlides(-1)">❮</a>
  <a class="next" onclick="plusSlides(1)">❯</a>
  <div class="mySlides">
   <img alt="첨부사진" src="seafood.jpg"  onclick="currentSlide(1)">
  </div>
  <div class="mySlides">
   <img alt="첨부사진" src="salmon_steak.jpg" onclick="currentSlide(2)">
  </div>
  <div class="mySlides">
   <img alt="첨부사진" src="chicken_steak.jpg" onclick="currentSlide(3)">
  </div>
 </div>
 <!-- 사진펼침 끝 -->
</div>
<!-- 사진영역 div 끝-->

<div class="clear"></div>
<hr>

<!-- 리뷰내용 영역 -->
<div class="review_content">
 
 
 <div class="clear"></div>


 <div class="name"> <p>홍길동</p> </div>
 <div class="date"> <p>2018.10.26 14:37:00</p> </div>
 <div class="rating">
  <i class="fa fa-star"></i>
  <i class="fa fa-star"></i>
  <i class="fa fa-star"></i>
  <i class="fa fa-star"></i>
  <i class="fa fa-star-o">4.0</i>
 
 </div>
 
 
 <div class="clear"></div>

 <div class="content">
  <p>내용<br>
    내용<br>
    내용<br>
 <div class="like">
  <button type="button" onclick="style='background-color:pink'"> <i class="fa fa-heart" id=heart style="color:red"></i> <p>좋아요</p> </button>
 </div>
 <input type="button"value="글수정" id="udate" onclick="location='review_re.jsp'">
  <input type="button"value="글삭제" id="ddate" onclick="delete22()">
     <script type="text/javascript">
     function delete22(){
    	 r=confirm("삭제하시겠습니까?");
    	 if(r==true){
    		 alert("삭제 완료되었습니다.")
    		 location.href="review.jsp";
    	 }
    	 else{
    		 alert("취소되었습니다.")
    		 location.href="review.jsp";
    	 }
     }
     </script>
    <br> 
     <br>
     </p>
 </div>
</div>


<!-- 리뷰내용 영역 끝 -->


<hr>
<div class="comment">
 <textarea placeholder="댓글"></textarea>
 <button type="button" onclick="sub11()"><p>댓글등록</p></button>
      <script type="text/javascript">
     function sub11(){
    	 r=confirm("등록하시겠습니까?");
    	 if(r==true){
    		 alert("등록되었습니다.")
    		 location.href="review.jsp";
    	 }
    	 else{
    		 alert("취소되었습니다.")
    		 location.href="review.jsp";
    	 }
     }
     </script>
</div>

</div>
<!-- review_wrap 끝 -->

</div>
<!-- 메인 들어가는 곳 -->



<div class="review_wrap">	

<!-- 사진영역 div-->
<div class="container">	
<!-- 썸네일 이미지 목록 -->
 <div class="row">
  <div class="column">
   <img class="demo cursor active" src="seafood.jpg" style="width:100%" onclick="currentSlide(1)" alt="">
  </div>
  <div class="column">
   <img class="demo cursor active" src="salmon_steak.jpg" style= "width:100%" onclick="currentSlide(2)" alt="">
  </div>  
  <div class="column">
   <img class="demo cursor active" src="chicken_steak.jpg" style="width:100%" onclick="currentSlide(3)" alt="">
  </div>
 </div>
 <!-- 썸네일 이미지 목록 끝 --> 

 <!-- 사진펼침 시작 -->
 <div class="review_pic">
  <a class="prev" onclick="plusSlides(-1)">❮</a>
  <a class="next" onclick="plusSlides(1)">❯</a>
  <div class="mySlides">
   <img alt="첨부사진" src="seafood.jpg"  onclick="currentSlide(1)">
  </div>
  <div class="mySlides">
   <img alt="첨부사진" src="salmon_steak.jpg" onclick="currentSlide(2)">
  </div>
  <div class="mySlides">
   <img alt="첨부사진" src="chicken_steak.jpg" onclick="currentSlide(3)">
  </div>
 </div>
 <!-- 사진펼침 끝 -->
</div>
<!-- 사진영역 div 끝-->

<div class="clear"></div>
<hr>

<!-- 리뷰내용 영역 -->
<div class="review_content">
 
 
 <div class="clear"></div>

 <div class="name"> <p>홍길동</p> </div>
 <div class="date"> <p>2018.10.26 14:37:00</p> </div>
 <div class="rating">
  <i class="fa fa-star"></i>
  <i class="fa fa-star"></i>
  <i class="fa fa-star"></i>
  <i class="fa fa-star"></i>
  <i class="fa fa-star-o">4.0</i>
 
 </div>
 
 
 <div class="clear"></div>

 <div class="content">
  <p>내용<br>
    내용<br>
    내용<br>
 <div class="like">
  <button type="button" onclick="style='background-color:pink'"> <i class="fa fa-heart-o" id=heart></i> <p>좋아요</p> </button>
 </div>
 <input type="button"value="글수정" id="udate" onclick="re_updateForm.jsp">
  <input type="button"value="글삭제" id="ddate" onclick="delete22()">
     <script type="text/javascript">
     function delete22(){
    	 r=confirm("삭제하시겠습니까?");
    	 if(r==true){
    		 alert("삭제 완료되었습니다.")
    		 location.href="review.jsp";
    	 }
    	 else{
    		 alert("취소되었습니다.")
    		 location.href="review.jsp";
    	 }
     }
     </script>
    <br> 
     <br>
     </p>
 </div>
</div>


<!-- 리뷰내용 영역 끝 -->

<hr>
<div class="comment">
 <textarea placeholder="댓글"></textarea>
 <button type="button"><p>댓글등록</p></button>
</div>

</div>
<!-- review_wrap 끝 -->
<p id="numnum" style=margin-left:250px; style=margin-right:auto; style=margin-top:100px; >
<a href="#" style=text-decoration:none;>[이전]&nbsp;</a><a href="#" style=text-decoration:none;>1&nbsp;</a>
<a href="#" style=text-decoration:none;>2&nbsp;</a> <a href="#" style=text-decoration:none;>3&nbsp;</a>
<a href="#" style=text-decoration:none;>4&nbsp;</a><a href="#" style=text-decoration:none;>5&nbsp;</a>
 <a href="#"style=text-decoration:none;>6&nbsp;</a><a href="#" style=text-decoration:none;>7&nbsp;</a>
 <a href="#" style=text-decoration:none;>8&nbsp;</a><a href="#" style=text-decoration:none;>9&nbsp;</a>
 <a href="#" style=text-decoration:none;>10&nbsp;</a><a href="#" style=text-decoration:none;>[다음]</a></p>
</div>
</article>
<!-- 메인 들어가는 곳 -->










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