<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="net.book.db.BookBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.review.db.ReviewBean"%>
<%@page import="java.util.List"%>
<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="./css/default.css" rel="stylesheet">
<link href="./css/mypage.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css' integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns' crossorigin='anonymous'>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/httpRequest.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script type="text/javascript" src="./js/mypage.js"></script>

<title>L'harmonie|My page</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<div class="clear"></div>
<%
MemberBean mb = (MemberBean)request.getAttribute("mb");
%>
<div class="mpbox" id="main0"><!-- 배경들어가는 영역 -->
 <h1>MODIFY</h1>
 	<div id="modify"> 	
 		<form id="info_update" method="post" name="fr1">
 		<input type="hidden" value="<%=mb.getMem_num() %>" name="mem_num"><!-- 회원번호 숨겨서 넘기기 -->
				<table >
				<tr>
						<td><i class='far fa-envelope' style='font-size:24px'></i></td>
						<th>아이디 : </th><td><input type="text" name="email" value="<%=mb.getEmail() %>" size="35" Readonly>
						</td>
				</tr>
				<tr>
						<td><i class='fas fa-lock' style='font-size:24px'></i></td>
						<th>새 비밀번호 : </th><td><input type="password" name="pass" id="pass" value="" size="35" onkeyup="checkPwd()">
											<span id="checkPwd1"></span>
											</td>
				</tr>
				<tr>
						<td><i class='fas fa-lock' style='font-size:24px'></i></td>
						<th>비밀번호 확인 : </th><td><input type="password" name="repass" id="repass" value="" size="35" onkeyup="checkPwd()">
											<span id="checkPwd2"></span>
											</td>
				</tr>
				<tr>
						<td><i class='fas fa-male' style='font-size:32px' id="name_icon"></i></td>
						<th>이름 : </th><td><input type="text" name="name" id="name" value="<%=mb.getName() %>" size="35" onkeyup="checkName()" >
										<span id="checkName"></span>
										</td>
				</tr>
				<tr>
						<td><i class="material-icons" style='font-size:28px'>phone_android</i></td>
						<th>휴대폰 : </th><td><input type="text" name="phone" id="phone" value="<%=mb.getPhone() %>" size="35" maxlength="11"
											style="ime-mode:disabled;" onkeyup="checkPhone()" onkeypress="return digit_check(event)">
										<span id="checkPhone"></span>	
										</td>
				</tr>

				<tr><td id="button_area"></td><td><input type="button" id="mem_update" class="mem_update" value="정보수정" disabled="disabled" onclick="Action(1)"></td>
					<td><input type="button" id="mem_delete" class="mem_delete" value="회원탈퇴" disabled="disabled" onclick="Action(2)">
					</td>
				</tr>
				
			</table>
		</form>
		
		
	 </div>
</div>

<!-- 2번째 메인 -->
<%
List myBookList = (List)request.getAttribute("myBookList");
String startDate = (String)request.getAttribute("startDate");
String endDate = (String)request.getAttribute("endDate");

int myBookCountTerm = ((Integer)request.getAttribute("myBookCountTerm")).intValue();
int myBookCountAll = ((Integer)request.getAttribute("myBookCountAll")).intValue();
%>
<div class="mpbox" id="main1"><!-- 배경들어가는 영역 -->
 <h1>MY BOOK</h1>
<div id="mybook">
<form action="./Mypage.me#main1" name="fr" method="get">
	<div class="term">
		 <ul class="searchDate">
            <li>
                <span class="chkbox2">
                    <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
                    <label for="dateType1" id="leftBorder">오늘</label>
                </span>
            </li>
            <li>
                <span class="chkbox2">
                    <input type="radio" name="dateType" id="dateType3" onclick="setSearchDate('1w')"/>
                    <label for="dateType3">1주일</label>
                </span>
            </li>
            <li>
                <span class="chkbox2">
                    <input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
                    <label for="dateType5">1개월</label>
                </span>
            </li>
            <li>
                <span class="chkbox2">
                    <input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
                    <label for="dateType6">3개월</label>
                </span>
            </li>
            <li>
                <span class="chkbox2">
                    <input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
                    <label for="dateType7">6개월</label>
                </span>
            </li>
        </ul>
		 	 <!-- 시작일 -->
            <span class="dset">
                <input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" value=<%=startDate %> >
            	 <a href="#none" class="btncalendar dateclick">달력</a>
            </span>
            <span class="demi">~</span>
            <!-- 종료일 -->
            <span class="dset">
                <input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" value=<%=endDate %> >
            	<a href="#none" class="btncalendar dateclick">달력</a>
            </span>
			<input type="submit" value="조회">
	</div>

