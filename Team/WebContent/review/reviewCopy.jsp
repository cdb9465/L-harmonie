<%@page import="net.member.db.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="net.review.db.ReviewBean"%>
<%@page import="net.admin.db.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- css경로바꿔야함 -->
<link href="./css/default.css" rel="stylesheet">
<link href="./css/reviewCopy.css" rel="stylesheet">
<script src="./js/love.js"></script>
<title>L'harmonie</title>
</head>
<body>
<%
//한글처리
request.setCharacterEncoding("utf-8");

//session 받아오기
String email = (String)session.getAttribute("email");

//가져오기 ReviewList
List<ReviewBean> reviewList = (List<ReviewBean>)request.getAttribute("reviewList");

// PageBean 가져오기 count pageNum 
// pageCount pageBlock startPage endPage
PageBean pb = (PageBean)request.getAttribute("pb");
int count = pb.getCount();
String pageNum = pb.getPageNum();
int pageCount = pb.getPageCount();
int pageBlock = pb.getPageBlock();
int startPage = pb.getStartPage();
int endPage = pb.getEndPage();

int currentPage = Integer.parseInt(pageNum);
%>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="./../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>

<!-- 배경들어가는 영역 -->
<div id="sec1_reviewlist">
<!-- 배경이미지 들어가는 영역 -->

         <h1 id="title">REVIEW</h1>

<!-- 메인 table있을곳 -->
<div id="reviewList">

<!-- 지점선택 영역 -->
<form action="./ReviewListTest.re" method="post" name="location">
 <div id="selectArea">
    <i class='fas fa-store' style='font-size:17px;'></i> <span>[간편검색] 지점을 선택해주세요</span>
     <select class="dateBox" name="sel_location" onchange="this.form.submit();">
         <option value="전체" >전체</option>
         <option value="서울강남점" >서울강남점</option>
         <option value="부산서면점" >부산서면점</option>
     </select>
 </div>
</form>
 
<!-- 리뷰 전체개수 -->
<div class="mpcount"> 리뷰 <span class="countRed"><%=count %></span>개 </div>
   <div class="clear"></div>
<!-- 메인 테이블 -->  
 <!-- <table class="review_tbl"> -->
