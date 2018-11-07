<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

#table{border: 1px solid;
  width: 500px; height: 300px;
  position: relative; }
 
#table>div{position: absolute;}

#kitchen{border: 2px solid;
  box-sizing: border-box;
  width: 300px; height: 30px;
  top: 2px; left: 100px;
  padding: 2px 120px;
  font-weight: bold;
  font-size: 18px;}

#door{border: 2px solid;
 	box-sizing: border-box;
	width: 70px; height: 50px;
	border-radius: 0 100% 0 0;
	padding: 12px 10px;
	font-weight: bold;
	font-size: 18px;
	left: 2px; bottom: 2px;}
	  
#table img{width: 60px; height: 60px;}
 
#table img:HOVER{cursor: pointer;}

#t1{ left: 100px; bottom: 2px;}
#t2{ left: 210px; bottom: 2px;}
#t3{ left: 320px; bottom: 2px;}
#t4{ left: 430px; bottom: 2px;}
#t5{ left: 380px; bottom: 100px;}
#t6{ left: 260px; bottom: 100px;}
#t7{ left: 140px; bottom: 100px;}
#t8{ left: 140px; bottom: 190px;}
#t9{ left: 260px; bottom: 190px;}
#t10{ left: 380px; bottom: 190px;}

</style>
</head>
<body>
<div id="table">
 <div id="door">입구</div>
 <div id="kitchen">주방</div>
 <div id="t1"><img src="table2.png" onmouseover="this.src='table2_g.png'" onmouseout="this.src='table2.png'"></div>
 <div id="t2"><img src="table2.png" onmouseover="this.src='table2_g.png'" onmouseout="this.src='table2.png'"></div>
 <div id="t3"><img src="table2.png" onmouseover="this.src='table2_g.png'" onmouseout="this.src='table2.png'"></div>
 <div id="t4"><img src="table2.png" onmouseover="this.src='table2_g.png'" onmouseout="this.src='table2.png'"></div>
 <div id="t5"><img src="table4.png" onmouseover="this.src='table4_g.png'" onmouseout="this.src='table4.png'"></div>
 <div id="t6"><img src="table4.png" onmouseover="this.src='table4_g.png'" onmouseout="this.src='table4.png'"></div>
 <div id="t7"><img src="table4.png" onmouseover="this.src='table4_g.png'" onmouseout="this.src='table4.png'"></div>
 <div id="t8"><img src="table4.png" onmouseover="this.src='table4_g.png'" onmouseout="this.src='table4.png'"></div>
 <div id="t9"><img src="table4.png" onmouseover="this.src='table4_g.png'" onmouseout="this.src='table4.png'"></div>
 <div id="t10"><img src="table4.png" onmouseover="this.src='table4_g.png'" onmouseout="this.src='table4.png'"></div>
</div>
</body>
</html>