<%@ page import="net.menu.db.MenuBean" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" async src="https://www.google-analytics.com/analytics.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/menu.css" rel="stylesheet">
<link href="./css/default.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>L'marmonie</title>
</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

    <script type="text/javascript">
        window.onload = function () {
            $(".main_box").each(function () {
                // 개별적으로 Wheel 이벤트 적용
                $(this).on("mousewheel DOMMouseScroll", function (e) {
                    e.preventDefault();
                    var delta = 0;
                    if (!event) event = window.event;
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                        if (window.opera) delta = -delta;
                    } else if (event.detail) delta = -event.detail / 3;
                    var moveTop = null;
                    // 마우스휠을 위에서 아래로
                    if (delta < 0) {
                        if ($(this).next() != undefined) {
                            moveTop = $(this).next().offset().top;
                        }
                    // 마우스휠을 아래에서 위로
                    } else {
                        if ($(this).prev() != undefined) {
                            moveTop = $(this).prev().offset().top;
                        }
                    }
                    // 화면 이동 0.8초(800)
                    $("html,body").stop().animate({
                        scrollTop: moveTop + 'px'
                    }, {
                        duration: 800, complete: function () {
                        }
                    });
                });
            });
        }
    </script>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>
<%
List menuList=(List)request.getAttribute("menuList");
String category=(String)request.getAttribute("category");
int count=0;
%>
<article class="menu_article">

<div id="menu_sec1" class="main_box">
<div class="menu_cover">
<ul class="menu_info">
	<li><a href="#article_sec2" onclick="moveStarter()">STARTER</a></li>
	<li><a href="#article_sec2" onclick="moveSalad()">SALAD</a></li>
	<li><a href="#article_sec2" onclick="moveSteak()">STEAK</a></li>
	<li><a href="#article_sec2" onclick="movePasta()">PASTA</a></li>
	<li><a href="#article_sec2" onclick="moveDessert()">DESSERT</a></li>
	<li><a href="#article_sec2" onclick="moveBeverage()">BEVERAGE</a></li>
</ul>
<a href="#main1" class="arrow">
   <img src="./images/arrow.png">
   <img src="./images/dot.png" class="dot">
</a>
</div>
</div>

<div id="menu_sec2" class="main_box">
<div class="menu_cover">
<div class="tab">
  <p><a href="./MenuList.nu?category=Starter" id="defaultOpen" class="tablinks" onclick="openMenu(event, 'Appetizer', 'caption_Appetizer')">STARTER</a></p>
  <p><a href="./MenuList.nu?category=Salad" id="button_Salad" class="tablinks" onclick="openMenu(event, 'Salad', 'caption_Salad')">SALAD</a></p>
  <p><a href="./MenuList.nu?category=Steak" id="button_Steak" class="tablinks" onclick="openMenu(event, 'Steak', 'caption_Steak')">STEAK</a></p>
  <p><a href="./MenuList.nu?category=Pasta" id="button_Pasta" class="tablinks" onclick="openMenu(event, 'Pasta', 'caption_Pasta')">PASTA</a></p>
  <p><a href="./MenuList.nu?category=Dessert" id="button_Dessert" class="tablinks" onclick="openMenu(event, 'Dessert', 'caption_Dessert')">DESSERT</a></p>
  <p><a href="./MenuList.nu?category=Beverage" id="button_Beverage" class="tablinks" onclick="openMenu(event, 'Beverage', 'caption_Beverage')">BEVERAGE</a></p>
</div>
<div class="menu_top">
<% 
	if(category.equals("Starter")) {
	%>
		<img src="./images/menu/icon_Starter.png" class="menu_topicon">
		<span>Starter</span>
	<%
	} else if(category.equals("Salad")) {
	%>
		<img src="./images/menu/icon_Salad.png" class="menu_topicon">
		<span>Salad</span>
	<%
	} else if(category.equals("Steak")) {
	%>
		<img src="./images/menu/icon_Steak.png" class="menu_topicon">
		<span>Steak</span>
	<%
	} else if(category.equals("Steak")) {
	%>
		<img src="./images/menu/icon_Pasta.png" class="menu_topicon">
		<span>Pasta</span>
	<%
	} else if(category.equals("Dessert")) {
	%>
		<img src="./images/menu/icon_Dessert.png" class="menu_topicon">
		<span>Dessert</span>
	<%
	} else {
	%>
		<img src="./images/menu/icon_Beverage.png" class="menu_topicon">
		<span>Beverage</span>
	<%
	}
%>
</div>
<div class="menu_row">
<%
for(int i=0; i<menuList.size(); i++) {
	MenuBean nu = (MenuBean)menuList.get(i);
	
%>
<div class="menu_column">
	<div class="menu_content">
	<img src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="300px" height="200px">
	<span class="caption_Appetizer"><%=nu.getName()%></span>
	</div>
</div> 
<%
count+=1;

if(count==3) {
	count=0;
}
}
%>
</div>
</div>
</div>
</article>

<script>
function moveAppetizer() {
	document.getElementById("defaultOpen").click();
}
function moveSalad() {
	document.getElementById("button_Salad").click();
}
function moveSteak() {
	document.getElementById("button_Steak").click();
}
function movePasta() {
	document.getElementById("button_Pasta").click();
}
function moveSaDessert() {
	document.getElementById("button_Dessert").click();
}
function moveBeverage() {
	document.getElementById("button_Beverage").click();
}
function openMenu() {
	
}

</script>
<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

</body>
</html>