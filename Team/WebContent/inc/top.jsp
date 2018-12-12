<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="./css/login.css" rel="stylesheet">
<header>
<!-- 헤더 들어가는곳 -->
<% 
String sess=(String)session.getAttribute("email");
MemberDAO mdao=new MemberDAO();
//리턴값을 저장할 변수 = getMember(세션값) 메서드 호출
MemberBean mb=mdao.getMember(sess);
%>

<div class="top_menu">

<!-- 로고들어가는 곳 시작 -->
<!-- <div id="logo"><a href ="./Main.ma"><img src="./images/logo.png"></a></div> -->
<a href="./Main.ma" id="logo" class="logoC"></a>
<!-- 로고들어가는 곳 끝 -->

<!-- 메인메뉴 -->

<nav id="main_menu">
	<a href="./AboutUs.ad" id="MM">ABOUT US</a>
	<a href="./MenuList.nu" id="MM">MENU</a>
	<a href="./NewsList.nw" id="MM">NEWS</a>
	<a href="./ReviewList.re" id="MM">REVIEW</a>
	<a href="./Book.bk" id="book">BOOK</a>
</nav>
<!-- 예약 버튼 -->
<!-- <a href="./Book.bk" id="book"></a> -->

<!-- 로그인버튼 -->
<%//세션값이 없으면 로그인버튼보이기
if(sess==null){%>
<span id="login" style="cursor:pointer"onclick="document.getElementById('id01').style.display='block'"><i class="material-icons" >lock_outline</i></span>
<!-- <input type="button" value="Login" onclick="document.getElementById('id01').style.display='block'">	 -->
<% } else { %>
	<div id="loginPage">
		<%=mb.getName()%>님 
		<%--
		<%if(sess.equals("admin@team.com"))%><a href="./BookList.ad" id="PageName">AdminPage</a>
		<%else%>							 <a href="./Mypage.me" id="PageName">MyPage</a>
		--%>	
		</div>	
		<!-- 마이페이지 -->
		<div class="MPDown">
  			<button onclick="myFunction()" class="MPDbtn"></button>
  			
  			<div id="myMPDown" class="MPDown-content">
    			<%if(sess.equals("admin@team.com")) {%> <a href="./BookList.ad" id="PageName">AdminPage</a>
    			<%} else {%>							<a href="./Mypage.me" id="PageName">MyPage</a> <%} %>
    			<input type="button" value="Logout" onclick="location.href='./MemberLogout.me'">
  			</div>
		</div>

		<script>
			function myFunction() {
  				document.getElementById("myMPDown").classList.toggle("Myshow");
			}

			window.onclick = function(event) {
  				if (!event.target.matches('.MPDbtn')) {
    				var MPDowns = document.getElementsByClassName("MPDown-content");
    				var i;
    				
    				for (i = 0; i < MPDowns.length; i++) {
      					var openMPDown = MPDowns[i];
      					
      					if (openMPDown.classList.contains('Myshow')) {
        					openMPDown.classList.remove('Myshow');
      					}    				
    				}  				
  				}			
			}
		</script>

<!-- 		<div class="mypageImg">
  			<button class="Mydropbtn"></button>
  			<div class="mypageImg-content">
    			<a href="./Mypage.me" id="PageName">MyPage</a>
    			<input type="button" value="Logout" onclick="location.href='./MemberLogout.me'">
  			</div>
		</div>	 -->	
		<!-- <input type="button" onclick="chatBtn()" class="mypageImg"> -->
		<!-- <input type="button" value="Logout" onclick="location.href='./MemberLogout.me'"> -->
<% } %>
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
	      <a href="./FindIdPass.me">아이디/비밀번호찾기</a>|
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
<!-- 헤더 들어가는곳 -->
</header>
