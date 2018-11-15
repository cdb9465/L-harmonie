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

<!-- <img src="../images/comming.jpg" alt="준비중입니다." width="100%" id="img2"> -->

<!-- 본문 -->
<div id="wrap">
<article>
<div id="book_form">
<%
request.setCharacterEncoding("utf-8");
String location = request.getParameter("location");
//String date = request.getParameter("date");
Date date = Date.valueOf(request.getParameter("date"));
String time = request.getParameter("time");
String guest = request.getParameter("guest");
String tablenum = request.getParameter("tablenum");
String req = request.getParameter("request");

//날짜파싱
DateFormat df = new SimpleDateFormat("yyyyMMdd");
String sDate = df.format(date);
%>
지점 <%=location %><br>
날짜 <%=date %><br>
날짜2 <%=sDate %><br>
시간 <%=time %><br>
인원 <%=guest %><br>
테이블 <%=tablenum %><br>
요청 <%=req %>


</div>
</article>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->


</body>
</html>