<%
if(count==0)
{
	%>
	 <table class="review_tbl">
	  <tr><td colspan="2">리뷰 없음</td></tr>
	 </table>
	 <%

}else{
	for(int i = 0; i < reviewList.size(); i++)
	{
		ReviewBean rb = reviewList.get(i);
%>
	<table class="review_tbl">
    <tr><td colspan="2" class="td_start"><%=rb.getMem_num() %><span id="loca"><%=rb.getLocation() %></span><span id="date"><%=rb.getDate() %></span></td></tr>
    <tr><td colspan="2" class="td_rating">
        <%
          for(int s=0; s< rb.getRating(); s++){ 
             %><i class="fa fa-star" style="color:#f04e00; font-size:15px;"></i><%             
          }
        %>
    </td></tr>
    <tr><td colspan="2" class="td_cont"> <%=rb.getContent() %> </td></tr>
    <tr><td colspan="2" class="td_pic">

	<div class="container">
	<!-- 썸네일 이미지 목록 -->
	 <div class="row">
  
	<%
	for(int picIndex = 0; picIndex < 3; picIndex++)
	{
		if(rb.getFile().split(",")[picIndex]!=null)	//수정필요
		{
			if(rb.getFile().split(",")[picIndex].equals("null")) break; //수정필요
	%>
	  <div class="column">
	   <img class="demo cursor active" src="./upload/<%=rb.getFile().split(",")[picIndex]%>" style="width:100%" onclick="currentSlide(<%=i %>, <%=picIndex+1 %>)" alt="<%=rb.getFile().split(",")[picIndex] %>" >
	  </div>
	  
	<%	}
	}%>
	
	 </div>
	<!-- 썸네일 이미지 목록 끝 -->
	
	<!-- 사진펼침 시작 -->
	 <div class="review_pic">
	  <a class="prev" onclick="plusSlides(<%=i%>,-1)">❮</a>
	  <a class="next" onclick="plusSlides(<%=i%>,1)">❯</a>
	  
	<%
	 for(int picIndex = 0; picIndex < 3; picIndex++)
	 {
		 if(rb.getFile().split(",")[picIndex]!=null)	//수정필요
		 {
			 if(rb.getFile().split(",")[picIndex].equals("null")) break; //수정필요
			 System.out.println(rb.getFile().split(",")[picIndex]);
	%>
	  <div class="mySlides">
	   <img alt="첨부사진"  width="700" src="./upload/<%=rb.getFile().split(",")[picIndex]%>" onclick="currentSlide(<%=i%>,<%=picIndex+1%>)">
	  </div>

	<%	}
	}%>

	 </div>
	</div>
	<!-- 사진펼침 끝 -->	 
    </td></tr>
                   <%%>   
    <tr><td colspan="2" class="td_like" >
            <!-- 누르기 전이라 하트아이콘 회색으로해둠. 누르면 빨강으로 style="color:#800000;" -->
               <Button type="button" onclick="loveClick('<%=email %>,<%=rb.getReview_num()%>')" id="heart1">
               <i class='fas fa-heart' style='color:#800000; font-size:23px;'id=heart ></i></Button>
      <%//=lovecount %>20명이 좋아합니다.
		<!-- 작성자일때만 글삭제 보여주기 -->
         <input type="button" value="글삭제" onclick="location.href='./ReviewDelete.re?review_num=<%=rb.getReview_num()%>'" class="delReview">
        <!-- 작성자일때만 글삭제 보여주기 -->
    </td></tr>

	<!-- admin일때만 댓글등록하는 창 보여주기 -->
	<%if(email != null && email.equals("admin@team.com")){%>
     <tr><td colspan="2" class="insertComm">      
           <form action="./CommentWriteAction.re"  method="post">
                <input type="hidden" name="mem_num" value=<%//=rb.getMem_num()%>>
                <input type="hidden" name="review_num" value=<%//=rb.getReview_num()%>>
             <textarea  name="content" class="comm_content">댓글내용</textarea> 
             <button type="submit" class="comment_btn" >댓글등록</button>
             </form>
       </td></tr>      
	<%} %>
	<!-- admin일때만 댓글등록 보여주기 -->      
    
    <tr><th class="th_admin"><i class="material-icons" style='font-size:16px'>subdirectory_arrow_right </i> L'harmonie
    
    </th>
       <td class="td_comment"> <%//=cb.getContent() %>
                         안녕하세요 고객님, L'harmonie입니다.<br>
                         고객님의 소중한 후기 감사드립니다.<br>
                         정성스럽게 남겨주신 의견을 반영하여
                         나날이 발전되고, 개선된 모습으로<br>
                         만족스러운 모습 보여드릴수 있는
                         L'harmonie가 되겠습니다.<br>
                         좋은하루 보내세요^^
                <!-- admin일때만 댓글삭제 보여주기 -->
                <%if(email != null && email.equals("admin@team.com")){%>
                <input type="button"value="댓글삭제"  onclick="location.href='./CommentDelete.re?comment_num=<%//=cb.getComment_num()%>'" class="delComment">
                <%} %>  
            </td></tr>

      </table>
		

   <%} //for문 끝
}//else문 끝
%>
<hr>
<!-- 페이지 ◀12345▶ 영역 -->
 <div class="pageArea">
<%
//이전
if(startPage > pageBlock){
	%><a href="./ReviewListTest.re?pageNum=<%=startPage-pageBlock%>">◀이전</a><%
}

//[1]~[10] 출력
for(int i = startPage; i <= endPage; i++)
{
	//현재선택페이지 링크제거
	if(i != currentPage)
	{%>
		<a href="./ReviewListTest.re?pageNum=<%=i%>">
	<%} %>[<%=i %>]</a>
<%}

//다음
if(endPage < pageCount){%>
	<a href="./ReviewListTest.re?pageNum=<%=startPage+pageBlock %>">다음▶</a>
<%}
%>     
 </div>
   
</div>


</div>

<script>
var bClick = false;
var activeIndex = 0;
var slideIndex = 0;
var j=0;
//showSlides(slideIndex);

function plusSlides(j,n) { showSlides(j,slideIndex += n); }
function currentSlide(j,n) { showSlides(j,slideIndex = n); }

function showSlides(j,n) {
	
	var i;
	var table = document.getElementsByClassName("review_tbl");
	
// 	for(i=0; i<tbimg.length; i++)
// 		{
		var slides = table[j].getElementsByClassName("mySlides");
		var dots = table[j].getElementsByClassName("demo");
		var prev = table[j].getElementsByClassName("prev");
		var next = table[j].getElementsByClassName("next");
// 		}
	
	
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
		dots[slideIndex-1].className += "active";
		prev[0].style.display = "block";
		next[0].style.display = "block";
		
		activeIndex = slideIndex;
	}
}

</script>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="./../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
 
</body>
</html>