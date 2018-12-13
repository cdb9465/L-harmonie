<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
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
<div id="topArea">
<a href="./Main.ma" id="logo" class="logoC"></a>
<!-- 로고들어가는 곳 끝 -->

<!-- 메인메뉴 -->

<ul id="main_menu">
	<li><a href="./AboutUs.ad" class = "MM">ABOUT US</a></li>
	<li><a href="./MenuList.nu" class = "MM">MENU</a></li>
	<li><a href="./NewsList.nw" class = "MM">NEWS</a></li>
	<li><a href="./ReviewList.re" class = "MM">REVIEW</a></li>
	<li><a href="./Book.bk" id = "book">BOOK</a></li>


<!-- 예약 버튼 -->
<!-- <a href="./Book.bk" id="book"></a> -->

<!-- 로그인버튼 -->
<%//세션값이 없으면 로그인버튼보이기
if(sess==null){%>

<!-- <input type="button" value="Login" onclick="document.getElementById('id01').style.display='block'">
	<i class="material-icons" >lock_outline</i>	 -->

	<li class="logArea"><span id="login" style="cursor:pointer" onclick="document.getElementById('id01').style.display='block'">
							<i class='fas fa-key' style='font-size:18px;'></i> 로그인  </span></li> 
	<li class="logArea"><a href="./MemberJoin.me"><i class='fas fa-user-plus' style='font-size:18px;'></i> 회원가입  </a></li>
 	


<% //세션값이 있으면 마이페이지, 로그아웃 보이기
} else { %>

		<!-- 마이페이지 -->

    			<%if(sess.equals("admin@team.com")) {%> <li class="logArea" id="login"><a href="./BookList.ad" id="PageName"><i class='fas fa-user-cog' style='font-size:18px;'></i> AdminPage </a></li>
    			<%} else {%>							<li class="logArea" id="login"><a href="./Mypage.me" id="PageName"><i class='fas fa-user-cog' style='font-size:18px;'></i> MyPage </a></li> 
    			<%} %>
    			<li class="logArea"><a href="./MemberLogout.me"><i class='fas fa-power-off' style='font-size:18px;'></i>  로그아웃  </a></li>
  				
<% } %>
		</ul>


		
		<div id="minwin_all">
			<div id="minwin_btn">
					<%//세션값이 없으면 로그인버튼보이기
						if(sess==null){%>
							<span style="cursor:pointer" onclick="document.getElementById('id01').style.display='block'"><i class='fas fa-key' style='font-size:20px;'></i>Login</span>
							<a href="./MemberJoin.me"><i class='fas fa-user-plus' style='font-size:20px;'></i>Join</a>
					<%	} else { %>
							<%if(sess.equals("admin@team.com")) {%>
										<a href="./BookList.ad"><i class='fas fa-user-cog' style='font-size:20px;'></i>Admin</a>
								<%} else {%>	
										<a href="./Mypage.me"><i class='fas fa-user-cog' style='font-size:20px;'></i>My</a>
								<%} %>
										<a href="./MemberLogout.me"><i class='fas fa-power-off' style='font-size:20px;'></i>Out</a>
						<% } %>
			</div>
		</div>
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
