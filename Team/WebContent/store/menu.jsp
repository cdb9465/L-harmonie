<%@ page import="net.menu.db.MenuBean" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/menu.css" rel="stylesheet">
<link href="./css/default.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>L'marmonie| MENU</title>
</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            $(".main_box").each(function () {
                // 개별적으로 Wheel 이벤트 적용
                $(this).on("mousewheel DOMMouseScroll", function (e) {
                    e.preventDefault();
                    var delta = 0;
                    if (!event) event = window.event;
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                        if (window.opera) delta = -delta;
                    } else if (event.detail) delta = -event.detail / 3;
                    var moveTop = null;
                    // 마우스휠을 위에서 아래로
                    if (delta < 0) {
                        if ($(this).next() != undefined) {
                            moveTop = $(this).next().offset().top;
                        }
                    // 마우스휠을 아래에서 위로
                    } else {
                        if ($(this).prev() != undefined) {
                            moveTop = $(this).prev().offset().top;
                        }
                    }
                    // 화면 이동 0.8초(800)
                    $("html,body").stop().animate({
                        scrollTop: moveTop + 'px'
                    }, {
                        duration: 800, complete: function () {
                        }
                    });
                });
            });
        }
    </script>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>
<%
List<MenuBean> menuList=(List<MenuBean>)request.getAttribute("menuList");
%>

<article class="menu_article">

<div id="article_sec1" class="main_box">
<ul class="sec1_menu">
	<li><a href="#">APPETIZER</a></li>
	<li><a href="#">SALAD</a></li>
	<li><a href="#">STEAK</a></li>
	<li><a href="#">PASTA</a></li>
	<li><a href="#">DESSERT</a></li>
	<li><a href="#">BEVERAGE</a></li>
</ul>
<a href="#main1" class="arrow">
   <img src="./images/arrow.png">
   <img src="./images/dot.png" class="dot">
</a>
</div>

<div id="article_sec2" class="main_box">
<div class="tab">
  <button id="defaultOpen" class="tablinks" onclick="openMenu(event, 'Appetizer')">APPETIZER</button>
  <button class="tablinks" onclick="openMenu(event, 'Salad')">SALAD</button>
  <button class="tablinks" onclick="openMenu(event, 'Steak')">STEAK</button>
  <button class="tablinks" onclick="openMenu(event, 'Pasta')">PASTA</button>
  <button class="tablinks" onclick="openMenu(event, 'Dessert')">DESSERT</button>
  <button class="tablinks" onclick="openMenu(event, 'Beverage')">BEVERAGE</button>
</div>

<div class="tabcontent">
<%
for(int i=0; i<menuList.size(); i++) {
	
	MenuBean nu = (MenuBean)menuList.get(i);
	
	if(nu.getCategory().equals("appetizer")) {
	%>
	  	<img src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="300px" height="200px"  class="Appetizer" >
	  	<p class="caption" title="<%=nu.getCategory()%>"><%=nu.getName()%></p>
  	<%
	}
	else if(nu.getCategory().equals("salad")) {
	%>
  		<img src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="300px" height="200px" class="Salad" >
  		<p class="caption" title="<%=nu.getName()%>"><%=nu.getName()%></p>
  	<% 
	}
	else if(nu.getCategory().equals("steak")) {
	%>
  		<img src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="300px" height="200px" class="Steak" >
  	<%
	}
	else if(nu.getCategory().equals("pasta")) {
  	%>
  		<img src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="300px" height="200px" class="Pasta" >
  	<%
	}
	else if(nu.getCategory().equals("dessert")) {
  	%>
  		<img src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="300px" height="200px" class="Dessert" >
  	<%
	}
	else {
  	%>
  		<img src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="300px" height="200px" class="Beverage" >
	<%
	}
}
%>
</div>
</div>


</article>
<script>
document.getElementById("defaultOpen").click();

function openMenu(evt, menuName) {
    var i, tablinks, n, menu, img, caption;
    img = document.getElementsByTagName("img");
    
   
    
   
    show = document.getElementsByClassName(menuName);
    menu = document.getElementsByClassName(menuName)[0].getAttribute("class");
    
    allcaption = document.getElementsByClassName("caption")[0].getAttribute("title");
    alert(allcaption);
    alert(menu);
   
    
    
    for(i = 0; i<img.length; i++) {
    	img[i].style.display = "none";

    }
    
    if(menuName==menu) {
    	for(i =0; i<show.length; i++) {
    		if(allcaption==menu) {
    			allcaption[i].style.display = "block";
    		}
			show[i].style.display = "block";
			
    	}
    }
    
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    evt.currentTarget.className += " active";
    
}


</script>
<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

</body>
</html>