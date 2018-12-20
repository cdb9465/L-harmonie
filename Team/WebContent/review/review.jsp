<%@page import="net.review.db.LoveBean"%>
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

List<LoveBean> lobe=(List<LoveBean>)request.getAttribute("lobe");
int Lcount=((Integer)request.getAttribute("Lcount")).intValue();

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
MemberDAO mdao1= new MemberDAO();
MemberBean mbb= mdao1.getMember(email);

%>


<!-- 헤더파일들어가는 곳 -->
<jsp:include page="./../inc/top.jsp"></jsp:include>

<div class="clear"></div>
<!-- 헤더파일들어가는 곳 -->
<div id="sec1_reviewlist">
<!-- 배경이미지 들어가는 영역 -->

         <h1 id="title">REVIEW</h1>

<!-- 메인 table있을곳 -->
<div id="reviewList">

<form action="./LocationAction.re" name="location" method="get">
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


<!-- 사진영역 div-->
<%
if(count==0)
{
	%>
	 <table class="review_tbl">
	  <tr><td colspan="2">리뷰 없음</td></tr>
	 </table>
	 <%
}

else if(count!=0)
{  
for(int i=0;i<ReviewList.size();i++)
{
    ReviewBean rb=ReviewList.get(i);
    String ii[]=rb.getFile().split(",");
   System.out.println("이미지 개수 : "+ ii.length);
   
   %>
   
	<table class="review_tbl">
    <tr><td colspan="2" class="td_start"><%=rb.getName() %><span id="loca"><%=rb.getLocation() %></span><span id="date"><%=rb.getDate() %></span></td></tr>
    <tr><td colspan="2" class="td_rating">
        <%
          for(int s=0; s< rb.getRating(); s++){ 
             %><i class="fa fa-star" style="color:#f04e00; font-size:15px;"></i><%             
          }
        %>
    </td></tr>
    <tr><td colspan="2" class="td_cont"> <%=rb.getContent() %> </td></tr>
    <tr >
    <td colspan="2" class="td_pic">

	<div class="container" > 
	<!-- 썸네일 이미지 목록 -->
	 <div class="row" >
  
	<%
	for(int picIndex = 0; picIndex < rb.getFile().split(",").length; picIndex++)
	{
		if(rb.getFile().split(",")[picIndex]!=null)	//수정필요
		{
		//if(rb.getFile().split(",")[picIndex].equals(null)) break; //수정필요
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
	 for(int picIndex = 0; picIndex < rb.getFile().split(",").length; picIndex++)
	
	 {
		 if(rb.getFile().split(",")[picIndex]!=null)	//수정필요
		 {
		// if(rb.getFile().split(",")[picIndex].equals(null)) break; //수정필요
	%>
	
	  <div class="mySlides">
	   <img alt="첨부사진"  width="700" src="./upload/<%=rb.getFile().split(",")[picIndex]%>" onclick="currentSlide(<%=i%>,<%=picIndex+1%>)"/>
	  </div>
<%
		 }
	 }

%>


	 </div>
	</div>
	<!-- 사진펼침 끝 -->	 
    </td></tr>
                      
    <tr><td colspan="2" class="td_like" >
         <form action="./LoveCountAction.re"  method="post">
            <input type="hidden" name="mem_num" value=<%//=mbb.getMem_num()%>>
            <input type="hidden" name="review_num" value=<%//=rb.getReview_num()%>>
            <input type="hidden" name="love_num" value="1">
            <!-- 누르기 전이라 하트아이콘 회색으로해둠. 누르면 빨강으로 style="color:#800000;" -->
               <Button type="submit" onclick="style='background-color:pink'" id="heart1">
               <i class='fas fa-heart' style='color:#800000; font-size:23px;'id=heart ></i></Button>
         </form>


<%

int lovecount = 0; 
if(Lcount!=0){	 
 

for(int z=0;z<lobe.size();z++){
	
	
    	LoveBean lb=lobe.get(z);
    	
   	if(rb.getReview_num()==lb.getReview_num()){
    	lovecount+=1;
    	%>




<%
    	}
	}
 } 

%>
<%=lovecount %>
명이 좋아합니다.


 <%

if(rb.getMem_num()==mbb.getMem_num())
{
%>
  <input type="button"value="글삭제"  onclick="location.href='./ReviewDelete.re?review_num=<%=rb.getReview_num()%>'" class="delReview">
    <br> 
     <br>
     <%
}
 %>
 
 
 
</td>

</tr>
<%

MemberDAO mdao=new MemberDAO();
//리턴값을 저장할 변수 = getMember(세션값) 메서드 호출
MemberBean mb=mdao.getMember(email);

if(email!=null)
{
if(email.equals("admin@team.com")){%> 

<tr>




<td colspan='2' class="insertComm">
 <form action="./CommentWriteAction.re"  method="post">
<div class="comment">
<input type="hidden" name="mem_num" value=<%=rb.getMem_num()%>>
<input type="hidden" name="review_num" value=<%=rb.getReview_num()%>>
   <!-- <input type="text" name="content" id="content"> 
 <button type="submit" id="comment_sub"><p>댓글등록</p></button> -->
              <textarea  name="content" class="comm_content" placeholder="댓글내용"></textarea> 
             <button type="submit" class="comment_btn" >댓글등록</button>
 
</form>
</td>
 </tr>
 <%}%>
<%}%>
 
 <%
 if(Ccount!=0){

	 
 

for(int j=0;j<cobe.size();j++){
	
	
    	CommentBean cb=cobe.get(j);

    	if(rb.getReview_num()==cb.getReview_num()){
    	 	
    	//System.out.println(rb.getFile().split(",")[0]);
    	%>
<tr>

<th class="th_admin"><i class="material-icons" style='font-size:16px'>subdirectory_arrow_right </i> L'harmonie
    
    </th>

<td class="td_comment">
<%=cb.getContent() %>

<%


//리턴값을 저장할 변수 = getMember(세션값) 메서드 호출

if(email!=null)
{
if(email.equals("admin@team.com")){%> 

<input type="button"value="댓글삭제"  onclick="location.href='./CommentDelete.re?comment_num=<%=cb.getComment_num()%>'" class="delComment">


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


<hr>
<!-- 페이지 ◀12345▶ 영역 -->
 <div class="pageArea">
<%
//이전
if(startPage > pageBlock){
	%><a href="./ReviewList.re?pageNum=<%=startPage-pageBlock%>" >◀이전</a><%
}
// 1~10 
for(int i=startPage;i<=endPage;i++){
	%><a href="./ReviewList.re?pageNum=<%=i%>">[<%=i %>]</a><%
}
//다음
if(endPage < pageCount){
	%><a href="./ReviewList.re?pageNum=<%=startPage+pageBlock%>">다음▶</a><%
}
%>
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
</div>
</div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="./../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</body>
</html>