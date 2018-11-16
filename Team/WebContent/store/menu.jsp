<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/menu.css" rel="stylesheet">
<link href="../css/default.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>L'marmonie| MENU</title>
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

<article class="menu_article">

<div id="article_sec1" class="main_box">
<ul class="sec1_menu">
	<li><a href="#">APPETIZER</a></li>
	<li><a href="#">SALAD</a></li>
	<li><a href="#">STEAK</a></li>
	<li><a href="#">SALAD</a></li>
	<li><a href="#">DESSERT</a></li>
	<li><a href="#">BEVERAGE</a></li>
</ul>
</div>

<div id="article_sec2" class="main_box">
<div class="tab">
  <button class="tablinks" onclick="openMenu(event, 'Appetizer')">APPETIZER</button>
  <button class="tablinks" onclick="openMenu(event, 'Salad')">SALAD</button>
  <button class="tablinks" onclick="openMenu(event, 'Steak')">STEAK</button>
  <button class="tablinks" onclick="openMenu(event, 'Pasta')">PASTA</button>
  <button class="tablinks" onclick="openMenu(event, 'Dessert')">DESSERT</button>
  <button class="tablinks
  " onclick="openMenu(event, 'Beverage')">BEVERAGE</button>
</div>

<div id="Appetizer" class="tabcontent">
  <ul>
  	<li><div id="steak1"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<li><div id="steak2"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  </ul>
</div>

<!-- 스테이크 id로 통일했으니 바꿔써주세요 -->
<div id="Salad" class="tabcontent">
  <ul>
  	<li><div id="steak1"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<li><div id="steak2"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  </ul>
</div>

<div id="Steak" class="tabcontent">
  <h3>Rosotto</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

<div id="Pasta" class="tabcontent">
  <h3>Salad</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

<div id="Beverage" class="tabcontent">
  <h3>Dessert</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

<script>
function openMenu(evt, menuName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(menuName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
</div>
</article>
<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

</body>
</html>