<div class="mpcount"> <%=myBookCountTerm %><span id="countAll"> / <%= myBookCountAll%></span></div>
	<div class="clear"></div>
<table class="mybook_tbl">
<tr class="ttl"><th>예약번호</th><th>지점</th><th>예약일자<br>[시간]</th><th>테이블번호</th><th class="guest">인원</th>
	<th class="ps">요청사항</th><th>리뷰/취소</th></tr>
<tbody>
<%	for(int i=0; i < myBookList.size(); i++){
		BookBean bb = (BookBean)myBookList.get(i);
		
		//오늘날짜구하기
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date();
		String oTime = mSimpleDateFormat.format ( currentTime ); //현재시간 (String)
		
		//date형으로 바꾸기
		Date nowDate =  mSimpleDateFormat.parse( oTime );

		// Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화
		// Date.getTime() 은 해당날짜를 기준으로 1970년 00:00:00 부터 몇 초가 흘렀는지를 반환
		// 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나옴
		long bbResult = bb.getDate().getTime()/ ( 24*60*60*1000);
		long todayResult = nowDate.getTime()/ ( 24*60*60*1000);

		//예약일 - 오늘 값을 계산해준다 ( -1이상이면 예약취소가능)
		long Result = bbResult - todayResult;
		System.out.println(Result);//확인

%>
	
	<tr class="ttl"><td><%=bb.getBook_num() %></td><td><%=bb.getLocation() %></td>
	<td><%=bb.getDate() %><br><%=bb.getTime() %></td>
	<td><%=bb.getTablenum() %></td><td><%=bb.getGuest() %></td>
	<td><%=bb.getRequest() %></td><td>
	
		<%if ( Result >= 1 ){ // 예약일 이전 %>
			<input type="button" value="예약취소" class="bookcancel" id="bcancel" >
		<%} else if(Result == 0){ //예약당일 %>
			<span class="bookday">당일취소불가</span>
		<%} else{  // 예약일 이후  %> 
			<input type="button" value="리뷰작성" class="writeReview" id="wreview" >
<%} %>
	</td></tr>
<%} %>
</tbody>
</table>

	<div class="pageArea">
	

	</div>
	</form>
</div>
</div>

<!-- 3번째 메인 -->
<%
List myReviewList = (List)request.getAttribute("myReviewList");
%>
<div class="mpbox" id="main2">
 <h1>MY REVIEW</h1>
<div id="myreview">
<div class="term">

<i class='far fa-calendar-alt' style='font-size:27px'></i>
<span>조회기간</span>
 <input type="button" value="일주일" class="termbtn"> <input type="button" value="1개월" class="termbtn">
 <input type="button" value="3개월" class="termbtn"> <input type="button" value="6개월" class="termbtn">
  <input type="button" value="6개월 이전" class="termbtn">
</div>

<div class="mpcount">전체 1건</div>
	<div class="clear"></div>
<table class="mybook_tbl">
	<tr class="ttl"><th>번호</th><th>평점</th><th>날짜</th>
	<th class="ps">내용</th><th>지점</th><th>첨부</th></tr>
	
	<%	for(int i=0; i < myReviewList.size(); i++){

		ReviewBean rb = (ReviewBean)myReviewList.get(i);
%>
	<tr class="ttl"><td><a href="#" class="reviewdetail"><%=rb.getReview_num() %></a></td>
	<td><%
		//평점 점수에 따라 ★로 표시함
		for(int j=0; j < rb.getRating(); j++){
			out.print("★");
		}
		%>
	</td>
	<td><%=rb.getDate() %></td><td class="ps"><%=rb.getContent() %></td><td><%=rb.getLocation() %></td><td><%=rb.getFile() %></td></tr>
<%	}

	 %>
	
</table>
</div>
</div>


   
   
<div class="clear"></div>

<!-- 서브메뉴 들어가는 곳 -->
<jsp:include page="../inc/submenu.jsp"></jsp:include>
<!-- 서브메뉴 들어가는 곳 -->
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</body>
</html>