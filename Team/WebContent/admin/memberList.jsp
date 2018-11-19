<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="../css/default.css" rel="stylesheet">
<link href="../css/adminForm.css" rel="stylesheet">

<title>L'harmonie</title>
</head>
<body>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>

<div class="mpbox" id="sec1_mypage"><!-- 배경들어가는 영역 -->
 <h1>MEMBER LIST</h1>
 
<div id="bookList">

<div class="mpcount">전체10명</div>

<div class="clear"></div>
	
<table class="bookList_tab">
 <tr>
  <th>회원번호</th>
  <th>이메일</th>
  <th>이름</th>
  <th>휴대폰번호</th>
  <th>생일</th>
 </tr>
	
<!-- 예약내역목록 -->
 <tr>
  <td>1</td>
  <td>admin@lharmonie.com</td>
  <td>관리자</td>
  <td>051-111-2345</td>
  <td>11/21</td>
 </tr>
 <tr>
  <td>2</td>
  <td>member@lharmonie.com</td>
  <td>일인자</td>
  <td>051-222-2347</td>
  <td>01/26</td>
  
</table>
</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
 
</body>
</html>