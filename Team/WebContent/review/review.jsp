<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@page import="net.review.db.CommentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.review.db.CommentBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.member.db.MemberBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="net.review.db.ReviewDAO"%>
<%@page import="net.review.db.ReviewBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>L'harmonie</title>

<link href="./css/default.css" rel="stylesheet">
<link href="./css/review.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>

<%


int review_num1=((Integer)request.getAttribute("review_num1")).intValue();
//System.out.println(review_num1);
List<CommentBean> cobe=(List<CommentBean>)request.getAttribute("cobe");

String pageNum=(String)request.getAttribute("pageNum");
List<ReviewBean> ReviewList = (List<ReviewBean>)request.getAttribute("reviewList");
int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
int count=((Integer)request.getAttribute("count")).intValue();
int Ccount=((Integer)request.getAttribute("Ccount")).intValue();

int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
int startPage=((Integer)request.getAttribute("startPage")).intValue();
int endPage=((Integer)request.getAttribute("endPage")).intValue();
String email=(String)session.getAttribute("email");
String location=(String)session.getAttribute("location");
List<ReviewBean> reviewlocation=(List)request.getAttribute("reviewlocation");
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

<form action="./ReviewList.re" name="location" method="get">
 <div class="write_find">
  <div class="title">*간편검색*</div><br>
  <select name="sel_location">
    <option value="전체" >전체</option>
   <option value="서울강남점" ><a href="./LocationAction.re">서울강남점</a></option>
   <option value="부산서면점">부산서면점</option>
  </select>
 </div>
 </form>
<!-- review_wrap 시작 -->
<div class="review_wrap">	

