<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div>
        <form action="sendMail.jsp" method="post">
            <table>
                <tr><th colspan="2">E-mail 문의</th></tr>
                <tr><td><input type="hidden" name="from" value="wwe5y2@naver.com"/></td></tr>
                <tr><td><input type="hidden" name="to" value="wwe5y2@naver.com"/></td></tr>				
				<tr><td>E-mail</td><td><input type="text" name="email"></td></tr>            	
                <tr><td>subject</td><td><input type="text" name="subject"/></td></tr>
                <tr><td>content</td><td><textarea name="content" style="width:170px; height:200px;"></textarea></td></tr>
                <tr><td colspan="2" style="text-align:right;"><input type="submit" value="전송"/>
                    <input type="reset" value="reset"></td></tr>
            </table>
        </form>
    </div>
</body>
</html> 