<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="./js/jquery.scrollify.js"></script>
<div class="submenu">
<div class="submenu_in" onmouseover="subOn()" onmouseout="subOff()">
 <a href="#main0"></a>
 <a href="#main1"></a>
 <a href="#main2"></a>
 <a id="sub_about" href="#main3"></a>	 <!-- aboutUs페이지 4번째 서브메뉴 -->
</div>
	<input type="button" value="문의" onclick="chatBtn()" class="chat">	
</div>


<!-- 1:1채팅 -->
<script>
function chatBtn(){	      
	window.open('./main/chat.jsp','1:1 문의','width=1020,height=700,top=250,left=470');
	   				
	}
/* 마우스휠 & 페이지 바뀔때마다 서브메뉴 색 바뀜 */
$(function() {
	  $.scrollify({
		section:"section",
	    easing: "easeOutExpo",
	    scrollSpeed: 50, /* 스크롤속도 */
	    interstitialSection: "header,footer",
	    before:function(i,panels) {
	      var ref = panels[i].attr("data-section-name");
	      $(".submenu_in .subact").removeClass("subact");
	      $(".submenu_in").find("a[href=\"#" + ref + "\"]").addClass("subact");
	   		  },
   	   afterRender:function() {
   	      $(".submenu_in a").on("click",$.scrollify.move);
   	    }
	});
});

//서브메뉴 나타내기
function subOn(){
	document.getElementById('subon').style.display = "block";
}
function subOff(){
	document.getElementById('subon').style.display = "none";
}
</script>
