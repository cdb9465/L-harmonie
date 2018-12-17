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
	<li><a href="./Book.bk" id = "book" >BOOK</a></li>


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

    			<%if(sess.equals("admin@team.com")) {%> <li class="logArea" id="login"><a href="./BookList.ad" id="PageName"><i class='fas fa-user-cog' style='font-size:18px;'></i> 관리자페이지 </a></li>
    			<%} else {%>							<li class="logArea" id="login"><a href="./Mypage.me" id="PageName"><i class='fas fa-user-cog' style='font-size:18px;'></i> 마이페이지 </a></li> 
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
		<!-- 사이트맵 --> 
	 <span id="smapbtn" onclick="openNav()">&#9776;</span>
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

<!-- 사이트맵 --> 
<div id="myNav" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
   <div class="sm_about">
    <a href="./AboutUs.ad" id="sm_title">ABOUT US</a>
     <a href="./AboutUs.ad">About Us</a>
     <a href="./AboutUs.ad#main3">Find Us</a>
   </div>
   <div class="sm_menu">
    <a href="./MenuList.nu" id="sm_title">MENU</a>
     <a href="./MenuList.nu?category=Starter#menu_sec2">Starter</a>
     <a href="./MenuList.nu?category=Salad#menu_sec2">Salad</a>
     <a href="./MenuList.nu?category=Steak#menu_sec2">Steak</a>
     <a href="./MenuList.nu?category=Pasta#menu_sec2">Pasta</a>
     <a href="./MenuList.nu?category=Dessert#menu_sec2">Dessert</a>
     <a href="./MenuList.nu?category=Beverage#menu_sec2">Beverage</a>
   </div>
   <div class="sm_news">
    <a href="./NewsList.nw" id="sm_title">NEWS</a>
      <a href="./NewsList.nw">News</a>
   </div>
   <div class="sm_review">
    <a href="./ReviewList.re" id="sm_title">REVIEW</a>
     <a href="./ReviewList.re" >Review</a>
   </div>
   <div class="sm_book">
    <a href="./Book.bk" id="sm_title">BOOK</a>
     <a href="./Book.bk" >Book</a>
   </div>
   <div class="sm_mypage">
    <a href="./Mypage.me" id="sm_title">MY PAGE</a>
     <a href="./Mypage.me#main0">My Page</a>
     <a href="./Mypage.me#main1">My Book</a>
     <a href="./Mypage.me#main2">My Review</a>
   </div>
  </div>
</div>
<!-- 사이트맵 -->

<script>
//사이트맵
function openNav() {
	  document.getElementById("myNav").style.display = "block";
	}

	function closeNav() {
	  document.getElementById("myNav").style.display = "none";
	}
	
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
//메뉴 눌렀을 때 유지
<script>
 $(function(){
  var sBtn = $("ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
  sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
   sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
   $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
  })
 })

</script>
<!-- 헤더 들어가는곳 -->
</header>
