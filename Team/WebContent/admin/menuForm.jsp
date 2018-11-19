<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/default.css" rel="stylesheet">
<link href="../css/adminForm.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>

<div id="wrap">
<div class="mpbox" id="sec1_mypage"><!-- 배경들어가는 영역 -->
<h1>메뉴 등록</h1>
<div id="write">
<form id="writeForm" action="./" method="post" enctype="multipart/form-data">
 <table border="1">
  <tr>
   <th>카테고리</th>
   <td>
   	<select name="category">
   	 <option value="appetizer">appetizer</option>
   	 <option value="salad">salad</option>
   	 <option value="steak">steak</option>
   	 <option value="salad">salad</option>
   	 <option value="dessert">dessert</option>
   	 <option value="beverage">beverage</option>
   	</select>   
   </td>
  </tr>
  <tr>
   <th>메뉴이름</th>
   <td><input type="text" name="name"></td>
  </tr>
  <tr>
   <th>메뉴설명</th>
   <td><textarea name="content" rows="10" cols="35"></textarea></td>
  </tr>
  <tr>
   <th>이미지</th>
   <td><input type="file" name="file"></td>
  </tr>
  <tr>
   <td colspan="2">
    <input type="submit" id="btnSubmit" value="글쓰기">
    <input type="reset" id="btnReset" value="다시작성">
   </td>
  </tr>
 </table>
</form>
</div>
</div>

<div class="clear"></div>

<!-- 서브메뉴 들어가는 곳 -->
<%-- <jsp:include page="../inc/submenu.jsp"></jsp:include> --%>
<!-- 서브메뉴 들어가는 곳 -->
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

</div>
</body>
</html>