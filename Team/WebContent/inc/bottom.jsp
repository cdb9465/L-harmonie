<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<footer id="footer">

	<div class="ftop">
		<a href="#"><i class="material-icons" >people_outline</i>브랜드 제휴 문의</a>
		<a href="#"><i class="material-icons" >business</i>가맹문의</a>	
		<span style="cursor:pointer"onclick="mailSend()"><i class="material-icons" >mail_outline</i>이메일</span>
	</div>
	
	<div class="fmenu">
		<a href="#">이용약관</a>
		<a href="#">개인정보취급방침</a>
		<a href="#">채용정보</a>
		<span style="cursor:pointer"onclick="openNav()">사이트맵</span>
	</div>
	
	<div class="fbottom">
		<span>부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층 </span>
		<span>대표전화 : 123-456-7890</span>
		<span>대표자 : 이정민</span>
		<span>사업자등록번호 : 123-45-678910</span> 
		<span>지점명 : L'harmonie </span> 
	</div>	
</footer>
    
 <!-- 사이트맵 -->
<div id="myNav" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
   <div class="sm_about">
    <a href="./AboutUs.ad" id="sm_title">ABOUT US</a>
    <a href="./AboutUs.ad#main3">오시는길</a>
   </div>
   <div class="sm_menu">
    <a href="./MenuList.nu" id="sm_title">MENU</a>
   </div>
   <div class="sm_news">
    <a href="./NewsList.nw" id="sm_title">NEWS</a>   
   </div>
   <div class="sm_review">
    <a href="./ReviewList.re" id="sm_title">REVIEW</a>
   </div>
   <div class="sm_book">
    <a href="./Book.bk" id="sm_title">BOOK</a>
   </div>
   <div class="sm_mypage">
    <a href="./Mypage.me" id="sm_title">MY PAGE</a>
    <a href="./Mypage.me#modify">Modify</a>
    <a href="./Mypage.me#mybook">My Book</a>
    <a href="./Mypage.me#myreview">My Review</a>
   </div>
  </div>
</div>
<!-- 사이트맵 -->

<!--사이트맵 js  -->
<script>
function openNav() {
  document.getElementById("myNav").style.display = "block";
}

function closeNav() {
  document.getElementById("myNav").style.display = "none";
}

/* 메일 */
function mailSend(){    	
	window.open('./mail/mailForm.jsp','메일문의','width=250,height=310,left=832,top=350');
}
</script>

