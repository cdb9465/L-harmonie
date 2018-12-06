<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="mySidebar" class="sidebar">
  <a href="./BookList.ad">예약 목록</a>
  <a href="./MemberList.ad">회원 목록</a>
  <a href="./MenuAdd.ad">메뉴 등록</a>
  <a href="./NewsAdd.ad">뉴스 등록</a>
</div>

<div id="main">
  <button id="open" class="openbtn" onclick="openMenu()">☰ 관리자메뉴</button>
</div>

<script>
function openMenu() {
    document.getElementById("mySidebar").style.width = "250px";
    document.getElementById("main").style.marginRight = "250px";
 	document.getElementById("open").onclick=function(){closeMenu()};
}
	
function closeMenu() {
	document.getElementById("mySidebar").style.width = "0";
    document.getElementById("main").style.marginRight= "0";
    document.getElementById("open").onclick=function(){openMenu()};
}
</script>