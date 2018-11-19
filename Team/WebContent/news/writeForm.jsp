<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/board/fwriteForm.jsp</h1>
<h1>게시판 글등록</h1>
<form action="./FileBoardWriteAction.nw" method="post" enctype="multipart/form-data">
<table border="1">
<tr><td>제목</td><td><input type="text" name="title"></td></tr>
<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"></textarea></td></tr>
<tr><td>첨부파일</td><td><input type="file" name="file"></td></tr>
<tr><td colspan="2">
<input type="submit" value="글쓰기">
</table>
</form>
</body>
</html>