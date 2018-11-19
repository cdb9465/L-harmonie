<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/login.css" rel="stylesheet">
<link href="../css/default.css" rel="stylesheet">
<title>L'harmonie|Login</title>
</head>
<body>

<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>

<div id="id01" class="modal">
  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
  <form action="../main/main.jsp" class="modal-content" >
  <div id="login_top">회원로그인</div>
    <div class="container">
      <table>
      <tr><td><input type="text" size="60" placeholder="email" name="email"></td></tr>
      <tr><td><input type="text" size="60" placeholder="pass" name="pass"></td></tr>
      </table>
      <a id="kakao-login-btn"></a>

      <div id="login_btm">
	      <span>아이디/비밀번호를 잊으셨나요?</span>
	      <a href="#">아이디찾기</a>
	      <a href="#">비밀번호찾기</a>
      </div>
     <div class="clearfix">
     	<button type="submit" class="signupbtn">Login</button>
        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      </div>
      
      <input type="button" value="회원가입" onclick="location.href='../member/join.jsp'">
       
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

</body>
</html>