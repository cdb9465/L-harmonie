<%@page import="net.admin.db.PageBean"%>
<%@page import="net.member.db.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="./css/default.css" rel="stylesheet">
<link href="./css/admin.css" rel="stylesheet">

<title>L'harmonie</title>
</head>
<body>
<%
// session 없으면 -> 로그인
String email = (String)session.getAttribute("email");
if(email == null || !email.equals("admin@team.com")){
%>
<script>
alert("관리자만 이용가능합니다.");
history.back();
</script>	
<%
}

PageBean pb = (PageBean)request.getAttribute("pb");
List<MemberBean> memberList = (List)request.getAttribute("memberList");

int count = pb.getCount();
String pageNum = pb.getPageNum();
int pageCount = pb.getPageCount();
int pageBlock = pb.getPageBlock();
int startPage = pb.getStartPage();
int endPage = pb.getEndPage();
int currentPage = Integer.parseInt(pageNum);

%>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>

<div class="mpbox" id="sec1_mypage"><!-- 배경들어가는 영역 -->

<!-- 서브메뉴 -->
<jsp:include page="admin_sub.jsp"></jsp:include>

 <h1 id="title">회원 목록</h1>
 
<div id="bookList">

<div class="mpcount">전체 <%=memberList.size() %>명</div>

<div class="clear"></div>
	
<table class="bookList_tab">
 <tr class="memberList_tr">
  <th>회원번호</th>
  <th>이메일</th>
  <th>이름</th>
  <th>휴대폰번호</th>
 </tr>
	
<!-- 회원목록 -->
<%
for(int i=0;i<memberList.size();i++){
	MemberBean mb = (MemberBean)memberList.get(i);
%>
 <tr>
  <td><%=mb.getMem_num()%></td>
  <td><%=mb.getEmail()%></td>
  <td><%=mb.getName()%></td>
  <td><%=mb.getPhone()%></td>
 </tr>
  <%
}
  %>
</table>
<div class="pageArea">
<%
//이전
if(startPage > pageBlock){
 %><a class="page2" href="./MemberList.ad?pageNum=<%=startPage-pageBlock%>">◀</a>
<%}

for(int i=startPage;i<=endPage;i++){
	if(currentPage!=i){%><a id="page1" href="./MemberList.ad?pageNum=<%=i%>">
	<%}%>
	[<%=i %>]</a>
	<%}

//다음
if(endPage < pageCount){
	%><a class="page2" href="./MemberList.ad?pageNum=<%=startPage+pageBlock%>">▶</a>
	<%
}
%>
 </div>
 
</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
 
</body>
</html>