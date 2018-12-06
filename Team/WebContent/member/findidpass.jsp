<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 아이콘링크 -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css' integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns' crossorigin='anonymous'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- css링크 -->
<link href="./css/findIdPass.css" rel="stylesheet">
<link href="./css/default.css" rel="stylesheet">
<title>L'harmonie</title>
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/httpRequest.js"></script>

</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>

<div id="article_fi">
		<!-- <div id="backimg">
		이미지영역
		</div> -->
		
			<div id="tapBtn">
				<button class="tablink" onclick="openPage('Home', this, '#eee')" id="defaultOpen">FIND ID</button>
				<button class="tablink" onclick="openPage('News', this, '#eee')">FIND PASS</button>
			</div>

<div id="Home" class="tabcontent">

		<div id="inputForm">
			<form action="./FindIdAction.me" name="fr1" method="post">
				<table class="findTbl">
					<tr><td><i class='fas fa-male' style='font-size: 25px' id="name_icon"></i>NAME</td></tr>
					<tr><td class="inputArea"><input type="text" class="txtbox" name="name" id="name"></td></tr>
					
					<tr><td><i class="material-icons" style='font-size: 25px' id="phone_icon">phone_android</i>PHONE</td></tr>
					<tr><td class="inputArea"><input type="text" class="txtbox" name="phone" id="phone" maxlength="11" placeholder="(-)제외 숫자만 입력"></td></tr>
						
				</table>		
				<input type="submit" class="submitBtn" value="FIND YOUR ID >">			
			</form>
		</div>
	
</div>

<div id="News" class="tabcontent">

		<div id="inputForm">

			<form action="./FindPassAction.me" name="fr2" method="post">
				<table class="findTbl">
					<tr><td><i class='far fa-envelope' style='font-size: 25px'></i>EMAIL</td></tr>
					<tr><td class="emailInputArea"><input type="text" class="txtbox" name="email1" id="email1"><div>@</div><input type="text" class="txtbox" name="email2" id="email2"></td></tr>
					
					<tr><td><i class='fas fa-male' style='font-size: 25px' id="name_icon"></i>NAME</td>
					<tr><td class="inputArea"><input type="text" class="txtbox" name="name" id="name"></td></tr>
					
					<tr><td><i class="material-icons" style='font-size: 25px' id="phone_icon">phone_android</i>PHONE</td></tr>
					<tr><td class="inputArea"><input type="text" class="txtbox" name="phone" id="phone" maxlength="11" placeholder="(-)제외 숫자만 입력"></td></tr>
				</table>		
				<input type="submit" class="submitBtn" value="FIND YOUR PASSWORD >">			
			</form>
		</div>
	
</div>

<script type="text/javascript">
function openPage(pageName,elmnt,color) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "";
    }
    document.getElementById(pageName).style.display = "block";
    elmnt.style.backgroundColor = color;

}
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();

</script>
    
	
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->	
</body>
</html>