<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>L'harmonie</title>
<link href="../css/default.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<div class="clear"></div>

<!-- 메인 들어가는 곳 -->
<div class="main_img1" id="main1"></div>
<a href="#main2" class="arrow">
   <img src="../images/arrow.png">
   <img src="../images/dot.png" class="dot">
</a>
<div class="main_img2" id="main2"></div>
<div class="main_img3" id="main3"></div>
<!-- 메인 들어가는 곳 -->
<!-- 서브메뉴 들어가는 곳 -->
<jsp:include page="../inc/submenu.jsp"></jsp:include>
<!-- 서브메뉴 들어가는 곳 -->

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</body>
</html>