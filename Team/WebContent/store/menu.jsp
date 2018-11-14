<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/menu.css" rel="stylesheet">
<link href="../css/default.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<title>L'marmonie| MENU</title>
    
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<article>

<div id="article_sec1">
<div class="main_menu">
<ul>
	<li><a href="#">APPETIZER</a></li>
	<li><a href="#">SALAD</a></li>
	<li><a href="#">STEAK</a></li>
	<li><a href="#">PASTA</a></li>
	<li><a href="#">DESSERT</a></li>
	<li><a href="#">BEVERAGE</a></li>
</ul>
</div>
</div>


<div id="article_sec2">
<div class="tab">
  <button class="tablinks" onclick="openMenu(event, 'Appetizer')">APPETIZER</button>
  <button class="tablinks" onclick="openMenu(event, 'Salad')">SALAD</button>
  <button class="tablinks" onclick="openMenu(event, 'Steak')">STEAK</button>
  <button class="tablinks" onclick="openMenu(event, 'Pasta')">PASTA</button>
  <button class="tablinks" onclick="openMenu(event, 'Dessert')">DESSERT</button>
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
  	<li><div id="steak4"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<li><div id="steak5"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<li><div id="steak6"><p id="steak_ps1">Feta Cheese Ribeye Steak</p><p id="steak_ps2">39,900</p></div></li>
  	<div class="clear"/>
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

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->


</body>
</html>