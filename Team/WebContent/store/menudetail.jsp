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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 삭제하시겠습니까? -->
<script>
function deletemenu(num) {
	var txt;
	var r=confirm("삭제하시겠습니까?");
	if(r == true) {
		location.href="./MenuDelete.nu?num="+num;
	}
	else {
		histroy.back();
	}
}
</script>
<title>L'marmonie</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<div class="clear"></div>

<%
List menuList=(List)request.getAttribute("menuList");
String category=(String)request.getAttribute("category");
int count=0;
%>

<!-- 전체 메인 -->
<article class="menu_article">

<!-- 두번째 메뉴페이지 -->
<div id="menu_sec2" class="main_box">
<div class="menu_cover">

<!-- 탭메뉴 -->
<div class="tab">
  <p><a href="./MenuDetailList.nu?category=Starter#menu_sec2" id="button_Starter" class="tablinks">STARTER</a></p>
  <p><a href="./MenuDetailList.nu?category=Salad#menu_sec2" id="button_Salad" class="tablinks">SALAD</a></p>
  <p><a href="./MenuDetailList.nu?category=Steak#menu_sec2" id="button_Steak" class="tablinks">STEAK</a></p>
  <p><a href="./MenuDetailList.nu?category=Pasta#menu_sec2" id="button_Pasta" class="tablinks">PASTA</a></p>
  <p><a href="./MenuDetailList.nu?category=Dessert#menu_sec2" id="button_Dessert" class="tablinks">DESSERT</a></p>
  <p><a href="./MenuDetailList.nu?category=Beverage#menu_sec2" id="button_Beverage" class="tablinks">BEVERAGE</a></p>
</div>

<!-- 상세메뉴 탑 -->
<div class="menu_top">
<% 
	if(category.equals("Starter")) {
	%>
		<img src="./images/menu/icon_Starter.png" height="50px" class="menu_topicon">
		<div>Starter</div>
	<%
	} else if(category.equals("Salad")) {
	%>
		<img src="./images/menu/icon_Salad.png" height="50px" class="menu_topicon">
		<div>Salad</div>
	<%
	} else if(category.equals("Steak")) {
	%>
		<img src="./images/menu/icon_Steak.png" height="50px" class="menu_topicon">
		<div>Steak</div>
	<%
	} else if(category.equals("Pasta")) {
	%>
		<img src="./images/menu/icon_Pasta.png" height="50px" class="menu_topicon">
		<div>Pasta</div>
	<%
	} else if(category.equals("Dessert")) {
	%>
		<img src="./images/menu/icon_Dessert.png" height="50px" class="menu_topicon">
		<div>Dessert</div>
	<%
	} else {
	%>
		<img src="./images/menu/icon_Beverage.png" height="50px" class="menu_topicon">
		<div>Beverage</div>
	<%
	}
%>
</div>

<!--상세메뉴 -->
<div class="menu_row">
<%
for(int i=0; i<menuList.size(); i++) {
	MenuBean nu = (MenuBean)menuList.get(i);
%>

<!-- 메뉴 한개 -->
<div id="<%=category%>"class="menu_column">

	<!-- 메뉴 감싸는 배경 -->
	<div class="menu_content">
	
	<!-- 메뉴 사진 -->
	<img id="myImg" src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="100%" height="250px"><br>
	
	<!-- 메뉴 이름 -->
	<div class="menu_caption"><%=nu.getName()%>
	<%
	String email = (String)session.getAttribute("email");
	if(email==null) {
		%>
		</div>
		<%
	}
	else if(email.equals("admin@team.com")) {
		%>
		<button onclick="deletemenu(<%=nu.getMenu_num()%>)" id="menu_delete"><i class="fa fa-trash"></i></button>
		</div>
		
		<%
	}
	else {
	%>
	</div>
	<%
	}
	%>
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

<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

</body>
</html>