<%@page import="java.net.URLEncoder"%>
<%@page import="net.admin.db.PageBean"%>
<%@page import="java.sql.Date"%>
<%@page import="net.book.db.BookBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="./js/jquery-ui.css" rel="stylesheet">
<link href="./css/default.css" rel="stylesheet">
<link href="./css/admin.css" rel="stylesheet">
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//datepicker 
 	$(function () {
 			
		$("#datepicker").datepicker({
			showMonthAfterYear: true, //연도와 달 위치 변경
			monthNames:['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			dateFormat: 'yy-mm-dd',
 			maxDate: '+14d',
 			onSelect: function(){
 				$('form').submit();
 			}
 			
		});
		
		//$("#datepicker").datepicker("setDate", );
		
		
		$('.ui-datepicker').css({
			"margin":"0 auto"
		});
		
	});
}); 

</script>
<title>L'harmonie</title>
</head>
<body>
<%
// session 없으면 -> 로그인
String email = (String)session.getAttribute("email");
if(email == null || !email.equals("admin@team.com")){
%>
<script>
alert("관리자만 이용가능합니다.");
history.back();
</script>	
<%
}
PageBean pb = (PageBean)request.getAttribute("pb");
List<BookBean> bookList = (List)request.getAttribute("bookList");
String location = (String)request.getAttribute("location");
String date = (String)request.getAttribute("date");

int count = pb.getCount();
String pageNum = pb.getPageNum();
int pageCount = pb.getPageCount();
int pageBlock = pb.getPageBlock();
int startPage = pb.getStartPage();
int endPage = pb.getEndPage();
int currentPage = Integer.parseInt(pageNum);
%>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>


<div class="mpbox" id="sec1_mypage"><!-- 배경들어가는 영역 -->

<!-- 서브메뉴 -->
<jsp:include page="admin_sub.jsp"></jsp:include>

<h1 id="title">예약 목록</h1>
<form action="./BookList.ad" name="fr" method="get">
<div id="bookList">

<!-- 일자 선택 -->
<div class="term">
<span>조회 지점</span>
 <select class="dateBox" name="location" onchange="this.form.submit();">
  <option value="전체" <%=location.equals("전체")?"selected":""%>>전체</option>
  <option value="서울강남점" <%=location.equals("서울강남점")?"selected":""%>>서울강남점</option>
  <option value="부산서면점" <%=location.equals("부산서면점")?"selected":""%>>부산서면점</option>
 </select>
<span>조회 일자</span>
 <input type="text" name="date" id="datepicker" class="dateBox" value=<%=date%>>
</div>

<div class="mpcount">전체 <%=count%>건</div>

<div class="clear"></div>
	
<table class="bookList_tab">
 <tr>
  <th>지점</th>
  <th>예약번호</th>
  <th>회원번호</th>
  <th>인원</th>
  <th>날짜</th>
  <th>테이블번호</th>
  <th class="ps">요청사항</th>
 </tr>
	
<!-- 예약내역목록 -->
 <%
 if(bookList==null){
	 %><tr><td colspan="7"><b>예약내역이 없습니다.</b></td></tr><%
 }else{
	 for(int i=0;i<bookList.size();i++){
		 BookBean bb = (BookBean)bookList.get(i);
 	%>
 <tr>
  <td><%=bb.getLocation()%></td>
  <td><%=bb.getBook_num()%></td>
  <td><%=bb.getMem_num()%></td>
  <td><%=bb.getGuest()%></td>
  <td><%=bb.getDate()%></td>
  <td><%=bb.getTablenum()%></td>
  <td><%=bb.getRequest()%></td> 
 </tr>
 <%
 	}
 }%>
	
</table>

 <div class="pageArea">
<%
//이전
if(startPage > pageBlock){
 %><a class="page2" href="./BookList.ad?location=<%=URLEncoder.encode(location,"utf-8")%>&date=<%=date %>&pageNum=<%=startPage-pageBlock%>">◀</a>
<%}

for(int i=startPage;i<=endPage;i++){
	if(currentPage!=i){%><a id="page1" href="./BookList.ad?location=<%=URLEncoder.encode(location,"utf-8")%>&date=<%=date %>&pageNum=<%=i%>">
	<%}%>
	[<%=i %>]</a>
	<%}

//다음
if(endPage < pageCount){
	%><a class="page2" href="./BookList.ad?location=<%=URLEncoder.encode(location,"utf-8")%>&date=<%=date %>&pageNum=<%=startPage+pageBlock%>">▶</a>
	<%
}
%>
 </div>
</div>
</form>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
 
</body>
</html>