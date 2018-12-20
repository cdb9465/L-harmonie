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
		<a onclick="openNav()" style="cursor: pointer">사이트맵</a>
	</div>
	
	<div class="fbottom">
		<span>부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층 </span>
		<span>대표전화 : 123-456-7890</span>
		<span>대표자 : 이정민</span>
		<span>사업자등록번호 : 123-45-678910</span> 
		<span>지점명 : L'harmonie </span> 
	</div>	
</footer>
    
<script>

/* 메일 */
function mailSend(){    	
	window.open('./mail/mailForm.jsp','메일문의','width=650,height=430,left=630,top=300');
}
</script>

