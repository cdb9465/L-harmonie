<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<!-- 헤더 들어가는곳 -->

<div class="top_menu">

<!-- 로고들어가는 곳 시작 -->
<div id="logo"><a href ="../main/main.jsp"><img src="../images/logo.png"></a></div>
<!-- 로고들어가는 곳 끝 -->

<!-- 메인메뉴 -->

<nav id="main_menu">
	<a href="../store/aboutUs.jsp">ABOUT US</a>
	<a href="../store/menu.jsp">MENU</a>
	<a href="../news/news.jsp">NEWS</a>
	<a href="../review/review.jsp">REVIEW</a>
</nav>

<!-- 로그인 버튼 -->
<%
String id=(String)session.getAttribute("mem_num");

if(id==null){
%>
<div id="login"><a href="../main/main.jsp">
<i class="material-icons">lock_open</i>LOGIN</a>
</div>
<% 
}
if(id!=null) {
	if(id.equals("1")){
	%>
	   <div id="login"><b>관리자</b>님 반갑습니다
	   <a href="로그아웃">[logout]</a></div>
	<%
	}


else {
   %>
   <div id="login"><b><%=id %></b>님 반갑습니다
   <a href="로그아웃">[logout]</a></div>
   <%
	}
}
%>

<div id="book"><a href="./Book.bk">BOOK</a></div>
</div>

<!-- 헤더 들어가는곳 -->
</header>
