<%@ page import="net.news.db.NewsBean" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="./css/default.css" rel="stylesheet">
<link href="./css/news.css" rel="stylesheet">
</head>
<body class="news_body">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>

<%
List<NewsBean> newsList=(List<NewsBean>)request.getAttribute("newsList");
int count=((Integer)request.getAttribute("count")).intValue();
int count2=0;
%>
<!-- 본문 -->
<div class="wrap">
<div class="news_main">
<h1>News & Event</h1>
<div class="news_row">
<%
for(int i=0; i<newsList.size(); i++) {
	NewsBean nb = newsList.get(i);
%>
<div class="news_column">
    	<div class="news_content">
    	<img id="myImg" src="./upload/<%=nb.getFile()%>" width="100%" height="150px" alt="<%=nb.getTitle()%>">
    	<div id="myModal" class="modal">
    	<span class="close">&times;</span>
    	<img class="modal-content" id="img01">
    	<div id="caption"></div>
    	</div>
		<h4><%=nb.getTitle() %></h4>
		<h5><%=nb.getContent() %></h5>
		</div>
</div>
<%
count2 +=1;
%>
<%
if(count2==4) {
%>
</div>  
<%
count2=0;
}
}
%>
</div>
</div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
<script>
var modal = document.getElementById("myModal");

var img = document.getElementById("myImg");
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    
    captionText.innerHTML = this.alt;
}

var span = document.getElementsByClassName("close")[0];

var div = document.getElementsByClassName("modal")[0];


span.onclick = function() { 
  modal.style.display = "none";
}
//x표 누르면 팝업창 사라지기
div.onclick = function() {   
  modal.style.display = "none";
}
//검은 바탕 누르면 팝업창 사라지기
</script>

</body>
</html>