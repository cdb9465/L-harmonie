<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
    <%@page import="net.review.db.ReviewDAO"%>
    <%@page import="net.review.db.ReviewBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Review Board</title>
<link href="./css/default.css" rel="stylesheet">
<link href="./css/review.css" rel="stylesheet" type="text/css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>


<%
String pageNum=(String)request.getAttribute("pageNum");
List<ReviewBean> ReviewList = (List<ReviewBean>)request.getAttribute("ReviewList");
int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
int startPage=((Integer)request.getAttribute("startPage")).intValue();
int endPage=((Integer)request.getAttribute("endPage")).intValue();
%>

<%
    for(int i=0;i<ReviewList.size();i++){
    	ReviewBean rb=ReviewList.get(i);
    	%>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="./../inc/top.jsp"></jsp:include>
<div class="clear"></div>
<!-- 헤더파일들어가는 곳 -->
<div id="wraap">
<div class="clear"></div>
<article>
<!-- 메인 들어가는 곳 -->
<div class="main">
<!-- 리뷰쓰기 영역 시작 -->

<!-- 리뷰쓰기 영역 끝 -->
<hr>
 <div class="write_find">
  <div class="title">*간편검색*</div>
  <select name="sel_location">
    <option value="gangnam">전체</option>
   <option value="gangnam">서울강남점</option>
   <option value="seomyeon">부산서면점</option>
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
 

 <div class="name"> <p><%=rb.getReview_num()%></p> </div>
 <div class="date"> <p><%=rb.getDate() %></p> </div>
 
 <div class="rating">
  <i class="fa fa-star"></i>
  <i class="fa fa-star"></i>
  <i class="fa fa-star"></i>
  <i class="fa fa-star"></i>
  <i class="fa fa-star-o">4.0</i>
 
 </div>
 
 
 <div class="clear"></div>

 <div class="content">
  <p><%=rb.getContent()%></p><br>
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
 <%
    }
%>
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
   <img class="demo cursor active" src="salmon_salade.jpg" style="width:100%" onclick="currentSlide(1)" alt="">
  </div>
  <div class="column">
   <img class="demo cursor active" src="spaghetti.jpg" style= "width:100%" onclick="currentSlide(2)" alt="">
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
   <img alt="첨부사진" src="salmon_salade.jpg"  onclick="currentSlide(1)">
  </div>
  <div class="mySlides">
   <img alt="첨부사진" src="spaghetti.jpg" onclick="currentSlide(2)">
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





<div class="review_wrap">	

<!-- 사진영역 div-->
<div class="container">	
<!-- 썸네일 이미지 목록 -->
 <div class="row">
  <div class="column">
   <img class="demo cursor active" src="salmon_salade.jpg" style="width:100%" onclick="currentSlide(1)" alt="">
  </div>
  <div class="column">
   <img class="demo cursor active" src="spaghetti.jpg" style= "width:100%" onclick="currentSlide(2)" alt="">
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
   <img alt="첨부사진" src="salmon_salade.jpg"  onclick="currentSlide(1)">
  </div>
  <div class="mySlides">
   <img alt="첨부사진" src="spaghetti.jpg" onclick="currentSlide(2)">
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




















<!-- review_wrap 끝 -->
<%
//이전
if(startPage > pageBlock){
	%><a href="./ReviewList.re?pageNum=<%=startPage-pageBlock%>">[이전]</a><%
}
// 1~10 
for(int i=startPage;i<=endPage;i++){
	%><a href="./ReviewList.re?pageNum=<%=i%>">[<%=i %>]</a><%
}
//다음
if(endPage < pageCount){
	%><a href="./ReviewList.re?pageNum=<%=startPage+pageBlock%>">[다음]</a><%
}
%>

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
</article>
</div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="./../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</body>
</html>