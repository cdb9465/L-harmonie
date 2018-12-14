<%@page import="net.book.db.BookBean"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>L'harmonie</title>
<link href="./css/book.css" rel="stylesheet">
<link href="./css/default.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/jquery-ui.js"></script>
<link href="./js/jquery-ui.css" rel="stylesheet">

</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>

<!-- 본문 -->
<div id="wrap">
<div id="book_form">
<%
request.setCharacterEncoding("utf-8");
BookBean bb = (BookBean)request.getAttribute("bb");
%>
<div class="bookCk">
<div class="chTitle">
<img src="./images/logo.png"><br>
<h1 id="title">예약이 완료되었습니다.</h1>
</div>
<article id="bookck_art">
<p>BOOK INFO </p>

<table>
 <tr>
  <th>예약 번호 </th>
  <td><%=bb.getBook_num() %></td>
 </tr>
 <tr>
  <th>예약 지점 </th>
  <td><%=bb.getLocation() %></td>
 </tr>
 <tr>
  <th>예약 인원 </th>
  <td><%=bb.getGuest() %></td>
 </tr>
 <tr>
  <th>예약 날짜 </th>
  <td><%=bb.getDate() %></td>
 </tr>
 <tr>
  <th>예약 시간 </th>
  <td><%=bb.getTime() %></td>
 </tr>
 <tr>
  <th>예약 테이블 </th>
  <td><%=bb.getTablenum() %></td>
  </tr>
 <tr>
  <th>그 외 요청사항 </th>
  <td><%=bb.getRequest() %></td>
 </tr>
 <tr>
  <td id="booknote" colspan="2"><i class="fa fa-check"></i> 마이페이지에서 예약취소가 가능합니다.<br>
  	<i class="fa fa-check"></i> 당일예약취소는 <b style="text-decoration: underline;">불가능</b>합니다.<br>
  	<i class="fa fa-check"></i> 버튼을 누르시면 마이페이지로 이동합니다.</td>
 </tr>
</table>

<input type="button" id="bookCheckbtn" onclick="location.href='./Mypage.me#main1'" value="예약현황보기">

</article>

</div>

</div>

</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->


</body>
</html>