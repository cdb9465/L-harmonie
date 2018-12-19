<%@page import="net.book.db.BookBean"%>
<%@page import="net.book.db.BookDAO"%>
<%@page import="net.review.db.ReviewBean"%>
<%@page import="net.review.db.ReviewDAO"%>
<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <link href="./css/default.css" rel="stylesheet">
<link href="./css/review_write.css" rel="stylesheet" type="text/css">
</head>
<body>

<%
String email=(String)session.getAttribute("email");
MemberDAO mdao = new MemberDAO();
MemberBean mb = mdao.getMember(email);

ReviewDAO rdao= new ReviewDAO();
ReviewBean rb= rdao.getReview1();
BookDAO bdao= new BookDAO();
int book_num = Integer.parseInt(request.getParameter("book_num"));
%>

<div class="maintext">
<div class="jquery-script-ads">
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></div>
</div>


 <div id="sec1_reviewlist">
<div id="boxes">
<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog" class="window">리뷰 작성
  <a class="agree"style="color:red;" href="#" onclick="history.back();">x</a>
  
    <div id="lorem">
<table border="1">

<form action="./ReviewAddAction.re" method="post" enctype="multipart/form-data">
 <div class="write_location"  >
 <tr><th><div class="title">지점선택</div></th>
 <td colspan="3">
  <select name="sel_location" required>
  <option selected disabled value="">선택</option>
   <option value="서울강남점">서울강남점</option>
   <option value="부산서면점">부산서면점</option>
  </select></td></tr>
 </div>
 <div class="clear"></div>
<tr><th><div class="title">작성자</div></th><td><%=mb.getName() %>
<input type="hidden" name="mem_num" value="<%=mb.getMem_num()%>" readonly></td></tr>
<tr><th><div class="title">예약번호</div></th><td><%=book_num %></td></tr>
 <div class="write_rating" >
 <tr><th>  <div class="title">별점</div></th>
 <td colspan="3">
 <span class="star-input">
	<span class="input" >
    	<input type="radio" class="star-input" value="1" id="p1" name="rating"required>
    	<label for="p1">1</label>
    	<input type="radio" class="star-input" value="2" id="p2" name="rating"required>
    	<label for="p2">2</label>
    	<input type="radio" class="star-input" value="3" id="p3" name="rating"required>
    	<label for="p3">3</label>
    	<input type="radio" class="star-input" value="4" id="p4" name="rating"required>
    	<label for="p4">4</label>
    	<input type="radio" class="star-input" value="5" id="p5" name="rating"required>
    	<label for="p5">5</label>
    	</span>
    	<output for="star-input"><b>0</b>점</output>	
    				
</span></td></tr>


<script src="./js/jquery-1.11.3.min.js"></script>
<script src="./js/star.js"></script>
 </div> 
 <div class="clear"></div>
 <tr><th>사진선택</th><td colspan="3">
 <input type="file" name="file1" required/>
  <input type="file" name="file2" />
   <input type="file" name="file3"/></td></tr>
 <div class="write_content">
 <tr><th> <div class="title">리뷰</div></th><td>
  <input type="text" name="content"  autofocus required>
  </td></tr>
 
  <div class="clear"></div>
 
 
 </div>



</table>
</div>
        <!-- Modal footer -->
        <div id="popupfoot">

         <button type="submit" style="margin-left:100px; margin-right:auto;">리뷰등록</button>
         <button type="reset" class="reset_button">다시작성</button>
        </div>
       
        </form>
     
      </div>
    </div>
  </div>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script> 
<script src="./js/main.js"></script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</body>
</html>