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

<%
// session 없으면 -> 로그인
String email = (String)session.getAttribute("email");
if(email == null){
%>
<script>
alert("로그인이 필요합니다.");
history.back();
</script>	
<%
}
%>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<%
MemberBean mb = (MemberBean)request.getAttribute("mb");
%>
<div class="mpbox" id="main0"><!-- 배경들어가는 영역 -->
 <h1>MODIFY</h1>
 	<div id="modify"> 	
 		<form id="info_update" method="post" name="fr1">
 		<input type="hidden" value="<%=mb.getMem_num() %>" id="mem_num" name="mem_num"><!-- 회원번호 숨겨서 넘기기 -->
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
	 
	 <a href="#" class="arrow">
   <img src="./images/arrow.png">
   <img src="./images/dot.png" class="dot">
</a>
</div>

<!-- 2번째 메인 -->
<%
List myBookList = (List)request.getAttribute("myBookList");
//book용 조회
String startDate = (String)request.getAttribute("startDate");
String endDate = (String)request.getAttribute("endDate");
int myBookCount = ((Integer)request.getAttribute("myBookCount")).intValue();
int myBookCountAll = ((Integer)request.getAttribute("myBookCountAll")).intValue();
//페이지관련
String bookpageNum=(String)request.getAttribute("bookpageNum");
int bookpageCount=((Integer)request.getAttribute("bookpageCount")).intValue();
int bookpageBlock=((Integer)request.getAttribute("bookpageBlock")).intValue();
int bookstartPage=((Integer)request.getAttribute("bookstartPage")).intValue();
int bookendPage=((Integer)request.getAttribute("bookendPage")).intValue();
%>
<div class="mpbox" id="main1"><!-- 배경들어가는 영역 -->
 <h1>MY BOOK</h1>
<div id="mybook">
<form action="./Mypage.me?searchStartDate=<%=startDate %>&searchEndDate=<%=endDate%>#main1" name="fr2" method="get">
	<div class="term">
		 <ul class="searchDate">
			 <li>
                <span class="chkbox2">
                    <input type="radio" name="dateType" id="dateType0" onclick="setSearchAll()"/>
                    <label for="dateType0" id="leftBorder">전체</label>
                </span>
            </li>
            <li>
                <span class="chkbox2">
                    <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
                    <label for="dateType1">오늘</label>
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
                <input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" value=<%=startDate.equals("1500-01-01")?"":startDate %> >
            	 <a href="#none" class="btncalendar dateclick">달력</a>
            </span>
            <span class="demi">~</span>
            <!-- 종료일 -->
            <span class="dset">
                <input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" value=<%=endDate.equals("1500-01-01")?"":endDate %> >
            	<a href="#none" class="btncalendar dateclick">달력</a>
            	
            </span>
			<input type="submit" value="조회" class="termSearch">
	</div>


<div class="mpcount"> 조회 <span class="countRed"><%=myBookCount%></span>건 / 전체 예약 <span class="countRed"><%= myBookCountAll%></span>건 </div>
	<div class="clear"></div>
<table class="mybook_tbl">
<tr class="ttl"><th>예약번호</th><th>지점</th><th>예약일자<br>[시간]</th><th>테이블번호</th><th class="guest">인원</th>
	<th class="ps">요청사항</th><th>취소/리뷰</th></tr>
<tbody>
<% 	if(myBookList==null){ %>
	<tr class="ttl"><td colspan="7">예약 내역이 없습니다.</td>
<%	}else{
	for(int i=0; i < myBookList.size(); i++){
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
<%			}
		}%>
	</td></tr>
<%} %>
</tbody>
</table>

		<div class="pageArea">
			<%
			//이전
			if(bookstartPage > bookpageBlock){
				%><a href="./Mypage.me?bookpageNum=<%=bookstartPage-bookpageBlock%>&searchStartDate=<%=startDate %>&searchEndDate=<%=endDate%>#main1" class="page2">◀</a><%
			}// 1~10 
			for(int i=bookstartPage;i<=bookendPage;i++){
				%><a href="./Mypage.me?bookpageNum=<%=i%>&searchStartDate=<%=startDate %>&searchEndDate=<%=endDate%>#main1" id="page1"><%=i %></a><%
			}
			//다음
			if(bookendPage < bookpageCount){
				%><a href="./Mypage.me?bookpageNum=<%=bookstartPage+bookpageBlock%>&searchStartDate=<%=startDate %>&searchEndDate=<%=endDate%>#main1"  class="page2">▶</a><%
			}
			%>
				
		</div>
	</form>
</div>

	 <a href="#" class="arrow">
   <img src="./images/arrow.png">
   <img src="./images/dot.png" class="dot">
</a>
</div>

<!-- 3번째 메인 -->
<%
List myReviewList = (List)request.getAttribute("myReviewList");

