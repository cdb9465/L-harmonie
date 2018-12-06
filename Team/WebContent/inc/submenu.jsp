<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="submenu">
<div class="submenu_in">
 <a href="#main0"></a>
 <a href="#main1"></a>
 <a href="#main2"></a>
 <a id="sub_about" href="#main3"></a>	 <!-- aboutUs페이지 4번째 서브메뉴 -->
</div>
</div>

<!-- 1:1채팅 -->
<div class="chat" id="chatbtn"><a href="./chat.jsp">문의</a></div>

<!-- 
<div class="chat" onclick="openform()" id="chatbtn">문의</div>

<div class="chat-popup" id="myform">
  <form action="/action_page.php" class="form-container">
    <label for="msg"><b>Message</b></label>
    <textarea placeholder="Type message.." name="msg" required></textarea>
    <button type="submit" class="btn">Send</button>
    <button type="button" class="btn cancel" onclick="closeform()">Close</button>
  </form>
</div>

<script>
function openform() {
    document.getElementById("myform").style.display = "block";
    document.getElementById("chatbtn").style.right= "325px";    
}

function closeform() {
    document.getElementById("myform").style.display = "none";
    document.getElementById("chatbtn").style.right= "0";
}
</script>
 -->