<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>L'harmonie</title>
<link href="./css/default.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<div class="clear"></div>

<!-- 메인 들어가는 곳 -->
<section class="main_box" id="main0" data-section-name="main0">
  <div class="main_text">
    <h1>Flatter the senses</h1>
    <p>오감을 즐겁게 하다</p>
  </div>

<!-- 마우스 모양 -->
<a href="#main1" class="arrow">
   <img src="./images/arrow.png">
   <img src="./images/dot.png" class="dot">
</a>
</section>
<!-- 첫번째 메인 끝 -->


<!-- 2번째 메인 -->
<jsp:include page="main02.jsp"></jsp:include>

<!-- 3번째 메인 -->
<section class="main_box" id="main2" data-section-name="main2">
	<jsp:include page="insta.jsp"></jsp:include>
</section>
<!-- 메인 들어가는 곳 -->

<!-- 서브메뉴 들어가는 곳 -->
<jsp:include page="../inc/submenu.jsp"></jsp:include>
<!-- 서브메뉴 들어가는 곳 -->


<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</body>
</html>