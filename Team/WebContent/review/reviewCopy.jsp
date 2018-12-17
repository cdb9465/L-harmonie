<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- css경로바꿔야함 -->
<link href="../css/default.css" rel="stylesheet">
<link href="../css/reviewCopy.css" rel="stylesheet">
<title>L'harmonie</title>
</head>
<body>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="./../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>

<!-- 배경들어가는 영역 -->
<div id="sec1_reviewlist">
<!-- 배경이미지 들어가는 영역 -->

         <h1 id="title">REVIEW</h1>

<!-- 메인 table있을곳 -->
<div id="reviewList">

<!-- 지점선택 영역 -->
<div id="selectArea">
   <i class='fas fa-store' style='font-size:17px;'></i> <span>[간편검색] 지점을 선택해주세요</span>
    <select class="dateBox" name="location" onchange="this.form.submit();">
        <option value="전체" >전체</option>
        <option value="서울강남점" >서울강남점</option>
        <option value="부산서면점" >부산서면점</option>
    </select>
</div> 
<!-- 리뷰 전체개수 -->
   <div class="mpcount"> 리뷰 <span class="countRed">420</span>개 </div>
      <div class="clear"></div>
<!-- 메인 테이블 -->  
      <table class="review_tbl">
         <tr><td colspan="2" class="td_start">박소정님<span id="loca">부산서면점</span><span id="date"> 2018.12.15</span></td></tr>
         <tr><td colspan="2" class="td_rating">
                <%   //for(int s=0; s< rb.getRating(); s++)
                  for(int s=0; s< 5; s++){ 
                     %><i class="fa fa-star" style="color:#f04e00; font-size:15px;"></i><%
                     
                  }
                %>
         </td></tr>
         <tr><td colspan="2" class="td_cont">내용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td></tr>
         <tr><td colspan="2" class="td_pic">사진----여기부터 사진 사진<br>사<br>아<br>아<br>아<br>아<br>아<br>아<br>아<br>아<br>아<br>아<br>진<br>----여기까지</td></tr>
                           
         <tr><td colspan="2" class="td_like" >
                  <form action="./LoveCountAction.re"  method="post">
                     <input type="hidden" name="mem_num" value=<%//=mbb.getMem_num()%>>
                     <input type="hidden" name="review_num" value=<%//=rb.getReview_num()%>>
                     <input type="hidden" name="love_num" value="1">
                     <!-- 누르기 전이라 하트아이콘 회색으로해둠. 누르면 빨강으로 style="color:#800000;" -->
                        <Button type="submit" onclick="style='background-color:pink'" id="heart1">
                        <i class='fas fa-heart' style='color:gray; font-size:23px;'id=heart ></i></Button>
                  </form>
               <%//=lovecount %>20명이 좋아합니다.
    
                  <input type="button" value="글삭제" onclick="location.href='./ReviewDelete.re?review_num=<%//=rb.getReview_num()%>'" class="delReview">
         </td></tr>

<!-- admin일때만 댓글등록하는 창 보여주기 -->
          <tr><td colspan="2" class="insertComm">      
                <form action="./CommentWriteAction.re"  method="post">
                     <input type="hidden" name="mem_num" value=<%//=rb.getMem_num()%>>
                     <input type="hidden" name="review_num" value=<%//=rb.getReview_num()%>>
                  <textarea  name="content" class="comm_content">댓글내용</textarea> 
                  <button type="submit" class="comment_btn" >댓글등록</button>
                  </form>
            </td></tr>      
<!-- admin일때만 댓글등록 보여주기 -->      
         
         <tr><th class="th_admin"><i class="material-icons" style='font-size:16px'>subdirectory_arrow_right </i> L'harmonie
         
         </th>
            <td class="td_comment"> <%//=cb.getContent() %>
                              안녕하세요 고객님, L'harmonie입니다.<br>
                              고객님의 소중한 후기 감사드립니다.<br>
                              정성스럽게 남겨주신 의견을 반영하여
                              나날이 발전되고, 개선된 모습으로<br>
                              만족스러운 모습 보여드릴수 있는
                              L'harmonie가 되겠습니다.<br>
                              좋은하루되세요^^
                     <!-- admin일때만 댓글삭제 보여주기 -->
                     <input type="button"value="댓글삭제"  onclick="location.href='./CommentDelete.re?comment_num=<%//=cb.getComment_num()%>'" class="delComment">
                     
            </td></tr>
      </table>






<hr>


<!-- 페이지 ◀12345▶ 영역 -->
      <div class="pageArea">   
            <a href="#" class="page2">◀이전</a>
            <a href="#" id="page1">1 2 3</a>
            <a href="#"  class="page2">다음▶</a>            
      </div>
   
</div>


</div>


<!-- 푸터 들어가는 곳 -->
<jsp:include page="./../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
 
</body>
</html>