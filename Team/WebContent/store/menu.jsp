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
int count2=0;
%>

<article class="menu_article">

<div id="article_sec1" class="main_box">
<ul class="sec1_menu">
	<li><a href="#article_sec2" onclick="moveAppetizer()">APPETIZER</a></li>
	<li><a href="#article_sec2" onclick="moveSalad()">SALAD</a></li>
	<li><a href="#article_sec2" onclick="moveSteak()">STEAK</a></li>
	<li><a href="#article_sec2" onclick="movePasta()">PASTA</a></li>
	<li><a href="#article_sec2" onclick="moveDessert()">DESSERT</a></li>
	<li><a href="#article_sec2" onclick="moveBeverage()">BEVERAGE</a></li>
</ul>
<a href="#main1" class="arrow">
   <img src="./images/arrow.png">
   <img src="./images/dot.png" class="dot">
</a>
</div>

<div id="article_sec2" class="main_box">
<div class="tab">
  <button id="defaultOpen" class="tablinks" onclick="openMenu(event, 'Appetizer', 'caption_Appetizer')">APPETIZER</button>
  <button id="button_Salad" class="tablinks" onclick="openMenu(event, 'Salad', 'caption_Salad')">SALAD</button>
  <button id="button_Steak" class="tablinks" onclick="openMenu(event, 'Steak', 'caption_Steak')">STEAK</button>
  <button id="button_Pasta" class="tablinks" onclick="openMenu(event, 'Pasta', 'caption_Pasta')">PASTA</button>
  <button id="button_Dessert" class="tablinks" onclick="openMenu(event, 'Dessert', 'caption_Dessert')">DESSERT</button>
  <button id="button_Beverage" class="tablinks" onclick="openMenu(event, 'Beverage', 'caption_Beverage')">BEVERAGE</button>
</div>

<div class="tabcontent">

<table id="menu_table">
	<tr>

<%
for(int i=0; i<menuList.size(); i++) {
	
	MenuBean nu = (MenuBean)menuList.get(i);
	%>
	
	<%
	if(nu.getCategory().equals("Appetizer")) {
		System.out.println(count2);
	%>	
		
		<td><img src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="300px" height="200px"  class="Appetizer" >
	  	<p class="caption_Appetizer" title="<%=nu.getCategory()%>"><%=nu.getName()%></p></td>
	  	<%
	  	count2 +=1;
		
		if(count2 == 4) {
			System.out.println(count2);
			count2 =0;
			%>
			</tr>
			<%
		}
	}
	else if(nu.getCategory().equals("Salad")) {
	%>
	
  		<td><img src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="300px" height="200px" class="Salad" >
  		<p class="caption_Salad" title="<%=nu.getCategory()%>"><%=nu.getName()%></p></td>
  		
  	<% 
	}
	else if(nu.getCategory().equals("Steak")) {
	%>
  		<td><img src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="300px" height="200px" class="Steak" >
  		<p class="caption_Steak" title="<%=nu.getCategory()%>"><%=nu.getName()%></p></td>
  	<%
	}
	else if(nu.getCategory().equals("Pasta")) {
  	%>
  		<td><img src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="300px" height="200px" class="Pasta" >
  		<p class="caption_Pasta" title="<%=nu.getCategory()%>"><%=nu.getName()%></p></td>
  	<%
	}
	else if(nu.getCategory().equals("Dessert")) {
  	%>
  		<td><img src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="300px" height="200px" class="Dessert" >
 		<p class="caption_Dessert" title="<%=nu.getCategory()%>"><%=nu.getName()%></p></td>

  	<%
	}
	else {
  	%>
  		<td><img src="./upload/<%=nu.getFile()%>" alt="<%=nu.getName() %>" width="300px" height="200px" class="Beverage" >
  		<p class="caption_Beverage" title="<%=nu.getCategory()%>"><%=nu.getName()%></p></td>
	<%
	}
	
}
%>
</tr>
</table>
</div>
</div>
</article>
<script>
function moveAppetizer() {
	document.getElementById("defaultOpen").click();
}
function moveSalad() {
	document.getElementById("button_Salad").click();
}
function moveSteak() {
	document.getElementById("button_Steak").click();
}
function movePasta() {
	document.getElementById("button_Pasta").click();
}
function moveSaDessert() {
	document.getElementById("button_Dessert").click();
}
function moveBeverage() {
	document.getElementById("button_Beverage").click();
}
document.getElementById("defaultOpen").click();

function openMenu(evt, menuName, capName) {
    var i, tablinks, n, menu, img, cap;
    img = document.getElementsByTagName("img"); //이미지 파일 전체 다
    show = document.getElementsByClassName(menuName); //에피타이져3개 (샐러드 제외)
    menu = document.getElementsByClassName(menuName)[0].getAttribute("class"); //분류 (Appetizer)
    
    cap = document.getElementsByTagName("p");//캡션 전체 다
    caption = document.getElementsByClassName(capName);
    allcaption = document.getElementsByClassName(capName)[0].getAttribute("title"); //p 타이틀 분류 (Appetizer)

    for(i = 0; i<cap.length; i++) {
    	cap[i].style.display = "none";
    }
    for(i = 0; i<img.length; i++) {
    	img[i].style.display = "none";
    	
    }
    if(menuName==menu) {
    	for(i =0; i<show.length; i++) {
    		show[i].style.display = "block";
    	}
    	if(menuName==allcaption){
    		for(i = 0; i<caption.length; i++) {
				caption[i].style.display="block";
			}
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