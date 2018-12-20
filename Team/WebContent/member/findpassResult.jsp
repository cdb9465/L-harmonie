<%@page import="net.member.db.MemberBean"%>
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
<!-- script링크 -->
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/httpRequest.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/findpassResult.js"></script>
<title>L'harmonie</title>
<style type="text/css">
#resultId{margin-bottom: 30px; font-size: 25px;}
#inputForm{padding-top: 450px;text-align: center;}
.txtbox{width:70%; margin: 5px 5px 0 5px;}
.submitBtn{width:70%;}
#PS{font-size: 14px; width:450px;padding-left:80px;}
#checkPwd1,#checkPwd2{font-size: 12px;text-align: left; margin-bottom: 5px;}
p{margin-left:100px;}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>
<%request.setCharacterEncoding("utf-8");
String findPass = (String)request.getAttribute("findPass");
MemberBean mb = (MemberBean)request.getAttribute("mb");
%>
<div id="article_fi">
		<!-- <div id="backimg">
		이미지영역
		</div> -->
	<div id="inputForm">
			<form action="./ChangePassAction.me" name="fr1" method="post" >
				<input type="hidden" name="email" value="<%=mb.getEmail()%>">
				<input type="hidden" name="name" value="<%=mb.getName()%>">
				<input type="hidden" name="phone" value="<%=mb.getPhone()%>">
				<div id="resultId"> " 회원님의 <span>비밀번호를 변경</span>해주세요. "</div>
					<div id="PS">비밀번호는 최소 4자리 이상만 사용할 수 있습니다.</div>
				<input type="password" name="pass" class="txtbox" placeholder="비밀번호" onkeyup="checkPwd()"><br>
				<span id="checkPwd1"></span>
				<input type="password" name="repass" class="txtbox" placeholder="비밀번호 확인" onkeyup="checkPwd()"><br>
				<span id="checkPwd2"></span>
				<input type="submit" value="비밀번호 변경 >" disabled="disabled" class="submitBtn">
			</form>
			
			
	</div>
	
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->	
</body>
</html>