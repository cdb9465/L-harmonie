<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="submenu">

<div class="submenu_in">
 <a href="#main0"></a>
 <a href="#main1"></a>
 <a href="#main2"></a>
 <!-- <a href="#footer"></a> -->
</div>
</div>

<!-- 1:1채팅 -->
<div class="chat" onclick="openform()" id="chatbtn">CHAT</div>

<div class="chat-popup" id="myform">
  <form action="/action_page.php" class="form-container">
    <h1>Chat</h1>

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
