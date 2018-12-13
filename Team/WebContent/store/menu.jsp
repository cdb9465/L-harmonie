<%@ page import="net.menu.db.MenuBean" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
%>

<article class="menu_article">

<div id="article_sec1" class="main_box">
<ul class="sec1_menu">
	<li><a href="./MenuList.nu?catigory=Starter" onclick="moveStarter()">STARTER</a></li>
	<li><a href="./MenuList.nu?catigory=Salad" onclick="moveSalad()">SALAD</a></li>
	<li><a href="./MenuList.nu?catigory=Steak" onclick="moveSteak()">STEAK</a></li>
	<li><a href="./MenuList.nu?catigory=Pasta" onclick="movePasta()">PASTA</a></li>
	<li><a href="./MenuList.nu?catigory=Dessert" onclick="moveDessert()">DESSERT</a></li>
	<li><a href="./MenuList.nu?catigory=Beverage" onclick="moveBeverage()">BEVERAGE</a></li>
</ul>
<a href="#main1" class="arrow">
   <img src="./images/arrow.png">
   <img src="./images/dot.png" class="dot">
</a>
</div>

<div id="article_sec2" class="main_box">
<div class="tab">
  <button id="defaultOpen" class="tablinks" onclick="openMenu(event, 'Appetizer', 'caption_Appetizer')">STARTER</button>
  <button id="button_Salad" class="tablinks" onclick="openMenu(event, 'Salad', 'caption_Salad')">SALAD</button>
  <button id="button_Steak" class="tablinks" onclick="openMenu(event, 'Steak', 'caption_Steak')">STEAK</button>
  <button id="button_Pasta" class="tablinks" onclick="openMenu(event, 'Pasta', 'caption_Pasta')">PASTA</button>
  <button id="button_Dessert" class="tablinks" onclick="openMenu(event, 'Dessert', 'caption_Dessert')">DESSERT</button>
  <button id="button_Beverage" class="tablinks" onclick="openMenu(event, 'Beverage', 'caption_Beverage')">BEVERAGE</button>
</div>

<div class="tabcontent">


<%
for(int i=0; i<menuList.size(); i++) {
	MenuBean nu = (MenuBean)menuList.get(i);
		%>
		<img src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="300px" height="200px"  class="Appetizer" >
	  	<p class="caption_Appetizer" title="<%=nu.getCategory()%>"><%=nu.getName()%></p></td>
		<%
}
%>

</div>
</div>
</article>
<script>
function openMenu(evt, menuName, )
</script>
<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

</body>
</html>