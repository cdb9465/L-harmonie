<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="./css/login.css" rel="stylesheet">
<header>
<!-- 헤더 들어가는곳 -->

<div class="top_menu">

<!-- 로고들어가는 곳 시작 -->
<div id="logo"><a href ="./Main.ma"><img src="./images/logo.png"></a></div>
<!-- 로고들어가는 곳 끝 -->

<!-- 메인메뉴 -->

<nav id="main_menu">
	<a href="./AboutUs.ad">ABOUT US</a>
	<a href="../store/menu.jsp">MENU</a>
	<a href="../news/news.jsp">NEWS</a>
	<a href="./ReviewList.re">REVIEW</a>
</nav>

<!-- 예약 버튼 -->
<div id="book"><a href="./Book.bk">BOOK</a></div>
<!-- 로그인버튼 -->
<div id="login"><i class="material-icons" font-size="30px" >lock_open</i>

<% String sess=(String)session.getAttribute("email");
System.out.print(sess);
MemberDAO mdao=new MemberDAO();
//리턴값을 저장할 변수 = getMember(세션값) 메서드 호출
MemberBean mb=mdao.getMember(sess);

//세션값이 없으면 로그인버튼보이기
if(sess==null){%>
<input type="button" value="Login" onclick="document.getElementById('id01').style.display='block'">	
<%
}else{ %>
	<%=mb.getName() %> 로그인 중 
<input type="button" value="Logout" onclick="location.href='./MemberLogout.me'">
<%	if(sess.equals("admin@team.com"))%> <a href="./BookList.ad">AdminPage</a><%
	else%> <a href="./Mypage.me">MyPage</a>
<%}%>

	</div>
</div>
<!-- <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button> -->

<div id="id01" class="modal">
  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
  <form action="./MemberLogin.me" class="modal-content">
  <div id="login_top">LOGIN</div>
    <div class="container">

		<input type="text" size="60" placeholder="이메일" name="email">
		<input type="password" size="60" placeholder="비밀번호" name="pass">

      <div id="login_btm">
	      <a href="#">아이디찾기</a>|
	      <a href="#">비밀번호찾기</a>|
	      <a href="./MemberJoin.me" id="joinlink">회원가입</a>
      </div>
     <div class="clearfix">
     	<button type="submit" class="signupbtn">로그인</button>
        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">취소</button>
      </div>
      
      
    </div>
    
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
>>>>>>> refs/remotes/origin/master
<!-- 헤더 들어가는곳 -->
</header>