<!-- 사진영역 div-->
<%
if(count!=0)
{  
for(int i=0;i<ReviewList.size();i++)
{
    ReviewBean rb=ReviewList.get(i);
   %>
   
<table border="1" class="tbimg" width="100%" cellspacing="0" cellpadding="0">
<tr style="background-color:black; color:white; height:20px;">
<th><%=rb.getMem_num()%></th>
<th><%=rb.getLocation() %></th>
<th><%=rb.getDate() %></th>
</tr>


<tr><th colspan='2'>
 
 <div class="rating">
 <%	
	for(int s=0; s< rb.getRating(); s++){
		%><i class="fa fa-star" style="color:red; font-size:20px;"></i><%
	}
	%>
</div>
</th>
<td>정말 놀라웠어요~!</td>
</tr>



<tr><th colspan='3'><div class="content">
  <%=rb.getContent()%><br>
</div></th></tr>


<tr><th colspan='3'> 
<div class="container">
<!-- 썸네일 이미지 목록 -->
 <div class="row">
  <div class="column">
  <img class="demo cursor active" src="./upload/<%=rb.getFile().split(",")[0] %>" style="width:100%" onclick="currentSlide(<%=i%>,1)" alt="">
  </div>
  <div class="column">
   <img class="demo cursor active" src="./upload/<%=rb.getFile().split(",")[1] %>" style= "width:100%" onclick="currentSlide(<%=i%>,2)" alt="">
  </div>  
  <div class="column">
   <img class="demo cursor active" src="./upload/<%=rb.getFile().split(",")[2] %>" style="width:100%" onclick="currentSlide(<%=i%>,3)" alt="">
  </div>
 </div>
 <!-- 썸네일 이미지 목록 끝 --> 

 <!-- 사진펼침 시작 -->
 <div class="review_pic">
  <a class="prev" onclick="plusSlides(<%=i%>,-1)">❮</a>
  <a class="next" onclick="plusSlides(<%=i%>,1)">❯</a>
  <div class="mySlides">
   <img alt="첨부사진" src="./upload/<%=rb.getFile().split(",")[0] %>"  onclick="currentSlide(<%=i%>,1)"> 

  </div>
  <div class="mySlides">
   <img alt="첨부사진" src="./upload/<%=rb.getFile().split(",")[1] %>" onclick="currentSlide(<%=i%>,2)">
  </div>
  <div class="mySlides">
   <img alt="첨부사진" src="./upload/<%=rb.getFile().split(",")[2] %>" onclick="currentSlide(<%=i%>,3)">
  </div>
 </div>
 <!-- 사진펼침 끝 -->
</div>
<!-- 사진영역 div 끝-->
<div class="clear"></div>

</th></tr>

<tr><td>
<div class="content">

 <div class="like">
  <button type="button" onclick="style='background-color:pink'"> <i class="fa fa-heart" id=heart style="color:red"></i> <p>좋아요</p> </button>
 </div>
 </div>
</td>
<td>4명이 좋아합니다.</td>
<td><div class="content">
  <input type="button"value="글삭제"  onclick="location.href='./ReviewDelete.re?review_num=<%=rb.getReview_num()%>'" id="ddate">
    <br> 
     <br>
 </div>
</td>
</tr>


<tr>


<%

MemberDAO mdao=new MemberDAO();
//리턴값을 저장할 변수 = getMember(세션값) 메서드 호출
MemberBean mb=mdao.getMember(email);
if(email!=null)
{
if(email.equals("admin@team.com")){%> 

<td colspan='3'>
 <form action="./CommentWriteAction.re"  method="post">
<div class="comment">
<input type="hidden" name="mem_num" value=<%=rb.getMem_num()%>>
<input type="hidden" name="review_num" value=<%=rb.getReview_num()%>>
   <input type="text" name="content" id="content">
 <button type="submit"><p>댓글등록</p></button>
</div>
</form>
</td>

<%}%>
<%}%>

 </tr>
 <%
CommentBean cdd=new CommentBean();
 if(Ccount!=0){
	 //System.out.println(rb.getReview_num());
	 
 

for(int j=0;j<cobe.size();j++){
	
	
    	CommentBean cb=cobe.get(j);

    	if(rb.getReview_num()==cb.getReview_num()){
    	 	
    	//System.out.println(rb.getFile().split(",")[0]);
    	%>
<tr>

<td colspan="3">

<div> 
<i class="material-icons" >subdirectory_arrow_right </i>
<b>[관리자]</b>
<%=cb.getContent() %>

<%


//리턴값을 저장할 변수 = getMember(세션값) 메서드 호출

if(email!=null)
{
if(email.equals("admin@team.com")){%> 

<input type="button"value="댓글삭제"  onclick="location.href='./CommentDelete.re?comment_num=<%=cb.getComment_num()%>'" id="ddate">
</div>

</td>

</tr>
<%}%>
<%}%>
<%}%>
<%}%>
<%}%>
</table>
<%
}
%>
  
<%
    }
%>


</div>
<!-- review_wrap 끝 -->
<p class="pageSelect">
<%
//이전
if(startPage > pageBlock){
	%><a href="./ReviewList.re?pageNum=<%=startPage-pageBlock%>" >[이전]</a><%
}
// 1~10 
for(int i=startPage;i<=endPage;i++){
	%><a href="./ReviewList.re?pageNum=<%=i%>" class="pp">[<%=i %>]</a><%
}
//다음
if(endPage < pageCount){
	%><a href="./ReviewList.re?pageNum=<%=startPage+pageBlock%>">[다음]</a><%
}
%>
</p>
<script>
var bClick = false;
var activeIndex = 0;
var slideIndex = 0;
var j=0;
//showSlides(slideIndex);

function plusSlides(j,n) { showSlides(j,slideIndex += n); }
function currentSlide(j,n) {	showSlides(j,slideIndex = n); }

function showSlides(j,n) {
	
	var i;
	var tbimg=document.getElementsByClassName("tbimg");
	
// 	for(i=0; i<tbimg.length; i++)
// 		{
		var slides = tbimg[j].getElementsByClassName("mySlides");
		var dots = tbimg[j].getElementsByClassName("demo");
		var prev = tbimg[j].getElementsByClassName("prev");
		var next = tbimg[j].getElementsByClassName("next");
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
</div>
</article>
</div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="./../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</body>
</html>