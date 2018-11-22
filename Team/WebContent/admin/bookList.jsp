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
<script>

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
 			/* onSelect: function(){
 				changeLocationSelect()
 			} */
 			
		});
		
		//초기값 오늘날짜
		$("#datepicker").datepicker("setDate", new Date());
				
		$('.ui-datepicker').css({
			"margin":"0 auto"
		});
		
	});
}); 

function changeLocationSelect(){
	var locationSelect = document.getElementById("selectLoc");
	var location = locationSelect.options[locationSelect.selectedIndex].value;
	var date = document.getElementById("datepicker").value;
	window.location.href="./BookList.ad?location="+location+"&date="+date;
} 
</script>
<title>L'harmonie</title>
</head>
<body>
<%
List bookList = (List)request.getAttribute("bookList");
%>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>


<div class="mpbox" id="sec1_mypage"><!-- 배경들어가는 영역 -->

<!-- 서브메뉴 -->
<jsp:include page="admin_sub.jsp"></jsp:include>

<h1 id="title">예약 목록</h1>
 
<div id="bookList">

<!-- 일자 선택 -->
<div class="term">
<span>조회 지점</span>
 <select class="dateBox" id="selectLoc" name="location" onchange="changeLocationSelect()">
  <option value="전체">전체</option>
  <option value="서울강남점">서울강남점</option>
  <option value="부산서면점">부산서면점</option>
 </select>
<span>조회 일자</span>
 <input type="text" id="datepicker" class="dateBox" >
</div>

<div class="mpcount">전체 <%=bookList.size()%>건</div>

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
 for(int i=0;i<bookList.size();i++){
	 BookBean bb = (BookBean)bookList.get(i);
 %>
 <tr>
  <td><%=bb.getLocation()%>
  <td><%=bb.getBook_num()%></td>
  <td><%=bb.getMem_num()%></td>
  <td><%=bb.getGuest()%></td>
  <td><%=bb.getDate()%></td>
  <td><%=bb.getTablenum()%></td>
  <td><%=bb.getRequest()%></td> 
 </tr>
 <%
 }
 %>
	
</table>
</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
 
</body>
</html>