int myReviewCount = ((Integer)request.getAttribute("myReviewCount")).intValue();
int myReviewCountAll = ((Integer)request.getAttribute("myReviewCountAll")).intValue();
//review용 조회
String startDate2 = (String)request.getAttribute("startDate2");
String endDate2 = (String)request.getAttribute("endDate2");
//페이지관련
String reviewpageNum=(String)request.getAttribute("reviewpageNum");
int reviewpageCount=((Integer)request.getAttribute("reviewpageCount")).intValue();
int reviewpageBlock=((Integer)request.getAttribute("reviewpageBlock")).intValue();
int reviewstartPage=((Integer)request.getAttribute("reviewstartPage")).intValue();
int reviewendPage=((Integer)request.getAttribute("reviewendPage")).intValue();
%>
<div class="mpbox" id="main2">
 <h1>MY REVIEW</h1>
<div id="myreview">
<form action="./Mypage.me#main2" name="fr3" method="get">
	<div class="term">
		<ul class="searchDate2">
			 <li>
                <span class="chkbox22">
                    <input type="radio" name="dateType2" id="dateType02" onclick="setSearchAll2()"/>
                    <label for="dateType02" id="leftBorder">전체</label>
                </span>
            </li>
            <li>
                <span class="chkbox22">
                    <input type="radio" name="dateType2" id="dateType12" onclick="setSearchDate2('0d')"/>
                    <label for="dateType12">오늘</label>
                </span>
            </li>
            <li>
                <span class="chkbox22">
                    <input type="radio" name="dateType2" id="dateType32" onclick="setSearchDate2('1w')"/>
                    <label for="dateType32">1주일</label>
                </span>
            </li>
            <li>
                <span class="chkbox22">
                    <input type="radio" name="dateType2" id="dateType52" onclick="setSearchDate2('1m')"/>
                    <label for="dateType52">1개월</label>
                </span>
            </li>
            <li>
                <span class="chkbox22">
                    <input type="radio" name="dateType2" id="dateType62" onclick="setSearchDate2('3m')"/>
                    <label for="dateType62">3개월</label>
                </span>
            </li>
            <li>
                <span class="chkbox22">
                    <input type="radio" name="dateType2" id="dateType72" onclick="setSearchDate2('6m')"/>
                    <label for="dateType72">6개월</label>
                </span>
            </li>
        </ul>
		 	 <!-- 시작일 -->
            <span class="dset2">
                <input type="text" class="datepicker2 inpType" name="searchStartDate2" id="searchStartDate2" value=<%=startDate2.equals("1500-01-01")?"":startDate2 %> >
            	 <a href="#none" class="btncalendar dateclick2">달력</a>
            </span>
            <span class="demi2">~</span>
            <!-- 종료일 -->
            <span class="dset2">
                <input type="text" class="datepicker2 inpType" name="searchEndDate2" id="searchEndDate2" value=<%=endDate2.equals("1500-01-01")?"":endDate2 %> >
            	<a href="#none" class="btncalendar dateclick2">달력</a>
            </span>
            	<input type="submit" value="조회" class="termSearch">
	</div>

<div class="mpcount">  조회 <span class="countRed"><%=myReviewCount%></span>건 / 전체 리뷰 <span class="countRed"><%= myReviewCountAll%></span>건</div>

	<div class="clear"></div>
<table class="mybook_tbl">
	<tr class="ttl"><th>번호</th><th>지점</th><th>평점</th><th>날짜</th>
	<th class="ps">내용</th><th> </th></tr>
<% 	if(myReviewList==null){ %>
	<tr class="ttl"><td colspan="6">작성하신 리뷰가 없습니다.</td>
<%	}else{
		for(int i=0; i < myReviewList.size(); i++){

		ReviewBean rb = (ReviewBean)myReviewList.get(i);
%>
	<tr class="ttl"><td><%=rb.getReview_num() %></td>
	<td><%=rb.getLocation() %></td>
	<td><%
		//평점 점수에 따라 ★로 표시함
		for(int j=0; j < rb.getRating(); j++){
			out.print("★");
		}
		%>
	</td>
	<td><%=rb.getDate() %></td><td class="ps"><%=rb.getContent() %></td>
	<td><input type="button" value="리뷰삭제" class="writeReview" onclick="#"></td></tr>
<%		}
	}
	 %>
	
</table>

	
		<div class="pageArea">
			<%
			//이전
			if(reviewstartPage > reviewpageBlock){
				%><a href="./Mypage.me?reviewpageNum=<%=reviewstartPage-reviewpageBlock%>&searchStartDate2=<%=startDate2 %>&searchEndDate2=<%=endDate2%>#main1" class="page2">◀</a><%
			}
			// 1~10 
			for(int i=reviewstartPage;i<=reviewendPage;i++){
				%><a href="./Mypage.me?reviewpageNum=<%=i%>&searchStartDate2=<%=startDate2 %>&searchEndDate2=<%=endDate2%>#main1" id="page1"><%=i %></a><%
			}
			//다음
			if(reviewendPage < reviewpageCount){
				%><a href="./Mypage.me?reviewpageNum=<%=reviewstartPage+reviewpageBlock%>&searchStartDate2=<%=startDate2 %>&searchEndDate2=<%=endDate2%>#main1" class="page2">▶</a><%
			}
			%>
				
		</div>
</form>
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