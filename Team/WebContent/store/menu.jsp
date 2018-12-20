<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" async src="https://www.google-analytics.com/analytics.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/menu.css" rel="stylesheet">
<link href="./css/default.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>L'marmonie</title>
</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<div class="clear"></div>

<!-- 전체 메인 -->
<article class="menu_article">

<!-- 첫번째 메뉴페이지-->
<div id="menu_sec1" class="main_box">
<div class="menu_cover">

<!-- 메뉴판 -->
<ul class="menu_info">
	<li><a href="./MenuDetailList.nu?category=Starter#menu_sec2">STARTER</a></li>
	<li><a href="./MenuDetailList.nu?category=Salad#menu_sec2">SALAD</a></li>
	<li><a href="./MenuDetailList.nu?category=Steak#menu_sec">STEAK</a></li>
	<li><a href="./MenuDetailList.nu?category=Pasta#menu_sec2">PASTA</a></li>
	<li><a href="./MenuDetailList.nu?category=Dessert#menu_sec2">DESSERT</a></li>
	<li><a href="./MenuDetailList.nu?category=Beverage#menu_sec2">BEVERAGE</a></li>
</ul>

</div>
</div>


</article>

<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

</body>
</html>