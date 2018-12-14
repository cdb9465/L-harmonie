<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- css링크 -->
<link href="./css/findIdPass.css" rel="stylesheet">
<link href="./css/default.css" rel="stylesheet">
<title>L'harmonie</title>
<style type="text/css">
#inputForm{padding-top: 500px;text-align: center;}

</style>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>
<%request.setCharacterEncoding("utf-8");
String findEmail = (String)request.getAttribute("findEmail");

%>
<div id="article_fi">
		<!-- <div id="backimg">
		이미지영역
		</div> -->
	<div id="inputForm">
			<div id="resultId">회원님의 아이디는 <br><span><%=findEmail%></span> 입니다.</div>
			<input type="button" value="비밀번호 찾기" id="resultbtn1" onclick="location.href='./FindIdPass.me?id=passck'">
		<input type="button" value="홈으로 이동" id="resultbtn" onclick="location.href='./Main.ma'">
		

	</div>
	
</div>


<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->	
</body>
</html>