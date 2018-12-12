<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/default.css" rel="stylesheet">
<link href="./css/admin.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
// 카테고리 선택했는지 확인
function categoryChk() {
	if(document.fr1.category.selectedIndex==0)
	{
		alert("카테고리를 선택하세요.")
		document.fr1.category.focus();
		return false;
	}
}
</script>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>

<div class="mpbox" id="sec1_mypage"><!-- 배경들어가는 영역 -->

<!-- 서브메뉴 -->
<jsp:include page="admin_sub.jsp"></jsp:include>

<h1 id="title">메뉴 등록</h1>
<div class="write">
<form id="menuForm" action="./MenuAddAction.ad" 
method="post" enctype="multipart/form-data" name="fr1" onsubmit="return categoryChk()">
 <table border="1">
  <tr>
   <th>카테고리</th>
   <td>
   	<select name="category">
   	 <option value="" selected="selected">카테고리</option>
   	 <option value="appetizer">Appetizer</option>
   	 <option value="salad">Salad</option>
   	 <option value="steak">Steak</option>
   	 <option value="pasta">Pasta</option>
   	 <option value="dessert">Dessert</option>
   	 <option value="beverage">Beverage</option>
   	</select>   
   </td>
  </tr>
  <tr>
   <th>메뉴이름</th>
   <td><input type="text" name="name" required></td>
  </tr>
  <tr>
   <th>설명</th>
   <td><textarea name="content" rows="10" cols="35" required></textarea></td>
  </tr>
  <tr>
   <th>이미지</th>
   <td><input type="file" name="file" required></td>
  </tr>
  <tr>
   <td colspan="2">
    <input type="submit" id="btnSubmit" value="메뉴등록">
    <input type="reset" id="btnReset" value="다시작성">
   </td>
  </tr>
 </table>
</form>
</div>
</div>

<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

</body>
</html>