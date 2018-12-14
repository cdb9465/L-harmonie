<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="submenu">
<div class="submenu_in" onmouseover="subOn()" onmouseout="subOff()">
 <a href="#main0"></a>
 <a href="#main1"></a>
 <a href="#main2"></a>
 <a id="sub_about" href="#main3"></a>	 <!-- aboutUs페이지 4번째 서브메뉴 -->
<input type="button" value="문의" onclick="chatBtn()" class="chat">
</div>
</div>

<!-- 1:1채팅 -->
<script>
function chatBtn(){
	      
	window.open('./chat.jsp','1:1 문의','width=500,height=770');
	   											/* scrollbars=yes */
	}
</script>
