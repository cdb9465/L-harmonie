<%@ page import="net.news.db.NewsBean" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>L'marmonie</title>
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
<div class="news_cover">
<div class="news_main">
<h1>News & Event</h1>
<div class="news_row">
<%
for(int i=0; i<newsList.size(); i++) {
	NewsBean nb = newsList.get(i);
%>
<div class="news_column">
    	<div class="news_content">
    	<img class="myImg" src="./upload/<%=nb.getFile()%>" width="400px" height="250px" alt="<%=nb.getTitle()%>" onclick="modal(this)">
    	
    	<!-- 모달 -->
    	<div id="myModal"> 
    		<span class="news_close">&times;</span>
    		<img class="modal-content" id="img01">
    		<div class="news_detail">
	    	<div id="title"></div>
	    	</div>
	    </div>
		<div id="subject"><%=nb.getTitle() %></div>
		</div>
</div>
<%
count2 +=1;
%>
<%
if(count2==3) {

count2=0;
}
}
%>
</div>
</div>
</div>
</div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
<script>
/* var modal = document.getElementById("myModal");

var img = document.getElementById("myImg");
var modalImg = document.getElementById("img01");
var caption = document.getElementById("title");
	


img.onclick=function() {
		modal.style.display="block";
		modalImg.src = this.src;
		caption.innerHTML = this.alt;
	}
	
	var span = document.getElementsByClassName("news_close")[0];
	
	//x표 누르면 팝업창 사라지기
	span.onclick = function() { 
	  modal.style.display = "none";
	}
	
	//검은 바탕 누르면 팝업창 사라지기
	modal.onclick = function() {   
	  modal.style.display = "none";
	}
 */
 
function modal(element) {
	var modal = document.getElementById("myModal");
	var modalImg = document.getElementById("img01");
	var caption = document.getElementById("title");
	 
	
	document.getElementById("img01").src=element.src;
	caption.innerHTML = element.alt;
	modal.style.display = "block";
	
	
		
	var span = document.getElementsByClassName("news_close")[0];
	
	span.onclick = function() { 
		modal.style.display = "none";
	}
		
		//검은 바탕 누르면 팝업창 사라지기
	modal.onclick = function() {   
		modal.style.display = "none";
	}
 }
</script>

</body>
</html>