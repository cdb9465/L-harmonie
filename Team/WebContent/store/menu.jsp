<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/menu.css" rel="stylesheet">
<link href="../css/default.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<title>L'marmonie|MENU</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            $(".box").each(function () {
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
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="box">
<article>
<div id="article_sec1">
<div id="mmenu_img">
<div class="main_menu">
<ul>
	<li><a href="#">STEAK</a></li>
	<li><a href="#">PASTA</a></li>
	<li><a href="#">RISOTTO</a></li>
	<li><a href="#">SALAD</a></li>
	<li><a href="#">DESSERT</a></li>
	<li><a href="#">WINE</a></li>
	<li><a href="#">BEVERAGE</a></li>
</ul>
</div>
</div>
</div>

<div id="article_sec2">
<div class="tab">
  <button class="tablinks" onclick="openMenu(event, 'Steak')">STEAK</button>
  <button class="tablinks" onclick="openMenu(event, 'Pasta')">PASTA</button>
  <button class="tablinks" onclick="openMenu(event, 'Rosotto')">RISOTTO</button>
  <button class="tablinks" onclick="openMenu(event, 'Salad')">SALAD</button>
  <button class="tablinks" onclick="openMenu(event, 'Dessert')">DESSERT</button>
  <button class="tablinks" onclick="openMenu(event, 'Wine')">WINE</button>
  <button class="tablinks" onclick="openMenu(event, 'Beverage')">BEVERAGE</button>
</div>

<div id="Steak" class="tabcontent">
  <ul>
  	<li><div id="steak1"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<li><div id="steak2"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<li><div id="steak3"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<div class="clear"/>
  	<li><div id="steak4"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<li><div id="steak5"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<li><div id="steak6"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<div class="clear"/>
  </ul>
</div>

<!-- 스테이크 id로 통일했으니 바꿔써주세요 -->
<div id="Pasta" class="tabcontent">
  <ul>
  	<li><div id="steak1"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<li><div id="steak2"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<li><div id="steak3"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<div class="clear"/>
  	<li><div id="steak4"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<li><div id="steak5"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<li><div id="steak6"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<div class="clear"/>
  	<li><div id="steak4"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<li><div id="steak5"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<li><div id="steak6"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<div class="clear"/>
  </ul>
</div>

<div id="Rosotto" class="tabcontent">
  <h3>Rosotto</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

<div id="Salad" class="tabcontent">
  <h3>Salad</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

<div id="Dessert" class="tabcontent">
  <h3>Dessert</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

<div id="Wine" class="tabcontent">
  <h3>Wine</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

<div id="Beverage" class="tabcontent">
  <h3>Beverage</h3>
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
</div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->


</body>
</html>