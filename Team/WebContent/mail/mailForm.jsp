<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>E-mail 문의</title>
<link href="../css/mail.css" rel="stylesheet">
	<script type="text/javascript">
		function sendCheck() {
			if(document.fr1.subject.value.length==0){
				alert("제목을 입력하세요");
				document.fr1.subject.focus();
				return;
			}
			
			if(document.fr1.content.value.length==0){
				alert("내용을 입력하세요");
				document.fr1.content.focus();
				return;
			}
			
	    	document.fr1.submit();
		} 
	</script>
</head>
<% 
request.setCharacterEncoding("utf-8");
String id=(String)session.getAttribute("email");
MemberDAO mdao=new MemberDAO();
//리턴값을 저장할 변수 = getMember(세션값) 메서드 호출
MemberBean mb=mdao.getMember(id);
if(id == null){
	%>
	<script>
				alert("로그인 후 이용해주세요.");
				window.opener = window.location.href; self.close();			 
	</script>
	<% 
}
%>
<body>
    <div id="mailtable">
        <form action="sendMail.jsp" method="post" name="fr1">
    		<h1>E-mail 문의</h1>
            <table id="t1">
                <!-- <tr><th colspan="2">E-mail 문의</th></tr> -->
                <tr><td>
                  <input type="hidden" name="from" value="wwe5y2@naver.com"/>
                  <input type="hidden" name="to" value="wwe5y2@naver.com"/>			
				  <input type="hidden" name="email" value="<%=mb.getEmail()%>">
				</td></tr>
				            	
                <tr><th>Subject</th><td><input type="text" name="subject" size="25"/></td></tr>
                <tr><th>Content</th><td><textarea name="content" style="height:200px;"></textarea></td></tr>
                <tr><td colspan="2" style="text-align:right;"><input type="button" value="Send" onclick="sendCheck()"/>
                    <input type="reset" value="Reset"></td></tr>
            </table>
        </form>
    </div>            
</body>
</html> 